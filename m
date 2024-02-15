Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D880C54E5B
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:33 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.20159.1708018344653965605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DOTEzByo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=f0VswMC5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018dadd3a879-ede82c9d-c9e1-4b85-9ddb-abc055e58198-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OGsPmwoYPPQZ96UqvOGkIFjCivYns1JsGuQg1Jf2LF8=;
	b=DOTEzByo31EXtLH5XTCyMgoX2WSPaOV7kk64rBhWm09cKmnu/39LbWZpry7b1VIG
	/pZdubkLcKCNbe/iot0PPAYYDo2dHmAUirH+zq9nwJBBFsZtr4v0CThXWDU1ipp7Hbv
	1xr4TEPkNcku0nVUmiRmrfcHgFmkTwR+RzNtB+/M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OGsPmwoYPPQZ96UqvOGkIFjCivYns1JsGuQg1Jf2LF8=;
	b=f0VswMC5mMEZTBH9bUBwU1oHTxFblfUQCUxUPx3dDkWFhmNAwAwVBBCEMGID5CiZ
	GjcRoeKbMVaV+LCS0FvgUyfq+nZd2E9UAfZctplyfDhGV9b+LnR8aE0uZJBPEgUrdWd
	GXfX51hYqBGSVHtzznAu8yaSTjUWWQfBSRpc8OXc=
Content-Type: multipart/mixed; boundary="===============1755553558397939231=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to b9374d2c59e665bf60950af898003ed17bf98370
 SUCCEEDED
Message-ID: <0101018dadd3a879-ede82c9d-c9e1-4b85-9ddb-abc055e58198-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195642

--===============1755553558397939231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *b9374d2c59e665bf60950af898003ed17bf98370* has Succeeded.

Next steps:
    - apply the patch: git am 0001-piglit-upgrade-to-latest-revision.patch
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
From 9f89e8b52ed0e65998ca757129afa32dda02ef1a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 13:41:36 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 ...-tests-Fix-narrowing-errors-seen-with-clang.patch |  6 ++----
 ...tils-Include-libgen.h-on-musl-linux-systems.patch |  6 ++----
 ...ke-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch |  8 +++-----
 ...l-piglit-shader.c-do-not-hardcode-build-pat.patch | 12 +++++-------
 meta/recipes-graphics/piglit/piglit_git.bb           |  2 +-
 5 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index b1bb00e052..9786247ae8 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From cd38c91e8c743bfc1841bcdd08e1ab18bf22f0e1 Mon Sep 17 00:00:00 2001
+From 69d9143e9e76101bf6d32636983277f0cb496ab5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
@@ -9,6 +9,7 @@ zer list [-Wc++11-narrowing]
 
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/807]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  .../spec/ext_framebuffer_multisample/draw-buffers-common.cpp  | 4 ++--
  tests/util/piglit-test-pattern.cpp                            | 4 ++--
@@ -48,6 +49,3 @@ index 43d451d6a..52ee94457 100644
  		glClearBufferuiv(GL_COLOR, 0, clear_color);
  		break;
  	}
--- 
-2.40.1
-
diff --git a/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch b/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch
index 35e919e552..66691ed9d4 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-utils-Include-libgen.h-on-musl-linux-systems.patch
@@ -1,4 +1,4 @@
-From 232a67b651ccb415b7d4d47584613359b7ebd920 Mon Sep 17 00:00:00 2001
+From 5fda54a757eefebc87bec21d70bd57645fb29eac Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 13 Feb 2024 08:53:37 -0800
 Subject: [PATCH] utils: Include libgen.h on musl/linux systems
@@ -9,6 +9,7 @@ allow to include libgen.h on non-glibc based linux systems
 
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/877]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  tests/util/piglit-util.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -26,6 +27,3 @@ index 4d3606c70..fdfd903b3 100644
  #  include "libgen.h" // for basename
  #elif defined(_MSC_VER)
  
--- 
-2.43.1
-
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 5d6ec368ba..b50f095f3d 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From 3bf1beee1ddd19bc536ff2856e04ac269d43daa2 Mon Sep 17 00:00:00 2001
+From 56ebccb7431dd32774604e1097de38fbfdb38b20 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
@@ -10,12 +10,13 @@ when cross compiling.
 Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
 
 Upstream-Status: Submitted [piglit@lists.freedesktop.org]
+
 ---
  tests/util/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/util/CMakeLists.txt b/tests/util/CMakeLists.txt
-index a5f080156..a303a9f58 100644
+index 1714ab41f..3b67aa7da 100644
 --- a/tests/util/CMakeLists.txt
 +++ b/tests/util/CMakeLists.txt
 @@ -97,7 +97,7 @@ if(PIGLIT_USE_WAFFLE)
@@ -27,6 +28,3 @@ index a5f080156..a303a9f58 100644
  		)
  	endif()
  	if(PIGLIT_HAS_X11)
--- 
-2.11.0
-
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 16c7c5c803..cff7cc65e0 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,19 +1,20 @@
-From 1c67250308a92d4991ed05d9d240090ab84accae Mon Sep 17 00:00:00 2001
+From b972699f70234f34700033d311d87a9a4096d1ef Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
-Subject: [PATCH 2/2] tests/util/piglit-shader.c: do not hardcode build path
- into target binary
+Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
+ target binary
 
 This helps reproducibilty.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  tests/util/piglit-shader.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/util/piglit-shader.c b/tests/util/piglit-shader.c
-index 4fd68d21e..c9ea8295e 100644
+index 1787eb180..9e74704b1 100644
 --- a/tests/util/piglit-shader.c
 +++ b/tests/util/piglit-shader.c
 @@ -73,7 +73,7 @@ piglit_compile_shader(GLenum target, const char *filename)
@@ -25,6 +26,3 @@ index 4fd68d21e..c9ea8295e 100644
  	}
  
  	snprintf(filename_with_path, FILENAME_MAX - 1,
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index ab749f7867..144ea18dd1 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "f3f1b3f960611a88cb1a037114ba4724f1bf330e"
+SRCREV = "b9374d2c59e665bf60950af898003ed17bf98370"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.42.0


--===============1755553558397939231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+f3f1b3f960 to 1.0+gitr0+b9374d2c59
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+f3f1b3f960 to 1.0+gitr0+b9374d2c59
packages/core2-64-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+f3f1b3f960-r0'])", added "piglit (['= 1.0+gitr0+b9374d2c59-r0'])"
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+f3f1b3f960 to 1.0+gitr0+b9374d2c59
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+f3f1b3f960 to 1.0+gitr0+b9374d2c59
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+f3f1b3f960 to 1.0+gitr0+b9374d2c59
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+f3f1b3f960 to 1.0+gitr0+b9374d2c59
packages/core2-64-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+f3f1b3f960-r0'])", added "piglit-dev (['= 1.0+gitr0+b9374d2c59-r0'])"
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+f3f1b3f960 to 1.0+gitr0+b9374d2c59
packages/core2-64-poky-linux/piglit/piglit: PKGSIZE changed from 2053381172 to 2053400791 (+0%)
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/glsl-1.10/execution/vs-multiple-shader-fragments-with-global.shader_test /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/varying_error.vert /usr/lib/piglit/bin/ext_texture_storage-formats"
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+f3f1b3f960 to 1.0+gitr0+b9374d2c59

--===============1755553558397939231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+f3f1b3f960 to 1.0+gitr0+b9374d2c59
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+f3f1b3f960 to 1.0+gitr0+b9374d2c59
packages/core2-64-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+f3f1b3f960-r0'])", added "piglit (['= 1.0+gitr0+b9374d2c59-r0'])"
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+f3f1b3f960 to 1.0+gitr0+b9374d2c59
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+f3f1b3f960 to 1.0+gitr0+b9374d2c59
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+f3f1b3f960 to 1.0+gitr0+b9374d2c59
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+f3f1b3f960 to 1.0+gitr0+b9374d2c59
packages/core2-64-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+f3f1b3f960-r0'])", added "piglit-dev (['= 1.0+gitr0+b9374d2c59-r0'])"
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+f3f1b3f960 to 1.0+gitr0+b9374d2c59
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/ext_texture_storage-formats /usr/lib/piglit/tests/spec/glsl-1.10/execution/vs-multiple-shader-fragments-with-global.shader_test /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/varying_error.vert"
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+f3f1b3f960 to 1.0+gitr0+b9374d2c59

--===============1755553558397939231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1857 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1857 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6ec3338488189c6da9bbdad5113d742c34a2b79c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6ec3338488189c6da9bbdad5113d742c34a2b79c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 451 Local 439 Mirrors 0 Missed 12 Current 610 (97% match, 98% complete)
Removing 10 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2361 of 2922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: Running task 2903 of 2922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 2904 of 2922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Succeeded
NOTE: Running task 2905 of 2922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running task 2906 of 2922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_collect_spdx_deps)
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Succeeded
NOTE: Running task 2907 of 2922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2908 of 2922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2909 of 2922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 00cbab6a51dcfe22281f69be087a252bafcd229ff88edc15e13eb0b94ad82a67
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2910 of 2922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Succeeded
NOTE: Running task 2911 of 2922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Succeeded
NOTE: Running task 2912 of 2922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Succeeded
NOTE: Running task 2913 of 2922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2914 of 2922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot unihash changed to 1debc0c2f298c0b94cae6a0bc13cf8768e0b209638cf1c25c17ccd395a24a48f
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Succeeded
NOTE: Running task 2915 of 2922 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2915 tasks of which 2901 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215132541.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215132541.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+f3f1b3f960-r0 to 0:1.0+gitr0+b9374d2c59-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+f3f1b3f960-r0 to 0:1.0+gitr0+b9374d2c59-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+f3f1b3f960-r0 to 0:1.0+gitr0+b9374d2c59-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+f3f1b3f960-r0 to 0:1.0+gitr0+b9374d2c59-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+f3f1b3f960-r0 to 0:1.0+gitr0+b9374d2c59-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+f3f1b3f960-r0 to 0:1.0+gitr0+b9374d2c59-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+f3f1b3f960-r0 to 0:1.0+gitr0+b9374d2c59-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+f3f1b3f960-r0 to 0:1.0+gitr0+b9374d2c59-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.3618980
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============1755553558397939231==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSA5Zjg5ZThiNTJlZDBlNjU5OThjYTc1NzEyOWFmYTMyZGRhMDJlZjFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTM6NDE6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIC4uLi10ZXN0cy1GaXgtbmFy
cm93aW5nLWVycm9ycy1zZWVuLXdpdGgtY2xhbmcucGF0Y2ggfCAgNiArKy0tLS0KIC4uLnRpbHMt
SW5jbHVkZS1saWJnZW4uaC1vbi1tdXNsLWxpbnV4LXN5c3RlbXMucGF0Y2ggfCAgNiArKy0tLS0K
IC4uLmtlLXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2ggfCAg
OCArKystLS0tLQogLi4ubC1waWdsaXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBh
dC5wYXRjaCB8IDEyICsrKysrLS0tLS0tLQogbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9w
aWdsaXRfZ2l0LmJiICAgICAgICAgICB8ICAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13
aXRoLWNsYW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAw
MS10ZXN0cy1GaXgtbmFycm93aW5nLWVycm9ycy1zZWVuLXdpdGgtY2xhbmcucGF0Y2gKaW5kZXgg
YjFiYjAwZTA1Mi4uOTc4NjI0N2FlOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1GaXgtbmFycm93aW5nLWVycm9ycy1zZWVuLXdpdGgt
Y2xhbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAw
MS10ZXN0cy1GaXgtbmFycm93aW5nLWVycm9ycy1zZWVuLXdpdGgtY2xhbmcucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIGNkMzhjOTFlOGM3NDNiZmMxODQxYmNkZDA4ZTFhYjE4YmYyMmYwZTEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY5ZDkxNDNlOWU3NjEwMWJmNmQzMjYzNjk4
MzI3N2YwY2I0OTZhYjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogV2VkLCAzIE1heSAyMDIzIDIxOjU5OjQzIC0wNzAw
CiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiBGaXggbmFycm93aW5nIGVycm9ycyBzZWVuIHdpdGgg
Y2xhbmcKQEAgLTksNiArOSw3IEBAIHplciBsaXN0IFstV2MrKzExLW5hcnJvd2luZ10KIAogVXBz
dHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9t
ZXNhL3BpZ2xpdC8tL21lcmdlX3JlcXVlc3RzLzgwN10KIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+CisKIC0tLQogIC4uLi9zcGVjL2V4dF9mcmFtZWJ1ZmZlcl9t
dWx0aXNhbXBsZS9kcmF3LWJ1ZmZlcnMtY29tbW9uLmNwcCAgfCA0ICsrLS0KICB0ZXN0cy91dGls
L3BpZ2xpdC10ZXN0LXBhdHRlcm4uY3BwICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCAr
Ky0tCkBAIC00OCw2ICs0OSwzIEBAIGluZGV4IDQzZDQ1MWQ2YS4uNTJlZTk0NDU3IDEwMDY0NAog
IAkJZ2xDbGVhckJ1ZmZlcnVpdihHTF9DT0xPUiwgMCwgY2xlYXJfY29sb3IpOwogIAkJYnJlYWs7
CiAgCX0KLS0tIAotMi40MC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9w
aWdsaXQvcGlnbGl0LzAwMDEtdXRpbHMtSW5jbHVkZS1saWJnZW4uaC1vbi1tdXNsLWxpbnV4LXN5
c3RlbXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXV0
aWxzLUluY2x1ZGUtbGliZ2VuLmgtb24tbXVzbC1saW51eC1zeXN0ZW1zLnBhdGNoCmluZGV4IDM1
ZTkxOWU1NTIuLjY2NjkxZWQ5ZDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9w
aWdsaXQvcGlnbGl0LzAwMDEtdXRpbHMtSW5jbHVkZS1saWJnZW4uaC1vbi1tdXNsLWxpbnV4LXN5
c3RlbXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAw
MS11dGlscy1JbmNsdWRlLWxpYmdlbi5oLW9uLW11c2wtbGludXgtc3lzdGVtcy5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gMjMyYTY3YjY1MWNjYjQxNWI3ZDRkNDc1ODQ2MTMzNTliN2ViZDky
MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNWZkYTU0YTc1N2VlZmViYzg3YmVjMjFk
NzBiZDU3NjQ1ZmIyOWVhYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDEzIEZlYiAyMDI0IDA4OjUzOjM3IC0w
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHV0aWxzOiBJbmNsdWRlIGxpYmdlbi5oIG9uIG11c2wvbGlu
dXggc3lzdGVtcwpAQCAtOSw2ICs5LDcgQEAgYWxsb3cgdG8gaW5jbHVkZSBsaWJnZW4uaCBvbiBu
b24tZ2xpYmMgYmFzZWQgbGludXggc3lzdGVtcwogCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRl
ZCBbaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvcGlnbGl0Ly0vbWVyZ2VfcmVx
dWVzdHMvODc3XQogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4K
KwogLS0tCiAgdGVzdHMvdXRpbC9waWdsaXQtdXRpbC5oIHwgMiArLQogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQpAQCAtMjYsNiArMjcsMyBAQCBpbmRleCA0
ZDM2MDZjNzAuLmZkZmQ5MDNiMyAxMDA2NDQKICAjICBpbmNsdWRlICJsaWJnZW4uaCIgLy8gZm9y
IGJhc2VuYW1lCiAgI2VsaWYgZGVmaW5lZChfTVNDX1ZFUikKICAKLS0tIAotMi40My4xCi0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDItY21ha2Ut
dXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12YXJpYWJsZS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDItY21ha2UtdXNlLXByb3Blci1XQVlMQU5E
X0lOQ0xVREVfRElSUy12YXJpYWJsZS5wYXRjaAppbmRleCA1ZDZlYzM2OGJhLi5iNTBmMDk1ZjNk
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAyLWNt
YWtlLXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMi1jbWFrZS11c2UtcHJvcGVy
LVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSAzYmYxYmVlZTFkZGQxOWJjNTM2ZmYyODU2ZTA0YWMyNjlkNDNkYWEyIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA1NmViY2NiNzQzMWRkMzI3NzQ2MDRlMTA5N2RlMzhmYmZkYjM4YjIw
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGFzY2FsIEJhY2ggPHBhc2NhbC5iYWNo
QHNpZW1lbnMuY29tPgogRGF0ZTogVGh1LCA0IE9jdCAyMDE4IDE0OjQzOjE3ICswMjAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIGNtYWtlOiB1c2UgcHJvcGVyIFdBWUxBTkRfSU5DTFVERV9ESVJTIHZhcmlh
YmxlCkBAIC0xMCwxMiArMTAsMTMgQEAgd2hlbiBjcm9zcyBjb21waWxpbmcuCiBTaWduZWQtb2Zm
LWJ5OiBQYXNjYWwgQmFjaCA8cGFzY2FsLmJhY2hAc2llbWVucy5jb20+CiAKIFVwc3RyZWFtLVN0
YXR1czogU3VibWl0dGVkIFtwaWdsaXRAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXQorCiAtLS0KICB0
ZXN0cy91dGlsL0NNYWtlTGlzdHMudHh0IHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMvdXRpbC9DTWFrZUxp
c3RzLnR4dCBiL3Rlc3RzL3V0aWwvQ01ha2VMaXN0cy50eHQKLWluZGV4IGE1ZjA4MDE1Ni4uYTMw
M2E5ZjU4IDEwMDY0NAoraW5kZXggMTcxNGFiNDFmLi4zYjY3YWE3ZGEgMTAwNjQ0CiAtLS0gYS90
ZXN0cy91dGlsL0NNYWtlTGlzdHMudHh0CiArKysgYi90ZXN0cy91dGlsL0NNYWtlTGlzdHMudHh0
CiBAQCAtOTcsNyArOTcsNyBAQCBpZihQSUdMSVRfVVNFX1dBRkZMRSkKQEAgLTI3LDYgKzI4LDMg
QEAgaW5kZXggYTVmMDgwMTU2Li5hMzAzYTlmNTggMTAwNjQ0CiAgCQkpCiAgCWVuZGlmKCkKICAJ
aWYoUElHTElUX0hBU19YMTEpCi0tLSAKLTIuMTEuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGlnbGl0LXNoYWRlci5j
LWRvLW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
cGlnbGl0L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5vdC1oYXJk
Y29kZS1idWlsZC1wYXQucGF0Y2gKaW5kZXggMTZjN2M1YzgwMy4uY2ZmN2NjNjVlMCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMy10ZXN0cy11dGls
LXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQt
c2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaApAQCAtMSwxOSArMSwyMCBA
QAotRnJvbSAxYzY3MjUwMzA4YTkyZDQ5OTFlZDA1ZDlkMjQwMDkwYWI4NGFjY2FlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiOTcyNjk5ZjcwMjM0ZjM0NzAwMDMzZDMxMWQ4N2E5YTQw
OTZkMWVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4g
PGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDEwIE5vdiAyMDIwIDE3OjEzOjUw
ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0ggMi8yXSB0ZXN0cy91dGlsL3BpZ2xpdC1zaGFkZXIuYzog
ZG8gbm90IGhhcmRjb2RlIGJ1aWxkIHBhdGgKLSBpbnRvIHRhcmdldCBiaW5hcnkKK1N1YmplY3Q6
IFtQQVRDSF0gdGVzdHMvdXRpbC9waWdsaXQtc2hhZGVyLmM6IGRvIG5vdCBoYXJkY29kZSBidWls
ZCBwYXRoIGludG8KKyB0YXJnZXQgYmluYXJ5CiAKIFRoaXMgaGVscHMgcmVwcm9kdWNpYmlsdHku
CiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNp
Z25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgor
CiAtLS0KICB0ZXN0cy91dGlsL3BpZ2xpdC1zaGFkZXIuYyB8IDIgKy0KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3Rlc3RzL3V0
aWwvcGlnbGl0LXNoYWRlci5jIGIvdGVzdHMvdXRpbC9waWdsaXQtc2hhZGVyLmMKLWluZGV4IDRm
ZDY4ZDIxZS4uYzllYTgyOTVlIDEwMDY0NAoraW5kZXggMTc4N2ViMTgwLi45ZTc0NzA0YjEgMTAw
NjQ0CiAtLS0gYS90ZXN0cy91dGlsL3BpZ2xpdC1zaGFkZXIuYwogKysrIGIvdGVzdHMvdXRpbC9w
aWdsaXQtc2hhZGVyLmMKIEBAIC03Myw3ICs3Myw3IEBAIHBpZ2xpdF9jb21waWxlX3NoYWRlcihH
TGVudW0gdGFyZ2V0LCBjb25zdCBjaGFyICpmaWxlbmFtZSkKQEAgLTI1LDYgKzI2LDMgQEAgaW5k
ZXggNGZkNjhkMjFlLi5jOWVhODI5NWUgMTAwNjQ0CiAgCX0KICAKICAJc25wcmludGYoZmlsZW5h
bWVfd2l0aF9wYXRoLCBGSUxFTkFNRV9NQVggLSAxLAotLS0gCi0yLjE3LjEKLQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCmluZGV4IGFiNzQ5Zjc4NjcuLjE0NGVh
MThkZDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dp
dC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKQEAg
LTE0LDcgKzE0LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21l
c2EvcGlnbGl0LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWEKICAgICAgICAgICAgIgogVVBT
VFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgogCi1TUkNSRVYgPSAiZjNmMWIzZjk2MDYxMWE4OGNi
MWEwMzcxMTRiYTQ3MjRmMWJmMzMwZSIKK1NSQ1JFViA9ICJiOTM3NGQyYzU5ZTY2NWJmNjA5NTBh
Zjg5ODAwM2VkMTdiZjk4MzcwIgogIyAod2hlbiBQViBnb2VzIGFib3ZlIDEuMCByZW1vdmUgdGhl
IHRyYWlsaW5nIHIpCiBQViA9ICIxLjArZ2l0ciIKIAotLSAKMi40Mi4wCgo=

--===============1755553558397939231==--

