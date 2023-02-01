Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B51C7EE20
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.30000.1675272853928444061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jsNJlAcs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101860e0b1c9f-a2b0c5a9-0c45-438d-88db-865cef4475ba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/KKcfO5Sx00jGdfz4WoX9RyXDRgtiSWLH8u/rkb68Zc=;
	b=jsNJlAcsmlpmFyJA9wH6vW7/75/C5nkLNUOgi7SIu61Ygy0/7MqdvfbdDhrlAR5I
	orQPK6M4BzRHQ6K7+ADhsMYdURKCdgmvr45XpuOWx93xRBfUWc0hqfqy02hhHEq7S1z
	RqTX/5HVW8+0D+L4ttUGl9w6cAE7vNcAscQcD38k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/KKcfO5Sx00jGdfz4WoX9RyXDRgtiSWLH8u/rkb68Zc=;
	b=da9sqHuK4TzdRYws5ztYGk62d33r5eeos7JE5hYN6pR9JxHYNxEeXqsToXusKD74
	aStLyRcuz9ZSBmJmrDzu3ZJUCt8YHfy2Aq+Fx105YMNYDHLld5GVKv6Gr57fx9sLfQJ
	oPEIh3sS5MnO383nC7XmDs2t+ti2qk5AtDyZR4hk=
Content-Type: multipart/mixed; boundary="===============7462685324179226336=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-iniconfig: upgrading to 2.0.0 FAILED
Message-ID: <010101860e0b1c9f-a2b0c5a9-0c45-438d-88db-865cef4475ba-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176588

--===============7462685324179226336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-iniconfig* to *2.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-iniconfig-upgrade-1.1.1-2.0.0.patch
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
--===============7462685324179226336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1697 targets, 41 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:5f9fd4c17b46b42ee2c51a0f1e50d797cf7fa2dd"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 81 Mirrors 0 Missed 7 Current 219 (92% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 958 of 1174 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_fetch)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1161 of 1174 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_unpack)
NOTE: Running task 1162 of 1174 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1163 of 1174 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_patch)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1164 of 1174 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1165 of 1174 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_populate_lic)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_populate_lic: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1166 of 1174 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1167 of 1174 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pyproject_hooks/_impl.py", line 321, in _call_hook
|     raise BackendUnavailable(data.get('traceback', ''))
| pyproject_hooks._impl.BackendUnavailable: Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pyproject_hooks/_in_process/_in_process.py", line 77, in _build_backend
|     obj = import_module(mod_path)
|           ^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/importlib/__init__.py", line 126, in import_module
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-iniconfig/2.0.0-r0/temp/run.do_compile.3724687:157 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-iniconfig/2.0.0-r0/dist /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-iniconfig/2.0.0-r0/iniconfig-2.0.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-iniconfig/2.0.0-r0/temp/run.do_compile.3724687, line 157
| 	#2: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-iniconfig/2.0.0-r0/temp/run.do_compile.3724687, line 152
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-iniconfig/2.0.0-r0/temp/run.do_compile.3724687, line 168
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1167 tasks of which 1159 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-iniconfig-2.0.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-iniconfig/2.0.0-r0/temp/run.do_compile.3724687', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-iniconfig/2.0.0-r0/temp/log.do_compile.3724687
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile) failed with exit code '1'

--===============7462685324179226336==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-iniconfig-upgrade-1.1.1-2.0.0.patch"

RnJvbSBjMmI3MWE1MDUwZmI3ZjAzYmQ5MGRlNjIyYjI2ODBlMzAzNGM3YjE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMToyNToxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaW5pY29uZmlnOiB1cGdyYWRlIDEuMS4xIC0+IDIuMC4wCgotLS0KIC4uLi97cHl0aG9u
My1pbmljb25maWdfMS4xLjEuYmIgPT4gcHl0aG9uMy1pbmljb25maWdfMi4wLjAuYmJ9IHwgMyAr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWluaWNvbmZpZ18xLjEuMS5i
YiA9PiBweXRob24zLWluaWNvbmZpZ18yLjAuMC5iYn0gKDY2JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaW5pY29uZmlnXzEuMS4xLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWluaWNvbmZpZ18yLjAuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDY2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtaW5pY29uZmlnXzEuMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtaW5pY29uZmlnXzIuMC4wLmJiCmluZGV4IDQ2NDM0MzdiODAuLmVm
NWZiNDJjMTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1pbmljb25maWdfMS4xLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWluaWNvbmZpZ18yLjAuMC5iYgpAQCAtNCw4ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0
cHM6Ly9weXBpLm9yZy9wcm9qZWN0L2luaWNvbmZpZy8iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWE2YmIwMzIwYjA0YTBhNTAzZjEyZjY5
ZmVhNDc5ZGU5IgogCi1TUkNfVVJJW21kNXN1bV0gPSAiMGI3ZjNiZTg3NDgxMjExYzE4M2VhZTA5
NWJjZWE2ZjEiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmMzYWYwNTFkN2QxNGIyZWU1ZWY5OTY5
NjY2ZGVmMGNkMWEwMDBlMTIxZWFlYTU4MGQ0YTMxM2RmNGIzN2YzMiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIyZDkxZTEzNWJmNzJkMzFhNDEwYjE3YzE2ZGE2MTBhODJjYjU1ZjZiMDQ3N2QxYTkw
MjEzNGIyNGE0NTViOGIzIgogCiBERVBFTkRTICs9ICJweXRob24zLXNldHVwdG9vbHMtc2NtLW5h
dGl2ZSIKIAotLSAKMi4zNy4zCgo=

--===============7462685324179226336==--

