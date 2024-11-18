Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A49D6004F
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:21 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.4659.1731964617240623107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jzz+OX7h;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=jGTSodg6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019341231b42-7f12e48d-2ddd-43b0-879c-ae4f2950b4c8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964640;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9MGPO4E0tOeDvxZB0K8VC+DHFaUO0dr/Bz8OHjeqv18=;
	b=jzz+OX7hkgBlxWlxi7umS5RKFEJ6rhUj4oG9lMyGq01pg0v1Oe2oy4F9ycMPlqR+
	hd4CsPrjfLalnWFkvfuNaF3maqvSSour9CHHSmX7NoJ8ydDKL92cOG7EiORmmz1DaQt
	hIDerQVHxqX+44Bjh6mLz8bYve/kh9yMCmlE92as=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964640;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9MGPO4E0tOeDvxZB0K8VC+DHFaUO0dr/Bz8OHjeqv18=;
	b=jGTSodg6caTqtcN56rYEQGmAtBn8ryV+e/z5mc518SruOkpFudDE1rzaHBoGYtnq
	DcIP6xI8OWzq3XBpS5T8xoj8x7WO7aFmWermadWM2LhEMMFB3ZC531H9mSrnsThYlH9
	vBtCSmGjET9ujXVQDkEyDMBrehFNw3jRPMFsFKGY=
Content-Type: multipart/mixed; boundary="===============1290068100922495681=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 2.2.3 FAILED
Message-ID: <0101019341231b42-7f12e48d-2ddd-43b0-879c-ae4f2950b4c8-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207295

--===============1290068100922495681==
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
From e6896af46712af60b5af56f433bb750e0118223c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 03:06:45 +0000
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


--===============1290068100922495681==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-2.2.2-2.2.3.patch"

RnJvbSBlNjg5NmFmNDY3MTJhZjYwYjVhZjU2ZjQzM2JiNzUwZTAxMTgyMjNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMDM6MDY6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVybGxpYjM6IHVwZ3JhZGUgMi4yLjIgLT4gMi4yLjMKCi0tLQogLi4uL3tweXRob24z
LXVybGxpYjNfMi4yLjIuYmIgPT4gcHl0aG9uMy11cmxsaWIzXzIuMi4zLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cmxsaWIzXzIuMi4yLmJiID0+
IHB5dGhvbjMtdXJsbGliM18yLjIuMy5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjIuMi5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuMi4zLmJiCnNpbWlsYXJpdHkgaW5k
ZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11
cmxsaWIzXzIuMi4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdXJsbGliM18yLjIuMy5iYgppbmRleCAzMWEwM2E2MGIzLi5lOTY0NjAxYmMwIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjIu
Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18y
LjIuMy5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3No
YXpvdy91cmxsaWIzIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFLnR4dDttZDU9NTJkMjczYTMwNTRjZWQ1NjEyNzVkNGQxNTI2MGVjZGEiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJkZDUwNTQ4NTU0OWE3YTU1MjgzM2RhNWU2MDYzNjM5ZDBkMTc3
YzA0ZjIzYmMzODY0ZTQxZTVkYzVmNjEyMTY4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImU3ZDgx
NGE4MWRhZDgxZTZjYWYyZWM5ZmRlZGIyODRlY2M5YzczMDc2YjYyNjU0NTQ3Y2M2NGNjZGNhZTI2
ZTkiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLS0gCjIuNDQuMQoK

--===============1290068100922495681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1880 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:87a2e51b40a71ae7b6e88497bb26dc31055d4ec5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 369 Local 357 Mirrors 0 Missed 12 Current 448 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1697 of 2331 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_recipe_qa)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_recipe_qa unihash changed to 06c3c50b037002ba0b9b93dd2762e434c07658da506441ed492a4ebf0ccab90f
NOTE: Setscene tasks completed
NOTE: Running task 2312 of 2331 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_fetch)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 2313 of 2331 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_unpack)
NOTE: Running task 2314 of 2331 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2315 of 2331 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_patch)
NOTE: Running task 2316 of 2331 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-urllib3-2.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2317 of 2331 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2318 of 2331 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_populate_lic)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-2.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_populate_lic: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_populate_lic unihash changed to e57d8e58a104dd7ff09ccc73fe55ae966bd3b961d0fd63797a379e328f664dc1
NOTE: recipe python3-urllib3-2.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_deploy_source_date_epoch unihash changed to 493e069945c7991e67deda53a612b354a20444809cfa40d1468048de629d551e
NOTE: Setscene tasks completed
NOTE: Running task 2319 of 2331 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_configure)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2320 of 2331 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_compile)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| ERROR Missing dependencies:
| 	hatch-vcs==0.4.0
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/run.do_compile.3354275:157 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/urllib3-2.2.3'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/run.do_compile.3354275, line 157
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/run.do_compile.3354275, line 152
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/run.do_compile.3354275, line 168
NOTE: recipe python3-urllib3-2.2.3-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2320 tasks of which 2310 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241117030540.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241117030540.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/log.do_compile.3354275
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-urllib3-2.2.3-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/run.do_compile.3354275' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/log.do_compile.3354275
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_compile) failed with exit code '1'

--===============1290068100922495681==--

