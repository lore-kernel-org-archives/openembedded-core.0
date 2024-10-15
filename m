Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2F9D1D885
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:01 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.11863.1728994550401994657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=jacESwFw;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=T4LLgNnB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010192901b479f-3f954bea-2c86-4cc6-b844-32cfaba3aafb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994560;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DzhiW7s5ZduKKhZxubnCD/7GFesHsN4vySUs9CL0r7Q=;
	b=jacESwFwDrIr3wV08Rj4c1UN7YJx6KpEX8vXHnPqZedzGY3GGJARK9vU/Q3nvc9R
	1hbefemqeePGcTfRe3+z3hRN1mgV3H9hbG5W0Rbdqr6yNn4X0XvrASD8pDNjnZIpK6R
	0kyaRd3G35NuZq949CnIPhO5pQTh/72woI4Jj//k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994560;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DzhiW7s5ZduKKhZxubnCD/7GFesHsN4vySUs9CL0r7Q=;
	b=T4LLgNnBjkA2H/IW2ZsLE9eZsieO6Q55Egn0SDByzUeiQfULu50uiG8EHEplqqZa
	N9s1Ohm+wR2rif5qH+DIvSo57vU5EACIctPtb4DSj51BnVZuvE7YVXr0kZPsc3scNMs
	v2gnADm1G8r62XOFOkrDxl0ZlElNHCOBBPkcUkWY=
Content-Type: multipart/mixed; boundary="===============5009533600206167362=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 2.2.3 FAILED
Message-ID: <01010192901b479f-3f954bea-2c86-4cc6-b844-32cfaba3aafb-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205852

--===============5009533600206167362==
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
From 69adb6a3fbd7b3e6d7ad438e9a1106c85fe52fff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 09:00:35 +0000
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


--===============5009533600206167362==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-2.2.2-2.2.3.patch"

RnJvbSA2OWFkYjZhM2ZiZDdiM2U2ZDdhZDQzOGU5YTExMDZjODVmZTUyZmZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDk6MDA6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
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

--===============5009533600206167362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:f041c3c6f62870c666509a76144be2da880f72bc"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 390 Local 381 Mirrors 0 Missed 9 Current 417 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 528 of 807 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 530 of 807 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 725 of 807 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.25.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hatchling-native-1.25.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-urllib3-2.2.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 804 of 807 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatchling-native-1.25.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 805 of 807 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2141 of 2310 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_fetch)
NOTE: recipe python3-trove-classifiers-native-2024.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 2273 of 2310 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_unpack)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_unpack: Started
NOTE: recipe python3-trove-classifiers-native-2024.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 807 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-trove-classifiers_2024.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2274 of 2310 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_patch)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_patch: Started
NOTE: recipe python3-trove-classifiers-native-2024.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-trove-classifiers-native-2024.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2290 of 2310 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2295 of 2310 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-2.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-urllib3-2.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2298 of 2310 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_configure)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.2.3-r0: task do_configure: Succeeded
NOTE: Running task 2299 of 2310 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_compile)
NOTE: recipe python3-urllib3-2.2.3-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| ERROR Missing dependencies:
| 	hatch-vcs==0.4.0
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/run.do_compile.1641731:157 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/urllib3-2.2.3'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/run.do_compile.1641731, line 157
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/run.do_compile.1641731, line 152
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/run.do_compile.1641731, line 168
NOTE: recipe python3-urllib3-2.2.3-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2299 tasks of which 2292 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015090021.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015090021.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/log.do_compile.1641731
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-urllib3-2.2.3-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/run.do_compile.1641731' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-urllib3/2.2.3/temp/log.do_compile.1641731
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb:do_compile) failed with exit code '1'

--===============5009533600206167362==--

