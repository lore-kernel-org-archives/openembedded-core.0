Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8069AC64EAE
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web09.24562.1665871394034943595
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=A0e+nfw/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010183ddac334b-a4322f44-2c7e-4451-9de0-f0e1d105d315-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=E2ZeDI80+PuxsQeOTuUCfMkMDWKrMR3ROcH6xKYNN14=;
	b=A0e+nfw/NaQeKvB2X3Pj0p62+4NOl0HMzqyce47FCkJ/rTb8fq1JaTjZg715+0RU
	ppzr0094JrPUIxSJe2oHL14UwcQhhyyJMkYuuPwREFs0zPi+es0trrrn3cjvmaew4dE
	lq2AZbH0kpr8HrEqrQgVkdJ6VXJWka46f+NlZbzQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=E2ZeDI80+PuxsQeOTuUCfMkMDWKrMR3ROcH6xKYNN14=;
	b=GMDiQD5dQf/lsR91aodxnfsVeYquypzYiWalaatVjX1Ihwl4KGL77EBvuUGw5SYT
	PUPUsZ4AcP0DAzTWSvvjvHjXs6EFiuQEid52mWbX4AAktBeGxSrCYJbRAWhpNg1vh5c
	z5rKJUBS6MjXW5SMoIqLiie8shM96fYc4KFL3TFM=
Content-Type: multipart/mixed; boundary="===============6291610622122375506=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.16.0 FAILED
Message-ID: <01010183ddac334b-a4322f44-2c7e-4451-9de0-f0e1d105d315-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171783

--===============6291610622122375506==
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
--===============6291610622122375506==
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
meta-yocto-bsp       = "tmp-auh-upgrades:f1b79f56e535a3bcd6a0fe01e94d5eb32cfe10dd"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 105 Local 98 Mirrors 0 Missed 7 Current 266 (93% match, 98% complete)
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/run.do_compile.1380397:158 exit 1 from 'nativepython3 -m picobuild --source /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/jsonschema-4.16.0 --dest /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/dist --wheel'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/run.do_compile.1380397, line 158
| 	#2: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/run.do_compile.1380397, line 153
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/run.do_compile.1380397, line 162
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
ERROR: python3-jsonschema-4.16.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/run.do_compile.1380397', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/log.do_compile.1380397
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb:do_compile) failed with exit code '1'

--===============6291610622122375506==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.9.1-4.16.0.patch"

RnJvbSA4NGY5YTdhMzM0NmM2ZjhjYjkwZjZlZmE0YTkzY2JlYjQyMzA5NDFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTA6MjM6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWpzb25zY2hlbWE6IHVwZ3JhZGUgNC45LjEgLT4gNC4xNi4wCgotLS0KIC4uLnB5dGhv
bjMtanNvbnNjaGVtYV80LjkuMS5iYiA9PiBweXRob24zLWpzb25zY2hlbWFfNC4xNi4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtanNvbnNjaGVtYV80Ljku
MS5iYiA9PiBweXRob24zLWpzb25zY2hlbWFfNC4xNi4wLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuOS4xLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4xNi4w
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuOS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjE2LjAuYmIKaW5kZXggMTI1
YmM2YjRkNS4uOTU2ZWRiN2U2NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC45LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4xNi4wLmJiCkBAIC00LDcgKzQsNyBAQCBM
SUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTdh
NjBhODFjMTQ2ZWMyNTU5OWEzZTFkYWJiODYxMGE4IFwKICAgICAgICAgICAgICAgICAgICAgZmls
ZTovL2pzb24vTElDRU5TRTttZDU9OWQ0ZGU0MzExMWQzMzU3MGM4ZmU0OWI0Y2IwZTAxYWYiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0MDhjNGM4ZWQwZGVkZTNiMjY4ZjdhNDQxNzg0Zjc0MjA2
MzgwYjA0ZjkzZWIyZDUzN2M3YmVmYjNkZjMwOTlmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE2
NTA1OWYwNzZlZmY2OTcxYmFlNWI3NDJmYzAyOWE3YjRlZjNmOWJjZjA0YzE0ZTQ3NzZhNzYwNWRl
MTRiMjMiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLS0gCjIuMzEuMQoK

--===============6291610622122375506==--

