Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C353C6FD23
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:57 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web12.12462.1662040785423948987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RutbqG1k;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 01010182f959c2a4-7aad4703-c559-4ebc-b7b9-392829644d09-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vVCegWs7an/gHGd1XztpTYdsPvKn9R92cRc2LG8JLC8=;
	b=RutbqG1k14+09DoDLJHKc2eRcNS+0NxMszpem6IhDyu/ydfOtfeMwCIG1TvO4o8K
	0dF7re+HKqofAHiIuK8NbvV+dEMo9ctTK3f6R/OZaOUzTe7BAUB7VUh03cNoEokYf+G
	p0hkIBK82wG5ps8bCNUdFnYyEiOxYUDhLoLb986Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vVCegWs7an/gHGd1XztpTYdsPvKn9R92cRc2LG8JLC8=;
	b=ir+AJdUKLru9wr67/ZoT3kqqbTbpJK40dLW2wMkOGJR28a6ws+YX8XL/yiKJaPKe
	y35nJDhlVSenBHAY7U2Zxo7Y8crSg6ViPnzkPK5L6xWRYJVhVN3IAa4Oto0thMkqTst
	5z3xHDmgeANawx6+h3Xd+3rQgVBGRK7TrnWAKlVk=
Content-Type: multipart/mixed; boundary="===============8003593663337403777=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pathspec: upgrading to 0.10.0 FAILED
Message-ID: 
 <01010182f959c2a4-7aad4703-c559-4ebc-b7b9-392829644d09-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:45 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170172

--===============8003593663337403777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pathspec* to *0.10.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pathspec-upgrade-0.9.0-0.10.0.patch
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
--===============8003593663337403777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1658 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-41c86931ebed322d4d57b5163e172ff1d137562a"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:41c86931ebed322d4d57b5163e172ff1d137562a"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 86 Local 79 Mirrors 0 Missed 7 Current 206 (91% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 918 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathspec_0.10.0.bb:do_fetch)
NOTE: recipe python3-pathspec-0.10.0-r0: task do_fetch: Started
NOTE: recipe python3-pathspec-0.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 1097 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathspec_0.10.0.bb:do_unpack)
NOTE: Running task 1098 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathspec_0.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pathspec-0.10.0-r0: task do_unpack: Started
NOTE: recipe python3-pathspec-0.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathspec-0.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 1099 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathspec_0.10.0.bb:do_patch)
NOTE: recipe python3-pathspec-0.10.0-r0: task do_patch: Started
NOTE: recipe python3-pathspec-0.10.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pathspec-0.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1100 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathspec_0.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1101 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathspec_0.10.0.bb:do_populate_lic)
NOTE: recipe python3-pathspec-0.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pathspec-0.10.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pathspec-0.10.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pathspec-0.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1102 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathspec_0.10.0.bb:do_configure)
NOTE: recipe python3-pathspec-0.10.0-r0: task do_configure: Started
NOTE: recipe python3-pathspec-0.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1103 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathspec_0.10.0.bb:do_compile)
NOTE: recipe python3-pathspec-0.10.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pathspec/0.10.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pathspec/0.10.0-r0/pathspec-0.10.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pathspec/0.10.0-r0/temp/run.do_compile.3880034:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pathspec/0.10.0-r0/temp/run.do_compile.3880034, line 174
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pathspec/0.10.0-r0/temp/run.do_compile.3880034, line 164
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pathspec/0.10.0-r0/temp/run.do_compile.3880034, line 153
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pathspec/0.10.0-r0/temp/run.do_compile.3880034, line 178
NOTE: recipe python3-pathspec-0.10.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1103 tasks of which 1095 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathspec_0.10.0.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-pathspec-0.10.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-pathspec-0.10.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pathspec/0.10.0-r0/temp/run.do_compile.3880034', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pathspec/0.10.0-r0/temp/log.do_compile.3880034
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathspec_0.10.0.bb:do_compile) failed with exit code '1'

--===============8003593663337403777==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pathspec-upgrade-0.9.0-0.10.0.patch"

RnJvbSBhMGMzODJkZDYxMjE4NTQwZTM4NzM5Yjc4YjFlZjUyNDE3YTE4OGI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwNzoxNjoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGF0aHNwZWM6IHVwZ3JhZGUgMC45LjAgLT4gMC4xMC4wCgotLS0KIC4uLi97cHl0aG9u
My1wYXRoc3BlY18wLjkuMC5iYiA9PiBweXRob24zLXBhdGhzcGVjXzAuMTAuMC5iYn0gICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGF0aHNwZWNfMC45LjAuYmIg
PT4gcHl0aG9uMy1wYXRoc3BlY18wLjEwLjAuYmJ9ICg3OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhdGhzcGVjXzAuOS4wLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhdGhzcGVjXzAuMTAuMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDc4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtcGF0aHNwZWNfMC45LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wYXRoc3BlY18wLjEwLjAuYmIKaW5kZXggNjQxZjFjZmQ4Ny4uZjMzMWNm
NWExYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBh
dGhzcGVjXzAuOS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1wYXRoc3BlY18wLjEwLjAuYmIKQEAgLTQsNyArNCw3IEBAIFNFQ1RJT04gPSAiZGV2ZWwvcHl0
aG9uIgogTElDRU5TRSA9ICJNUEwtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRTttZDU9ODE1Y2E1OTljOWRmMjQ3YTBjN2Y2MTliYWIxMjNkYWQiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJlNTY0NDk5NDM1YTI2NzNkNTg2ZjZiMjEzMGJiNWI5NWYwNGEzYmEwNmY4MWI4
Zjg5NWI2NTFhM2M3NmFhYmIxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAxZWVjZDMwNGJhMGU2
ZWVlZDE4OGFlNWZhNTY4ZTk5ZWYxMDI2NWFmN2ZkOWFiNzM3ZDY0MTJiNGVlMGFiODUiCiAKIGlu
aGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjMxLjEKCg==

--===============8003593663337403777==--

