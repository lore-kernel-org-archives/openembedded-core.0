Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BD5C369B2
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:32 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.10351.1742048287062527983
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ij7aCioo;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kwQS5gfr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101959a2bb6cd-678659ed-d8fb-4bca-aa42-b79ea30a8d51-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048311;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5V68uHjzcQHWiqAoqrNQeZXZVD0u01rM6wX15VaAV/4=;
	b=ij7aCiooxtX+lApLFg808OLNBRMV+bWLfbmWjVC6iGB8S2p6gWPRE6d6EsFeW6SR
	u3GTluKKmzZdCOh0dHk0D1a9EMRRQPqgTPpNLBLVJcA5yIA4HahftGFobmr55ds8yZi
	G6eBoa3htp05Qco4Rq+t5ZFl0ihk7e+VoR0kFaog=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048311;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5V68uHjzcQHWiqAoqrNQeZXZVD0u01rM6wX15VaAV/4=;
	b=kwQS5gfrhJYD3BP7h2lGnd1iFkePlg/v4Zve0uwaddzfVgiU2e94wCdj6OlQa8y1
	xeGrkzgycNhnHT3udFbiGFFm81ou9TveDmotYYaSJTgp9900igjaTO8SB6S9+Mp6gXF
	AtJSWiRAFCwNeUi8v9CR8SSqxR5HprCzhuQL61Qw=
Content-Type: multipart/mixed; boundary="===============1581286707979953838=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 708a9e365b18fdd881af989f75e1a6c1409cae8c
 SUCCEEDED
Message-ID: <010101959a2bb6cd-678659ed-d8fb-4bca-aa42-b79ea30a8d51-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212948

--===============1581286707979953838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *708a9e365b18fdd881af989f75e1a6c1409cae8c* has Succeeded.

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
From 5c49dc75ae8f7c3e6ec6821f72e4af583046e4ad Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 12:30:17 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 ...CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch | 2 +-
 .../0001-tests-Fix-narrowing-errors-seen-with-clang.patch     | 2 +-
 ...tests-egl-spec-make-egl_ext_surface_compression-cond.patch | 2 +-
 .../0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch | 2 +-
 ...tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch | 4 ++--
 meta/recipes-graphics/piglit/piglit_git.bb                    | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
index fa9db07f3f..cd7733d8dc 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From b76523100ad785c1fed41b881d7aecda1b8ce66f Mon Sep 17 00:00:00 2001
+From 1413845f257f2e87b751bfbbd010bef6cbafd5af Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index 8b51790e2a..eed4fa256f 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From e7cd5ff25b40b807664bdcaf4f865ec769bbc52c Mon Sep 17 00:00:00 2001
+From 6285135bfd65a046b4156dfebd6a05474bd9e567 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index 9c2fe0adb2..0c62abb310 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From a7b699b2647b950b5558a0d51626e44455d2a229 Mon Sep 17 00:00:00 2001
+From dee7b5929680b4c0969dfc316d3c4d829f3a9fd7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index a196921aa4..5c54226865 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From a28c1dcdaa74b014ad33a7c04ad3b906cee2770e Mon Sep 17 00:00:00 2001
+From d5b8ea675e70bb3cb05f35d36034045aa963fafd Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 1a5d7f7006..d876f3c6bb 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From 30eb460534dbcd6c7cd23bbe733c8ed6bdd82773 Mon Sep 17 00:00:00 2001
+From 7fe76ae81062420e70c74755fe3c518fa9aa5512 Mon Sep 17 00:00:00 2001
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
index ef3241c7a2..4358f1cc89 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "fc8179d319046f45346bcbcc5aaeabebdf151f03"
+SRCREV = "708a9e365b18fdd881af989f75e1a6c1409cae8c"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.44.1


--===============1581286707979953838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (922 cached, 1 parsed). 1884 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:4e5113fc9fe84de98510a1a553fad659ca8a1fdf"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 425 Local 414 Mirrors 0 Missed 11 Current 596 (97% match, 98% complete)
Removing 10 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2167 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: Running task 2705 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 2706 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
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
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot unihash changed to fc1698ab46d599beadc8f93422eadc04c9bf4cd1d63c5787c91816405dd4e614
NOTE: Setscene tasks completed
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Succeeded
NOTE: Running task 2813 of 2820 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2813 tasks of which 2799 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315121817.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315121817.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.672946
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+708a9e365b-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+708a9e365b-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+708a9e365b-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+708a9e365b-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+708a9e365b-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+708a9e365b-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+708a9e365b-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+fc8179d319-r0 to 0:1.0+gitr0+708a9e365b-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.672946
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============1581286707979953838==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSA1YzQ5ZGM3NWFlOGY3YzNlNmVjNjgyMWY3MmU0YWY1ODMwNDZlNGFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTI6MzA6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIC4uLkNNYWtlTGlzdHMudHh0
LWRvLW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVyLXBhdGgtZnIucGF0Y2ggfCAyICstCiAuLi4v
MDAwMS10ZXN0cy1GaXgtbmFycm93aW5nLWVycm9ycy1zZWVuLXdpdGgtY2xhbmcucGF0Y2ggICAg
IHwgMiArLQogLi4udGVzdHMtZWdsLXNwZWMtbWFrZS1lZ2xfZXh0X3N1cmZhY2VfY29tcHJlc3Np
b24tY29uZC5wYXRjaCB8IDIgKy0KIC4uLi8wMDAyLWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9J
TkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2ggfCAyICstCiAuLi50ZXN0cy11dGlsLXBpZ2xpdC1z
aGFkZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNoIHwgNCArKy0tCiBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIgICAgICAgICAgICAgICAgICAgIHwg
MiArLQogNiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1DTWFr
ZUxpc3RzLnR4dC1kby1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS1DTWFrZUxpc3RzLnR4dC1k
by1ub3Qtb2J0YWluLXdheWxhbmQtc2Nhbm5lci1wYXRoLWZyLnBhdGNoCmluZGV4IGZhOWRiMDdm
M2YuLmNkNzczM2Q4ZGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQv
cGlnbGl0LzAwMDEtQ01ha2VMaXN0cy50eHQtZG8tbm90LW9idGFpbi13YXlsYW5kLXNjYW5uZXIt
cGF0aC1mci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8w
MDAxLUNNYWtlTGlzdHMudHh0LWRvLW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVyLXBhdGgtZnIu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGI3NjUyMzEwMGFkNzg1YzFmZWQ0MWI4ODFkN2Fl
Y2RhMWI4Y2U2NmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE0MTM4NDVmMjU3ZjJl
ODdiNzUxYmZiYmQwMTBiZWY2Y2JhZmQ1YWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogRnJpLCAyMyBB
dWcgMjAyNCAxNToyOTo0NSArMDIwMAogU3ViamVjdDogW1BBVENIXSBDTWFrZUxpc3RzLnR4dDog
ZG8gbm90IG9idGFpbiB3YXlsYW5kLXNjYW5uZXIgcGF0aCBmcm9tCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLUZpeC1uYXJyb3dpbmct
ZXJyb3JzLXNlZW4td2l0aC1jbGFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWds
aXQvcGlnbGl0LzAwMDEtdGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13aXRoLWNsYW5n
LnBhdGNoCmluZGV4IDhiNTE3OTBlMmEuLmVlZDRmYTI1NmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtRml4LW5hcnJvd2luZy1lcnJv
cnMtc2Vlbi13aXRoLWNsYW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWds
aXQvcGlnbGl0LzAwMDEtdGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13aXRoLWNsYW5n
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlN2NkNWZmMjViNDBiODA3NjY0YmRjYWY0Zjg2
NWVjNzY5YmJjNTJjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2Mjg1MTM1YmZkNjVh
MDQ2YjQxNTZkZmViZDZhMDU0NzRiZDllNTY3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMyBNYXkgMjAyMyAy
MTo1OTo0MyAtMDcwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0czogRml4IG5hcnJvd2luZyBlcnJv
cnMgc2VlbiB3aXRoIGNsYW5nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGln
bGl0L3BpZ2xpdC8wMDAxLXRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2NvbXBy
ZXNzaW9uLWNvbmQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8w
MDAxLXRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNzaW9uLWNvbmQu
cGF0Y2gKaW5kZXggOWMyZmUwYWRiMi4uMGM2MmFiYjMxMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1lZ2wtc3BlYy1tYWtlLWVnbF9l
eHRfc3VyZmFjZV9jb21wcmVzc2lvbi1jb25kLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtZWdsLXNwZWMtbWFrZS1lZ2xfZXh0X3N1cmZh
Y2VfY29tcHJlc3Npb24tY29uZC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTdiNjk5YjI2
NDdiOTUwYjU1NThhMGQ1MTYyNmU0NDQ1NWQyYTIyOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gZGVlN2I1OTI5NjgwYjRjMDk2OWRmYzMxNmQzYzRkODI5ZjNhOWZkNyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXgu
ZGU+CiBEYXRlOiBGcmksIDIyIE5vdiAyMDI0IDIyOjUyOjMxICswMTAwCiBTdWJqZWN0OiBbUEFU
Q0hdIHRlc3RzL2VnbC9zcGVjOiBtYWtlIGVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbiBjb25k
aXRpb25hbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQv
MDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMi1jbWFrZS11c2UtcHJv
cGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoCmluZGV4IGExOTY5MjFhYTQu
LjVjNTQyMjY4NjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0LzAwMDItY21ha2UtdXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12YXJpYWJsZS5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAyLWNtYWtl
LXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIGEyOGMxZGNkYWE3NGIwMTRhZDMzYTdjMDRhZDNiOTA2Y2VlMjc3MGUgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQ1YjhlYTY3NWU3MGJiM2NiMDVmMzVkMzYwMzQw
NDVhYTk2M2ZhZmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQYXNjYWwgQmFjaCA8
cGFzY2FsLmJhY2hAc2llbWVucy5jb20+CiBEYXRlOiBUaHUsIDQgT2N0IDIwMTggMTQ6NDM6MTcg
KzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gY21ha2U6IHVzZSBwcm9wZXIgV0FZTEFORF9JTkNMVURF
X0RJUlMgdmFyaWFibGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQv
cGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1
aWxkLXBhdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDMt
dGVzdHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxkLXBhdC5wYXRj
aAppbmRleCAxYTVkN2Y3MDA2Li5kODc2ZjNjNmJiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGlnbGl0LXNoYWRlci5jLWRv
LW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3BpZ2xpdC9waWdsaXQvMDAwMy10ZXN0cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFy
ZGNvZGUtYnVpbGQtcGF0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMGViNDYwNTM0ZGJj
ZDZjN2NkMjNiYmU3MzNjOGVkNmJkZDgyNzczIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA3ZmU3NmFlODEwNjI0MjBlNzBjNzQ3NTVmZTNjNTE4ZmE5YWE1NTEyIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiBEYXRlOiBUdWUsIDEwIE5vdiAyMDIwIDE3OjEzOjUwICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIHRlc3RzL3V0aWwvcGlnbGl0LXNoYWRlci5jOiBkbyBub3QgaGFyZGNvZGUgYnVpbGQgcGF0
aCBpbnRvCkBAIC0xMyw3ICsxMyw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmlu
IDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMvdXRpbC9waWdsaXQtc2hhZGVy
LmMgYi90ZXN0cy91dGlsL3BpZ2xpdC1zaGFkZXIuYwotaW5kZXggMTc4N2ViMTgwLi45ZTc0NzA0
YjEgMTAwNjQ0CitpbmRleCBiMDMyMjEwNTMuLmEwMTU2OGM4MSAxMDA2NDQKIC0tLSBhL3Rlc3Rz
L3V0aWwvcGlnbGl0LXNoYWRlci5jCiArKysgYi90ZXN0cy91dGlsL3BpZ2xpdC1zaGFkZXIuYwog
QEAgLTczLDcgKzczLDcgQEAgcGlnbGl0X2NvbXBpbGVfc2hhZGVyKEdMZW51bSB0YXJnZXQsIGNv
bnN0IGNoYXIgKmZpbGVuYW1lKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Bp
Z2xpdC9waWdsaXRfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRf
Z2l0LmJiCmluZGV4IGVmMzI0MWM3YTIuLjQzNThmMWNjODkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKQEAgLTE1LDcgKzE1LDcgQEAgU1JDX1VSSSA9ICJn
aXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvcGlnbGl0LmdpdDtwcm90b2NvbD1odHRw
czticmFuY2g9bWEKICAgICAgICAgICAgIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgog
Ci1TUkNSRVYgPSAiZmM4MTc5ZDMxOTA0NmY0NTM0NmJjYmNjNWFhZWFiZWJkZjE1MWYwMyIKK1NS
Q1JFViA9ICI3MDhhOWUzNjViMThmZGQ4ODFhZjk4OWY3NWUxYTZjMTQwOWNhZThjIgogIyAod2hl
biBQViBnb2VzIGFib3ZlIDEuMCByZW1vdmUgdGhlIHRyYWlsaW5nIHIpCiBQViA9ICIxLjArZ2l0
ciIKIAotLSAKMi40NC4xCgo=

--===============1581286707979953838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+708a9e365b
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+708a9e365b
packages/core2-64-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+fc8179d319-r0'])", added "piglit (['= 1.0+gitr0+708a9e365b-r0'])"
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+708a9e365b
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+708a9e365b
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+708a9e365b
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+708a9e365b
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+708a9e365b
packages/core2-64-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+fc8179d319-r0'])", added "piglit-dev (['= 1.0+gitr0+708a9e365b-r0'])"
packages/core2-64-poky-linux/piglit/piglit: PKGSIZE changed from 2082995025 to 2083138483 (+0%)
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+708a9e365b
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/ovr_multiview/linker/multiple_shaders_single_num_view_declaration_2.shader_test /usr/lib/piglit/tests/spec/ovr_multiview2/compiler/other-static-dependence.frag /usr/lib/piglit/tests/spec/ovr_multiview2/compiler/other-static-dependence.vert /usr/lib/piglit/tests/spec/ovr_multiview2/compiler/implied-ovr_multiview.vert /usr/lib/piglit/tests/spec/ovr_multiview/compiler/glsl-130-view-id.vert /usr/lib/piglit/bin/ovr_multiview-triangle_compare /usr/lib/piglit/bin/ovr_multiview-fb_read_errors /usr/lib/piglit/tests/spec/ext_external_objects/vk_ping_pong.comp /usr/lib/piglit/bin/ovr_multiview-fb_incomplete_view_targets /usr/lib/piglit/bin/ovr_multiview-fb_incomplete_view_range /usr/lib/piglit/bin/ext_multi_draw_indirect-vertexid /usr/lib/piglit/bin/ovr_multiview-fb_texture_errors /usr/lib/piglit/bin/ovr_multiview-fb_blit_first_view /usr/lib/piglit/bin/ovr_multiview-fb_attachment_params /usr/lib/piglit/bin/o
 vr_multiview-fb_shader_mismatch_draw_errors"

--===============1581286707979953838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+708a9e365b
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+708a9e365b
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+708a9e365b
packages/core2-64-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+fc8179d319-r0'])", added "piglit (['= 1.0+gitr0+708a9e365b-r0'])"
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+708a9e365b
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+708a9e365b
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+708a9e365b
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+708a9e365b
packages/core2-64-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+fc8179d319-r0'])", added "piglit-dev (['= 1.0+gitr0+708a9e365b-r0'])"
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+fc8179d319 to 1.0+gitr0+708a9e365b
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/ovr_multiview2/compiler/implied-ovr_multiview.vert /usr/lib/piglit/bin/ovr_multiview-triangle_compare /usr/lib/piglit/bin/ovr_multiview-fb_shader_mismatch_draw_errors /usr/lib/piglit/bin/ovr_multiview-fb_attachment_params /usr/lib/piglit/tests/spec/ovr_multiview2/compiler/other-static-dependence.frag /usr/lib/piglit/bin/ovr_multiview-fb_incomplete_view_range /usr/lib/piglit/tests/spec/ovr_multiview2/compiler/other-static-dependence.vert /usr/lib/piglit/tests/spec/ext_external_objects/vk_ping_pong.comp /usr/lib/piglit/tests/spec/ovr_multiview/linker/multiple_shaders_single_num_view_declaration_2.shader_test /usr/lib/piglit/tests/spec/ovr_multiview/compiler/glsl-130-view-id.vert /usr/lib/piglit/bin/ovr_multiview-fb_texture_errors /usr/lib/piglit/bin/ovr_multiview-fb_blit_first_view /usr/lib/piglit/bin/ovr_multiview-fb_incomplete_view_targets /usr/lib/piglit/bin/ext_multi_draw_indirect-vertexid /usr/
 lib/piglit/bin/ovr_multiview-fb_read_errors"

--===============1581286707979953838==--

