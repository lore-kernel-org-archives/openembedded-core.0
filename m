Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67860C6FD24
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.10529.1663251513894332075
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XAEjixkP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101834183fe4a-64599cbc-c8bc-4095-ace7-2f9e62b71aad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8Z9SwS2tY710QAmwf/AKCg0AgjQ5JLXFsIb2kSxPOac=;
	b=XAEjixkPQf1lDRwmV2kO+GC98OU6Xn4sUYIVHgjowvjkQmwf5cVu+ZFj5SQWZ+3c
	5dvU9vT1xFSLmwQiynbNJhgi8A4fXymy55N1SG3RX6mVMuL71I9X7zVZnQGm3s4sNmN
	XUaVWNGTUfzdAzzaM0/cPVmDQXtePebcvg+/DTdA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8Z9SwS2tY710QAmwf/AKCg0AgjQ5JLXFsIb2kSxPOac=;
	b=Qi2pfOCSfCXO9PCBTxfqJzn9rfHViKt5bI3+LTrmkZ9nYFpIKKqekXJhB8TLFm54
	5xYfDfSBIr7M92hMl7/1tweXlPSzjH0gzK/Z4ktNy5rmQ1QJUlK877R2hG2IhTiZgXq
	fWQ2neCPGCkuegKcnJ2pnG8tcf0hKIzWIyQgXDvM=
Content-Type: multipart/mixed; boundary="===============4997265907210488786=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.16.0 FAILED
Message-ID: 
 <010101834183fe4a-64599cbc-c8bc-4095-ace7-2f9e62b71aad-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:32 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170736

--===============4997265907210488786==
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
--===============4997265907210488786==
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
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-9ac1f2c4a89e54b99cc241bcee47bb1e1a9b4df9"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9ac1f2c4a89e54b99cc241bcee47bb1e1a9b4df9"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 100 Local 93 Mirrors 0 Missed 7 Current 271 (93% match, 98% complete)
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/run.do_compile.471669:158 exit 1 from 'nativepython3 -m picobuild --source /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/jsonschema-4.16.0 --dest /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/dist --wheel'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/run.do_compile.471669, line 158
| 	#2: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/run.do_compile.471669, line 153
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/run.do_compile.471669, line 162
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
ERROR: python3-jsonschema-4.16.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/run.do_compile.471669', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.16.0-r0/temp/log.do_compile.471669
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.16.0.bb:do_compile) failed with exit code '1'

--===============4997265907210488786==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.9.1-4.16.0.patch"

RnJvbSAzZGM1OTQ2NDM1NWQyNjliY2NlYjdiYTczOTVkYzA4MTY4MDY1MDdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMDk6NTk6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
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

--===============4997265907210488786==--

