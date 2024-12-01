Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53762D49767
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:10 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.149806.1733047559256529005
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MoyiqOOU;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=EMfqhs0w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019381af3b3f-efba9280-7606-4b41-92dd-b8e867441f53-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047565;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hdZRQpWGAdp2941rrQMjOkb99G+VHaK9kzi4zdyv6ag=;
	b=MoyiqOOUJruZNN2qHOQ/Snkt0epp0EnXkbvVtrZ3KNkIO+Pg0/V6fNXhmVMoozFb
	eENrCtT/4shP/o4RhC+YDTNK9dZQhGBAy8odVQn3OKVJDd41CChtwJstmhWDi1KSii4
	o5Jas2cCHW9GBu6DpltAzCuU05r91aRsHhgb8H9E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047565;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hdZRQpWGAdp2941rrQMjOkb99G+VHaK9kzi4zdyv6ag=;
	b=EMfqhs0wAVnRWplFepSGr7nVqTTFFIxqRfIUUfsbxYQIGPscv+hBowsBg1jmEUpj
	zc2eJkUOhWp5y5aNtFVS7KFphtujpxHkVVYq6uqAAayyJKrYF2kqlPHUq9Ukdfj0jr6
	lqw936LnXxkwPBLw+6hSPjEM45AHApVFwXn9/Jgs=
Content-Type: multipart/mixed; boundary="===============2821117486679014189=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 468221c722481c470e6a23760b914c33143c2af6
 SUCCEEDED
Message-ID: <0101019381af3b3f-efba9280-7606-4b41-92dd-b8e867441f53-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:06:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208092

--===============2821117486679014189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *468221c722481c470e6a23760b914c33143c2af6* has Succeeded.

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
From 106189acebb967cd690118377160f3cd59cea97f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 08:26:01 +0000
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
index 0c872d3e9b..ad4c1f84a9 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch
@@ -1,4 +1,4 @@
-From 2af98d67e16e083c36e3193aefbda942399a455a Mon Sep 17 00:00:00 2001
+From 1c27b06909749621b8ffd041ad604ff18a3adcc9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 23 Aug 2024 15:29:45 +0200
 Subject: [PATCH] CMakeLists.txt: do not obtain wayland-scanner path from
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
index cfdfeb683e..064c5dde26 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-Fix-narrowing-errors-seen-with-clang.patch
@@ -1,4 +1,4 @@
-From 70f8d56bf9db9d85f3d197ab9de972e3a514514c Mon Sep 17 00:00:00 2001
+From e53b54039cb3226e2f2a7757ee380b12f218a7ec Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 May 2023 21:59:43 -0700
 Subject: [PATCH] tests: Fix narrowing errors seen with clang
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
index 47f8b03961..8882059b9f 100644
--- a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch
@@ -1,4 +1,4 @@
-From 0c97d5eacae4f584313c9251e585bb0246cceffc Mon Sep 17 00:00:00 2001
+From b605797f4f7f2ebeefdf1f7562200b63980d0ee6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 22:52:31 +0100
 Subject: [PATCH] tests/egl/spec: make egl_ext_surface_compression conditional
diff --git a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
index 17bcbce190..8443528ab9 100644
--- a/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
+++ b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
@@ -1,4 +1,4 @@
-From 9b2c2213a2d7aaea350649ee031e227b44343428 Mon Sep 17 00:00:00 2001
+From d9130d3caebdc902685676f0a20ffa4e75495b7b Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Thu, 4 Oct 2018 14:43:17 +0200
 Subject: [PATCH] cmake: use proper WAYLAND_INCLUDE_DIRS variable
diff --git a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
index 767e93c43e..c3a980d682 100644
--- a/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
+++ b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -1,4 +1,4 @@
-From 3d621cf028acb3b464759abb72a38102844079b2 Mon Sep 17 00:00:00 2001
+From fc95479aa0bf1cea054d10454b2efe7c9e9bb249 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 17:13:50 +0000
 Subject: [PATCH] tests/util/piglit-shader.c: do not hardcode build path into
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 3e950ff61c..1e283fcba5 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "d04d6fff00849a2a8e29ef3251c6ca04a2f68dc7"
+SRCREV = "468221c722481c470e6a23760b914c33143c2af6"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.44.1


--===============2821117486679014189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1877 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:e1387eec8a5ae8520b1925fb5927b268b2b5690b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 439 Local 428 Mirrors 0 Missed 11 Current 566 (97% match, 98% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 10 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2121 of 2771 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_fetch: Succeeded
NOTE: Running task 2752 of 2771 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 2753 of 2771 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_unpack: Succeeded
NOTE: Running task 2754 of 2771 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running task 2755 of 2771 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_collect_spdx_deps)
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_patch: Succeeded
NOTE: Running task 2756 of 2771 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2757 of 2771 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 2758 of 2771 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 1e1e200888113b8514d6004d68242ecb4d7375231d369c328dccca02b046218b
NOTE: recipe piglit-1.0+gitr-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2759 of 2771 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_configure: Succeeded
NOTE: Running task 2760 of 2771 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_compile: Succeeded
NOTE: Running task 2761 of 2771 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_install: Succeeded
NOTE: Running task 2762 of 2771 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 2763 of 2771 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot unihash changed to 461e5292fff2536c8da6f1fef318bd714435cefa56f98ba931bfc19784d79dae
NOTE: Setscene tasks completed
NOTE: recipe piglit-1.0+gitr-r0: task do_package: Succeeded
NOTE: Running task 2764 of 2771 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitr-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2764 tasks of which 2750 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201081300.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201081300.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.1528199
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+468221c722-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+468221c722-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+468221c722-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+468221c722-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+468221c722-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+468221c722-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+468221c722-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+d04d6fff00-r0 to 0:1.0+gitr0+468221c722-r0) [version-going-backwards]
ERROR: piglit-1.0+gitr-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/piglit/1.0+gitr/temp/log.do_packagedata.1528199
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============2821117486679014189==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSAxMDYxODlhY2ViYjk2N2NkNjkwMTE4Mzc3MTYwZjNjZDU5Y2VhOTdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwODoyNjowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
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
IDBjODcyZDNlOWIuLmFkNGMxZjg0YTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0LzAwMDEtQ01ha2VMaXN0cy50eHQtZG8tbm90LW9idGFpbi13YXlsYW5k
LXNjYW5uZXItcGF0aC1mci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0
L3BpZ2xpdC8wMDAxLUNNYWtlTGlzdHMudHh0LWRvLW5vdC1vYnRhaW4td2F5bGFuZC1zY2FubmVy
LXBhdGgtZnIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJhZjk4ZDY3ZTE2ZTA4M2MzNmUz
MTkzYWVmYmRhOTQyMzk5YTQ1NWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDFjMjdi
MDY5MDk3NDk2MjFiOGZmZDA0MWFkNjA0ZmYxOGEzYWRjYzkgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTog
RnJpLCAyMyBBdWcgMjAyNCAxNToyOTo0NSArMDIwMAogU3ViamVjdDogW1BBVENIXSBDTWFrZUxp
c3RzLnR4dDogZG8gbm90IG9idGFpbiB3YXlsYW5kLXNjYW5uZXIgcGF0aCBmcm9tCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLUZpeC1u
YXJyb3dpbmctZXJyb3JzLXNlZW4td2l0aC1jbGFuZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13
aXRoLWNsYW5nLnBhdGNoCmluZGV4IGNmZGZlYjY4M2UuLjA2NGM1ZGRlMjYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtRml4LW5hcnJv
d2luZy1lcnJvcnMtc2Vlbi13aXRoLWNsYW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtRml4LW5hcnJvd2luZy1lcnJvcnMtc2Vlbi13
aXRoLWNsYW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3MGY4ZDU2YmY5ZGI5ZDg1ZjNk
MTk3YWI5ZGU5NzJlM2E1MTQ1MTRjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlNTNi
NTQwMzljYjMyMjZlMmYyYTc3NTdlZTM4MGIxMmYyMThhN2VjIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMyBN
YXkgMjAyMyAyMTo1OTo0MyAtMDcwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0czogRml4IG5hcnJv
d2luZyBlcnJvcnMgc2VlbiB3aXRoIGNsYW5nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAxLXRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJm
YWNlX2NvbXByZXNzaW9uLWNvbmQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0
L3BpZ2xpdC8wMDAxLXRlc3RzLWVnbC1zcGVjLW1ha2UtZWdsX2V4dF9zdXJmYWNlX2NvbXByZXNz
aW9uLWNvbmQucGF0Y2gKaW5kZXggNDdmOGIwMzk2MS4uODg4MjA1OWI5ZiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMS10ZXN0cy1lZ2wtc3BlYy1t
YWtlLWVnbF9leHRfc3VyZmFjZV9jb21wcmVzc2lvbi1jb25kLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0LzAwMDEtdGVzdHMtZWdsLXNwZWMtbWFrZS1lZ2xf
ZXh0X3N1cmZhY2VfY29tcHJlc3Npb24tY29uZC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
MGM5N2Q1ZWFjYWU0ZjU4NDMxM2M5MjUxZTU4NWJiMDI0NmNjZWZmYyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gYjYwNTc5N2Y0ZjdmMmViZWVmZGYxZjc1NjIyMDBiNjM5ODBkMGVlNiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxp
bnV0cm9uaXguZGU+CiBEYXRlOiBGcmksIDIyIE5vdiAyMDI0IDIyOjUyOjMxICswMTAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIHRlc3RzL2VnbC9zcGVjOiBtYWtlIGVnbF9leHRfc3VyZmFjZV9jb21wcmVz
c2lvbiBjb25kaXRpb25hbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xp
dC9waWdsaXQvMDAwMi1jbWFrZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlh
YmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMi1jbWFr
ZS11c2UtcHJvcGVyLVdBWUxBTkRfSU5DTFVERV9ESVJTLXZhcmlhYmxlLnBhdGNoCmluZGV4IDE3
YmNiY2UxOTAuLjg0NDM1MjhhYjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9w
aWdsaXQvcGlnbGl0LzAwMDItY21ha2UtdXNlLXByb3Blci1XQVlMQU5EX0lOQ0xVREVfRElSUy12
YXJpYWJsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8w
MDAyLWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9JTkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDliMmMyMjEzYTJkN2FhZWEzNTA2NDllZTAzMWUyMjdiNDQz
NDM0MjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQ5MTMwZDNjYWViZGM5MDI2ODU2
NzZmMGEyMGZmYTRlNzU0OTViN2IgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQYXNj
YWwgQmFjaCA8cGFzY2FsLmJhY2hAc2llbWVucy5jb20+CiBEYXRlOiBUaHUsIDQgT2N0IDIwMTgg
MTQ6NDM6MTcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gY21ha2U6IHVzZSBwcm9wZXIgV0FZTEFO
RF9JTkNMVURFX0RJUlMgdmFyaWFibGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8tbm90LWhh
cmRjb2RlLWJ1aWxkLXBhdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0LzAwMDMtdGVzdHMtdXRpbC1waWdsaXQtc2hhZGVyLmMtZG8tbm90LWhhcmRjb2RlLWJ1aWxk
LXBhdC5wYXRjaAppbmRleCA3NjdlOTNjNDNlLi5jM2E5ODBkNjgyIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDAzLXRlc3RzLXV0aWwtcGlnbGl0LXNo
YWRlci5jLWRvLW5vdC1oYXJkY29kZS1idWlsZC1wYXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwMy10ZXN0cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1k
by1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzZDYy
MWNmMDI4YWNiM2I0NjQ3NTlhYmI3MmEzODEwMjg0NDA3OWIyIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBmYzk1NDc5YWEwYmYxY2VhMDU0ZDEwNDU0YjJlZmU3YzllOWJiMjQ5IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDEwIE5vdiAyMDIwIDE3OjEzOjUwICswMDAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIHRlc3RzL3V0aWwvcGlnbGl0LXNoYWRlci5jOiBkbyBub3QgaGFyZGNvZGUg
YnVpbGQgcGF0aCBpbnRvCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0
L3BpZ2xpdF9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQu
YmIKaW5kZXggM2U5NTBmZjYxYy4uMWUyODNmY2JhNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0X2dpdC5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gImdpdDov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9waWdsaXQuZ2l0O3Byb3RvY29sPWh0dHBzO2Jy
YW5jaD1tYQogICAgICAgICAgICAiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiCiAKLVNS
Q1JFViA9ICJkMDRkNmZmZjAwODQ5YTJhOGUyOWVmMzI1MWM2Y2EwNGEyZjY4ZGM3IgorU1JDUkVW
ID0gIjQ2ODIyMWM3MjI0ODFjNDcwZTZhMjM3NjBiOTE0YzMzMTQzYzJhZjYiCiAjICh3aGVuIFBW
IGdvZXMgYWJvdmUgMS4wIHJlbW92ZSB0aGUgdHJhaWxpbmcgcikKIFBWID0gIjEuMCtnaXRyIgog
Ci0tIAoyLjQ0LjEKCg==

--===============2821117486679014189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+468221c722
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+468221c722
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+468221c722
packages/core2-64-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+d04d6fff00-r0'])", added "piglit (['= 1.0+gitr0+468221c722-r0'])"
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+468221c722
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+468221c722
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+468221c722
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+468221c722
packages/core2-64-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+d04d6fff00-r0'])", added "piglit-dev (['= 1.0+gitr0+468221c722-r0'])"
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+468221c722
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/ext_image_dma_buf_import-tex-modifier /usr/lib/piglit/tests/spec/glsl-1.30/execution/vs-loop-uint-induction-var-subtraction-2.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/linker/global-const-initializer.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/vs-loop-uint-induction-var-subtraction.shader_test"

--===============2821117486679014189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+468221c722
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+468221c722
packages/core2-64-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+d04d6fff00-r0'])", added "piglit (['= 1.0+gitr0+468221c722-r0'])"
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+468221c722
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+468221c722
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+468221c722
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+468221c722
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+468221c722
packages/core2-64-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+d04d6fff00-r0'])", added "piglit-dev (['= 1.0+gitr0+468221c722-r0'])"
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/ext_image_dma_buf_import-tex-modifier /usr/lib/piglit/tests/spec/glsl-1.30/execution/vs-loop-uint-induction-var-subtraction-2.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/linker/global-const-initializer.shader_test /usr/lib/piglit/tests/spec/glsl-1.30/execution/vs-loop-uint-induction-var-subtraction.shader_test"
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+d04d6fff00 to 1.0+gitr0+468221c722
packages/core2-64-poky-linux/piglit/piglit: PKGSIZE changed from 2082654242 to 2082671404 (+0%)

--===============2821117486679014189==--

