Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF142EED603
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:37:59 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.102972.1767267475144214666
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=H7z3SNHH;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=lm9wXiOJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b79599c16-baed7ec4-69a4-4873-b7c9-527f531f688a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267474;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qc4Ms2eAKSYWiS9ahsZlU1el4WMy0xNJbLij1bVFPmA=;
	b=H7z3SNHHyELi0+iYq98uxJVTJDrLrCH6UUWyhq6u23qeL44vjWM2EtaCALswD4VU
	udYHhymrBlVeheYpMKqBK5LG+JOFJ+oEqQkVmbdNeDRii05GS49J/F48PBy0pRSCMId
	24s1pIKFOEouWJqL7SN2LT4WTXfLri8uw1brcH/E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267474;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qc4Ms2eAKSYWiS9ahsZlU1el4WMy0xNJbLij1bVFPmA=;
	b=lm9wXiOJYlxF8DmiHv09XKSSK38QIFjapGg5HsHpKzncBzwLyaqlPvMxkEs7QP2f
	6JsvxHBWw3FBM9SknQLuUSr7uqaQHwgyCATVHZ8ItI6JsUWEcMSqZWevRZdkUo960Bp
	5vjeW5P6WOHlM430/22DZNrzs9L2EV/6bKRt3PW0=
Content-Type: multipart/mixed; boundary="===============8621980052416549328=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-roman-numerals-py: upgrading to 4.1.0 FAILED
Message-ID: <0101019b79599c16-baed7ec4-69a4-4873-b7c9-527f531f688a-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228777

--===============8621980052416549328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-roman-numerals-py* to *4.1.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-roman-numerals-py-upgrade-3.1.0-4.1.0.patch
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
From 89b3b1793de38d8961ec4ed5e512045920bdb532 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 08:06:21 +0000
Subject: [PATCH] python3-roman-numerals-py: upgrade 3.1.0 -> 4.1.0

---
 ...-numerals-py_3.1.0.bb => python3-roman-numerals-py_4.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-roman-numerals-py_3.1.0.bb => python3-roman-numerals-py_4.1.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb b/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb
rename to meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb
index 9a76df0de2..2d9724f94d 100644
--- a/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb
+++ b/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/AA-Turner/roman-numerals/"
 LICENSE = "0BSD & CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=bfcc8b16e42929aafeb9d414360bc2fd"
 
-SRC_URI[sha256sum] = "be4bf804f083a4ce001b5eb7e3c0862479d10f94c936f6c4e5f250aa5ff5bd2d"
+SRC_URI[sha256sum] = "f5d7b2b4ca52dd855ef7ab8eb3590f428c0b1ea480736ce32b01fef2a5f8daf9"
 PYPI_PACKAGE = "roman_numerals_py"
 UPSTREAM_CHECK_PYPI_PACKAGE = "roman_numerals_py"
 
-- 
2.47.1


--===============8621980052416549328==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-roman-numerals-py-upgrade-3.1.0-4.1.0.patch"

RnJvbSA4OWIzYjE3OTNkZTM4ZDg5NjFlYzRlZDVlNTEyMDQ1OTIwYmRiNTMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwODowNjoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcm9tYW4tbnVtZXJhbHMtcHk6IHVwZ3JhZGUgMy4xLjAgLT4gNC4xLjAKCi0tLQogLi4u
LW51bWVyYWxzLXB5XzMuMS4wLmJiID0+IHB5dGhvbjMtcm9tYW4tbnVtZXJhbHMtcHlfNC4xLjAu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1yb21hbi1udW1l
cmFscy1weV8zLjEuMC5iYiA9PiBweXRob24zLXJvbWFuLW51bWVyYWxzLXB5XzQuMS4wLmJifSAo
ODAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1y
b21hbi1udW1lcmFscy1weV8zLjEuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1yb21hbi1udW1lcmFscy1weV80LjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcm9tYW4tbnVt
ZXJhbHMtcHlfMy4xLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1yb21hbi1udW1lcmFscy1weV80LjEuMC5iYgppbmRleCA5YTc2ZGYwZGUyLi4yZDk3
MjRmOTRkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cm9tYW4tbnVtZXJhbHMtcHlfMy4xLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXJvbWFuLW51bWVyYWxzLXB5XzQuMS4wLmJiCkBAIC0zLDcgKzMsNyBAQCBI
T01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vQUEtVHVybmVyL3JvbWFuLW51bWVyYWxzLyIK
IExJQ0VOU0UgPSAiMEJTRCAmIENDMC0xLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTkNFLnJzdDttZDU9YmZjYzhiMTZlNDI5MjlhYWZlYjlkNDE0MzYwYmMyZmQiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJiZTRiZjgwNGYwODNhNGNlMDAxYjVlYjdlM2MwODYyNDc5ZDEwZjk0
YzkzNmY2YzRlNWYyNTBhYTVmZjViZDJkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY1ZDdiMmI0
Y2E1MmRkODU1ZWY3YWI4ZWIzNTkwZjQyOGMwYjFlYTQ4MDczNmNlMzJiMDFmZWYyYTVmOGRhZjki
CiBQWVBJX1BBQ0tBR0UgPSAicm9tYW5fbnVtZXJhbHNfcHkiCiBVUFNUUkVBTV9DSEVDS19QWVBJ
X1BBQ0tBR0UgPSAicm9tYW5fbnVtZXJhbHNfcHkiCiAKLS0gCjIuNDcuMQoK

--===============8621980052416549328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1954 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-a4b57616ab48b010883526588a8bede5f0470c3e"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:a4b57616ab48b010883526588a8bede5f0470c3e"
meta-yocto-bsp       
meta-poky            = "master:853589ccc3445f5952efc02a7102587cb4d4f075"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 168 Local 155 Mirrors 0 Missed 13 Current 475 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1473 of 1840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb:do_recipe_qa)
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1821 of 1840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb:do_fetch)
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_fetch: Started
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1822 of 1840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb:do_unpack)
NOTE: Running task 1823 of 1840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_unpack: Started
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1824 of 1840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb:do_patch)
NOTE: Running task 1825 of 1840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_patch: Started
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1826 of 1840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1827 of 1840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb:do_populate_lic)
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_populate_lic: Started
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1828 of 1840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb:do_configure)
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_configure: Started
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1829 of 1840 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb:do_compile)
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-roman-numerals-py/4.1.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/pyproject_hooks/_impl.py", line 402, in _call_hook
|     raise BackendUnavailable(
|     ...<4 lines>...
|     )
| pyproject_hooks._impl.BackendUnavailable: Cannot import 'setuptools.build_meta'
| 
| ERROR Backend 'setuptools.build_meta' is not available.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-roman-numerals-py/4.1.0/temp/run.do_compile.3373118:158 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-roman-numerals-py/4.1.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-roman-numerals-py/4.1.0/sources/roman_numerals_py-4.1.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-roman-numerals-py/4.1.0/temp/run.do_compile.3373118, line 158
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-roman-numerals-py/4.1.0/temp/run.do_compile.3373118, line 153
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-roman-numerals-py/4.1.0/temp/run.do_compile.3373118, line 169
NOTE: recipe python3-roman-numerals-py-4.1.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1829 tasks of which 1819 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260101080608.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260101080608.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-roman-numerals-py/4.1.0/temp/log.do_compile.3373118
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-roman-numerals-py-4.1.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-roman-numerals-py/4.1.0/temp/run.do_compile.3373118' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-roman-numerals-py/4.1.0/temp/log.do_compile.3373118
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb:do_compile) failed with exit code '1'

--===============8621980052416549328==--

