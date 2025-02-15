Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B017C282DC
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:35 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.8097.1739623336216577416
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iB3HtpEJ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Dx6XRQsB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019509a1af38-fe5db60e-5410-4b5e-930a-35d46986ce20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vqwmHXjcRRkP7hdwjgh+AAC2h+mFOs93V9QNWby6Zfc=;
	b=iB3HtpEJObPYpfQetQJEnf66pOxzDGcPYvJ1sHNKjW7DaCYOlHN0q/ZFqob5D9MK
	DuefkfoysIAx2Fci462oPUM3BLrgR8LgC8xLd3lmFvTg5yzuVMzmZd/alZitF+hicvV
	n6BlNWLfFr/GBsld166Ac877U1IfBiQQE3scmPpQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vqwmHXjcRRkP7hdwjgh+AAC2h+mFOs93V9QNWby6Zfc=;
	b=Dx6XRQsBGSTlehrxK6v5uoVxqWVn91kl/zZoBC3VCpd6P828eTNeGguhP9sI/JKB
	Ei6OAHAQcigirHp0HXBECygkQy2t0ThKorP6L44UMagb4GoZVN2AfaXekNoNnj/hkEj
	j7zMuB6JHPkunw+jsAjHOMa2EeULRUOLq62sICRw=
Content-Type: multipart/mixed; boundary="===============5871869418049131589=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to efb2b6b4665d01162c641e8844ecead928c25fbe
 SUCCEEDED
Message-ID: <0101019509a1af38-fe5db60e-5410-4b5e-930a-35d46986ce20-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211456

--===============5871869418049131589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *efb2b6b4665d01162c641e8844ecead928c25fbe* has Succeeded.

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
From cfdb0c9a3ce071c029d487e4ab3614a282524551 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 09:58:45 +0000
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
index fa9db07f3f..2d33e2f639 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From b76523100ad785c1fed41b881d7aecda1b8ce66f Mon Sep 17 00:00:00 2001
+From 5a82425a8967d1a0a78497c9be16ce191075d645 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index 8b51790e2a..1469429c5d 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From e7cd5ff25b40b807664bdcaf4f865ec769bbc52c Mon Sep 17 00:00:00 2001
+From 021621bdff867f967c535d8c108430fa542f4924 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index 9c2fe0adb2..166097bc21 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From a7b699b2647b950b5558a0d51626e44455d2a229 Mon Sep 17 00:00:00 2001
+From d7d26a82e1a89d0c4d9f17ef9951fee625840828 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index a196921aa4..93d797d7f3 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From a28c1dcdaa74b014ad33a7c04ad3b906cee2770e Mon Sep 17 00:00:00 2001
+From 90a685017646c1ee629dcdc1116fa474ee40d0e7 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 1a5d7f7006..0aff2276ea 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From 30eb460534dbcd6c7cd23bbe733c8ed6bdd82773 Mon Sep 17 00:00:00 2001
+From 84440fd6e0a08121e03d3d7d408fb46b570a28ea Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index ef3241c7a2..ec3490815a 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "fc8179d319046f45346bcbcc5aaeabebdf151f03"
+SRCREV = "efb2b6b4665d01162c641e8844ecead928c25fbe"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.44.1


--===============5871869418049131589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1869 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1869 targets, 38 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:4482fea9c77d12b0b7e28b135cbf3f3fd5a427ad"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 423 Local 412 Mirrors 0 Missed 11 Current 590 (97% match, 98% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 10 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2146 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: Running task 2780 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 2781 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Succeeded
NOTE: Running task 2782 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running task 2783 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_collect_spdx_deps)
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Succeeded
NOTE: Running task 2784 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2785 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2786 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 1e1e200888113b8514d6004d68242ecb4d7375231d369c328dccca02b046218b
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2787 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Succeeded
NOTE: Running task 2788 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Succeeded
NOTE: Running task 2789 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Succeeded
NOTE: Running task 2790 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2791 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot unihash changed to a58feb693d516908ad1b40897944ad4be2074cf46e04bcf5c52b0b6fce6c2aac
NOTE: Setscene tasks completed
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Succeeded
NOTE: Running task 2792 of 2799 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2792 tasks of which 2778 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215094710.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215094710.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.1086227
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+efb2b6b466-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+efb2b6b466-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+efb2b6b466-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+efb2b6b466-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+efb2b6b466-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+efb2b6b466-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+efb2b6b466-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+efb2b6b466-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.1086227
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============5871869418049131589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1870 targets, 49 skipped, 0 masked, 0 errors.
Removing 55 recipes from the core2-64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:4482fea9c77d12b0b7e28b135cbf3f3fd5a427ad"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 709 Local 683 Mirrors 0 Missed 26 Current 322 (96% match, 97% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 333 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 344 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 348 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_qa_setscene)
NOTE: Running setscene task 359 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 361 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.8.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 375 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 384 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.8.bb:do_package_qa_setscene)
NOTE: Running setscene task 392 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 394 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 395 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 396 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 400 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 405 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.8.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 406 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 413 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 414 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_deb_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_qa_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-mako-1.3.8-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-mako-1.3.8-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-mako-1.3.8-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 415 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-mako-1.3.8-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 416 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 417 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_package_write_ipk_setscene)
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-mako-1.3.8-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 419 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.8.bb:do_create_spdx_setscene)
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 423 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 424 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-six-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 429 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_package_write_deb_setscene)
NOTE: recipe python3-mako-1.3.8-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 442 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.8.bb:do_package_write_rpm_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 450 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.45.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 452 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 454 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 459 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 461 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-mako-1.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-mako-1.3.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-six-1.17.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 465 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-mako-1.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-six-1.17.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libpng-1.6.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-mako-1.3.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 466 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_packagedata_setscene)
NOTE: recipe piglit-1.0+gitr-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 467 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.19.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 474 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 475 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.45.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.37-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 477 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: recipe waffle-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.45-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe waffle-1.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 478 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 480 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 481 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe mesa-demos-8.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 484 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygments-2.19.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_packagedata_setscene)
NOTE: recipe python3-six-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytest-8.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 500 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: recipe python3-mako-1.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 503 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.45.bb:do_recipe_qa_setscene)
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe waffle-1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.40.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 510 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-mako/1.3.8/temp/log.do_packagedata_setscene.1088116
NOTE: recipe tzdata-2025a-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.8.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 511 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.8.bb:do_package_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ca-certificates-20241223-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 528 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 530 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_create_spdx_setscene)
NOTE: Running setscene task 531 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 536 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 542 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 548 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 566 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 570 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 575 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 576 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 589 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 608 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 609 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 617 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_packagedata_setscene)
NOTE: recipe python3-mako-1.3.8-r0: task do_package_setscene: Started
NOTE: recipe wayland-protocols-1.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 637 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 639 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 674 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 675 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 682 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 689 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 692 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 694 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 698 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 703 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-mako-1.3.8-r0: task do_package_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 715 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 726 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 739 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 745 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 749 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 754 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 763 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 764 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 767 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.0.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 769 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.8.bb:do_packagedata_setscene)
NOTE: recipe python3-mako-1.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 772 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 776 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 778 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-mako-1.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 779 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 782 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 786 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 795 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 796 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 800 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.73.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 806 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 813 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 819 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 821 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 822 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 825 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.73-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 841 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 843 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 844 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 855 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 856 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 859 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 860 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 862 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 863 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 868 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 870 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 874 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 879 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 883 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 887 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 889 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 891 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 892 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 893 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 895 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 899 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 900 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 901 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 902 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 904 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 907 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 911 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 913 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 914 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 923 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 924 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 925 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 926 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 927 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 931 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 932 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 937 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 939 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 943 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 944 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 946 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 950 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 951 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 952 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 956 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 958 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 959 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 961 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 964 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 966 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 969 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 974 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 975 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 977 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 978 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 979 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1469 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_fetch)
NOTE: Running setscene task 984 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 986 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 990 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 993 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 994 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running task 1555 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1596 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1599 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_write_config)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe waffle-1.8.1-r0: task do_fetch: Started
NOTE: Running task 1710 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.8.1-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1819 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe waffle-1.8.1-r0: task do_write_config: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 1845 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 996 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: Running task 1846 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe waffle-1.8.1-r0: task do_unpack: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 998 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1000 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1001 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1003 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1004 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1005 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1006 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1008 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe waffle-1.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1849 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe waffle-1.8.1-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1012 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1016 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1020 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1021 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1023 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1877 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Succeeded
NOTE: Running task 1878 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Succeeded
NOTE: Running task 1880 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1881 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1025 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1028 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1030 of 1031 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2488 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2600 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2651 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-mako_1.3.8.bb:do_packagedata)
NOTE: recipe waffle-1.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2768 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_collect_spdx_deps)
NOTE: Running task 2777 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_collect_spdx_deps)
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.3.8-r0: task do_packagedata: Started
NOTE: recipe waffle-1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-mako-1.3.8-r0: task do_packagedata: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2805 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2806 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe waffle-1.8.1-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe waffle-1.8.1-r0: task do_configure: Succeeded
NOTE: Running task 2807 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_compile)
NOTE: recipe waffle-1.8.1-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2808 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe waffle-1.8.1-r0: task do_compile: Succeeded
NOTE: Running task 2809 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_install)
NOTE: recipe waffle-1.8.1-r0: task do_install: Started
NOTE: recipe waffle-1.8.1-r0: task do_install: Succeeded
NOTE: Running task 2810 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package)
NOTE: Running task 2811 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_populate_sysroot)
NOTE: recipe waffle-1.8.1-r0: task do_package: Started
NOTE: recipe waffle-1.8.1-r0: task do_populate_sysroot: Started
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
NOTE: Running task 2815 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_packagedata)
NOTE: Running task 2816 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: Running task 2817 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.8.1-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe waffle-1.8.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_packagedata unihash changed to 28d095c5ca24227fe67e95ee274db7e068ec8a349fc02471bc8b12ddcbd7e8d2
NOTE: Setscene tasks completed
NOTE: Running task 2818 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_create_spdx)
NOTE: Running task 2819 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_ipk)
NOTE: Running task 2820 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_deb)
NOTE: Running task 2821 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_rpm)
NOTE: Running task 2822 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_qa)
NOTE: recipe mesa-demos-8.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_create_spdx: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_write_ipk: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_write_deb: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_qa: Started
NOTE: recipe waffle-1.8.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2823 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_collect_spdx_deps)
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Started
NOTE: recipe waffle-1.8.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_ipk unihash changed to 0e0cf1ec96a06ff691d01faca23a8cafc0f5c37e717df15c181df33917f7d6d7
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_package_qa: Succeeded
NOTE: recipe waffle-1.8.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_qa unihash changed to b4a389aec37f2ad696a7ef14379e458b122319ccb5bc9013158aa615ff421f26
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_deb unihash changed to aab59cbfd6fa6f620c56578b35935952b364f2364e24080e54afb07c95551063
NOTE: recipe waffle-1.8.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/waffle/waffle_1.8.1.bb:do_package_write_rpm unihash changed to 9b243570e431584a9a9a86a34ebf9be6a8c452b872de15c6d977372f93dcad1e
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 2824 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata unihash changed to c1ee6d4f956bf28fa048d71e1580372f2a38a20d5a1799a1b18417f6e8543900
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
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_ipk unihash changed to 51d0d8421177ab82a3ea1540027263bcfaaef1d7f4dbc029235e552300635314
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_qa unihash changed to a0e3a4dcf3a4ec33bf8b4b154dc01212cd677b306db082c8685c19851dcef43c
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm unihash changed to 64da31526784f29728950647cf628ee1cd34b05c2cf38a0b7e5b6eda7dff1a0e
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_deb unihash changed to 614fe4656fb8fd65335446abc759abc6b89b495b2bdc58bb78aa1acb2cb713d2
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
NOTE: recipe piglit-1.0+gitr-r0: task do_create_spdx: Started
NOTE: Running task 2839 of 2841 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
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
NOTE: Tasks Summary: Attempted 2841 tasks of which 2786 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-mako-1.3.8-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.3.9-r0 to 0:1.3.8-r0) [version-going-backwards]
ERROR: python3-mako-1.3.8-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.3.9-r0 to 0:1.3.8-r0) [version-going-backwards]
ERROR: python3-mako-1.3.8-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mako-ptest went backwards which would break package feeds (from 0:1.3.9-r0 to 0:1.3.8-r0) [version-going-backwards]
ERROR: python3-mako-1.3.8-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.3.9-r0 to 0:1.3.8-r0) [version-going-backwards]
ERROR: python3-mako-1.3.8-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.3.9-r0 to 0:1.3.8-r0) [version-going-backwards]
ERROR: python3-mako-1.3.8-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.3.9-r0 to 0:1.3.8-r0) [version-going-backwards]
ERROR: python3-mako-1.3.8-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.3.9-r0 to 0:1.3.8-r0) [version-going-backwards]
ERROR: python3-mako-1.3.8-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.3.9-r0 to 0:1.3.8-r0) [version-going-backwards]
ERROR: python3-mako-1.3.8-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5871869418049131589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+efb2b6b466
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+efb2b6b466
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+efb2b6b466
packages/core2-64-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+fc8179d319-r0'])", added "piglit (['= 1.0+gitr0+efb2b6b466-r0'])"
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+efb2b6b466
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+efb2b6b466
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+efb2b6b466
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+efb2b6b466
packages/core2-64-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+fc8179d319-r0'])", added "piglit-dev (['= 1.0+gitr0+efb2b6b466-r0'])"
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+efb2b6b466

--===============5871869418049131589==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSBjZmRiMGM5YTNjZTA3MWMwMjlkNDg3ZTRhYjM2MTRhMjgyNTI0NTUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDk6NTg6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIC4uLjEtQ01ha2VMaXN0cy50
eHQtZG8tbm90LW9idGFpbi13YXlsYW5kLXNjYW5uZXItcGF0aC1mci5wYXRjaCB8IDIgKy0KIC4u
Li8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNlZW4td2l0aC1jbGFuZy5wYXRjaCAg
ICAgICB8IDIgKy0KIC4uLjEtdGVzdHMtZWdsLXNwZWMtbWFrZS1lZ2xfZXh0X3N1cmZhY2VfY29t
cHJlc3Npb24tY29uZC5wYXRjaCB8IDIgKy0KIC4uLi8wMDAyLWNtYWtlLXVzZS1wcm9wZXItV0FZ
TEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2ggICB8IDIgKy0KIC4uLjMtdGVzdHMtdXRp
bC1waWdsaXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaCB8IDIgKy0K
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYiAgICAgICAgICAgICAg
ICAgICAgICB8IDIgKy0KIDYgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0
LzAwMDEtQ01ha2VMaXN0cy50eHQtZG8tbm90LW9idGFpbi13YXlsYW5kLXNjYW5uZXItcGF0aC1m
ci5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtQ01ha2VM
aXN0cy50eHQtZG8tbm90LW9idGFpbi13YXlsYW5kLXNjYW5uZXItcGF0aC1mci5wYXRjaAppbmRl
eCBmYTlkYjA3ZjNmLi4yZDMzZTJmNjM5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvcGlnbGl0L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMudHh0LWRvLW5vdC1vYnRhaW4td2F5bGFu
ZC1zY2FubmVyLXBhdGgtZnIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xp
dC9waWdsaXQvMDAwMS1DTWFrZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5l
ci1wYXRoLWZyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiNzY1MjMxMDBhZDc4NWMxZmVk
NDFiODgxZDdhZWNkYTFiOGNlNjZmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1YTgy
NDI1YTg5NjdkMWEwYTc4NDk3YzliZTE2Y2UxOTEwNzVkNjQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERhdGU6
IEZyaSwgMjMgQXVnIDIwMjQgMTU6Mjk6NDUgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gQ01ha2VM
aXN0cy50eHQ6IGRvIG5vdCBvYnRhaW4gd2F5bGFuZC1zY2FubmVyIHBhdGggZnJvbQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1GaXgt
bmFycm93aW5nLWVycm9ycy1zZWVuLXdpdGgtY2xhbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNlZW4t
d2l0aC1jbGFuZy5wYXRjaAppbmRleCA4YjUxNzkwZTJhLi4xNDY5NDI5YzVkIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLUZpeC1uYXJy
b3dpbmctZXJyb3JzLXNlZW4td2l0aC1jbGFuZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmctZXJyb3JzLXNlZW4t
d2l0aC1jbGFuZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTdjZDVmZjI1YjQwYjgwNzY2
NGJkY2FmNGY4NjVlYzc2OWJiYzUyYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDIx
NjIxYmRmZjg2N2Y5NjdjNTM1ZDhjMTA4NDMwZmE1NDJmNDkyNCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDMg
TWF5IDIwMjMgMjE6NTk6NDMgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IEZpeCBuYXJy
b3dpbmcgZXJyb3JzIHNlZW4gd2l0aCBjbGFuZwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3Vy
ZmFjZV9jb21wcmVzc2lvbi1jb25kLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xp
dC9waWdsaXQvMDAwMS10ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVz
c2lvbi1jb25kLnBhdGNoCmluZGV4IDljMmZlMGFkYjIuLjE2NjA5N2JjMjEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtZWdsLXNwZWMt
bWFrZS1lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Npb24tY29uZC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLWVnbC1zcGVjLW1ha2UtZWds
X2V4dF9zdXJmYWNlX2NvbXByZXNzaW9uLWNvbmQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGE3YjY5OWIyNjQ3Yjk1MGI1NTU4YTBkNTE2MjZlNDQ0NTVkMmEyMjkgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGQ3ZDI2YTgyZTFhODlkMGM0ZDlmMTdlZjk5NTFmZWU2MjU4NDA4Mjgg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBs
aW51dHJvbml4LmRlPgogRGF0ZTogRnJpLCAyMiBOb3YgMjAyNCAyMjo1MjozMSArMDEwMAogU3Vi
amVjdDogW1BBVENIXSB0ZXN0cy9lZ2wvc3BlYzogbWFrZSBlZ2xfZXh0X3N1cmZhY2VfY29tcHJl
c3Npb24gY29uZGl0aW9uYWwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWds
aXQvcGlnbGl0LzAwMDItY21ha2UtdXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12YXJp
YWJsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDItY21h
a2UtdXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12YXJpYWJsZS5wYXRjaAppbmRleCBh
MTk2OTIxYWE0Li45M2Q3OTdkN2YzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
cGlnbGl0L3BpZ2xpdC8wMDAyLWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMt
dmFyaWFibGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQv
MDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhMjhjMWRjZGFhNzRiMDE0YWQzM2E3YzA0YWQzYjkwNmNl
ZTI3NzBlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5MGE2ODUwMTc2NDZjMWVlNjI5
ZGNkYzExMTZmYTQ3NGVlNDBkMGU3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUGFz
Y2FsIEJhY2ggPHBhc2NhbC5iYWNoQHNpZW1lbnMuY29tPgogRGF0ZTogVGh1LCA0IE9jdCAyMDE4
IDE0OjQzOjE3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNtYWtlOiB1c2UgcHJvcGVyIFdBWUxB
TkRfSU5DTFVERV9ESVJTIHZhcmlhYmxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvcGlnbGl0L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5vdC1o
YXJkY29kZS1idWlsZC1wYXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3Bp
Z2xpdC8wMDAzLXRlc3RzLXV0aWwtcGlnbGl0LXNoYWRlci5jLWRvLW5vdC1oYXJkY29kZS1idWls
ZC1wYXQucGF0Y2gKaW5kZXggMWE1ZDdmNzAwNi4uMGFmZjIyNzZlYSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMy10ZXN0cy11dGlsLXBpZ2xpdC1z
aGFkZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hhZGVyLmMt
ZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzBl
YjQ2MDUzNGRiY2Q2YzdjZDIzYmJlNzMzYzhlZDZiZGQ4Mjc3MyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gODQ0NDBmZDZlMGEwODEyMWUwM2QzZDdkNDA4ZmI0NmI1NzBhMjhlYSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogRGF0ZTogVHVlLCAxMCBOb3YgMjAyMCAxNzoxMzo1MCArMDAwMAogU3Vi
amVjdDogW1BBVENIXSB0ZXN0cy91dGlsL3BpZ2xpdC1zaGFkZXIuYzogZG8gbm90IGhhcmRjb2Rl
IGJ1aWxkIHBhdGggaW50bwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xp
dC9waWdsaXRfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0
LmJiCmluZGV4IGVmMzI0MWM3YTIuLmVjMzQ5MDgxNWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKQEAgLTE1LDcgKzE1LDcgQEAgU1JDX1VSSSA9ICJnaXQ6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvcGlnbGl0LmdpdDtwcm90b2NvbD1odHRwczti
cmFuY2g9bWEKICAgICAgICAgICAgIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgogCi1T
UkNSRVYgPSAiZmM4MTc5ZDMxOTA0NmY0NTM0NmJjYmNjNWFhZWFiZWJkZjE1MWYwMyIKK1NSQ1JF
ViA9ICJlZmIyYjZiNDY2NWQwMTE2MmM2NDFlODg0NGVjZWFkOTI4YzI1ZmJlIgogIyAod2hlbiBQ
ViBnb2VzIGFib3ZlIDEuMCByZW1vdmUgdGhlIHRyYWlsaW5nIHIpCiBQViA9ICIxLjArZ2l0ciIK
IAotLSAKMi40NC4xCgo=

--===============5871869418049131589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+efb2b6b466
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+efb2b6b466
packages/core2-64-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+fc8179d319-r0'])", added "piglit (['= 1.0+gitr0+efb2b6b466-r0'])"
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+efb2b6b466
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+efb2b6b466
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+efb2b6b466
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+efb2b6b466
packages/core2-64-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+fc8179d319-r0'])", added "piglit-dev (['= 1.0+gitr0+efb2b6b466-r0'])"
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+efb2b6b466
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+efb2b6b466

--===============5871869418049131589==--

