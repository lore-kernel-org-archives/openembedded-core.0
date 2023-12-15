Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36B7C4725D
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:50 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.63611.1702649863847532296
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Obhyd0hY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=craUkteX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018c6dd71bec-f59156df-c396-4211-8983-6f601d6e0764-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649863;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5qixSFh9R+U9lJn22bZ1Z1UCKW+gmM/lo06aHHktlWo=;
	b=Obhyd0hYvdSrYc0FPZ7xvY6NS9Le8d7/Etf0s3c7XQ4aJRN+WOsuT1+JcEjFczIX
	Zt/YnYYV1bYlWQzTfWn96YeCE3dxaVgMSoHQL48Jl+GoCrZoDqwj5BTmaGmYWrzN87n
	qM5onlTxj8jxqflKxwBRaIFRJJUADDoaDh5cUws4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649863;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5qixSFh9R+U9lJn22bZ1Z1UCKW+gmM/lo06aHHktlWo=;
	b=craUkteXQKibkwckXCbFNIOXtCQn3I1o3Epsnrtegs7cEWkt00t2cGSqKbK/oTfm
	fC5gYdmIPFn0u/X4HbZ1k8qIPX8N/YZ6BcjdQzQGL8BHG97xvKFtnwUlbsCOK+r04lF
	B/Z3jMQltjE4hAOES4RAqYVBphdEQdSChh+4CsTg=
Content-Type: multipart/mixed; boundary="===============0351268878661047477=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2023.11 FAILED
Message-ID: <0101018c6dd71bec-f59156df-c396-4211-8983-6f601d6e0764-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:43 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192460

--===============0351268878661047477==
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
From 12bbc6bcb0d59da0d2a64e739f4612fbf955c800 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 07:47:35 +0000
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


--===============0351268878661047477==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2023.7-2023.11.patch"

RnJvbSAxMmJiYzZiY2IwZDU5ZGEwZDJhNjRlNzM5ZjQ2MTJmYmY5NTVjODAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMDc6NDc6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjMuNyAtPiAyMDIzLjExCgotLS0KIC4uLi97cHl0
aG9uMy1kdHNjaGVtYV8yMDIzLjcuYmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjExLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZHRzY2hlbWFfMjAyMy43
LmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyMy4xMS5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMy43LmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuMTEuYmIK
c2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuMTEuYmIKaW5kZXggYzFkYzNlMDE5
YS4uNTQ1M2Q5NmY4YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWR0c2NoZW1hXzIwMjMuNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMy4xMS5iYgpAQCAtNyw3ICs3LDcgQEAgaW5oZXJpdCBw
eXBpIHNldHVwdG9vbHMzCiAKIFBZUElfUEFDS0FHRSA9ICJkdHNjaGVtYSIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImRlN2NkNzNhMzUyNDRjZjc2YThjZGQ5OTE5YmJlYjMxZjM2MmFhNTc0NGYz
Yzc2YzgwZTBlNjEyNDg5ZGQwYzAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2Y5YTQ0OWVhNzQz
YzBhOTU1Y2Y2MDM0ZWYyNDY2NjhmYTVlYTE3NzY4NDk3N2M2MWZlZjc2MDRhZjVmMjczYiIKIAog
REVQRU5EUyArPSAicHl0aG9uMy1zZXR1cHRvb2xzLXNjbS1uYXRpdmUiCiBSREVQRU5EUzoke1BO
fSArPSAiXAotLSAKMi40Mi4wCgo=

--===============0351268878661047477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-2d27714166974a5afb77333b4fc5ac808129aa1b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:2d27714166974a5afb77333b4fc5ac808129aa1b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 383 Local 373 Mirrors 0 Missed 10 Current 406 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 434 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtc_1.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 442 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_populate_lic_setscene)
NOTE: Running setscene task 444 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 454 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 461 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 462 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.35.bb:do_create_spdx_setscene)
NOTE: recipe python3-dtc-1.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-ruamel-yaml-0.17.35-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dtc-1.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-dtschema-2023.11-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 681 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_recipe_qa_setscene)
NOTE: recipe python3-jsonschema-4.17.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-ruamel-yaml-0.17.35-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 707 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-dtschema-2023.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 755 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1216 of 2227 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 766 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe python3-dtschema-2023.11-r0: task do_fetch: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_fetch: Succeeded
NOTE: Running task 1501 of 2227 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_unpack)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_unpack: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_unpack: Succeeded
NOTE: Running task 1553 of 2227 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_patch)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 773 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 775 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-dtschema-2023.11-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 789 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1974 of 2227 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2187 of 2227 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_collect_spdx_deps)
NOTE: recipe python3-dtschema-2023.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2215 of 2227 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_configure)
NOTE: recipe python3-dtschema-2023.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dtschema-2023.11-r0: task do_configure: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_configure: Succeeded
NOTE: Running task 2216 of 2227 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_compile)
NOTE: recipe python3-dtschema-2023.11-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/dtschema-2023.11/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.1631841:179 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.1631841, line 179
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.1631841, line 169
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.1631841, line 151
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.1631841, line 183
NOTE: recipe python3-dtschema-2023.11-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2216 tasks of which 2209 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215074712.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215074712.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-dtschema-2023.11-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-dtschema-2023.11-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.1631841', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/log.do_compile.1631841
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_compile) failed with exit code '1'

--===============0351268878661047477==--

