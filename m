Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BACCA9EB7
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.3769.1684186748262228448
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EaNnKpbH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188215a5314-c110e663-a843-4e66-91a9-731985ce78d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Qdw0baH5norBK+lzjbMDkWaSV2ZhtAEC/ImkTr2c2js=;
	b=EaNnKpbHDs6JO4WjmQQIYgx75QFcEn4859usg8AnM86nzUiyGS7JlY12G6wW+5mE
	+UjWsYUqf3lZulBQ+Xl76pCGogQzBOkkfrjAiQae6TInD378m8NYLOttT2eJNkzlKwG
	ox2NagMs2KU2d2DCfA+bMvDlTwkt+VTiJ/RQuFzo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Qdw0baH5norBK+lzjbMDkWaSV2ZhtAEC/ImkTr2c2js=;
	b=fsAnUs2Ol+EB+GDOkxorhvRTMHzJryJs5MFMAHYJ8bo0SoP1F16WaTr3wnL4WW6l
	C9Daxvx4Br5115ria58uVIY1dHn+1n0dzTQII/7PopJUXarpEtndO4Shv1Zc5hu5Bog
	fVKqpyYJJYsHsJ5gYfcqm2tugaHs0ZAhWlblr4dM=
Content-Type: multipart/mixed; boundary="===============3291661816459116932=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygments: upgrading to 2.15.1 FAILED
Message-ID: <01010188215a5314-c110e663-a843-4e66-91a9-731985ce78d0-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181316

--===============3291661816459116932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pygments* to *2.15.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pygments-upgrade-2.14.0-2.15.1.patch
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
--===============3291661816459116932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (899 cached, 1 parsed). 1803 targets, 40 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:6a46a29a982f7f32f1c0346fa0c01b9c637a2e1e"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 98 Local 91 Mirrors 0 Missed 7 Current 225 (92% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 984 of 1227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_fetch)
NOTE: recipe python3-pygments-2.15.1-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_fetch: Succeeded
NOTE: Running task 1214 of 1227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_unpack)
NOTE: Running task 1215 of 1227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.15.1-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 1216 of 1227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_patch)
NOTE: recipe python3-pygments-2.15.1-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_patch: Succeeded
NOTE: Running task 1217 of 1227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1218 of 1227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_populate_lic)
NOTE: recipe python3-pygments-2.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.15.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_populate_lic: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pygments-2.15.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1219 of 1227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_configure)
NOTE: recipe python3-pygments-2.15.1-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.15.1-r0: task do_configure: Succeeded
NOTE: Running task 1220 of 1227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_compile)
NOTE: recipe python3-pygments-2.15.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/Pygments-2.15.1/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/temp/run.do_compile.1611558:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/temp/run.do_compile.1611558, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/temp/run.do_compile.1611558, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/temp/run.do_compile.1611558, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/temp/run.do_compile.1611558, line 184
NOTE: recipe python3-pygments-2.15.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1220 tasks of which 1212 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-pygments-2.15.1-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-pygments-2.15.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/temp/run.do_compile.1611558', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.1-r0/temp/log.do_compile.1611558
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.1.bb:do_compile) failed with exit code '1'

--===============3291661816459116932==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygments-upgrade-2.14.0-2.15.1.patch"

RnJvbSBhNGY3MWY3MDdiZDM1MTZlYjE5OGNlMTZlOGM5YTU5MGYzMzA5ZWNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTI6MTM6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Z21lbnRzOiB1cGdyYWRlIDIuMTQuMCAtPiAyLjE1LjEKCi0tLQogLi4uL3tweXRo
b24zLXB5Z21lbnRzXzIuMTQuMC5iYiA9PiBweXRob24zLXB5Z21lbnRzXzIuMTUuMS5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWdtZW50c18yLjE0LjAu
YmIgPT4gcHl0aG9uMy1weWdtZW50c18yLjE1LjEuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIuMTQuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdtZW50c18yLjE1LjEuYmIKc2lt
aWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5Z21lbnRzXzIuMTQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIuMTUuMS5iYgppbmRleCAxNjc2OWU5MjYzLi5j
YzZlN2I0Y2ZlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHlnbWVudHNfMi4xNC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weWdtZW50c18yLjE1LjEuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiQlNE
LTItQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzZhMTNj
OTA1MTRlMjg5OWYxZWJhN2Y0MWMzZWU1OTIiCiAKIGluaGVyaXQgc2V0dXB0b29sczMKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJiM2VkMDZhOWU4YWM5YTlhYWU1YTZmNWRiZTc4YThhNTg2NTVkMTdi
NDNiOTNjMDc4ZjA5NGRkYzQ3NmFlMjk3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhhY2U0ZDNj
MWRkNDgxODk0YjIwMDVmNTYwZWFkMGY5ZjE5ZWU2NGZlOTgzMzY2YmUxYTIxZTE3MWQxMjc3NWMi
CiAKIERFUEVORFMgKz0gIlwKICAgICAgICAgICAgICR7UFlUSE9OX1BOfSBcCi0tIAoyLjM5LjIK
Cg==

--===============3291661816459116932==--

