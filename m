Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2967.1794721856136214017
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 21:50:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=tKL0jOqe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JIe/9G7C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1ddc2366f-33f5848e-8075-4981-bc74-fb6fb8e5b6c4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794721855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cGqUUW1sPnaZZsMvwPYwQ87ylY9Ji4sFVjamvtQD6fA=;
	b=tKL0jOqeT+VrAQVKiipa4tBQDU5Hexvizok68OH4RUfmxX6lbfn3cRoU/KCO+VVD
	RyZ3/TvnXdTLQBOPtgzPUGOlWJN/jgcfRm4NMJq/g6cvcM1SJOJJatrEyjokzd9WPIm
	eJTmJLz6xNEMzFpv+w42qMdrJE3XlB0BjEc6GPjo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794721855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cGqUUW1sPnaZZsMvwPYwQ87ylY9Ji4sFVjamvtQD6fA=;
	b=JIe/9G7Cm2DwWdFKMx3vNmXhpRh1nElFOQRaPMB4nUPdEm+gjuIj/LxOeZyi4xPD
	LN6DvkZKAAdTN91G0PW/vNAYQhVPy4Xkm2QfV9Ctk0cjkr68uv7mbLhiTZipFdiIkNJ
	DlutKsQQvjccF/xDPyHaDRt4gS76AuZ4mbJY9oEw=
Content-Type: multipart/mixed; boundary="===============5948154221329945958=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-more-itertools: upgrading to 11.2.1 FAILED
Message-ID: <010101a1ddc2366f-33f5848e-8075-4981-bc74-fb6fb8e5b6c4-000000@us-west-2.amazonses.com>
Date: Sun, 15 Nov 2026 05:50:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 05:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250225

--===============5948154221329945958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-more-itertools* to *11.2.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-more-itertools-upgrade-11.1.0-11.2.1.patch
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
From 0ed0f23c5029946fade6feaf96c8f9b843d48347 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Nov 2026 05:29:02 +0000
Subject: [PATCH] python3-more-itertools: upgrade 11.1.0 -> 11.2.1

---
 ...ore-itertools_11.1.0.bb => python3-more-itertools_11.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_11.1.0.bb => python3-more-itertools_11.2.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_11.1.0.bb b/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-more-itertools_11.1.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb
index a291074daf..92a6669d0f 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_11.1.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "48e8f4d9e7e5878571ecf6f2b4e57634f93cd474cc8cfbd2376f2d11b396e30d"
+SRC_URI[sha256sum] = "cbf08fd0af284dc69718b9b76a8e6203df624d70209ea511e4219d350c856f63"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.47.1


--===============5948154221329945958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 2004 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-19fee1ad7fa7352fdb9be0e9dea5ddbf84969568"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:19fee1ad7fa7352fdb9be0e9dea5ddbf84969568"
meta-yocto-bsp       
meta-poky            = "master:8becfabefdf5df564aafe2d07d10e4b05fbaedb1"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 295 Local 282 Mirrors 0 Missed 13 Current 516 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1322 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb:do_recipe_qa)
NOTE: Running task 1992 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb:do_create_recipe_spdx)
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb:do_recipe_qa unihash changed to c7286554c7205f9cb2023dded808ec814ecd54b7388a41efc427121847487eaf
NOTE: Setscene tasks completed
NOTE: Running task 2032 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb:do_fetch)
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 2033 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb:do_unpack)
NOTE: Running task 2034 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 2035 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb:do_patch)
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_patch: Succeeded
NOTE: Running task 2036 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2037 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb:do_populate_lic)
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_populate_lic: Started
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb:do_populate_lic unihash changed to d36c0a26e048c0780d7c0af4e76305bde50d5ae919e29f06ea17bfc6ee323f8d
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb:do_deploy_source_date_epoch unihash changed to 03ee61391a9d9e0f283f8d52169d9ac52287fd0d98903e56cdf073288fbbe330
NOTE: Setscene tasks completed
NOTE: Running task 2038 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb:do_configure)
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_configure: Started
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2039 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb:do_configure_ptest_base)
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2040 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb:do_compile)
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.1/recipe-sysroot-native/usr/bin/nativepython3):
| 	flit_core<5,>=4
| 		wanted: <5,>=4
| 		found: 3.12.0
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.1/temp/run.do_compile.3683067:152 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.1/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.1/sources/more_itertools-11.2.1'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.1/temp/run.do_compile.3683067, line 152
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.1/temp/run.do_compile.3683067, line 147
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.1/temp/run.do_compile.3683067, line 164
NOTE: recipe python3-more-itertools-11.2.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2040 tasks of which 2029 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261115052846.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261115052846.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.1/temp/log.do_compile.3683067
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-more-itertools-11.2.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.1/temp/run.do_compile.3683067' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.1/temp/log.do_compile.3683067
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.1.bb:do_compile) failed with exit code '1'

--===============5948154221329945958==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-more-itertools-upgrade-11.1.0-11.2.1.patch"

RnJvbSAwZWQwZjIzYzUwMjk5NDZmYWRlNmZlYWY5NmM4ZjliODQzZDQ4MzQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTm92IDIwMjYgMDU6Mjk6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1vcmUtaXRlcnRvb2xzOiB1cGdyYWRlIDExLjEuMCAtPiAxMS4yLjEKCi0tLQogLi4u
b3JlLWl0ZXJ0b29sc18xMS4xLjAuYmIgPT4gcHl0aG9uMy1tb3JlLWl0ZXJ0b29sc18xMS4yLjEu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tb3JlLWl0ZXJ0
b29sc18xMS4xLjAuYmIgPT4gcHl0aG9uMy1tb3JlLWl0ZXJ0b29sc18xMS4yLjEuYmJ9ICg4MyUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1vcmUt
aXRlcnRvb2xzXzExLjEuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1tb3JlLWl0ZXJ0b29sc18xMS4yLjEuYmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1vcmUtaXRlcnRvb2xzXzEx
LjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1v
cmUtaXRlcnRvb2xzXzExLjIuMS5iYgppbmRleCBhMjkxMDc0ZGFmLi45MmE2NjY5ZDBmIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9yZS1pdGVydG9v
bHNfMTEuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1t
b3JlLWl0ZXJ0b29sc18xMS4yLjEuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS9lcmlrcm9zZS9tb3JlLWl0ZXJ0b29scyIKIExJQ0VOU0UgPSAiTUlUIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzM5NmVhMzBmOWQyMTM4OWQ3
ODU3NzE5ODE2ZjgzYjUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0OGU4ZjRkOWU3ZTU4Nzg1
NzFlY2Y2ZjJiNGU1NzYzNGY5M2NkNDc0Y2M4Y2ZiZDIzNzZmMmQxMWIzOTZlMzBkIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImNiZjA4ZmQwYWYyODRkYzY5NzE4YjliNzZhOGU2MjAzZGY2MjRkNzAy
MDllYTUxMWU0MjE5ZDM1MGM4NTZmNjMiCiAKIFNSQ19VUkkgKz0gImZpbGU6Ly9ydW4tcHRlc3Qi
CiAKLS0gCjIuNDcuMQoK

--===============5948154221329945958==--
