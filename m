Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FDFE7490F
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:18 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.65018.1696183990828029669
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eI0mw5KL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VmOyEdBg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018aec71b752-ca252b6e-3ecb-45cc-a4a0-a38b8360152f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=l3TUyFyhIbCQ4xcXUIn29fL8/3E9iFnM8DxWBQI770M=;
	b=eI0mw5KL3+IEJTKVgY59ZYN9F3ibgVMbctUMNdWcte+KrpCdaHoQnbJoeZT/uc6C
	xv8ej6937ejTJDu4zEzPQlO7sH+L6rpDoAx86w+OMIAOf36yoaW0ZYpXWGy8lxTDGjy
	x7/B3XV3fN+e/cXKHk5G1XeKXjqzpVnQtpH1GjVY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183990;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=l3TUyFyhIbCQ4xcXUIn29fL8/3E9iFnM8DxWBQI770M=;
	b=VmOyEdBgwFAj0ZlWCjYRjoVF2jNlmNgducgOMpzSLOi1cBdrtZvRi/6kkBBtirLD
	Wqs5QAE7HgQSWfq07yjjiYrHekINiV0LpoMX5r6BROWqE36xjfH75n1pI39sfKRzG9Z
	vS4F8nELYdLLZBMfMU0HIqf49wvngtE8wQTSRmKc=
Content-Type: multipart/mixed; boundary="===============7445019045077724415=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2023.9 FAILED
Message-ID: <0101018aec71b752-ca252b6e-3ecb-45cc-a4a0-a38b8360152f-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188529

--===============7445019045077724415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2023.9* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2023.7-2023.9.patch
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
From 9708a3f5f21f9973507e27763b18cd1378c1b091 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 09:39:38 +0000
Subject: [PATCH] python3-dtschema: upgrade 2023.7 -> 2023.9

---
 .../{python3-dtschema_2023.7.bb => python3-dtschema_2023.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2023.7.bb => python3-dtschema_2023.9.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.7.bb b/meta/recipes-devtools/python/python3-dtschema_2023.9.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dtschema_2023.7.bb
rename to meta/recipes-devtools/python/python3-dtschema_2023.9.bb
index c1dc3e019a..8cf6f54f76 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.7.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.9.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "de7cd73a35244cf76a8cdd9919bbeb31f362aa5744f3c76c80e0e612489dd0c0"
+SRC_URI[sha256sum] = "52c6d271065155ca134d8a0bcf7e0ebed67b3991acbbd7a98b74eb8642f67d87"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "\
-- 
2.39.2


--===============7445019045077724415==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2023.7-2023.9.patch"

RnJvbSA5NzA4YTNmNWYyMWY5OTczNTA3ZTI3NzYzYjE4Y2QxMzc4YzFiMDkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAwOTozOTozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZHRzY2hlbWE6IHVwZ3JhZGUgMjAyMy43IC0+IDIwMjMuOQoKLS0tCiAuLi4ve3B5dGhv
bjMtZHRzY2hlbWFfMjAyMy43LmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyMy45LmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWR0c2NoZW1hXzIwMjMuNy5i
YiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjMuOS5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMy43LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuOS5iYgpzaW1p
bGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZHRzY2hlbWFfMjAyMy43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZHRzY2hlbWFfMjAyMy45LmJiCmluZGV4IGMxZGMzZTAxOWEuLjhj
ZjZmNTRmNzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1kdHNjaGVtYV8yMDIzLjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWR0c2NoZW1hXzIwMjMuOS5iYgpAQCAtNyw3ICs3LDcgQEAgaW5oZXJpdCBweXBpIHNl
dHVwdG9vbHMzCiAKIFBZUElfUEFDS0FHRSA9ICJkdHNjaGVtYSIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gImRlN2NkNzNhMzUyNDRjZjc2YThjZGQ5OTE5YmJlYjMxZjM2MmFhNTc0NGYzYzc2Yzgw
ZTBlNjEyNDg5ZGQwYzAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTJjNmQyNzEwNjUxNTVjYTEz
NGQ4YTBiY2Y3ZTBlYmVkNjdiMzk5MWFjYmJkN2E5OGI3NGViODY0MmY2N2Q4NyIKIAogREVQRU5E
UyArPSAicHl0aG9uMy1zZXR1cHRvb2xzLXNjbS1uYXRpdmUiCiBSREVQRU5EUzoke1BOfSArPSAi
XAotLSAKMi4zOS4yCgo=

--===============7445019045077724415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-eeb8c4a85ae2abf1bd2c431ab3a94fb81e3377de"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:eeb8c4a85ae2abf1bd2c431ab3a94fb81e3377de"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 229 Local 218 Mirrors 0 Missed 11 Current 542 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1522 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_recipe_qa)
NOTE: recipe python3-dtschema-2023.9-r0: task do_recipe_qa: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2178 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_fetch)
NOTE: recipe python3-dtschema-2023.9-r0: task do_fetch: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_fetch: Succeeded
NOTE: Running task 2179 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_unpack)
NOTE: Running task 2180 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dtschema-2023.9-r0: task do_unpack: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_unpack: Succeeded
NOTE: Running task 2181 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_patch)
NOTE: Running task 2182 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_collect_spdx_deps)
NOTE: recipe python3-dtschema-2023.9-r0: task do_patch: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-dtschema-2023.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-dtschema-2023.9-r0: task do_patch: Succeeded
NOTE: Running task 2183 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 2184 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_populate_lic)
NOTE: recipe python3-dtschema-2023.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_populate_lic: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-dtschema-2023.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2185 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_configure)
NOTE: recipe python3-dtschema-2023.9-r0: task do_configure: Started
NOTE: recipe python3-dtschema-2023.9-r0: task do_configure: Succeeded
NOTE: Running task 2186 of 2195 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_compile)
NOTE: recipe python3-dtschema-2023.9-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/dtschema-2023.9/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.3518945:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.3518945, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.3518945, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.3518945, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.3518945, line 184
NOTE: recipe python3-dtschema-2023.9-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2186 tasks of which 2176 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-dtschema-2023.9-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-dtschema-2023.9-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/temp/run.do_compile.3518945', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dtschema/2023.9/temp/log.do_compile.3518945
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dtschema_2023.9.bb:do_compile) failed with exit code '1'

--===============7445019045077724415==--

