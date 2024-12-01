Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2284D10DD5
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:09 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.148762.1733047559860956486
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:05:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dNxbFIlN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=tZ6LJrky;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019381af2472-572d4a5f-518e-4eec-bfed-777de489d208-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047559;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PfhD8/j8s8/Yc0yZOovFGvkej1GHd6Rxd5TKKyhUDug=;
	b=dNxbFIlNQuEon1Qu9PBuk7W+knYM/qWR3dCmW+zB51kPiQoAegIj47Tzb4Rue/RW
	P6V3MtpKLxGLJn+xCk4cTPxrmXSc/aUdOXJSnWX3BooP9kUE7oTbcmzC94Sk03O70kj
	49890IDOGaNa6/LE1mFrmQwmMIKLzyOB/Qr0kT5c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047559;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PfhD8/j8s8/Yc0yZOovFGvkej1GHd6Rxd5TKKyhUDug=;
	b=tZ6LJrky6cOsQNU/q9AmKWWyOpItRVKehp2rEOZVIT1TPKvV9LQuNKBISJKA5JX7
	zHQ9rvVGaAuJ/lGY0BZ+T9CfbbyNdMWO0DShf14PKszPlykgc7oxFUAXUo392ijJt9g
	ene+T33Vg2JcH+0/VPuzYqxdQViz1wIwXA1J9oyQ=
Content-Type: multipart/mixed; boundary="===============1711491924996577384=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 2.2.3 FAILED
Message-ID: <0101019381af2472-572d4a5f-518e-4eec-bfed-777de489d208-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:05:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208076

--===============1711491924996577384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-urllib3* to *2.2.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-2.2.2-2.2.3.patch
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
From 8924f58b7d0112c06d007dee119b202f522e6902 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 07:21:36 +0000
Subject: [PATCH] python3-urllib3: upgrade 2.2.2 -> 2.2.3

---
 .../{python3-urllib3_2.2.2.bb => python3-urllib3_2.2.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.2.2.bb => python3-urllib3_2.2.3.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.2.3.bb
index 31a03a60b3..e964601bc0 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "dd505485549a7a552833da5e6063639d0d177c04f23bc3864e41e5dc5f612168"
+SRC_URI[sha256sum] = "e7d814a81dad81e6caf2ec9fdedb284ecc9c73076b62654547cc64ccdcae26e9"
 
 inherit pypi python_hatchling
 
-- 
2.44.1


--===============1711491924996577384==
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
workspace            = "tmp-auh-upgrades:2f9d5e667a031459fb79a3ea739c3f4a8f5017fb"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 387 Local 378 Mirrors 0 Missed 9 Current 422 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 545 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 732 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-urllib3-2.2.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 809 of 809 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1839 of 2309 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_fetch)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 2291 of 2309 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_unpack)
NOTE: Running task 2292 of 2309 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2293 of 2309 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_patch)
NOTE: Running task 2294 of 2309 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-urllib3-2.2.3-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-2.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2297 of 2309 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_configure)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2298 of 2309 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_compile)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| ERROR Missing dependencies:
| 	hatch-vcs==0.4.0
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/run.do_compile.853253:157 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/urllib3-2.2.3'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/run.do_compile.853253, line 157
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/run.do_compile.853253, line 152
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/run.do_compile.853253, line 168
NOTE: recipe python3-urllib3-2.2.3-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2298 tasks of which 2291 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201072122.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201072122.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/log.do_compile.853253
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-urllib3-2.2.3-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/run.do_compile.853253' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/log.do_compile.853253
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_compile) failed with exit code '1'

--===============1711491924996577384==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-2.2.2-2.2.3.patch"

RnJvbSA4OTI0ZjU4YjdkMDExMmMwNmQwMDdkZWUxMTliMjAyZjUyMmU2OTAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwNzoyMTozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJsbGliMzogdXBncmFkZSAyLjIuMiAtPiAyLjIuMwoKLS0tCiAuLi4ve3B5dGhvbjMt
dXJsbGliM18yLjIuMi5iYiA9PiBweXRob24zLXVybGxpYjNfMi4yLjMuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXVybGxpYjNfMi4yLjIuYmIgPT4g
cHl0aG9uMy11cmxsaWIzXzIuMi4zLmJifSAoODYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuMi4yLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMi4yLjMuYmIKc2ltaWxhcml0eSBpbmRl
eCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVy
bGxpYjNfMi4yLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy11cmxsaWIzXzIuMi4zLmJiCmluZGV4IDMxYTAzYTYwYjMuLmU5NjQ2MDFiYzAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuMi4y
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIu
Mi4zLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vc2hh
em93L3VybGxpYjMiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0xJQ0VOU0UudHh0O21kNT01MmQyNzNhMzA1NGNlZDU2MTI3NWQ0ZDE1MjYwZWNkYSIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gImRkNTA1NDg1NTQ5YTdhNTUyODMzZGE1ZTYwNjM2MzlkMGQxNzdj
MDRmMjNiYzM4NjRlNDFlNWRjNWY2MTIxNjgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTdkODE0
YTgxZGFkODFlNmNhZjJlYzlmZGVkYjI4NGVjYzljNzMwNzZiNjI2NTQ1NDdjYzY0Y2NkY2FlMjZl
OSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi40NC4xCgo=

--===============1711491924996577384==--

