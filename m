Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E54AC88C8D
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.107899.1682976351643455935
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DxdxhS+c;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010187d935222d-bb680ef9-209d-4066-bb55-a6dc57c44efb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=59mk560fqq049PhuR7qfUJ/zWzm+mEvOFBEPTm3iBMs=;
	b=DxdxhS+cGE94gkbuYFXmXQZN3LLXZB6l3ZU2b0qAgO3NK/ezHvLG8EEqSIADl6jg
	VgEZvFi/aWQnbxckBcp/G6n96W/HseYeWRu+9SpycTCjZ09NGKONXo/PC5MOD4GSn3c
	y08ZYvH3u7e34EPMfhmWmpY99XeWvk51V06E1nFY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=59mk560fqq049PhuR7qfUJ/zWzm+mEvOFBEPTm3iBMs=;
	b=FxmCLP8g3GbZOsaB9f6P3CWH0rQxDbwO6eOGAjqp+2AztbZHmHVbnQvxSfGpt2Xr
	a15bO73EfpgKqjhtlcVezcnF1iO6Inpv6znlnyH2pOKcSy7uCmj2+5X1S/bMYYY7j8P
	OdVDyGOBHSpUKln42wCEL90e1DQgcoWfd9AwXQNk=
Content-Type: multipart/mixed; boundary="===============1001485618281788658=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 2.0.1 FAILED
Message-ID: <01010187d935222d-bb680ef9-209d-4066-bb55-a6dc57c44efb-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180636

--===============1001485618281788658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-urllib3* to *2.0.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-1.26.15-2.0.1.patch
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
--===============1001485618281788658==
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
meta-yocto-bsp       = "tmp-auh-upgrades:b7a2f369223c6abb1880a312af6f5a782269c23c"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 139 Local 132 Mirrors 0 Missed 7 Current 271 (94% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1175 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.1.bb:do_fetch)
NOTE: recipe python3-urllib3-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1547 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.1.bb:do_unpack)
NOTE: Running task 1548 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1549 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.1.bb:do_patch)
NOTE: recipe python3-urllib3-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1550 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1551 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.1.bb:do_populate_lic)
NOTE: recipe python3-urllib3-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-2.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-urllib3-2.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-urllib3-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1552 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.1.bb:do_configure)
NOTE: recipe python3-urllib3-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1553 of 1560 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.1.bb:do_compile)
NOTE: recipe python3-urllib3-2.0.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-urllib3/2.0.1-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-urllib3/2.0.1-r0/urllib3-2.0.1/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-urllib3/2.0.1-r0/temp/run.do_compile.3710150:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-urllib3/2.0.1-r0/temp/run.do_compile.3710150, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-urllib3/2.0.1-r0/temp/run.do_compile.3710150, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-urllib3/2.0.1-r0/temp/run.do_compile.3710150, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-urllib3/2.0.1-r0/temp/run.do_compile.3710150, line 184
NOTE: recipe python3-urllib3-2.0.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1553 tasks of which 1545 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.1.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-urllib3-2.0.1-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-urllib3-2.0.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-urllib3/2.0.1-r0/temp/run.do_compile.3710150', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-urllib3/2.0.1-r0/temp/log.do_compile.3710150
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_2.0.1.bb:do_compile) failed with exit code '1'

--===============1001485618281788658==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-1.26.15-2.0.1.patch"

RnJvbSAzM2Q2NTBhZDg5ZTYyM2UzYzRjMDdhNWI1ZmY2MmE1Nzc3Mzk5OWM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxMTo1NDo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJsbGliMzogdXBncmFkZSAxLjI2LjE1IC0+IDIuMC4xCgotLS0KIC4uLi97cHl0aG9u
My11cmxsaWIzXzEuMjYuMTUuYmIgPT4gcHl0aG9uMy11cmxsaWIzXzIuMC4xLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXJsbGliM18xLjI2LjE1LmJi
ID0+IHB5dGhvbjMtdXJsbGliM18yLjAuMS5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18xLjI2LjE1LmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMi4wLjEuYmIKc2ltaWxhcml0
eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXVybGxpYjNfMS4yNi4xNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXVybGxpYjNfMi4wLjEuYmIKaW5kZXggZDJkZTdjNGMwMi4uYzk3MTNjYWY4
OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxp
YjNfMS4yNi4xNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
dXJsbGliM18yLjAuMS5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRo
dWIuY29tL3NoYXpvdy91cmxsaWIzIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9YzI4MjNjYjk5NTQzOWM5ODRmZDYyYTk3M2Q3OTgx
NWMiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4YTM4ODcxN2I5NDc2ZjkzNGEyMTQ4NGU4Yzhl
NjE4NzVhYjYwNjQ0ZDI5YjliMzllMTFlNGI5ZGMxYzZiMzA1IgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjJjZTY2YTY4MTM0YmU0NjlmNWRmNWQ0NmQ3MjQyMzc0ODliM2NkODViMmJiYTIyMjNkYmJl
ZTE3NDY1NDg4MjYiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjM5LjIKCg==

--===============1001485618281788658==--

