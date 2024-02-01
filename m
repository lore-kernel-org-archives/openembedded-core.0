Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE998C54E73
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:19 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.2105.1706810405824188758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=g/fR0vPG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hqI9znqj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018d65d3f045-4a145abf-d3d0-4618-baa5-13f0107fa8e6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L/cNOovOjxyunr4Ip3uuj2s8Yn/uybp2BdSqsSZLaKw=;
	b=g/fR0vPGwGrRLOBwo5FMxHXPuj1DYM4qOo3Lfb1YAIhKY+vhpnkqiQwGwucyes+W
	0PlqwBgLK/iom79IisnH2EePrPFKDC59iepqxWHJ4Ai6MMEdtV9Yi/cZ+QtJCJbOYJq
	hDgiM3ZOEIpWDe2AywztsfuRMoP7n9B2ftmT++0k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L/cNOovOjxyunr4Ip3uuj2s8Yn/uybp2BdSqsSZLaKw=;
	b=hqI9znqjXwcd1DkZHl9rZItqwyS+W6yVLfNMFerxnxjgz4ySJYef+ED/C1KKMqVh
	OuRJt2/fTlpYdAP33UByGei0Z9FdEdzCoGcJGMfaUORBw+dzAnY72H0319QSBbw2rWc
	ELNPgpr5eObXmZS1MDuskl+8RxlXlyWxETv0llu4=
Content-Type: multipart/mixed; boundary="===============5346174238553778704=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2023.11 FAILED
Message-ID: <0101018d65d3f045-4a145abf-d3d0-4618-baa5-13f0107fa8e6-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194630

--===============5346174238553778704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2023.11* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2023.7-2023.11.patch
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
From c2f79a7c6d6057264e828e954bd94971804c8464 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 07:36:56 +0000
Subject: [PATCH] python3-dtschema: upgrade 2023.7 -> 2023.11

---
 .../{python3-dtschema_2023.7.bb => python3-dtschema_2023.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2023.7.bb => python3-dtschema_2023.11.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.7.bb b/meta/recipes-devtools/python/python3-dtschema_2023.11.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2023.7.bb
rename to meta/recipes-devtools/python/python3-dtschema_2023.11.bb
index c1dc3e019a..5453d96f8a 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.7.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.11.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "de7cd73a35244cf76a8cdd9919bbeb31f362aa5744f3c76c80e0e612489dd0c0"
+SRC_URI[sha256sum] = "cf9a449ea743c0a955cf6034ef246668fa5ea177684977c61fef7604af5f273b"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.42.0


--===============5346174238553778704==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2023.7-2023.11.patch"

RnJvbSBjMmY3OWE3YzZkNjA1NzI2NGU4MjhlOTU0YmQ5NDk3MTgwNGM4NDY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwNzozNjo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZHRzY2hlbWE6IHVwZ3JhZGUgMjAyMy43IC0+IDIwMjMuMTEKCi0tLQogLi4uL3tweXRo
b24zLWR0c2NoZW1hXzIwMjMuNy5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjMuMTEuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kdHNjaGVtYV8yMDIzLjcu
YmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjExLmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjcuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMy4xMS5iYgpz
aW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMy43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMy4xMS5iYgppbmRleCBjMWRjM2UwMTlh
Li41NDUzZDk2ZjhhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtZHRzY2hlbWFfMjAyMy43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjExLmJiCkBAIC03LDcgKzcsNyBAQCBpbmhlcml0IHB5
cGkgc2V0dXB0b29sczMKIAogUFlQSV9QQUNLQUdFID0gImR0c2NoZW1hIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiZGU3Y2Q3M2EzNTI0NGNmNzZhOGNkZDk5MTliYmViMzFmMzYyYWE1NzQ0ZjNj
NzZjODBlMGU2MTI0ODlkZDBjMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjZjlhNDQ5ZWE3NDNj
MGE5NTVjZjYwMzRlZjI0NjY2OGZhNWVhMTc3Njg0OTc3YzYxZmVmNzYwNGFmNWYyNzNiIgogCiBE
RVBFTkRTICs9ICJweXRob24zLXNldHVwdG9vbHMtc2NtLW5hdGl2ZSIKIFJERVBFTkRTOiR7UE59
ICs9ICJcCi0tIAoyLjQyLjAKCg==

--===============5346174238553778704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1853 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1849 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-87c498523931ed418dd885f9a7652ec4cd413c81"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:87c498523931ed418dd885f9a7652ec4cd413c81"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 326 Local 314 Mirrors 0 Missed 12 Current 466 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 541 of 792 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_recipe_qa_setscene)
NOTE: recipe python3-dtschema-2023.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1660 of 2244 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_fetch)
NOTE: recipe python3-dtschema-2023.11-r0: task do_fetch: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_fetch: Succeeded
NOTE: Running task 2026 of 2244 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_unpack)
NOTE: Running task 2027 of 2244 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dtschema-2023.11-r0: task do_unpack: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_unpack: Succeeded
NOTE: Running task 2228 of 2244 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_patch)
NOTE: Running task 2229 of 2244 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_collect_spdx_deps)
NOTE: recipe python3-dtschema-2023.11-r0: task do_patch: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtschema-2023.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dtschema-2023.11-r0: task do_patch: Succeeded
NOTE: Running task 2230 of 2244 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2231 of 2244 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_populate_lic)
NOTE: recipe python3-dtschema-2023.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_populate_lic: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-dtschema-2023.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_deploy_source_date_epoch unihash changed to 68e7aef39bbfcdebd7164baa1cf701e5958392575e326243c0beae84854ac402
NOTE: Setscene tasks completed
NOTE: Running task 2232 of 2244 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_configure)
NOTE: recipe python3-dtschema-2023.11-r0: task do_configure: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_configure: Succeeded
NOTE: Running task 2233 of 2244 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_compile)
NOTE: recipe python3-dtschema-2023.11-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/dtschema-2023.11/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.3828582:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.3828582, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.3828582, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.3828582, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.3828582, line 184
NOTE: recipe python3-dtschema-2023.11-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2233 tasks of which 2224 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201073637.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240201073637.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-dtschema-2023.11-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-dtschema-2023.11-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.3828582', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/log.do_compile.3828582
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_compile) failed with exit code '1'

--===============5346174238553778704==--

