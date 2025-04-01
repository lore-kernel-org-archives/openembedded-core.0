Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36E0C369D8
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:35 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.18065.1743511408836683871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=T+dK4nOf;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oIn/bLyj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010195f160cf00-294572b8-cf5a-45c3-8139-a1ad68aff485-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6W5jUbRo7cviTwnuKmKZmnMnPrtyZibOeq8D2O4OAx0=;
	b=T+dK4nOfsBzX0h4b+3DR5MtNjmnx5avGm4D7u0AfRE3y5nbaH5yvqcPJADZRmqi5
	IsAb1OsSNOAfrAhyBytHZQzWsO+EzBY/zC3bIDFsNABjLhsufo2kybbHMUXZix8I2fX
	cn49psKPSGFSpSX3E2RjeBz9m2EIka9kRsltxsTE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6W5jUbRo7cviTwnuKmKZmnMnPrtyZibOeq8D2O4OAx0=;
	b=oIn/bLyj6pYA9kBHBpQx2eMSi/rX3yoJY1q1sfMC+UligHM4vagct7/m1h4tSuU7
	TsCi0qaKWH6YNapzMkzA4h9w9prizmw+WBpHZfo9ZaE8wQnZ9ZJhPtAIMsqIQV65XMS
	4pEIKE5Ls+WyY8DSALUgIzmffeXULxEPh98AFRZo=
Content-Type: multipart/mixed; boundary="===============4270280366302350005=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 05f02cb2ff1787892cba38c3b609f892419bae87
 SUCCEEDED
Message-ID: <01010195f160cf00-294572b8-cf5a-45c3-8139-a1ad68aff485-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214102

--===============4270280366302350005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *05f02cb2ff1787892cba38c3b609f892419bae87* has Succeeded.

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
From fcea39e41fe1a2dc74852314348c32709fdbcc7d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 11:30:50 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 ...CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch | 4 ++--
 .../0001-tests-Fix-narrowing-errors-seen-with-clang.patch     | 2 +-
 ...tests-egl-spec-make-egl_ext_surface_compression-cond.patch | 2 +-
 .../0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch | 2 +-
 ...tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch | 4 ++--
 meta/recipes-graphics/piglit/piglit_git.bb                    | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index fa9db07f3f..6ce2348a71 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From b76523100ad785c1fed41b881d7aecda1b8ce66f Mon Sep 17 00:00:00 2001
+From 9ffd24add3263e24975318e693309881eadd99a2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 73750f67e..8018a1bb7 100644
+index 99ae07a4a..d5ee9cc22 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -211,11 +211,7 @@ if(PIGLIT_USE_WAYLAND)
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index 8b51790e2a..9751b20673 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From e7cd5ff25b40b807664bdcaf4f865ec769bbc52c Mon Sep 17 00:00:00 2001
+From 0ba2f908f2a2a897e8e06e34f99893d11ee4734c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index 9c2fe0adb2..c6c072c7e0 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From a7b699b2647b950b5558a0d51626e44455d2a229 Mon Sep 17 00:00:00 2001
+From d6ed4c477f22309c09accd4fee68486d7714f205 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index a196921aa4..6cb561c3f2 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From a28c1dcdaa74b014ad33a7c04ad3b906cee2770e Mon Sep 17 00:00:00 2001
+From deb0c15890fb9d0f4fc7074dde2a51c89cb5bf6d Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 1a5d7f7006..7706d88086 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From 30eb460534dbcd6c7cd23bbe733c8ed6bdd82773 Mon Sep 17 00:00:00 2001
+From 66d1d86ff8be33df265d0dda717be385fe8637cd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/util/piglit-shader.c b/tests/util/piglit-shader.c
-index 1787eb180..9e74704b1 100644
+index b03221053..a01568c81 100644
 --- a/tests/util/piglit-shader.c
 +++ b/tests/util/piglit-shader.c
 @@ -73,7 +73,7 @@ piglit_compile_shader(GLenum target, const char *filename)
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index ef3241c7a2..e30efdf33b 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "fc8179d319046f45346bcbcc5aaeabebdf151f03"
+SRCREV = "05f02cb2ff1787892cba38c3b609f892419bae87"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.47.1


--===============4270280366302350005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+05f02cb2ff
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+05f02cb2ff
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+05f02cb2ff
packages/core2-64-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+fc8179d319-r0'])", added "piglit (['= 1.0+gitr0+05f02cb2ff-r0'])"
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+05f02cb2ff
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+05f02cb2ff
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+05f02cb2ff
packages/core2-64-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+fc8179d319-r0'])", added "piglit-dev (['= 1.0+gitr0+05f02cb2ff-r0'])"
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+05f02cb2ff
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+05f02cb2ff
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/ovr_multiview2/compiler/other-static-dependence.frag /usr/lib/piglit/tests/spec/ovr_multiview/compiler/glsl-130-view-id.vert /usr/lib/piglit/bin/ovr_multiview-triangle_compare /usr/lib/piglit/bin/ovr_multiview-fb_incomplete_view_range /usr/lib/piglit/bin/ovr_multiview-fb_shader_mismatch_draw_errors /usr/lib/piglit/bin/ovr_multiview-fb_read_errors /usr/lib/piglit/tests/spec/ext_external_objects/vk_ping_pong.comp /usr/lib/piglit/bin/ext_multi_draw_indirect-vertexid /usr/lib/piglit/bin/ovr_multiview-fb_incomplete_view_targets /usr/lib/piglit/bin/ovr_multiview-fb_attachment_params /usr/lib/piglit/tests/spec/ovr_multiview2/compiler/other-static-dependence.vert /usr/lib/piglit/tests/spec/ovr_multiview/linker/multiple_shaders_single_num_view_declaration_2.shader_test /usr/lib/piglit/bin/ovr_multiview-fb_texture_errors /usr/lib/piglit/bin/ovr_multiview-fb_blit_first_view /usr/lib/piglit/tests/spec/ovr_mul
 tiview2/compiler/implied-ovr_multiview.vert"

--===============4270280366302350005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
Parsing recipes...done.
Parsing of 924 .bb files complete (923 cached, 1 parsed). 1886 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7fd244e35537888a203955c65863143fe1cdf97c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 427 Local 416 Mirrors 0 Missed 11 Current 594 (97% match, 98% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 10 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2186 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: Running task 2675 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 2676 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Succeeded
NOTE: Running task 2803 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running task 2804 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_collect_spdx_deps)
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Succeeded
NOTE: Running task 2805 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2806 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2807 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 1e1e200888113b8514d6004d68242ecb4d7375231d369c328dccca02b046218b
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2808 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Succeeded
NOTE: Running task 2809 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Succeeded
NOTE: Running task 2810 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Succeeded
NOTE: Running task 2811 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2812 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot unihash changed to 6653d8727c85a625ff5805adc80b8e628ae14b3a8be1a36415184e34efe0f289
NOTE: Setscene tasks completed
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Succeeded
NOTE: Running task 2813 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2813 tasks of which 2799 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401111845.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401111845.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.2208524
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+05f02cb2ff-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+05f02cb2ff-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+05f02cb2ff-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+05f02cb2ff-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+05f02cb2ff-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+05f02cb2ff-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+05f02cb2ff-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+05f02cb2ff-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.2208524
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============4270280366302350005==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSBmY2VhMzllNDFmZTFhMmRjNzQ4NTIzMTQzNDhjMzI3MDlmZGJjYzdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAxMTozMDo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
Z2xpdDogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogLi4uQ01ha2VMaXN0cy50eHQt
ZG8tbm90LW9idGFpbi13YXlsYW5kLXNjYW5uZXItcGF0aC1mci5wYXRjaCB8IDQgKystLQogLi4u
LzAwMDEtdGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13aXRoLWNsYW5nLnBhdGNoICAg
ICB8IDIgKy0KIC4uLnRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNz
aW9uLWNvbmQucGF0Y2ggfCAyICstCiAuLi4vMDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRf
SU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoIHwgMiArLQogLi4udGVzdHMtdXRpbC1waWdsaXQt
c2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaCB8IDQgKystLQogbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiICAgICAgICAgICAgICAgICAgICB8
IDIgKy0KIDYgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtQ01h
a2VMaXN0cy50eHQtZG8tbm90LW9idGFpbi13YXlsYW5kLXNjYW5uZXItcGF0aC1mci5wYXRjaCBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtQ01ha2VMaXN0cy50eHQt
ZG8tbm90LW9idGFpbi13YXlsYW5kLXNjYW5uZXItcGF0aC1mci5wYXRjaAppbmRleCBmYTlkYjA3
ZjNmLi42Y2UyMzQ4YTcxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0
L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMudHh0LWRvLW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVy
LXBhdGgtZnIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQv
MDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZy
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiNzY1MjMxMDBhZDc4NWMxZmVkNDFiODgxZDdh
ZWNkYTFiOGNlNjZmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5ZmZkMjRhZGQzMjYz
ZTI0OTc1MzE4ZTY5MzMwOTg4MWVhZGQ5OWEyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IEZyaSwgMjMg
QXVnIDIwMjQgMTU6Mjk6NDUgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gQ01ha2VMaXN0cy50eHQ6
IGRvIG5vdCBvYnRhaW4gd2F5bGFuZC1zY2FubmVyIHBhdGggZnJvbQpAQCAtMTcsNyArMTcsNyBA
QCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgog
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0cy50eHQKLWluZGV4IDczNzUwZjY3ZS4u
ODAxOGExYmI3IDEwMDY0NAoraW5kZXggOTlhZTA3YTRhLi5kNWVlOWNjMjIgMTAwNjQ0CiAtLS0g
YS9DTWFrZUxpc3RzLnR4dAogKysrIGIvQ01ha2VMaXN0cy50eHQKIEBAIC0yMTEsMTEgKzIxMSw3
IEBAIGlmKFBJR0xJVF9VU0VfV0FZTEFORCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13
aXRoLWNsYW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAw
MS10ZXN0cy1GaXgtbmFycm93aW5nLWVycm9ycy1zZWVuLXdpdGgtY2xhbmcucGF0Y2gKaW5kZXgg
OGI1MTc5MGUyYS4uOTc1MWIyMDY3MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1GaXgtbmFycm93aW5nLWVycm9ycy1zZWVuLXdpdGgt
Y2xhbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAw
MS10ZXN0cy1GaXgtbmFycm93aW5nLWVycm9ycy1zZWVuLXdpdGgtY2xhbmcucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIGU3Y2Q1ZmYyNWI0MGI4MDc2NjRiZGNhZjRmODY1ZWM3NjliYmM1MmMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDBiYTJmOTA4ZjJhMmE4OTdlOGUwNmUzNGY5
OTg5M2QxMWVlNDczNGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogV2VkLCAzIE1heSAyMDIzIDIxOjU5OjQzIC0wNzAw
CiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiBGaXggbmFycm93aW5nIGVycm9ycyBzZWVuIHdpdGgg
Y2xhbmcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAw
MDEtdGVzdHMtZWdsLXNwZWMtbWFrZS1lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24tY29uZC5w
YXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtZWds
LXNwZWMtbWFrZS1lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24tY29uZC5wYXRjaAppbmRleCA5
YzJmZTBhZGIyLi5jNmMwNzJjN2UwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
cGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2Nv
bXByZXNzaW9uLWNvbmQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9w
aWdsaXQvMDAwMS10ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lv
bi1jb25kLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhN2I2OTliMjY0N2I5NTBiNTU1OGEw
ZDUxNjI2ZTQ0NDU1ZDJhMjI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkNmVkNGM0
NzdmMjIzMDljMDlhY2NkNGZlZTY4NDg2ZDc3MTRmMjA1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6IEZy
aSwgMjIgTm92IDIwMjQgMjI6NTI6MzEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHMvZWds
L3NwZWM6IG1ha2UgZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9uIGNvbmRpdGlvbmFsCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAyLWNtYWtlLXVz
ZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAyLWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9J
TkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2gKaW5kZXggYTE5NjkyMWFhNC4uNmNiNTYxYzNmMiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMi1jbWFr
ZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDItY21ha2UtdXNlLXByb3Blci1X
QVlMQU5EX0lOQ0xVREVfRElSUy12YXJpYWJsZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
YTI4YzFkY2RhYTc0YjAxNGFkMzNhN2MwNGFkM2I5MDZjZWUyNzcwZSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gZGViMGMxNTg5MGZiOWQwZjRmYzcwNzRkZGUyYTUxYzg5Y2I1YmY2ZCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBhc2NhbCBCYWNoIDxwYXNjYWwuYmFjaEBz
aWVtZW5zLmNvbT4KIERhdGU6IFRodSwgNCBPY3QgMjAxOCAxNDo0MzoxNyArMDIwMAogU3ViamVj
dDogW1BBVENIXSBjbWFrZTogdXNlIHByb3BlciBXQVlMQU5EX0lOQ0xVREVfRElSUyB2YXJpYWJs
ZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMy10
ZXN0cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMy10ZXN0cy11dGlsLXBp
Z2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNoCmluZGV4IDFhNWQ3
ZjcwMDYuLjc3MDZkODgwODYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWds
aXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2Rl
LWJ1aWxkLXBhdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xp
dC8wMDAzLXRlc3RzLXV0aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5vdC1oYXJkY29kZS1idWlsZC1w
YXQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDMwZWI0NjA1MzRkYmNkNmM3Y2QyM2JiZTcz
M2M4ZWQ2YmRkODI3NzMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY2ZDFkODZmZjhi
ZTMzZGYyNjVkMGRkYTcxN2JlMzg1ZmU4NjM3Y2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFR1
ZSwgMTAgTm92IDIwMjAgMTc6MTM6NTAgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHMvdXRp
bC9waWdsaXQtc2hhZGVyLmM6IGRvIG5vdCBoYXJkY29kZSBidWlsZCBwYXRoIGludG8KQEAgLTEz
LDcgKzEzLDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiAKIGRpZmYgLS1naXQgYS90ZXN0cy91dGlsL3BpZ2xpdC1zaGFkZXIuYyBiL3Rlc3RzL3V0
aWwvcGlnbGl0LXNoYWRlci5jCi1pbmRleCAxNzg3ZWIxODAuLjllNzQ3MDRiMSAxMDA2NDQKK2lu
ZGV4IGIwMzIyMTA1My4uYTAxNTY4YzgxIDEwMDY0NAogLS0tIGEvdGVzdHMvdXRpbC9waWdsaXQt
c2hhZGVyLmMKICsrKyBiL3Rlc3RzL3V0aWwvcGlnbGl0LXNoYWRlci5jCiBAQCAtNzMsNyArNzMs
NyBAQCBwaWdsaXRfY29tcGlsZV9zaGFkZXIoR0xlbnVtIHRhcmdldCwgY29uc3QgY2hhciAqZmls
ZW5hbWUpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9n
aXQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKaW5kZXgg
ZWYzMjQxYzdhMi4uZTMwZWZkZjMzYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3BpZ2xpdC9waWdsaXRfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQv
cGlnbGl0X2dpdC5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvbWVzYS9waWdsaXQuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYQog
ICAgICAgICAgICAiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiCiAKLVNSQ1JFViA9ICJm
YzgxNzlkMzE5MDQ2ZjQ1MzQ2YmNiY2M1YWFlYWJlYmRmMTUxZjAzIgorU1JDUkVWID0gIjA1ZjAy
Y2IyZmYxNzg3ODkyY2JhMzhjM2I2MDlmODkyNDE5YmFlODciCiAjICh3aGVuIFBWIGdvZXMgYWJv
dmUgMS4wIHJlbW92ZSB0aGUgdHJhaWxpbmcgcikKIFBWID0gIjEuMCtnaXRyIgogCi0tIAoyLjQ3
LjEKCg==

--===============4270280366302350005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+05f02cb2ff
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+05f02cb2ff
packages/core2-64-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+fc8179d319-r0'])", added "piglit (['= 1.0+gitr0+05f02cb2ff-r0'])"
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+05f02cb2ff
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+05f02cb2ff
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+05f02cb2ff
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+05f02cb2ff
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+05f02cb2ff
packages/core2-64-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+fc8179d319-r0'])", added "piglit-dev (['= 1.0+gitr0+05f02cb2ff-r0'])"
packages/core2-64-poky-linux/piglit/piglit: PKGSIZE changed from 2082995025 to 2054516936 (-1%)
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+05f02cb2ff
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/ovr_multiview-fb_shader_mismatch_draw_errors /usr/lib/piglit/bin/ovr_multiview-fb_texture_errors /usr/lib/piglit/tests/spec/ovr_multiview2/compiler/other-static-dependence.frag /usr/lib/piglit/tests/spec/ext_external_objects/vk_ping_pong.comp /usr/lib/piglit/bin/ovr_multiview-fb_blit_first_view /usr/lib/piglit/bin/ovr_multiview-fb_incomplete_view_range /usr/lib/piglit/bin/ovr_multiview-fb_attachment_params /usr/lib/piglit/bin/ovr_multiview-fb_read_errors /usr/lib/piglit/tests/spec/ovr_multiview2/compiler/implied-ovr_multiview.vert /usr/lib/piglit/bin/ovr_multiview-fb_incomplete_view_targets /usr/lib/piglit/tests/spec/ovr_multiview/compiler/glsl-130-view-id.vert /usr/lib/piglit/bin/ext_multi_draw_indirect-vertexid /usr/lib/piglit/tests/spec/ovr_multiview/linker/multiple_shaders_single_num_view_declaration_2.shader_test /usr/lib/piglit/bin/ovr_multiview-triangle_compare /usr/lib/piglit/tests/spec/ovr_multi
 view2/compiler/other-static-dependence.vert"

--===============4270280366302350005==--

