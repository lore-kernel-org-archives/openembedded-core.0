Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9ADC6FD22
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:57 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.12569.1662040786328138915
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gUzYwKxv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010182f959c1ff-f345b704-ef62-4898-8f30-36ce4e1a24b1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jJyGWKgldeUCCGM/Qpbo1Aq+ZhM5s9SwzuCTrDUi2k4=;
	b=gUzYwKxvflFQjsXr/lA5sgV82p+kD+Ev4kYEFw2Q/W6g2HYkfegXFazOvGmF1fqO
	EQtX7quIb7ZO/hE2nIx3uo8SNqyl3YXqF9Hq3197vbHM2mEFTl1qGYDLG19Dj3GGmnL
	dkK+dulm/CNtFINcp0NMt4gXWrdZNkEE+ew7bBcg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jJyGWKgldeUCCGM/Qpbo1Aq+ZhM5s9SwzuCTrDUi2k4=;
	b=Dt26he92USrgvqMS9/vckVGW7Tk7cI7JgDXjeMfJgOMJvHaD3oNMePJ7SQpFaee7
	0fo3bG/LMWx1HT3uGWctB5KfqsntrhhNa+hu+zj/L6UtH0O2PdGFkezv0DhB+yKMzi8
	JpWlG9O7u9kycVMu5KePgARmS9wD/9j3/6txzqEk=
Content-Type: multipart/mixed; boundary="===============2351647130621595000=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.15.0 FAILED
Message-ID: 
 <01010182f959c1ff-f345b704-ef62-4898-8f30-36ce4e1a24b1-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:45 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170174

--===============2351647130621595000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonschema* to *4.15.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.9.1-4.15.0.patch
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
--===============2351647130621595000==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.9.1-4.15.0.patch"

RnJvbSBlZTk2NDUxZTk2MDI4ZjZhMjFhOTE1YThiZDQ0Y2VmNzhlMWFjMjY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwNzoxMjoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtanNvbnNjaGVtYTogdXBncmFkZSA0LjkuMSAtPiA0LjE1LjAKCi0tLQogLi4ucHl0aG9u
My1qc29uc2NoZW1hXzQuOS4xLmJiID0+IHB5dGhvbjMtanNvbnNjaGVtYV80LjE1LjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1qc29uc2NoZW1hXzQuOS4x
LmJiID0+IHB5dGhvbjMtanNvbnNjaGVtYV80LjE1LjAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC45LjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjE1LjAu
YmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC45LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMTUuMC5iYgppbmRleCAxMjVi
YzZiNGQ1Li5mMmUwNTg5MDE2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjkuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjE1LjAuYmIKQEAgLTQsNyArNCw3IEBAIExJ
Q0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9N2E2
MGE4MWMxNDZlYzI1NTk5YTNlMWRhYmI4NjEwYTggXAogICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vanNvbi9MSUNFTlNFO21kNT05ZDRkZTQzMTExZDMzNTcwYzhmZTQ5YjRjYjBlMDFhZiIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjQwOGM0YzhlZDBkZWRlM2IyNjhmN2E0NDE3ODRmNzQyMDYz
ODBiMDRmOTNlYjJkNTM3YzdiZWZiM2RmMzA5OWYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjFm
NDk3OTM5MWJkY2ViMDQ0ZTUwMmZkOGU3OWU3MzhjMGNkZmJkYzg3NzNmOWE0OWI1NzY5NDYxZTgy
ZmUxZSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi4zMS4xCgo=

--===============2351647130621595000==
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
DISTRO_VERSION       = "4.1+snapshot-c0e5ac3792ca064e8b4e4cf3ad64f6e50a6ddef9"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c0e5ac3792ca064e8b4e4cf3ad64f6e50a6ddef9"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 97 Local 90 Mirrors 0 Missed 7 Current 274 (92% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1072 of 1401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.15.0.bb:do_fetch)
NOTE: recipe python3-jsonschema-4.15.0-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 1388 of 1401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.15.0.bb:do_unpack)
NOTE: Running task 1389 of 1401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonschema-4.15.0-r0: task do_unpack: Started
NOTE: recipe python3-jsonschema-4.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1390 of 1401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.15.0.bb:do_patch)
NOTE: recipe python3-jsonschema-4.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonschema-4.15.0-r0: task do_patch: Started
NOTE: recipe python3-jsonschema-4.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1391 of 1401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.15.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1392 of 1401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.15.0.bb:do_populate_lic)
NOTE: recipe python3-jsonschema-4.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.15.0-r0: task do_populate_lic: Started
NOTE: recipe python3-jsonschema-4.15.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-jsonschema-4.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1393 of 1401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.15.0.bb:do_configure)
NOTE: recipe python3-jsonschema-4.15.0-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.15.0-r0: task do_configure: Succeeded
NOTE: Running task 1394 of 1401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.15.0.bb:do_compile)
NOTE: recipe python3-jsonschema-4.15.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| Missing build dependencies:
| - hatch-fancy-pypi-readme
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.15.0-r0/temp/run.do_compile.3837741:158 exit 1 from 'nativepython3 -m picobuild --source /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.15.0-r0/jsonschema-4.15.0 --dest /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.15.0-r0/dist --wheel'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.15.0-r0/temp/run.do_compile.3837741, line 158
| 	#2: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.15.0-r0/temp/run.do_compile.3837741, line 153
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.15.0-r0/temp/run.do_compile.3837741, line 162
NOTE: recipe python3-jsonschema-4.15.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1394 tasks of which 1386 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.15.0.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-jsonschema-4.15.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.15.0-r0/temp/run.do_compile.3837741', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.15.0-r0/temp/log.do_compile.3837741
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.15.0.bb:do_compile) failed with exit code '1'

--===============2351647130621595000==--

