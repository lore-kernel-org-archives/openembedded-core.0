Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416C3C64E67
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.24448.1665871392851934143
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WfdxHeY6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010183ddac347d-c189a997-89a6-4f24-8d6f-a316bb827427-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pi9lZQRuA5D6jEj2mo7Al6Mh7lu3zeOWlqADZSbPE6U=;
	b=WfdxHeY6WIMla4ztGaKAanb3CrFsQB6F3xkLw29waAhhHAmDa0a3eg5vQMm6g/Th
	bqxShF2MMqfDWc4Yz6xdgFtonuYQ0XOp7MOpPmYz/Vre0o5VnlLtCMwyqbQjUJrP1zh
	DB+MveivKvsr0F76buoxsCIQoYAudJTwZHGNVH00=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pi9lZQRuA5D6jEj2mo7Al6Mh7lu3zeOWlqADZSbPE6U=;
	b=BXynli3nXI+pHhDfHXuYJ75R0naCLMI7VP24IjpsmvI/deFZJ2KpAPVT1VskDbWS
	vY3HaGMR8qAibU+ROA6rbdtdi3GIYSIiDc0vg+OgNhnvU8jGFeYdgFRvCYPcHeHKzrX
	2wGL2E4Qu/FN90OTKMMt7ncK/v5kCLMPZ2bF8gXs=
Content-Type: multipart/mixed; boundary="===============2191759861296518979=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 5.2.3 FAILED
Message-ID: <01010183ddac347d-c189a997-89a6-4f24-8d6f-a316bb827427-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171797

--===============2191759861296518979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinx* to *5.2.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-5.1.1-5.2.3.patch
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
--===============2191759861296518979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:e258623cc46116304e96db5111d36886db21f9d7"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 109 Local 102 Mirrors 0 Missed 7 Current 331 (93% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1180 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.2.3.bb:do_fetch)
NOTE: recipe python3-sphinx-5.2.3-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-5.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1623 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.2.3.bb:do_unpack)
NOTE: Running task 1624 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-5.2.3-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-5.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinx-5.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1625 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.2.3.bb:do_patch)
NOTE: recipe python3-sphinx-5.2.3-r0: task do_patch: Started
NOTE: recipe python3-sphinx-5.2.3-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-5.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1626 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1627 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.2.3.bb:do_populate_lic)
NOTE: recipe python3-sphinx-5.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-5.2.3-r0: task do_populate_lic: Started
NOTE: recipe python3-sphinx-5.2.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-sphinx-5.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1628 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.2.3.bb:do_configure)
NOTE: recipe python3-sphinx-5.2.3-r0: task do_configure: Started
NOTE: recipe python3-sphinx-5.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1629 of 1636 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.2.3.bb:do_compile)
NOTE: recipe python3-sphinx-5.2.3-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinx/5.2.3-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinx/5.2.3-r0/Sphinx-5.2.3/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinx/5.2.3-r0/temp/run.do_compile.1632546:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinx/5.2.3-r0/temp/run.do_compile.1632546, line 174
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinx/5.2.3-r0/temp/run.do_compile.1632546, line 164
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinx/5.2.3-r0/temp/run.do_compile.1632546, line 153
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinx/5.2.3-r0/temp/run.do_compile.1632546, line 178
NOTE: recipe python3-sphinx-5.2.3-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1629 tasks of which 1621 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.2.3.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-sphinx-5.2.3-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-sphinx-5.2.3-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinx/5.2.3-r0/temp/run.do_compile.1632546', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinx/5.2.3-r0/temp/log.do_compile.1632546
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinx_5.2.3.bb:do_compile) failed with exit code '1'

--===============2191759861296518979==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-5.1.1-5.2.3.patch"

RnJvbSA2MDNkYmU2NTBhZGJiYmUwYmMyNDM0ZDQxMGI5MWFkYTdlOTRlNzMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTE6MDc6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueDogdXBncmFkZSA1LjEuMSAtPiA1LjIuMwoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXNwaGlueF81LjEuMS5iYiA9PiBweXRob24zLXNwaGlueF81LjIuMy5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNwaGlueF81LjEuMS5iYiA9PiBw
eXRob24zLXNwaGlueF81LjIuMy5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzUuMS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF81LjIuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkx
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54
XzUuMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c3BoaW54XzUuMi4zLmJiCmluZGV4IDFiZWYyMGMyZTIuLmRmYjEzZTEwZDMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfNS4xLjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF81LjIuMy5iYgpA
QCAtNiw3ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NzJj
NTM2ZTc4YzIxYzU2NzMxMWIxOTNmZTAwY2QyNTMiCiAKIFBZUElfUEFDS0FHRSA9ICJTcGhpbngi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiYTMyMjRhNGUyMDZlMWZiZGVjZjk4YTRmYWU0OTky
ZWY5YjI0Yjg1ZWJmN2I1ODRiYjM0MDE1NmVhZjA4ZDg5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjViMTBjYjEwMjJkYWM4YzAzNWY3NTc2Nzc5OWMzOTIxN2EwNWZjMGZlMmQ2ZmU1NTk3NTYwZDM4
ZTQ0ZjAzNjMiCiAKIGluaGVyaXQgc2V0dXB0b29sczMgcHlwaQogCi0tIAoyLjMxLjEKCg==

--===============2191759861296518979==--

