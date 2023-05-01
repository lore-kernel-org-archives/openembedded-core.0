Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604F7C88CB5
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:52 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.107430.1682976350710893712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WHRVNCI1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010187d9351df3-462df7d8-8584-4659-94fc-7e8f1cf0b547-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cinE82rjOTE31Zq8oX2TK/Hk53Jl1S9iqV5wZW4iuGU=;
	b=WHRVNCI1d/rDtaqmAbdjA+t2XQtIk35AZsgrQxKvOdIX3xObYJmOuer0fSno0O82
	QgPdti/Idz7j1I7vlSxq4sVePPAloTTJCDYVy+g5qPuaFCD646a2x0uA3nflUhPDjjS
	rhsSBtSZ5UlxskoGTXY1UKviaWa1XDnuy1TI4SuU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cinE82rjOTE31Zq8oX2TK/Hk53Jl1S9iqV5wZW4iuGU=;
	b=GXe+OIwn7pT0f3kMEW4NZbCg2ct12yS05gXAL2Ov90qpQwAdey93it7O4SXP0fg9
	z4ZvRU8R78QMR5UainmiAe2TXIJnnlXcYqeF8pOu34o7wJtVHEparaq/7cLdBX+41JQ
	xE+au9XxPlS4LEfmuV5GIr27+yQVWeEYtl/ePsuI=
Content-Type: multipart/mixed; boundary="===============1774269318127815702=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-attrs: upgrading to 23.1.0 FAILED
Message-ID: <01010187d9351df3-462df7d8-8584-4659-94fc-7e8f1cf0b547-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180623

--===============1774269318127815702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-attrs* to *23.1.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-attrs-upgrade-22.2.0-23.1.0.patch
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
--===============1774269318127815702==
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
meta-yocto-bsp       = "tmp-auh-upgrades:e0a65d4874e2a9bd2c473a84a78fca9982d5ec47"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 85 Local 78 Mirrors 0 Missed 7 Current 224 (91% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 925 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_fetch)
NOTE: recipe python3-attrs-23.1.0-r0: task do_fetch: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1153 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_unpack)
NOTE: Running task 1154 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-23.1.0-r0: task do_unpack: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1155 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_patch)
NOTE: recipe python3-attrs-23.1.0-r0: task do_patch: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1156 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1157 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_populate_lic)
NOTE: recipe python3-attrs-23.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_populate_lic: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1158 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_configure)
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1159 of 1166 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_compile)
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-attrs/23.1.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pyproject_hooks/_impl.py", line 321, in _call_hook
|     raise BackendUnavailable(data.get('traceback', ''))
| pyproject_hooks._impl.BackendUnavailable: Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-attrs/23.1.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pyproject_hooks/_in_process/_in_process.py", line 77, in _build_backend
|     obj = import_module(mod_path)
|           ^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-attrs/23.1.0-r0/recipe-sysroot-native/usr/lib/python3.11/importlib/__init__.py", line 126, in import_module
|     return _bootstrap._gcd_import(name[level:], package, level)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "<frozen importlib._bootstrap>", line 1206, in _gcd_import
|   File "<frozen importlib._bootstrap>", line 1178, in _find_and_load
|   File "<frozen importlib._bootstrap>", line 1128, in _find_and_load_unlocked
|   File "<frozen importlib._bootstrap>", line 241, in _call_with_frames_removed
|   File "<frozen importlib._bootstrap>", line 1206, in _gcd_import
|   File "<frozen importlib._bootstrap>", line 1178, in _find_and_load
|   File "<frozen importlib._bootstrap>", line 1142, in _find_and_load_unlocked
| ModuleNotFoundError: No module named 'hatchling'
| 
| ERROR Backend 'hatchling.build' is not available.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-attrs/23.1.0-r0/temp/run.do_compile.372584:157 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-attrs/23.1.0-r0/dist /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-attrs/23.1.0-r0/attrs-23.1.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-attrs/23.1.0-r0/temp/run.do_compile.372584, line 157
| 	#2: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-attrs/23.1.0-r0/temp/run.do_compile.372584, line 152
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-attrs/23.1.0-r0/temp/run.do_compile.372584, line 168
NOTE: recipe python3-attrs-23.1.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1159 tasks of which 1151 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-attrs-23.1.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-attrs/23.1.0-r0/temp/run.do_compile.372584', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-attrs/23.1.0-r0/temp/log.do_compile.372584
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_compile) failed with exit code '1'

--===============1774269318127815702==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-attrs-upgrade-22.2.0-23.1.0.patch"

RnJvbSAwNzg3MmI1MmE4YjE1NWU0OTFkM2Y3ZWJjYzI4MDEwMThjZTFkOTEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAwOToyOTowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYXR0cnM6IHVwZ3JhZGUgMjIuMi4wIC0+IDIzLjEuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLWF0dHJzXzIyLjIuMC5iYiA9PiBweXRob24zLWF0dHJzXzIzLjEuMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWF0dHJzXzIyLjIuMC5iYiA9PiBw
eXRob24zLWF0dHJzXzIzLjEuMC5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXR0cnNfMjIuMi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJzXzIzLjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgy
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXR0cnNf
MjIuMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
YXR0cnNfMjMuMS4wLmJiCmluZGV4IDhjMWZmMzMwZTcuLmFjNDdkMTBhZmQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hdHRyc18yMi4yLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJzXzIzLjEuMC5iYgpA
QCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5hdHRycy5vcmcvIgogTElDRU5T
RSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT01ZTU1NzMx
ODI0Y2Y5MjA1Y2ZhYmVhYjlhMDYwMDg4NyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImM5MjI3
YmZjMmYwMTk5M2MwM2Y2OGRiMzdkMWQxNWM5NjkwMTg4MzIzYzA2N2M2NDFmMWEzNWNhNTgxODVm
OTkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjI3OTgzNmQ1ODE1MTNhMjZmMWJmMjM1ZjlhY2Qz
MzNiYzkxMTU2ODNmMTRmN2U4ZmFlNDZjOThmYzUwZTAxNSIKIAogaW5oZXJpdCBweXBpIHB5dGhv
bl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotLSAKMi4zOS4yCgo=

--===============1774269318127815702==--

