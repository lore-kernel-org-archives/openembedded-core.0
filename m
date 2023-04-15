Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8147DC88CB7
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.13528.1681581685778936649
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MYcvVICw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101878614387e-926ab98f-2154-4e8f-b6da-a77b597e9709-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YL2EUnqDEi5yLdStYmHljlQwO+C3nn2q89CJ1LLO/tg=;
	b=MYcvVICwDJBm3jCcj2vgGkXzvV9HGLDh1QZGNvpc2HwFDjBAucE6yPj5aBtbqw7l
	zRVEdPl7LTEo2orMLUJcjxfuqhDMJwiZ7+36lWxjn9kPRYwI0Z/jVATlx/10ppElJZ9
	G1l1OBPmjrlajmuA8ckqLhtTLfptI2yaaNWBl5FM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YL2EUnqDEi5yLdStYmHljlQwO+C3nn2q89CJ1LLO/tg=;
	b=PG52ndtmYNuMqQA4iGQbLDu+AT8HXKbWEfFpsyh+5oKpWbx9xtq6m2TM1oRVKe5f
	JV67okILkASeDp4fpM1//k8Cy2YET3wU5iG3kD7LH5qyFxd4MJY9H8olbL1ALU4FEs8
	1iZGHfkhYnkBb/8xzYnvywozKeox1qw1ij3c9eQE=
Content-Type: multipart/mixed; boundary="===============0168981085952823469=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygments: upgrading to 2.15.0 FAILED
Message-ID: <010101878614387e-926ab98f-2154-4e8f-b6da-a77b597e9709-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180050

--===============0168981085952823469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pygments* to *2.15.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-pygments-upgrade-2.14.0-2.15.0.patch
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
--===============0168981085952823469==
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
meta-yocto-bsp       = "tmp-auh-upgrades:346a48ac4b90e1ea46e32e0a6d1da652aa695c25"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 95 Local 88 Mirrors 0 Missed 7 Current 214 (92% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 925 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.0.bb:do_fetch)
NOTE: recipe python3-pygments-2.15.0-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 1153 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.0.bb:do_unpack)
NOTE: Running task 1154 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.15.0-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1155 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.0.bb:do_patch)
NOTE: recipe python3-pygments-2.15.0-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1156 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1157 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.0.bb:do_populate_lic)
NOTE: recipe python3-pygments-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.15.0-r0: task do_populate_lic: Started
NOTE: recipe python3-pygments-2.15.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pygments-2.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1158 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.0.bb:do_configure)
NOTE: recipe python3-pygments-2.15.0-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1159 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.0.bb:do_compile)
NOTE: recipe python3-pygments-2.15.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.0-r0/Pygments-2.15.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.0-r0/temp/run.do_compile.1081910:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.0-r0/temp/run.do_compile.1081910, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.0-r0/temp/run.do_compile.1081910, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.0-r0/temp/run.do_compile.1081910, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.0-r0/temp/run.do_compile.1081910, line 184
NOTE: recipe python3-pygments-2.15.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1159 tasks of which 1151 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-pygments-2.15.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-pygments-2.15.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.0-r0/temp/run.do_compile.1081910', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-pygments/2.15.0-r0/temp/log.do_compile.1081910
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.15.0.bb:do_compile) failed with exit code '1'

--===============0168981085952823469==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygments-upgrade-2.14.0-2.15.0.patch"

RnJvbSAyN2Q4ZmQ2YzgxZDVlMDAyNTkzNWJlZTMwMWUzZTMzM2IzYjk3YTlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTA6MzE6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Z21lbnRzOiB1cGdyYWRlIDIuMTQuMCAtPiAyLjE1LjAKCi0tLQogLi4uL3tweXRo
b24zLXB5Z21lbnRzXzIuMTQuMC5iYiA9PiBweXRob24zLXB5Z21lbnRzXzIuMTUuMC5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWdtZW50c18yLjE0LjAu
YmIgPT4gcHl0aG9uMy1weWdtZW50c18yLjE1LjAuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIuMTQuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdtZW50c18yLjE1LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5Z21lbnRzXzIuMTQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIuMTUuMC5iYgppbmRleCAxNjc2OWU5MjYzLi4y
MjNiMzkyNjZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcHlnbWVudHNfMi4xNC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1weWdtZW50c18yLjE1LjAuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiQlNE
LTItQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzZhMTNj
OTA1MTRlMjg5OWYxZWJhN2Y0MWMzZWU1OTIiCiAKIGluaGVyaXQgc2V0dXB0b29sczMKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJiM2VkMDZhOWU4YWM5YTlhYWU1YTZmNWRiZTc4YThhNTg2NTVkMTdi
NDNiOTNjMDc4ZjA5NGRkYzQ3NmFlMjk3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY3ZTM2Y2Zm
YzRjNTE3ZmJjMjUyODYxYjlhNmU0NjQ0Y2EwZTVhYmFkZjlhMTEzYzcyZDEzNThhZDA5Yjk1MDAi
CiAKIERFUEVORFMgKz0gIlwKICAgICAgICAgICAgICR7UFlUSE9OX1BOfSBcCi0tIAoyLjM5LjIK
Cg==

--===============0168981085952823469==--

