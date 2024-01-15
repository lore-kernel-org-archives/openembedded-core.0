Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EA8C52CF8
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:01 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.88856.1705340029844065316
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FeyNOiKP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=j/2PS5XV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018d0e2fc8dd-e4cb8e44-e692-4b64-8948-7b322469db53-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VK7uoYlYfnRVBTDCYDkyiVN/ocfmGo1pZZLf57aGgLY=;
	b=FeyNOiKPbAmyPw8EY/Qkf4SpheYlqJL1Kra+56hp25/rSaris/ULnxw2WMgSH3+X
	mvhqksgGEcT4MK46rSFAMb8j64nrd3RFQGkJQ1i7UBDbyUbV5PpsbDezM7yJyN5cffa
	bckiyX7urPByCLA/S3Jcq2VjWdVesRyJ4UlED3Bg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VK7uoYlYfnRVBTDCYDkyiVN/ocfmGo1pZZLf57aGgLY=;
	b=j/2PS5XVFkAozMqFFqGMZyMER7f2OKkiHP/xrIi10EGBhZfimHB0U0I/1LYhBbhV
	4EJI59bvKhoRh89B2vnGeftFej6znUU/AKKHESoCkZ384/08LAf+7z013hPnYUGK7tV
	JJXCqDK4OR4a87VUW7/iMLQSbI96+/ULkeyY+nTs=
Content-Type: multipart/mixed; boundary="===============3471630170310486529=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2023.11 FAILED
Message-ID: <0101018d0e2fc8dd-e4cb8e44-e692-4b64-8948-7b322469db53-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193719

--===============3471630170310486529==
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
From c8a991103c5eb9598eeea1f118f556df3e1b4f57 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 07:07:16 +0000
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


--===============3471630170310486529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1853 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1850 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-94b124ee2aa6a1984fa56254face35fef5973ad4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:94b124ee2aa6a1984fa56254face35fef5973ad4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 337 Local 325 Mirrors 0 Missed 12 Current 455 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 529 of 792 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_recipe_qa_setscene)
NOTE: recipe python3-dtschema-2023.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1656 of 2240 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_fetch)
NOTE: recipe python3-dtschema-2023.11-r0: task do_fetch: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_fetch: Succeeded
NOTE: Running task 2020 of 2240 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_unpack)
NOTE: Running task 2021 of 2240 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dtschema-2023.11-r0: task do_unpack: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_unpack: Succeeded
NOTE: Running task 2224 of 2240 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_patch)
NOTE: Running task 2225 of 2240 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_collect_spdx_deps)
NOTE: recipe python3-dtschema-2023.11-r0: task do_patch: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtschema-2023.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dtschema-2023.11-r0: task do_patch: Succeeded
NOTE: Running task 2226 of 2240 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2227 of 2240 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_populate_lic)
NOTE: recipe python3-dtschema-2023.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_populate_lic: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-dtschema-2023.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_populate_lic unihash changed to c2e169d3969fa7dc6c78311e63b705357e1b6f36e49015e471d36ec27cf4b77c
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_deploy_source_date_epoch unihash changed to 68e7aef39bbfcdebd7164baa1cf701e5958392575e326243c0beae84854ac402
NOTE: Setscene tasks completed
NOTE: Running task 2228 of 2240 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_configure)
NOTE: recipe python3-dtschema-2023.11-r0: task do_configure: Started
NOTE: recipe python3-dtschema-2023.11-r0: task do_configure: Succeeded
NOTE: Running task 2229 of 2240 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_compile)
NOTE: recipe python3-dtschema-2023.11-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/dtschema-2023.11/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.3556161:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.3556161, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.3556161, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.3556161, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.3556161, line 184
NOTE: recipe python3-dtschema-2023.11-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2229 tasks of which 2220 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240115070656.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240115070656.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-dtschema-2023.11-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-dtschema-2023.11-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/run.do_compile.3556161', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-dtschema/2023.11/temp/log.do_compile.3556161
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dtschema_2023.11.bb:do_compile) failed with exit code '1'

--===============3471630170310486529==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2023.7-2023.11.patch"

RnJvbSBjOGE5OTExMDNjNWViOTU5OGVlZWExZjExOGY1NTZkZjNlMWI0ZjU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDc6MDc6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
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

--===============3471630170310486529==--

