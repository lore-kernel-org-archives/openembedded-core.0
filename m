Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DCDC27C43
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.828.1686887483469151791
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BZeT19TI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010188c25445d1-741f0cf6-c618-4628-8e52-05ed36fa5eae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DzSlrF2Tte3QtCzX5vhxqghfmgW8Wc1gt+VgKcb8SAw=;
	b=BZeT19TIE65itKO0kxrwLQdRwdXE10J4huInc5sKr9JzuOcshMNU3EbaEz9vQLFs
	uQpBS4C1Z2IRF3BHSF0EEcjvd73w5I9vAzWxYVkaj+PjxdjcTYcMjxQlMcJSDnT1H/J
	P7HtVuy5QMECstnfKHpDcln0K/ssRenSp6q5bRP4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887483;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DzSlrF2Tte3QtCzX5vhxqghfmgW8Wc1gt+VgKcb8SAw=;
	b=Pv4aMWYffnm45QJYSFLR7J9T3tRGB4sOB9ei4ZnL0KQTKpCO/Czx6clrL8BBu3qQ
	V7stS/DTrEJIo+gzZZk/n3QWbmUZ7OIm/NCg+DeQiDmscAHYcAv0zXE8E8slLbWAZO9
	0fbrHLl+8NDB+eQixTqOZVp9/22TeMzIPQD0ctnI=
Content-Type: multipart/mixed; boundary="===============5094707367590901522=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest-subtests: upgrading to 0.11.0 FAILED
Message-ID: <01010188c25445d1-741f0cf6-c618-4628-8e52-05ed36fa5eae-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182924

--===============5094707367590901522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest-subtests* to *0.11.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pytest-subtests-upgrade-0.10.0-0.11.0.patch
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
From 1f8927acfabe675ec7d49b46fbfefdf3d253dc6d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 13:44:43 +0000
Subject: [PATCH] python3-pytest-subtests: upgrade 0.10.0 -> 0.11.0

---
 ...est-subtests_0.10.0.bb => python3-pytest-subtests_0.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.10.0.bb => python3-pytest-subtests_0.11.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb
rename to meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb
index e1f2a49d31..bbcc2a7a17 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 
-SRC_URI[sha256sum] = "d9961a67c1791e8c1e32dce7a70ed1e54f3b1e641087f2094f2d37087ab7fb17"
+SRC_URI[sha256sum] = "51865c88457545f51fb72011942f0a3c6901ee9e24cbfb6d1b9dc1348bafbe37"
 
 inherit pypi setuptools3
 
-- 
2.39.2


--===============5094707367590901522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:92a7ba3bf5813a9479eb14ebec2206ac9bc35cec"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 153 Local 144 Mirrors 0 Missed 9 Current 331 (94% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 453 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 469 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_create_spdx_setscene)
NOTE: Running task 934 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_fetch)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Started
NOTE: Running task 1230 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_unpack)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_unpack: Started
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 476 of 484 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1246 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_patch)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1247 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1248 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_populate_lic)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1512 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_populate_lic: Started
NOTE: Running task 1592 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1701 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_configure)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1702 of 1711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_compile)
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/pytest-subtests-0.11.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/temp/run.do_compile.2776401:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/temp/run.do_compile.2776401, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/temp/run.do_compile.2776401, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/temp/run.do_compile.2776401, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/temp/run.do_compile.2776401, line 184
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1702 tasks of which 1693 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-subtests-0.11.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-pytest-subtests-0.11.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/temp/run.do_compile.2776401', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pytest-subtests/0.11.0-r0/temp/log.do_compile.2776401
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_compile) failed with exit code '1'

--===============5094707367590901522==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-subtests-upgrade-0.10.0-0.11.0.patch"

RnJvbSAxZjg5MjdhY2ZhYmU2NzVlYzdkNDliNDZmYmZlZmRmM2QyNTNkYzZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTM6NDQ6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5dGVzdC1zdWJ0ZXN0czogdXBncmFkZSAwLjEwLjAgLT4gMC4xMS4wCgotLS0KIC4u
LmVzdC1zdWJ0ZXN0c18wLjEwLjAuYmIgPT4gcHl0aG9uMy1weXRlc3Qtc3VidGVzdHNfMC4xMS4w
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHl0ZXN0LXN1
YnRlc3RzXzAuMTAuMC5iYiA9PiBweXRob24zLXB5dGVzdC1zdWJ0ZXN0c18wLjExLjAuYmJ9ICg4
NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5
dGVzdC1zdWJ0ZXN0c18wLjEwLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcHl0ZXN0LXN1YnRlc3RzXzAuMTEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0LXN1YnRl
c3RzXzAuMTAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXB5dGVzdC1zdWJ0ZXN0c18wLjExLjAuYmIKaW5kZXggZTFmMmE0OWQzMS4uYmJjYzJhN2Ex
NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVz
dC1zdWJ0ZXN0c18wLjEwLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXB5dGVzdC1zdWJ0ZXN0c18wLjExLjAuYmIKQEAgLTcsNyArNyw3IEBAIEJVR1RSQUNL
RVIgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5dGVzdC1kZXYvcHl0ZXN0LXN1YnRlc3RzL2lzc3Vl
cyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTtt
ZDU9MjQyYjRlMTdmYTI4N2RjZjdhZWYzNzJmNmJjM2RjYjEiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJkOTk2MWE2N2MxNzkxZThjMWUzMmRjZTdhNzBlZDFlNTRmM2IxZTY0MTA4N2YyMDk0ZjJk
MzcwODdhYjdmYjE3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjUxODY1Yzg4NDU3NTQ1ZjUxZmI3
MjAxMTk0MmYwYTNjNjkwMWVlOWUyNGNiZmI2ZDFiOWRjMTM0OGJhZmJlMzciCiAKIGluaGVyaXQg
cHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjM5LjIKCg==

--===============5094707367590901522==--

