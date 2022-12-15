Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111BFC71159
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.144489.1671136350181511172
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dTYzyVmA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010185177d1215-fea2701a-f986-4b99-a4f3-5490bb61de38-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WEEam+S6T1wqg7wxMUncNIIaqsAO0qsOoio1MfBKvis=;
	b=dTYzyVmAtRV7lyfOf5zJGYBbJI9fBUGBBhNaHDQxoEM+xmn9c0fPfXqqiqwo9RBj
	jtGg1+7CgMgggTZViPPmPajLHw62dnM4oswVJLUhdJ2DHBydXoVpu+9jXHCcu+UYbUx
	iyMZeI8+Rrp2QDEEyIkHhu51vlka7LZzbJ+hgKo8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WEEam+S6T1wqg7wxMUncNIIaqsAO0qsOoio1MfBKvis=;
	b=F2SnF8o6bWlauIMeQIxIGQmihF65vViC7g68o1iabB6SHk7Ac9Nm9VZ2EgCzi9Yw
	YbXEg2fmuMMDWgDYjFcjUGQbr581hFbe/p6p73pOqQ88ANigrYN6s1qsbfbRjD0SMof
	o6hLJm1vDb2OkXZ8cfqdIkfHJ0AYwBkA7Z6Pviks=
Content-Type: multipart/mixed; boundary="===============0516421440416188449=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-chardet: upgrading to 5.1.0 FAILED
Message-ID: <01010185177d1215-fea2701a-f986-4b99-a4f3-5490bb61de38-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174633

--===============0516421440416188449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-chardet* to *5.1.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-chardet-upgrade-5.0.0-5.1.0.patch
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
--===============0516421440416188449==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-chardet-upgrade-5.0.0-5.1.0.patch"

RnJvbSBkNzM1NmJkNWVmMDk5ODY5NDE0YWI0MzM0M2MxZDk5MjczYjYyYzk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTA6MDE6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNoYXJkZXQ6IHVwZ3JhZGUgNS4wLjAgLT4gNS4xLjAKCi0tLQogLi4uL3tweXRob24z
LWNoYXJkZXRfNS4wLjAuYmIgPT4gcHl0aG9uMy1jaGFyZGV0XzUuMS4wLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jaGFyZGV0XzUuMC4wLmJiID0+
IHB5dGhvbjMtY2hhcmRldF81LjEuMC5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2hhcmRldF81LjAuMC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jaGFyZGV0XzUuMS4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1j
aGFyZGV0XzUuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtY2hhcmRldF81LjEuMC5iYgppbmRleCA4MGJhZWQ3OTg2Li4wMTM5MTc1YjQ5IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2hhcmRldF81LjAu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2hhcmRldF81
LjEuMC5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9q
ZWN0L2NoYXJkZXQvIgogTElDRU5TRSA9ICJMR1BMLTIuMS1vbmx5IgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIwMzY4ZGYyYmZkNzhiNWZjMjA1NzJiYjRlOWJiN2Zi
NTNlMmMwOTRmNjBhZTk5OTMzMzllODY3MWQwYWZiOGFhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjBkNjI3MTJiOTU2YmMxNTRmODVmYjBhMjY2ZTJhM2M1OTEzYzI5NjdlMDAzNDg3MDFiMzI0MTFk
NmRlZjMxZTUiCiAKICMgc2V0dXAucHkgb2YgY2hhcmRldCBuZWVkcyB0aGlzLgogREVQRU5EUyAr
PSAiJHtQWVRIT05fUE59LXB5dGVzdC1ydW5uZXItbmF0aXZlIgotLSAKMi4zNy4zCgo=

--===============0516421440416188449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1672 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1672 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c7405cb3aae892ac73a455f8bc83fb11f2af7fc1"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 86 Local 79 Mirrors 0 Missed 7 Current 223 (91% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 970 of 1183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_fetch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1170 of 1183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_unpack)
NOTE: Running task 1171 of 1183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1172 of 1183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_patch)
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1173 of 1183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1174 of 1183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_populate_lic)
NOTE: recipe python3-chardet-5.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_populate_lic: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-chardet-5.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1175 of 1183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_configure)
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Started
NOTE: recipe python3-chardet-5.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1176 of 1183 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile)
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-chardet/5.1.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-chardet/5.1.0-r0/chardet-5.1.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-chardet/5.1.0-r0/temp/run.do_compile.567405:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-chardet/5.1.0-r0/temp/run.do_compile.567405, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-chardet/5.1.0-r0/temp/run.do_compile.567405, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-chardet/5.1.0-r0/temp/run.do_compile.567405, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-chardet/5.1.0-r0/temp/run.do_compile.567405, line 184
NOTE: recipe python3-chardet-5.1.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1176 tasks of which 1168 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-chardet-5.1.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-chardet-5.1.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-chardet/5.1.0-r0/temp/run.do_compile.567405', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-chardet/5.1.0-r0/temp/log.do_compile.567405
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-chardet_5.1.0.bb:do_compile) failed with exit code '1'

--===============0516421440416188449==--

