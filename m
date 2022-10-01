Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899AEC3A589
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:54:14 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web09.347.1664643227316354873
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QyqXOlTE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101839477dc36-a128f016-68b9-4bb1-98f3-a75e899cde4f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KrDtHaoNIj+n0AjdnAD56FvFDjW9u1EK5TZ8j/JnyDE=;
	b=QyqXOlTEbeugVVbbhASPjZB6i/W9vd/n+f+gNuzBvL9lIjlJKSazI3ATU2fslGtP
	Agw/fzS+5cUzxfTw5ue3n6c6VFcR24n3wy7PSIjEYOT4eIFWAdTcZ+bN7Ainf64oXeX
	ZqqDEQCDOTuOgpIljT5QvAdvG67Ez6kRx4hb+ozo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KrDtHaoNIj+n0AjdnAD56FvFDjW9u1EK5TZ8j/JnyDE=;
	b=PtbdmgXGtAg23SxP4BV1KEDdw3r/6leW3L2QRbw6aoSO/eWJya5CdT9gquAs1uEm
	Rmk4sH+IWJKUllhlUSA+2NrMVMlR6bo8JzP97H/uUhuzsC+fILtAj1RG+Z/s2vCWbFa
	E9pKd0R/cAwkDGz9AWzqU+/tbpcoc1JFkPZ0hCnQ=
Content-Type: multipart/mixed; boundary="===============9049862487715150920=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.16.0 FAILED
Message-ID: 
 <010101839477dc36-a128f016-68b9-4bb1-98f3-a75e899cde4f-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:54:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171277

--===============9049862487715150920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonschema* to *4.16.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.9.1-4.16.0.patch
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
--===============9049862487715150920==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.9.1-4.16.0.patch"

RnJvbSA0NTMyOTg1YWQwOTJiMDA3ZmQ3MWRhZTIxNGRmMGRhODJhNDIwNmIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwODoyNToxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtanNvbnNjaGVtYTogdXBncmFkZSA0LjkuMSAtPiA0LjE2LjAKCi0tLQogLi4ucHl0aG9u
My1qc29uc2NoZW1hXzQuOS4xLmJiID0+IHB5dGhvbjMtanNvbnNjaGVtYV80LjE2LjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1qc29uc2NoZW1hXzQuOS4x
LmJiID0+IHB5dGhvbjMtanNvbnNjaGVtYV80LjE2LjAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC45LjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjE2LjAu
YmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC45LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMTYuMC5iYgppbmRleCAxMjVi
YzZiNGQ1Li45NTZlZGI3ZTY3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjkuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjE2LjAuYmIKQEAgLTQsNyArNCw3IEBAIExJ
Q0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9N2E2
MGE4MWMxNDZlYzI1NTk5YTNlMWRhYmI4NjEwYTggXAogICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vanNvbi9MSUNFTlNFO21kNT05ZDRkZTQzMTExZDMzNTcwYzhmZTQ5YjRjYjBlMDFhZiIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjQwOGM0YzhlZDBkZWRlM2IyNjhmN2E0NDE3ODRmNzQyMDYz
ODBiMDRmOTNlYjJkNTM3YzdiZWZiM2RmMzA5OWYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTY1
MDU5ZjA3NmVmZjY5NzFiYWU1Yjc0MmZjMDI5YTdiNGVmM2Y5YmNmMDRjMTRlNDc3NmE3NjA1ZGUx
NGIyMyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi4zMS4xCgo=

--===============9049862487715150920==
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
meta-yocto-bsp       = "tmp-auh-upgrades:a848589a23af2f834aadbcda0f961333c832a5d7"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 99 Local 92 Mirrors 0 Missed 7 Current 272 (92% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1072 of 1401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb:do_fetch)
NOTE: recipe python3-jsonschema-4.16.0-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1388 of 1401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb:do_unpack)
NOTE: Running task 1389 of 1401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonschema-4.16.0-r0: task do_unpack: Started
NOTE: recipe python3-jsonschema-4.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonschema-4.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1390 of 1401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb:do_patch)
NOTE: recipe python3-jsonschema-4.16.0-r0: task do_patch: Started
NOTE: recipe python3-jsonschema-4.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1391 of 1401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1392 of 1401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb:do_populate_lic)
NOTE: recipe python3-jsonschema-4.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.16.0-r0: task do_populate_lic: Started
NOTE: recipe python3-jsonschema-4.16.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-jsonschema-4.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1393 of 1401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb:do_configure)
NOTE: recipe python3-jsonschema-4.16.0-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.16.0-r0: task do_configure: Succeeded
NOTE: Running task 1394 of 1401 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb:do_compile)
NOTE: recipe python3-jsonschema-4.16.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| Missing build dependencies:
| - hatch-fancy-pypi-readme
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/run.do_compile.4148586:158 exit 1 from 'nativepython3 -m picobuild --source /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/jsonschema-4.16.0 --dest /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/dist --wheel'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/run.do_compile.4148586, line 158
| 	#2: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/run.do_compile.4148586, line 153
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/run.do_compile.4148586, line 162
NOTE: recipe python3-jsonschema-4.16.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1394 tasks of which 1386 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-jsonschema-4.16.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/run.do_compile.4148586', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/log.do_compile.4148586
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb:do_compile) failed with exit code '1'

--===============9049862487715150920==--

