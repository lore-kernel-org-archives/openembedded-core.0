Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12C5C021AC
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:32 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.8066.1739623343288912062
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QS9Mct32;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=oweACdEK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019509a1c24f-09c563ec-cd14-4d7d-b59c-ca4d837e922e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LmWt1lScFqNpaG3DjQJC97urpgKIgNLwT/ktTk6rbAY=;
	b=QS9Mct32eoWZhWVrAKzuVOStsTPeZs1GnhBg/xHrOQEMOMn7IXaEw/OOeLzLZeB3
	CS7h4uNNWQfz20z5TeNlMLrLE3m4eMPFkzsa79WqusXVaXaKa38/GiMWYADURPVtJup
	ek4f3oepC3ARZLVt0+tYaXF/MQn2WJ0S9/6q6rv0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LmWt1lScFqNpaG3DjQJC97urpgKIgNLwT/ktTk6rbAY=;
	b=oweACdEKY2YaCYrAvKIcGL5OkOm5DrLG1GWdf9m9t2Y8B5iMd/DwjdyEavZ9jgi8
	UFE6FUFNQmemZcMqFwoV7hsp4FPLf9nDxZsrTWq5wmjZo66dlMRNenNzPVAAcbaUQhv
	h/rnDSFGXRR6cM3bPishaNbU/mtgq+foQrBqFJGE=
Content-Type: multipart/mixed; boundary="===============3986782782797059054=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 5edcabb967adb1b032bd46e4abb9c0015cd8a3c7
 SUCCEEDED
Message-ID: <0101019509a1c24f-09c563ec-cd14-4d7d-b59c-ca4d837e922e-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211473

--===============3986782782797059054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *puzzles* to *5edcabb967adb1b032bd46e4abb9c0015cd8a3c7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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
From 756f32e8b06b4cbc4650ef27186caf7f10f72bf1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 11:02:16 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 677a9e291e..67dc6777d9 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "79be403101d055d2fde3611a5f133135d4094ee9"
+SRCREV = "5edcabb967adb1b032bd46e4abb9c0015cd8a3c7"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.44.1


--===============3986782782797059054==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSA3NTZmMzJlOGIwNmI0Y2JjNDY1MGVmMjcxODZjYWY3ZjEwZjcyYmYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMTE6MDI6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggNjc3YTllMjkxZS4uNjdkYzY3NzdkOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNL
X0NPTU1JVFMgPSAiMSIKLVNSQ1JFViA9ICI3OWJlNDAzMTAxZDA1NWQyZmRlMzYxMWE1ZjEzMzEz
NWQ0MDk0ZWU5IgorU1JDUkVWID0gIjVlZGNhYmI5NjdhZGIxYjAzMmJkNDZlNGFiYjljMDAxNWNk
OGEzYzciCiBQRSA9ICIyIgogUFYgPSAiMC4wK2dpdCIKIAotLSAKMi40NC4xCgo=

--===============3986782782797059054==
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
workspace            = "tmp-auh-upgrades:4ac6f12cba1fd7043ea5d7e1c4453a97005ded89"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 392 Local 381 Mirrors 0 Missed 11 Current 636 (97% match, 98% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 10 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2497 of 2840 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 2821 of 2840 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2822 of 2840 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 2823 of 2840 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running task 2824 of 2840 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Succeeded
NOTE: Running task 2825 of 2840 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2826 of 2840 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2827 of 2840 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to a3f7604db05e2a8d8494c36ea3e44891250d6dc2de7849de5e5b7bcdd6333557
NOTE: Running task 2828 of 2840 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Succeeded
NOTE: Running task 2829 of 2840 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Succeeded
NOTE: Running task 2830 of 2840 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Succeeded
NOTE: Running task 2831 of 2840 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2832 of 2840 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot unihash changed to 68a372879044cce843a69bff2a86540a0705b9c6fcc5be3a2dab54b83afc6192
NOTE: Setscene tasks completed
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Succeeded
NOTE: Running task 2833 of 2840 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2833 tasks of which 2819 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215110100.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250215110100.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/puzzles/0.0+git/temp/log.do_packagedata.1732208
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-src went backwards which would break package feeds (from 2:0.0+git0+79be403101-r0 to 2:0.0+git0+5edcabb967-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-dbg went backwards which would break package feeds (from 2:0.0+git0+79be403101-r0 to 2:0.0+git0+5edcabb967-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-staticdev went backwards which would break package feeds (from 2:0.0+git0+79be403101-r0 to 2:0.0+git0+5edcabb967-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-dev went backwards which would break package feeds (from 2:0.0+git0+79be403101-r0 to 2:0.0+git0+5edcabb967-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-doc went backwards which would break package feeds (from 2:0.0+git0+79be403101-r0 to 2:0.0+git0+5edcabb967-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-locale went backwards which would break package feeds (from 2:0.0+git0+79be403101-r0 to 2:0.0+git0+5edcabb967-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles went backwards which would break package feeds (from 2:0.0+git0+79be403101-r0 to 2:0.0+git0+5edcabb967-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/puzzles/0.0+git/temp/log.do_packagedata.1732208
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata) failed with exit code '1'

--===============3986782782797059054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1870 targets, 49 skipped, 0 masked, 0 errors.
Removing 100 recipes from the core2-64 sysroot...done.
Removing 124 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:4ac6f12cba1fd7043ea5d7e1c4453a97005ded89"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 643 Local 633 Mirrors 0 Missed 10 Current 346 (98% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 362 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic_setscene)
NOTE: Running setscene task 375 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 450 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 453 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1339 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Started
NOTE: Running setscene task 540 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 544 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 1340 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.55.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.55.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.55.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.55.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/pango/1.55.5/temp/log.do_packagedata_setscene.1733774
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.55.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 567 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.55.5.bb:do_package_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxkbcommon/1.7.0/temp/log.do_packagedata_setscene.1733787
NOTE: recipe pango-1.55.5-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Succeeded
NOTE: Running setscene task 569 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_package_setscene)
NOTE: Running setscene task 571 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 573 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running task 1365 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.54.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.54.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 586 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 588 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 593 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.54.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1384 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.54.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1390 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 595 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 599 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 600 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 604 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_populate_sysroot_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Started
NOTE: Running setscene task 605 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running setscene task 608 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 609 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 610 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.55.5-r0: task do_package_setscene: Started
NOTE: Running setscene task 611 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_package_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 613 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 619 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 620 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 624 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 626 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 629 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 639 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 644 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 655 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.124-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 664 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 665 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 668 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 670 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 674 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.124.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 677 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.55.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 679 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 683 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 685 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 687 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 688 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_package_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 692 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.124-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 694 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 696 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 697 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 702 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.40.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 703 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.55.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 704 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 705 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 706 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 707 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.40-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 714 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.55.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 716 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 721 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.55.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 722 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 728 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 729 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 730 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 731 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 733 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_10.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 740 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.13.5-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 742 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/xkeyboard-config/2.43/temp/log.do_packagedata_setscene.1735858
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 743 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_package_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-10.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 747 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-10.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_package_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 755 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 757 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 765 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 768 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 772 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.44.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 776 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 781 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 783 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.45.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 785 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.45-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 790 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 792 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 793 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 794 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 796 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 797 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 810 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 814 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 818 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 822 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 824 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 825 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 830 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-75.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-75.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 834 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 836 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 837 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 839 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-75.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 841 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 844 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 846 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 849 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-75.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 851 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 852 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 853 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 854 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 855 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 857 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 858 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 860 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 861 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 862 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 863 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 864 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 865 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 867 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 868 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 869 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 870 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 874 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 876 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 880 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 884 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 885 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 886 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 887 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 888 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 889 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 890 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 891 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 893 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 894 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 896 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 901 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 902 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 903 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 905 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 910 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 914 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 915 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 917 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 919 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 920 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 924 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 925 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 928 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 930 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 931 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 933 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 935 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 937 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 939 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 941 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 942 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 947 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 949 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 950 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 954 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 956 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 958 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 959 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 961 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 962 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 963 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 964 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 966 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 970 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 974 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 976 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 978 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 979 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 981 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 983 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 986 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 988 of 989 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2615 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.43.bb:do_packagedata)
NOTE: Running task 2633 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.55.5.bb:do_packagedata)
NOTE: Running task 2641 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata: Started
NOTE: recipe pango-1.55.5-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.55.5-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.43-r0: task do_packagedata: Succeeded
NOTE: Running task 2716 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2724 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2725 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Succeeded
NOTE: Running task 2726 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Succeeded
NOTE: Running task 2727 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Succeeded
NOTE: Running task 2728 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2729 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Succeeded
NOTE: Running task 2730 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Succeeded
NOTE: Running task 2731 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_spdx)
NOTE: Running task 2732 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_ipk)
NOTE: Running task 2733 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_deb)
NOTE: Running task 2734 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2735 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_ipk: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_deb: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 2736 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_package_spdx)
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_package_spdx: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_create_package_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_ipk: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa unihash changed to 1b65e64bb2886b317336747ec21c58f97ee61198ad1b05f742b06c01546b6861
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2737 of 2737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2737 tasks of which 2714 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 73 ERROR messages, returning a non-zero exit code.
ERROR: pango-1.55.5-r0 do_packagedata_setscene: QA Issue: Package version for package pango-src went backwards which would break package feeds (from 0:1.56.1-r0 to 0:1.55.5-r0) [version-going-backwards]
ERROR: pango-1.55.5-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dbg went backwards which would break package feeds (from 0:1.56.1-r0 to 0:1.55.5-r0) [version-going-backwards]
ERROR: pango-1.55.5-r0 do_packagedata_setscene: QA Issue: Package version for package pango-staticdev went backwards which would break package feeds (from 0:1.56.1-r0 to 0:1.55.5-r0) [version-going-backwards]
ERROR: pango-1.55.5-r0 do_packagedata_setscene: QA Issue: Package version for package pango-dev went backwards which would break package feeds (from 0:1.56.1-r0 to 0:1.55.5-r0) [version-going-backwards]
ERROR: pango-1.55.5-r0 do_packagedata_setscene: QA Issue: Package version for package pango-doc went backwards which would break package feeds (from 0:1.56.1-r0 to 0:1.55.5-r0) [version-going-backwards]
ERROR: pango-1.55.5-r0 do_packagedata_setscene: QA Issue: Package version for package pango-locale went backwards which would break package feeds (from 0:1.56.1-r0 to 0:1.55.5-r0) [version-going-backwards]
ERROR: pango-1.55.5-r0 do_packagedata_setscene: QA Issue: Package version for package pango went backwards which would break package feeds (from 0:1.56.1-r0 to 0:1.55.5-r0) [version-going-backwards]
ERROR: libxkbcommon-1.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-src went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.7.0-r0) [version-going-backwards]
ERROR: pango-1.55.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libxkbcommon-1.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-dbg went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.7.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-staticdev went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.7.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-dev went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.7.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-doc went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.7.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-locale went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.7.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package xkbcli went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.7.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.7.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-bash-completion went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.7.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbcommon-x11 went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.7.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package libxkbregistry went backwards which would break package feeds (from 0:1.8.0-r0 to 0:1.7.0-r0) [version-going-backwards]
ERROR: libxkbcommon-1.7.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-src went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dbg went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-staticdev went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-dev went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-doc went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-af went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ar went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-az went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-bg went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ca went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-crh went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-cs went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-da went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-de went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-el went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-en-gb went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-eo went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-es went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fa went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fi went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fr went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-fur went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-gl went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-he went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hr went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-hu went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-id went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-it went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ja went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ka went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ko went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ky went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-lt went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nb went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-nl went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pl went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-pt-br went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ro went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-ru went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-rw went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sk went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sl went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sq went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sr went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-sv went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-tr went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-uk went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-vi went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-cn went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config-locale-zh-tw went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: QA Issue: Package version for package xkeyboard-config went backwards which would break package feeds (from 0:2.44-r0 to 0:2.43-r0) [version-going-backwards]
ERROR: xkeyboard-config-2.43-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3986782782797059054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+5edcabb967
packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 22024280 to 22024496 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+79be403101-r0'])", added "puzzles (['= 2:0.0+git0+5edcabb967-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+5edcabb967
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+5edcabb967
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+5edcabb967
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+5edcabb967
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3849408 to 3849460 (+0%)
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+5edcabb967
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+79be403101-r0'])", added "puzzles-dev (['= 2:0.0+git0+5edcabb967-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+5edcabb967

--===============3986782782797059054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+5edcabb967
packages/core2-64-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+79be403101-r0'])", added "puzzles (['= 2:0.0+git0+5edcabb967-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+5edcabb967
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+5edcabb967
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+5edcabb967
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+5edcabb967
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+5edcabb967
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+79be403101-r0'])", added "puzzles-dev (['= 2:0.0+git0+5edcabb967-r0'])"
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+79be403101 to 0.0+git0+5edcabb967

--===============3986782782797059054==--

