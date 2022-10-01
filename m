Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F41C48BD2
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.480.1664643226945041462
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=g4J7AghK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101839477da1b-fc73ef16-4548-43dc-b3ad-68b22f7bcd6f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BsTUcxtza3MY9GawUetSo4eYSUQYLoRfRRNAfQ2XPic=;
	b=g4J7AghKdy/Cg2sCWIq4JN6KgPuwPhzd19b7ITYAa50/VZVF8Mp1mYFwI2bqHmVX
	CUv3k43cRFt2+8pT1oNUvAERQDPtIv9jvxX7zWVgGMYVjjmbYOoKYo2gElTntQrK7us
	mXiMVMunUHCH+c2JIgFuTzQPZJO/PY731nEc+d5E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BsTUcxtza3MY9GawUetSo4eYSUQYLoRfRRNAfQ2XPic=;
	b=MySIHs5PDG+y6I5U2Ska3d+aQDL1tzV9MSA6eScS2mlMxBOM3b68mILUjvmrKzmB
	ac3gI+Vww3OgxsS5O3L2+fuzwSILpJVqKEbgqehURK9zwZcnukRWH3QWmMXVN4ci/AY
	DXPUWa0SvVO33sPozn42H+J3HHpd7SVCuSy8BhzI=
Content-Type: multipart/mixed; boundary="===============2307807465352332033=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-bcrypt: upgrading to 4.0.0 FAILED
Message-ID: 
 <010101839477da1b-fc73ef16-4548-43dc-b3ad-68b22f7bcd6f-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171267

--===============2307807465352332033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-bcrypt* to *4.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-bcrypt-upgrade-3.2.2-4.0.0.patch
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
--===============2307807465352332033==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-bcrypt-upgrade-3.2.2-4.0.0.patch"

RnJvbSA1N2Q2OGE3OTEzZjJhMjgyZjRhZjE4Yzk4ZTE5NDM1MjY4YTI5MzUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwNzo0ODo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmNyeXB0OiB1cGdyYWRlIDMuMi4yIC0+IDQuMC4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtYmNyeXB0XzMuMi4yLmJiID0+IHB5dGhvbjMtYmNyeXB0XzQuMC4wLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtYmNyeXB0XzMuMi4yLmJiID0+IHB5
dGhvbjMtYmNyeXB0XzQuMC4wLmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1iY3J5cHRfMy4yLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNyeXB0XzQuMC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODcl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iY3J5cHRf
My4yLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1i
Y3J5cHRfNC4wLjAuYmIKaW5kZXggNTQwNzBlNGI5Yy4uYjAzMmE3YjljMSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJjcnlwdF8zLjIuMi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNyeXB0XzQuMC4wLmJiCkBA
IC01LDcgKzUsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3QvYmNyeXB0
LyIKIAogREVQRU5EUyArPSAiJHtQWVRIT05fUE59LWNmZmktbmF0aXZlIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiNDMzYzQxMGMyMTc3MDU3NzA1ZGEyYTlmMmNkMDFkZDE1NzQ5M2IyYTdhYzE0
Yzg1OTNhMTZiM2RhYjZiNmJmYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjNTljMTcwZmM5MjI1
ZmFhZDA0ZGRlMWJhNjFkODViNDEzOTQ2ZThjZTJlNWY1ZjVmZjMwZGZkNjcyODNmMzE5IgogCiBp
bmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBwdGVzdAogCi0tIAoyLjMx
LjEKCg==

--===============2307807465352332033==
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
meta-yocto-bsp       = "tmp-auh-upgrades:65459e0a95effbfb64c5fbd34604647d4d2d0f09"
workspace            = "master:5200799866b92259e855051112520006e1aaaac0"

Initialising tasks...done.
Sstate summary: Wanted 90 Local 83 Mirrors 0 Missed 7 Current 276 (92% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 883 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_fetch)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1365 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_unpack)
NOTE: Running task 1366 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1367 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_patch)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_patch: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1368 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1369 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_populate_lic)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_populate_lic: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1370 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1371 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1372 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| Missing build dependencies:
| - setuptools-rust
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.0-r0/temp/run.do_compile.3665055:158 exit 1 from 'nativepython3 -m picobuild --source /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.0-r0/bcrypt-4.0.0 --dest /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.0-r0/dist --wheel'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.0-r0/temp/run.do_compile.3665055, line 158
| 	#2: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.0-r0/temp/run.do_compile.3665055, line 153
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.0-r0/temp/run.do_compile.3665055, line 162
NOTE: recipe python3-bcrypt-4.0.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1372 tasks of which 1363 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-bcrypt-4.0.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.0-r0/temp/run.do_compile.3665055', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.0-r0/temp/log.do_compile.3665055
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_compile) failed with exit code '1'

--===============2307807465352332033==--

