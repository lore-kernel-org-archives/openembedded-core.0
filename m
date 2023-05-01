Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D85C77B73
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:51 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.107422.1682976349634992511
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Zk5psZha;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010187d9351fb0-852c26a7-89ef-49af-b2d3-39cfedab7917-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pvDR26wJND6yJFBbJqY2lprUQoXHFjdZYzeFsX+HInA=;
	b=Zk5psZhaFa6yFYtrtXRzCx0Zj2YlRC6vzHNZKgF/8JQdkFAQyZj/1xmp6/7zpLOj
	2Gk1ylhs4VXNSXKj7M3gBqN6pHoLFiLL+sfK2TNpdS0uVDLHBNY8CkakPD6kdonuzp4
	Auci2sEwpqX/9QRugawNfxWDLLJqhZM0eAoW2YqA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pvDR26wJND6yJFBbJqY2lprUQoXHFjdZYzeFsX+HInA=;
	b=E0SN98HmvhuQ1wu3Wpfc3cYQ68UfZKfNyldWlCZqzxfIioafet45P3xhbkU4zD4f
	AuMyCMjhecL/anxD5a66yK5ti7ZnDAdGUu+CpuqvMkYQUqMTOu/ykNEDvHTrBrDxPkG
	seEOrKU5qWFJtZVnGwRnu4kSLdSJLqUeJ21eL79M=
Content-Type: multipart/mixed; boundary="===============8766006083211138664=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.14.1 FAILED
Message-ID: <01010187d9351fb0-852c26a7-89ef-49af-b2d3-39cfedab7917-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180620

--===============8766006083211138664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.14.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.13.0-1.14.1.patch
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
--===============8766006083211138664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1798 targets, 40 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:68d0f4ebc32b8c26aee9cf0100f6185cf700ff74"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 98 Local 89 Mirrors 0 Missed 9 Current 241 (90% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1024 of 1301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb:do_fetch)
NOTE: Running task 1026 of 1301 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb:do_fetch)
NOTE: recipe python3-hatchling-1.14.1-r0: task do_fetch: Started
NOTE: recipe python3-hatchling-1.14.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-hatchling-native-1.14.1-r0: task do_fetch: Started
NOTE: Running task 1280 of 1301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb:do_unpack)
NOTE: recipe python3-hatchling-native-1.14.1-r0: task do_fetch: Succeeded
NOTE: Running task 1281 of 1301 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb:do_unpack)
NOTE: Running task 1282 of 1301 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hatchling-1.14.1-r0: task do_unpack: Started
NOTE: recipe python3-hatchling-1.14.1-r0: task do_unpack: Succeeded
NOTE: Running task 1283 of 1301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb:do_patch)
NOTE: recipe python3-hatchling-native-1.14.1-r0: task do_unpack: Started
NOTE: recipe python3-hatchling-native-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hatchling-native-1.14.1-r0: task do_unpack: Succeeded
NOTE: Running task 1284 of 1301 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb:do_patch)
NOTE: recipe python3-hatchling-1.14.1-r0: task do_patch: Started
NOTE: recipe python3-hatchling-native-1.14.1-r0: task do_patch: Started
NOTE: recipe python3-hatchling-1.14.1-r0: task do_patch: Succeeded
NOTE: Running task 1285 of 1301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1286 of 1301 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb:do_populate_lic)
NOTE: recipe python3-hatchling-1.14.1-r0: task do_populate_lic: Started
NOTE: recipe python3-hatchling-1.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hatchling-native-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hatchling-native-1.14.1-r0: task do_patch: Succeeded
NOTE: Running task 1287 of 1301 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hatchling-1.14.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-hatchling-1.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hatchling-native-1.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hatchling-native-1.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1288 of 1301 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb:do_configure)
NOTE: recipe python3-hatchling-native-1.14.1-r0: task do_configure: Started
NOTE: recipe python3-hatchling-native-1.14.1-r0: task do_configure: Succeeded
NOTE: Running task 1289 of 1301 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb:do_compile)
NOTE: recipe python3-hatchling-native-1.14.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| ERROR Missing dependencies:
| 	trove-classifiers
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.14.1-r0/temp/run.do_compile.1276434:159 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.14.1-r0/dist /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.14.1-r0/hatchling-1.14.1'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.14.1-r0/temp/run.do_compile.1276434, line 159
| 	#2: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.14.1-r0/temp/run.do_compile.1276434, line 154
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.14.1-r0/temp/run.do_compile.1276434, line 163
NOTE: recipe python3-hatchling-native-1.14.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1289 tasks of which 1277 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-hatchling-native-1.14.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.14.1-r0/temp/run.do_compile.1276434', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.14.1-r0/temp/log.do_compile.1276434
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hatchling_1.14.1.bb:do_compile) failed with exit code '1'

--===============8766006083211138664==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.13.0-1.14.1.patch"

RnJvbSAxMGJlY2RkOWNjYmQ5MmM3M2IwZDFiNzMxYWRiYzY0YWM3MzJmNjg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxMDoyNjowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaGF0Y2hsaW5nOiB1cGdyYWRlIDEuMTMuMCAtPiAxLjE0LjEKCi0tLQogLi4ue3B5dGhv
bjMtaGF0Y2hsaW5nXzEuMTMuMC5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjE0LjEuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oYXRjaGxpbmdfMS4xMy4w
LmJiID0+IHB5dGhvbjMtaGF0Y2hsaW5nXzEuMTQuMS5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTMuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4xNC4xLmJi
CnNpbWlsYXJpdHkgaW5kZXggODQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS4xMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTQuMS5iYgppbmRleCAxN2U3Zjg2
YmE2Li4xN2M1MTJmN2QyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTMuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTQuMS5iYgpAQCAtOCw3ICs4LDcgQEAgaW5oZXJp
dCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIERFUEVORFMgKz0gInB5dGhvbjMtcGx1Z2d5LW5hdGl2
ZSBweXRob24zLXBhdGhzcGVjLW5hdGl2ZSBweXRob24zLXBhY2thZ2luZy1uYXRpdmUgcHl0aG9u
My1lZGl0YWJsZXMtbmF0aXZlIgogREVQRU5EUzpyZW1vdmU6Y2xhc3MtbmF0aXZlID0gInB5dGhv
bjMtaGF0Y2hsaW5nLW5hdGl2ZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImY4ZDI3NWEyY2M3
MjA3MzUyODZiN2MyZTJiYzM1ZGEwNTc2MWU2ZDM2OTVjMmZhNDE2NTUwMzk1ZjEwYzUzYzciCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNTVmYmM4OGNiZDBkOTZjMDljM2U5MzkyYjUxZGI1MTNmZDRj
YjRjYWY0NzYxNWQ2NWY5MzVhNWVmMTc1NjEzMyIKIAogZG9fY29tcGlsZTpwcmVwZW5kKCkgewog
ICAgIGV4cG9ydCBQWVRIT05QQVRIPXNyYwotLSAKMi4zOS4yCgo=

--===============8766006083211138664==--

