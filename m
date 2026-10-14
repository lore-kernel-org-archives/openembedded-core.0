Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A480ECC6B25
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 05:20:38 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6838.1791955230454680101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 22:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WMRqSgUg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=131ZXTvI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a138dadab9-af4df6f9-d70d-4ae5-b900-84bbd5b706ab-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791955229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U4zUIG/yLTbKlsCRcC0i7wlmT41vsyTRezOL200hhcw=;
	b=WMRqSgUgO29xs/OR78l7vKv1T1mhf8Xi4Vy4OhB8zsxYPGHuuzhOdMqy9Y4lkVkI
	UGL2IoDXts03KsTJyc27ZlH2k7Ww3qkTyTaPPL+TOlsEzlN3exjsuc7ttVKhCjMbF5J
	7vOiuyROf6mU5nOFh40gaLoJnUHohpCqmO9v/V4w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791955229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U4zUIG/yLTbKlsCRcC0i7wlmT41vsyTRezOL200hhcw=;
	b=131ZXTvII6YRl3Vvp46+qNCHoVwe/0Yc2wqAWS2nkeJXc3GH8jatrVNaG3qcDTVN
	ZZyI9FECctVdJNhpe/+e1WfINbyo/fgSgWI0+NKKlqvNrC65Jp9x9JFvltg98TFiVVf
	SCYwWlYKLTb9Jvk6UrMwMASQchBf3LxHBUPNqXQ8=
Content-Type: multipart/mixed; boundary="===============6540753223215437744=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-more-itertools: upgrading to 11.2.0 FAILED
Message-ID: <010101a138dadab9-af4df6f9-d70d-4ae5-b900-84bbd5b706ab-000000@us-west-2.amazonses.com>
Date: Wed, 14 Oct 2026 05:20:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.14-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 05:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247744

--===============6540753223215437744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-more-itertools* to *11.2.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-more-itertools-upgrade-10.8.0-11.2.0.patch
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
From ab9a1ce50415f74a8550affb7a2fd69bd56bedfe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 14 Oct 2026 05:20:22 +0000
Subject: [PATCH] python3-more-itertools: upgrade 10.8.0 -> 11.2.0

---
 ...ore-itertools_10.8.0.bb => python3-more-itertools_11.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_10.8.0.bb => python3-more-itertools_11.2.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb b/meta/recipes-devtools/python/python3-more-itertools_11.2.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_11.2.0.bb
index 053197ea5c..b51c11529c 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_11.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "f638ddf8a1a0d134181275fb5d58b086ead7c6a72429ad725c67503f13ba30bd"
+SRC_URI[sha256sum] = "59960f488835254863a857eb501f69e4ec92fdc8822f098c0f48dba530afd487"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============6540753223215437744==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-more-itertools-upgrade-10.8.0-11.2.0.patch"

RnJvbSBhYjlhMWNlNTA0MTVmNzRhODU1MGFmZmI3YTJmZDY5YmQ1NmJlZGZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTQgT2N0IDIwMjYgMDU6MjA6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1vcmUtaXRlcnRvb2xzOiB1cGdyYWRlIDEwLjguMCAtPiAxMS4yLjAKCi0tLQogLi4u
b3JlLWl0ZXJ0b29sc18xMC44LjAuYmIgPT4gcHl0aG9uMy1tb3JlLWl0ZXJ0b29sc18xMS4yLjAu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tb3JlLWl0ZXJ0
b29sc18xMC44LjAuYmIgPT4gcHl0aG9uMy1tb3JlLWl0ZXJ0b29sc18xMS4yLjAuYmJ9ICg4MiUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1vcmUt
aXRlcnRvb2xzXzEwLjguMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1tb3JlLWl0ZXJ0b29sc18xMS4yLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4MiUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1vcmUtaXRlcnRvb2xzXzEw
LjguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1v
cmUtaXRlcnRvb2xzXzExLjIuMC5iYgppbmRleCAwNTMxOTdlYTVjLi5iNTFjMTE1MjljIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9yZS1pdGVydG9v
bHNfMTAuOC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1t
b3JlLWl0ZXJ0b29sc18xMS4yLjAuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS9lcmlrcm9zZS9tb3JlLWl0ZXJ0b29scyIKIExJQ0VOU0UgPSAiTUlUIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzM5NmVhMzBmOWQyMTM4OWQ3
ODU3NzE5ODE2ZjgzYjUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmNjM4ZGRmOGExYTBkMTM0
MTgxMjc1ZmI1ZDU4YjA4NmVhZDdjNmE3MjQyOWFkNzI1YzY3NTAzZjEzYmEzMGJkIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjU5OTYwZjQ4ODgzNTI1NDg2M2E4NTdlYjUwMWY2OWU0ZWM5MmZkYzg4
MjJmMDk4YzBmNDhkYmE1MzBhZmQ0ODciCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3Jl
IHB0ZXN0LXB5dGhvbi1weXRlc3QKIAotLSAKMi40Ny4xCgo=

--===============6540753223215437744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1992 targets, 43 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "6.1.99+snapshot-df3f7352f82a719e17fdff53f6f130a6d10ec3a2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:df3f7352f82a719e17fdff53f6f130a6d10ec3a2"
meta-yocto-bsp       
meta-poky            = "master:49a2b44583968d321b3195bfd0cb2232dff13950"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 405 Local 390 Mirrors 0 Missed 15 Current 406 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1320 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.0.bb:do_recipe_qa)
NOTE: Running task 1989 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2029 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.0.bb:do_fetch)
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_fetch: Started
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2030 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.0.bb:do_unpack)
NOTE: Running task 2031 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_unpack: Started
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2032 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.0.bb:do_patch)
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_patch: Started
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2033 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2034 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.0.bb:do_populate_lic)
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_populate_lic: Started
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2035 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.0.bb:do_configure)
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_configure: Started
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2036 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.0.bb:do_configure_ptest_base)
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2037 of 2050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.0.bb:do_compile)
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| ERROR Unmet dependencies (checked against /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.0/recipe-sysroot-native/usr/bin/nativepython3):
| 	flit_core<5,>=4
| 		wanted: <5,>=4
| 		found: 3.12.0
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.0/temp/run.do_compile.1563012:152 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.0/sources/more_itertools-11.2.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.0/temp/run.do_compile.1563012, line 152
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.0/temp/run.do_compile.1563012, line 147
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.0/temp/run.do_compile.1563012, line 164
NOTE: recipe python3-more-itertools-11.2.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2037 tasks of which 2026 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261014052007.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261014052007.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.0/temp/log.do_compile.1563012
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-more-itertools-11.2.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.0/temp/run.do_compile.1563012' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-more-itertools/11.2.0/temp/log.do_compile.1563012
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-more-itertools_11.2.0.bb:do_compile) failed with exit code '1'

--===============6540753223215437744==--

