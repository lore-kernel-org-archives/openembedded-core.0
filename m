Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E9BC282C8
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:15 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.42726.1738416057736108930
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SvIAbEhg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Xkody6Ci;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010194c1ac04d1-6fbd100e-218d-4ea6-b602-8a38aafd91df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416063;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eEPzjKtcJGKBKydSpgXTkKaSWo7oOU6kMqPWR6FuEQ4=;
	b=SvIAbEhgqaay13NBKxx9yBydva7+5nRHU6k+9pjNCtbGca+sRk303SB6oWQZNxMF
	NMS+Mxe8X0DlV+8gdgGQKYStVE4fAg+drgSTNqCVW/4JRcHtmtGsBNQg4BcBL/fr8xK
	vSLCRFhuxe+bxLySPHtsgWIqVGbLhN2cZ5oG6unY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416063;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eEPzjKtcJGKBKydSpgXTkKaSWo7oOU6kMqPWR6FuEQ4=;
	b=Xkody6CiZpf/9tz1Iflb9ktx6qD79MnFGCsMCPpEiS/ZZ9VdWPdRdPdD0S02FXw4
	eMe5wqLZyKLMlbveVWHR/gWSpOsO1QMkV0SCFqhqtCBaB+EuDl4s0nixxARjTwjDC2E
	QAv5kYvnJ5j00PkJswUR+CetL6uBuUX0FVxvHEM4=
Content-Type: multipart/mixed; boundary="===============5352339713949592407=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to fc8179d319046f45346bcbcc5aaeabebdf151f03
 SUCCEEDED
Message-ID: <01010194c1ac04d1-6fbd100e-218d-4ea6-b602-8a38aafd91df-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:21:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210577

--===============5352339713949592407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *fc8179d319046f45346bcbcc5aaeabebdf151f03* has Succeeded.

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
From 425dc09c1a865c4ae9efa27ed1e6224fdd452841 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 11:49:08 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 ...1-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch | 2 +-
 .../0001-tests-Fix-narrowing-errors-seen-with-clang.patch       | 2 +-
 ...1-tests-egl-spec-make-egl_ext_surface_compression-cond.patch | 2 +-
 .../0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch   | 2 +-
 ...3-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch | 2 +-
 meta/recipes-graphics/piglit/piglit_git.bb                      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index c7e6a68e23..fa9db07f3f 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From ae76c836d98320dacb00616e19af93ac20c48825 Mon Sep 17 00:00:00 2001
+From b76523100ad785c1fed41b881d7aecda1b8ce66f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index 8b7da9f43d..8b51790e2a 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From e1d84dc54b0eca3cef1136264dbbceb9ea19524c Mon Sep 17 00:00:00 2001
+From e7cd5ff25b40b807664bdcaf4f865ec769bbc52c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index d68e9d477d..9c2fe0adb2 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From e23bacb04ff77f86e56d6684451e5e93b59f1b0a Mon Sep 17 00:00:00 2001
+From a7b699b2647b950b5558a0d51626e44455d2a229 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index a934d48c56..a196921aa4 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From 6810358403b2de577d76cab80a4e39da77c5c442 Mon Sep 17 00:00:00 2001
+From a28c1dcdaa74b014ad33a7c04ad3b906cee2770e Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index fa9cad3687..1a5d7f7006 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From d18b10cde60f209375e79db480c46489d483c7f2 Mon Sep 17 00:00:00 2001
+From 30eb460534dbcd6c7cd23bbe733c8ed6bdd82773 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index c4091eecb0..ef3241c7a2 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "631b72944f56e688f56a08d26c8a9f3988801a08"
+SRCREV = "fc8179d319046f45346bcbcc5aaeabebdf151f03"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.44.1


--===============5352339713949592407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+631b72944f to 1.0+gitr0+fc8179d319
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+631b72944f to 1.0+gitr0+fc8179d319
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+631b72944f to 1.0+gitr0+fc8179d319
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+631b72944f to 1.0+gitr0+fc8179d319
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+631b72944f to 1.0+gitr0+fc8179d319
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+631b72944f to 1.0+gitr0+fc8179d319
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+631b72944f to 1.0+gitr0+fc8179d319
packages/core2-64-poky-linux/piglit/piglit: PKGSIZE changed from 2082665033 to 2082937681 (+0%)
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/pixel-rate /usr/lib/piglit/tests/spec/ovr_multiview/compiler/multiple-num-views-in-single-declaration-mismatch.vert /usr/lib/piglit/tests/spec/ovr_multiview/linker/match_viewcount.shader_test /usr/lib/piglit/tests/spec/ovr_multiview/compiler/multiple-num-views-in-single-declaration.vert /usr/lib/piglit/tests/spec/ovr_multiview/linker/mismatch_viewcount.shader_test /usr/lib/piglit/tests/spec/ovr_multiview/linker/multiple_shaders_single_num_view_declaration.shader_test"
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+631b72944f to 1.0+gitr0+fc8179d319

--===============5352339713949592407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+631b72944f to 1.0+gitr0+fc8179d319
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+631b72944f to 1.0+gitr0+fc8179d319
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+631b72944f to 1.0+gitr0+fc8179d319
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+631b72944f to 1.0+gitr0+fc8179d319
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+631b72944f to 1.0+gitr0+fc8179d319
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+631b72944f to 1.0+gitr0+fc8179d319
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+631b72944f to 1.0+gitr0+fc8179d319
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/ovr_multiview/linker/match_viewcount.shader_test /usr/lib/piglit/tests/spec/ovr_multiview/compiler/multiple-num-views-in-single-declaration.vert /usr/lib/piglit/tests/spec/ovr_multiview/linker/multiple_shaders_single_num_view_declaration.shader_test /usr/lib/piglit/tests/spec/ovr_multiview/linker/mismatch_viewcount.shader_test /usr/lib/piglit/tests/spec/ovr_multiview/compiler/multiple-num-views-in-single-declaration-mismatch.vert /usr/lib/piglit/bin/pixel-rate"
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+631b72944f to 1.0+gitr0+fc8179d319

--===============5352339713949592407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (0 cached, 919 parsed). 1875 targets, 52 skipped, 0 masked, 0 errors.
Removing 57 recipes from the core2-64 sysroot...done.
Removing 96 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:fdff45e63947de90ecf4d2eb24f9e602d2c0b3ec"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 714 Local 684 Mirrors 0 Missed 30 Current 317 (95% match, 97% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 328 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 335 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 336 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx_setscene)
NOTE: Running setscene task 337 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 343 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 349 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 351 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 354 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 358 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 362 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.8.bb:do_package_qa_setscene)
NOTE: Running setscene task 394 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 395 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 397 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 400 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 403 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.8.bb:do_package_write_ipk_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-mako-1.3.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_package_qa_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-mako-1.3.8-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-mako-1.3.8-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 406 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_package_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-mako-1.3.8-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-mako-1.3.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 413 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.8.bb:do_package_write_deb_setscene)
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 431 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 436 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.8.bb:do_create_spdx_setscene)
NOTE: recipe python3-six-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 437 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 444 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 447 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 453 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 459 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 462 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-mako-1.3.8-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 463 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-mako-1.3.8-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-mako-1.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe waffle-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 464 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe python3-mako-1.3.8-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-mako-1.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 465 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: recipe piglit-1.0+gitr-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 466 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 468 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 469 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.0.bb:do_packagedata_setscene)
NOTE: recipe waffle-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 470 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 473 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 474 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe python3-six-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 476 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 477 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 478 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: recipe python3-six-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 480 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 481 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.8.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 483 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-pygments/2.19.0/temp/log.do_packagedata_setscene.3858219
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 485 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 488 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe waffle-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.44-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 491 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 494 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe python3-mako-1.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 500 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_create_spdx_setscene)
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 504 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_populate_sysroot_setscene)
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-mako-1.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 506 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.0.bb:do_package_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 514 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 525 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 534 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 536 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 558 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_setscene)
NOTE: recipe wayland-protocols-1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 569 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-six-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 579 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 582 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 588 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.44.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 593 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 605 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 615 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-mako-1.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 618 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 624 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 626 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe python3-mako-1.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 627 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 631 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.19.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 671 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 672 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 675 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 680 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 682 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.39.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 707 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.39-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 736 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 739 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 741 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 748 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 749 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/lzlib/1.14/temp/log.do_packagedata_setscene.3859844
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 751 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 754 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 760 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 769 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 773 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 775 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_package_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 779 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 781 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 797 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_package_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 798 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 799 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 800 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 804 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 809 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 814 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 825 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 827 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 834 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 835 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 841 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 843 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 847 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 848 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_package_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 852 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 864 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 865 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 867 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 868 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 873 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 874 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 875 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 877 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 879 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 880 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 882 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 884 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 885 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 888 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 890 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 891 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 893 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 894 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 897 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 898 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 900 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 901 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 902 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 908 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 909 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 910 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 911 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 914 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 915 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 916 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 917 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 918 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 921 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 925 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 929 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 931 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 932 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 933 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 934 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 938 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 939 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 941 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 945 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 946 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 947 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 949 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 950 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 951 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 953 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 954 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 955 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 956 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 959 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 960 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 962 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 965 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 968 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 969 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 972 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 973 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 977 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 978 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 979 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 981 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 983 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 986 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 989 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1474 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_fetch)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1560 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1601 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1604 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_write_config)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 991 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running task 1720 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 993 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 994 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.8.1-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1816 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe waffle-1.8.1-r0: task do_write_config: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe waffle-1.8.1-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: Running task 1840 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: Running task 1846 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe waffle-1.8.1-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 996 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 998 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1000 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1001 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1003 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1004 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1005 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe waffle-1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1849 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_patch)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1006 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1007 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe waffle-1.8.1-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1013 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1016 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1020 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1022 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1023 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1877 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Succeeded
NOTE: Running task 1878 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Succeeded
NOTE: Running task 1880 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1881 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1027 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1029 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1030 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2488 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2600 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2682 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata)
NOTE: Running task 2752 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.0.bb:do_packagedata)
NOTE: recipe waffle-1.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2760 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_collect_spdx_deps)
NOTE: Running task 2767 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_collect_spdx_deps)
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata: Started
NOTE: Running task 2777 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_ipk)
NOTE: recipe python3-pygments-2.19.0-r0: task do_packagedata: Started
NOTE: Running task 2778 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_deb)
NOTE: Running task 2779 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_rpm)
NOTE: recipe waffle-1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2780 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_qa)
NOTE: recipe mesa-demos-8.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.2.37-r0: task do_package_qa: Started
NOTE: recipe python3-pygments-2.19.0-r0: task do_packagedata: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_packagedata: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2805 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_configure)
NOTE: Running task 2806 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe waffle-1.8.1-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_ipk unihash changed to 4f29c2eb3a469f981f8642cc139dd1ae429c365792dcb37bf72e020017a1ab5d
NOTE: recipe waffle-1.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2807 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_compile)
NOTE: recipe waffle-1.8.1-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2808 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe bash-5.2.37-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_qa unihash changed to f6323b7851382cd4ea950c3b248d957f85711bdfb9dbdb83848cce39437fe6fc
NOTE: recipe waffle-1.8.1-r0: task do_compile: Succeeded
NOTE: Running task 2809 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_install)
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_rpm unihash changed to 983f2727465579c18a75af1ba2f689499bb30c772cb14bff9089ca7674bcdc33
NOTE: recipe waffle-1.8.1-r0: task do_install: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_deb unihash changed to b8e19515245707f237c6988324fa61adea46c10f05bb0b295ed87fa14e0cb11c
NOTE: recipe waffle-1.8.1-r0: task do_install: Succeeded
NOTE: Running task 2810 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package)
NOTE: Running task 2811 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.8.1-r0: task do_package: Started
NOTE: recipe waffle-1.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2812 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2813 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2814 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe waffle-1.8.1-r0: task do_package: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 2815 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: Running task 2816 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_packagedata)
NOTE: Running task 2817 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_populate_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe waffle-1.8.1-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.8.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_packagedata unihash changed to 71cc0d0bc1eb21e62eace7e056d2bd9089ad5009ea642f91274d8fb1f12c406c
NOTE: Setscene tasks completed
NOTE: Running task 2818 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_create_spdx)
NOTE: Running task 2819 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_ipk)
NOTE: Running task 2820 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_deb)
NOTE: Running task 2821 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_rpm)
NOTE: Running task 2822 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_qa)
NOTE: recipe waffle-1.8.1-r0: task do_create_spdx: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_write_ipk: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_package_write_deb: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_qa: Started
NOTE: recipe waffle-1.8.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2823 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_collect_spdx_deps)
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_ipk unihash changed to 768dbee0c5077a73a416667954c94a74f61a6da36e9a72bbf888ac18a8583407
NOTE: recipe waffle-1.8.1-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_qa unihash changed to b4a389aec37f2ad696a7ef14379e458b122319ccb5bc9013158aa615ff421f26
NOTE: recipe waffle-1.8.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_deb unihash changed to bd5b4f429a70a2b59d6904c264dde20badadd5970491f5ce4eceecefb735de34
NOTE: recipe waffle-1.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_rpm unihash changed to babf761acaf84507632f528ef0bd680db877df931e6b16f84714d06284e9a7f6
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 2824 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata unihash changed to de7306de08bfbc1fb1dfb13144aa47910f3dd8169a22e7c275ca833760c02031
NOTE: Setscene tasks completed
NOTE: Running task 2825 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_create_spdx)
NOTE: Running task 2826 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_ipk)
NOTE: Running task 2827 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_deb)
NOTE: Running task 2828 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: Running task 2829 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_qa)
NOTE: recipe mesa-demos-8.5.0-r0: task do_create_spdx: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_ipk: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_deb: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_qa: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_ipk unihash changed to a536bacc2c0548a77a6b02e6e7e70ebe729c24917c3cfeef5c1f53219699f559
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_qa unihash changed to a0e3a4dcf3a4ec33bf8b4b154dc01212cd677b306db082c8685c19851dcef43c
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm unihash changed to 2c400f7bc096566336ec6ee3ad0e27c18a389e3694f2f21cbca00715a2857254
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_deb unihash changed to b46e441ddad60851cc88dcd0840ac4b4f8d2434ebb6f5350f03c34ef471ce574
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2830 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Succeeded
NOTE: Running task 2831 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Succeeded
NOTE: Running task 2832 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2833 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Succeeded
NOTE: Running task 2834 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Succeeded
NOTE: Running task 2835 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_create_spdx)
NOTE: Running task 2836 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_ipk)
NOTE: Running task 2837 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_deb)
NOTE: Running task 2838 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 2839 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitr-r0: task do_create_spdx: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_ipk: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_deb: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_ipk: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_create_spdx: Succeeded
NOTE: Running task 2840 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_create_package_spdx)
NOTE: recipe piglit-1.0+gitr-r0: task do_create_package_spdx: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_deb: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa unihash changed to 1011d2c67cbc7179a315c2e6f9a4ff9e63766eec29783797d8aff041c48a4a53
NOTE: recipe piglit-1.0+gitr-r0: task do_create_package_spdx: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2841 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2841 tasks of which 2781 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: python3-pygments-2.19.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pygments-src went backwards which would break package feeds (from 0:2.19.1-r0 to 0:2.19.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.19.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pygments-dbg went backwards which would break package feeds (from 0:2.19.1-r0 to 0:2.19.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.19.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pygments-staticdev went backwards which would break package feeds (from 0:2.19.1-r0 to 0:2.19.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.19.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pygments-dev went backwards which would break package feeds (from 0:2.19.1-r0 to 0:2.19.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.19.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pygments-doc went backwards which would break package feeds (from 0:2.19.1-r0 to 0:2.19.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.19.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pygments-locale went backwards which would break package feeds (from 0:2.19.1-r0 to 0:2.19.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.19.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pygments went backwards which would break package feeds (from 0:2.19.1-r0 to 0:2.19.0-r0) [version-going-backwards]
ERROR: python3-pygments-2.19.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: lzlib-1.14-r0 do_packagedata_setscene: QA Issue: Package version for package lzlib-src went backwards which would break package feeds (from 0:1.15-r0 to 0:1.14-r0) [version-going-backwards]
ERROR: lzlib-1.14-r0 do_packagedata_setscene: QA Issue: Package version for package lzlib-dbg went backwards which would break package feeds (from 0:1.15-r0 to 0:1.14-r0) [version-going-backwards]
ERROR: lzlib-1.14-r0 do_packagedata_setscene: QA Issue: Package version for package lzlib-staticdev went backwards which would break package feeds (from 0:1.15-r0 to 0:1.14-r0) [version-going-backwards]
ERROR: lzlib-1.14-r0 do_packagedata_setscene: QA Issue: Package version for package lzlib-dev went backwards which would break package feeds (from 0:1.15-r0 to 0:1.14-r0) [version-going-backwards]
ERROR: lzlib-1.14-r0 do_packagedata_setscene: QA Issue: Package version for package lzlib-doc went backwards which would break package feeds (from 0:1.15-r0 to 0:1.14-r0) [version-going-backwards]
ERROR: lzlib-1.14-r0 do_packagedata_setscene: QA Issue: Package version for package lzlib-locale went backwards which would break package feeds (from 0:1.15-r0 to 0:1.14-r0) [version-going-backwards]
ERROR: lzlib-1.14-r0 do_packagedata_setscene: QA Issue: Package version for package lzlib went backwards which would break package feeds (from 0:1.15-r0 to 0:1.14-r0) [version-going-backwards]
ERROR: lzlib-1.14-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5352339713949592407==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSA0MjVkYzA5YzFhODY1YzRhZTllZmEyN2VkMWU2MjI0ZmRkNDUyODQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAxMTo0OTowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
Z2xpdDogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogLi4uMS1DTWFrZUxpc3RzLnR4
dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoIHwgMiArLQogLi4u
LzAwMDEtdGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13aXRoLWNsYW5nLnBhdGNoICAg
ICAgIHwgMiArLQogLi4uMS10ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21w
cmVzc2lvbi1jb25kLnBhdGNoIHwgMiArLQogLi4uLzAwMDItY21ha2UtdXNlLXByb3Blci1XQVlM
QU5EX0lOQ0xVREVfRElSUy12YXJpYWJsZS5wYXRjaCAgIHwgMiArLQogLi4uMy10ZXN0cy11dGls
LXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNoIHwgMiArLQog
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiICAgICAgICAgICAgICAg
ICAgICAgIHwgMiArLQogNiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQv
MDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZy
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1DTWFrZUxp
c3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoCmluZGV4
IGM3ZTZhNjhlMjMuLmZhOWRiMDdmM2YgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0LzAwMDEtQ01ha2VMaXN0cy50eHQtZG8tbm90LW9idGFpbi13YXlsYW5k
LXNjYW5uZXItcGF0aC1mci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0
L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMudHh0LWRvLW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVy
LXBhdGgtZnIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGFlNzZjODM2ZDk4MzIwZGFjYjAw
NjE2ZTE5YWY5M2FjMjBjNDg4MjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGI3NjUy
MzEwMGFkNzg1YzFmZWQ0MWI4ODFkN2FlY2RhMWI4Y2U2NmYgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTog
RnJpLCAyMyBBdWcgMjAyNCAxNToyOTo0NSArMDIwMAogU3ViamVjdDogW1BBVENIXSBDTWFrZUxp
c3RzLnR4dDogZG8gbm90IG9idGFpbiB3YXlsYW5kLXNjYW5uZXIgcGF0aCBmcm9tCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLUZpeC1u
YXJyb3dpbmctZXJyb3JzLXNlZW4td2l0aC1jbGFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13
aXRoLWNsYW5nLnBhdGNoCmluZGV4IDhiN2RhOWY0M2QuLjhiNTE3OTBlMmEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtRml4LW5hcnJv
d2luZy1lcnJvcnMtc2Vlbi13aXRoLWNsYW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13
aXRoLWNsYW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlMWQ4NGRjNTRiMGVjYTNjZWYx
MTM2MjY0ZGJiY2ViOWVhMTk1MjRjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlN2Nk
NWZmMjViNDBiODA3NjY0YmRjYWY0Zjg2NWVjNzY5YmJjNTJjIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMyBN
YXkgMjAyMyAyMTo1OTo0MyAtMDcwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0czogRml4IG5hcnJv
d2luZyBlcnJvcnMgc2VlbiB3aXRoIGNsYW5nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJm
YWNlX2NvbXByZXNzaW9uLWNvbmQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0
L3BpZ2xpdC8wMDAxLXRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNz
aW9uLWNvbmQucGF0Y2gKaW5kZXggZDY4ZTlkNDc3ZC4uOWMyZmUwYWRiMiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1lZ2wtc3BlYy1t
YWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1jb25kLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtZWdsLXNwZWMtbWFrZS1lZ2xf
ZXh0X3N1cmZhY2VfY29tcHJlc3Npb24tY29uZC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
ZTIzYmFjYjA0ZmY3N2Y4NmU1NmQ2Njg0NDUxZTVlOTNiNTlmMWIwYSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gYTdiNjk5YjI2NDdiOTUwYjU1NThhMGQ1MTYyNmU0NDQ1NWQyYTIyOSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxp
bnV0cm9uaXguZGU+CiBEYXRlOiBGcmksIDIyIE5vdiAyMDI0IDIyOjUyOjMxICswMTAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIHRlc3RzL2VnbC9zcGVjOiBtYWtlIGVnbF9leHRfc3VyZmFjZV9jb21wcmVz
c2lvbiBjb25kaXRpb25hbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xp
dC9waWdsaXQvMDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlh
YmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMi1jbWFr
ZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoCmluZGV4IGE5
MzRkNDhjNTYuLmExOTY5MjFhYTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9w
aWdsaXQvcGlnbGl0LzAwMDItY21ha2UtdXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12
YXJpYWJsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8w
MDAyLWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDY4MTAzNTg0MDNiMmRlNTc3ZDc2Y2FiODBhNGUzOWRhNzdj
NWM0NDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGEyOGMxZGNkYWE3NGIwMTRhZDMz
YTdjMDRhZDNiOTA2Y2VlMjc3MGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQYXNj
YWwgQmFjaCA8cGFzY2FsLmJhY2hAc2llbWVucy5jb20+CiBEYXRlOiBUaHUsIDQgT2N0IDIwMTgg
MTQ6NDM6MTcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gY21ha2U6IHVzZSBwcm9wZXIgV0FZTEFO
RF9JTkNMVURFX0RJUlMgdmFyaWFibGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8tbm90LWhh
cmRjb2RlLWJ1aWxkLXBhdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxk
LXBhdC5wYXRjaAppbmRleCBmYTljYWQzNjg3Li4xYTVkN2Y3MDA2IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGlnbGl0LXNo
YWRlci5jLWRvLW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMy10ZXN0cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1k
by1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkMThi
MTBjZGU2MGYyMDkzNzVlNzlkYjQ4MGM0NjQ4OWQ0ODNjN2YyIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAzMGViNDYwNTM0ZGJjZDZjN2NkMjNiYmU3MzNjOGVkNmJkZDgyNzczIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDEwIE5vdiAyMDIwIDE3OjEzOjUwICswMDAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIHRlc3RzL3V0aWwvcGlnbGl0LXNoYWRlci5jOiBkbyBub3QgaGFyZGNvZGUg
YnVpbGQgcGF0aCBpbnRvCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0
L3BpZ2xpdF9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQu
YmIKaW5kZXggYzQwOTFlZWNiMC4uZWYzMjQxYzdhMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0X2dpdC5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gImdpdDov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9waWdsaXQuZ2l0O3Byb3RvY29sPWh0dHBzO2Jy
YW5jaD1tYQogICAgICAgICAgICAiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiCiAKLVNS
Q1JFViA9ICI2MzFiNzI5NDRmNTZlNjg4ZjU2YTA4ZDI2YzhhOWYzOTg4ODAxYTA4IgorU1JDUkVW
ID0gImZjODE3OWQzMTkwNDZmNDUzNDZiY2JjYzVhYWVhYmViZGYxNTFmMDMiCiAjICh3aGVuIFBW
IGdvZXMgYWJvdmUgMS4wIHJlbW92ZSB0aGUgdHJhaWxpbmcgcikKIFBWID0gIjEuMCtnaXRyIgog
Ci0tIAoyLjQ0LjEKCg==

--===============5352339713949592407==--

