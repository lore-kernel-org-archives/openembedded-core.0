Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65326C54E55
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:17 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.36619.1709330715952703473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A3suizyH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TWanzO2m;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018dfc0cd560-c27a5644-0ee2-41b4-a04c-f95edded3a5e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3PigwfLorwBGOiotoFvcg6ORHxgMga7Y7y7BbS4sPD0=;
	b=A3suizyHTmTvoG8QehV7+Ly+8GLugsZsJYkPhwod5W27E8wPHUTDgdCdjAkU4kCl
	52qpTJK+84porEwPD27jL2gkX5BnOIzx3Hsv/MeRoZg3jczcV++EC05QXSMyduDI7XH
	sp6Y6m3H7CSX6E4cHEGyn2Pzen9LjncG6xwm6nxg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3PigwfLorwBGOiotoFvcg6ORHxgMga7Y7y7BbS4sPD0=;
	b=TWanzO2mcsQFmqEEBO0t+iCPixjN46YwhWdFHD6edIGjbJIqu0I60MFr4lRx0pGQ
	kOfSVoHzRbTTk691/1qDXWfVkLYwXAqYBKqfLSpp/wx8/mGtzehmiPiZTHNL9DlLhap
	jOHFLbOE9Hok5R6f9C1VzWjGuh9SdZgxKm0PzGFQ=
Content-Type: multipart/mixed; boundary="===============1834013989644964364=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2024.2 FAILED
Message-ID: <0101018dfc0cd560-c27a5644-0ee2-41b4-a04c-f95edded3a5e-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196475

--===============1834013989644964364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2024.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2023.7-2024.2.patch
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
From 34fcc07ce15516c488ea3bfef45044cb4c19c3f4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 12:32:18 +0000
Subject: [PATCH] python3-dtschema: upgrade 2023.7 -> 2024.2

---
 .../{python3-dtschema_2023.7.bb => python3-dtschema_2024.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2023.7.bb => python3-dtschema_2024.2.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.7.bb b/meta/recipes-devtools/python/python3-dtschema_2024.2.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2023.7.bb
rename to meta/recipes-devtools/python/python3-dtschema_2024.2.bb
index c1dc3e019a..4686f02970 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.7.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2024.2.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "de7cd73a35244cf76a8cdd9919bbeb31f362aa5744f3c76c80e0e612489dd0c0"
+SRC_URI[sha256sum] = "df4e5afb35bda93894209d2465e87fb7103f1a95a05909ebcb594fc4cf4fdd1e"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.42.0


--===============1834013989644964364==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2023.7-2024.2.patch"

RnJvbSAzNGZjYzA3Y2UxNTUxNmM0ODhlYTNiZmVmNDUwNDRjYjRjMTljM2Y0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxMjozMjoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZHRzY2hlbWE6IHVwZ3JhZGUgMjAyMy43IC0+IDIwMjQuMgoKLS0tCiAuLi4ve3B5dGhv
bjMtZHRzY2hlbWFfMjAyMy43LmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyNC4yLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWR0c2NoZW1hXzIwMjMuNy5i
YiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjQuMi5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMy43LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjQuMi5iYgpzaW1p
bGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZHRzY2hlbWFfMjAyMy43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyNC4yLmJiCmluZGV4IGMxZGMzZTAxOWEuLjQ2
ODZmMDI5NzAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1kdHNjaGVtYV8yMDIzLjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWR0c2NoZW1hXzIwMjQuMi5iYgpAQCAtNyw3ICs3LDcgQEAgaW5oZXJpdCBweXBpIHNl
dHVwdG9vbHMzCiAKIFBZUElfUEFDS0FHRSA9ICJkdHNjaGVtYSIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gImRlN2NkNzNhMzUyNDRjZjc2YThjZGQ5OTE5YmJlYjMxZjM2MmFhNTc0NGYzYzc2Yzgw
ZTBlNjEyNDg5ZGQwYzAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGY0ZTVhZmIzNWJkYTkzODk0
MjA5ZDI0NjVlODdmYjcxMDNmMWE5NWEwNTkwOWViY2I1OTRmYzRjZjRmZGQxZSIKIAogREVQRU5E
UyArPSAicHl0aG9uMy1zZXR1cHRvb2xzLXNjbS1uYXRpdmUiCiBSREVQRU5EUzoke1BOfSArPSAi
XAotLSAKMi40Mi4wCgo=

--===============1834013989644964364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1866 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1863 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-70afb4228d32d055d12e765bf06492f29f0bfd0f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:70afb4228d32d055d12e765bf06492f29f0bfd0f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 306 Local 296 Mirrors 0 Missed 10 Current 494 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 561 of 800 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 563 of 800 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-dtschema-2024.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-dtschema-2024.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dtschema-2024.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dtschema-2024.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 800 of 800 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-dtschema-2024.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-dtschema-2024.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1680 of 2266 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.2.bb:do_fetch)
NOTE: recipe python3-dtschema-2024.2-r0: task do_fetch: Started
NOTE: recipe python3-dtschema-2024.2-r0: task do_fetch: Succeeded
NOTE: Running task 2003 of 2266 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.2.bb:do_unpack)
NOTE: Running task 2004 of 2266 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dtschema-2024.2-r0: task do_unpack: Started
NOTE: recipe python3-dtschema-2024.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dtschema-2024.2-r0: task do_unpack: Succeeded
NOTE: Running task 2250 of 2266 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.2.bb:do_patch)
NOTE: Running task 2251 of 2266 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-dtschema-2024.2-r0: task do_patch: Started
NOTE: recipe python3-dtschema-2024.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dtschema-2024.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtschema-2024.2-r0: task do_patch: Succeeded
NOTE: Running task 2253 of 2266 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.2.bb:do_configure)
NOTE: recipe python3-dtschema-2024.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dtschema-2024.2-r0: task do_configure: Started
NOTE: recipe python3-dtschema-2024.2-r0: task do_configure: Succeeded
NOTE: Running task 2255 of 2266 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.2.bb:do_compile)
NOTE: recipe python3-dtschema-2024.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2024.2/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2024.2/dtschema-2024.2/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2024.2/temp/run.do_compile.3712052:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2024.2/temp/run.do_compile.3712052, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2024.2/temp/run.do_compile.3712052, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2024.2/temp/run.do_compile.3712052, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2024.2/temp/run.do_compile.3712052, line 184
NOTE: recipe python3-dtschema-2024.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2255 tasks of which 2248 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301123157.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301123157.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.2.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-dtschema-2024.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-dtschema-2024.2-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2024.2/temp/run.do_compile.3712052', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2024.2/temp/log.do_compile.3712052
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2024.2.bb:do_compile) failed with exit code '1'

--===============1834013989644964364==--

