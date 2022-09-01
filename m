Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9576CC6FD21
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:57 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.12568.1662040786313161843
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=F8tb3j6X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010182f959c1f0-af10ae0f-0792-4f48-8fc4-5d5176454206-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0Sdo0f/Lm111MgAkkChkD5CJdvPfdy/778KnW9MRVhE=;
	b=F8tb3j6XwPNWn96eicdV2EZN2Kp65FR1e1vCTHFWd6Fdcx+QmYWUyicIefE5Z/I2
	mRSBNf294fb10Bjoh9Y+RkOhOTBguS6yW95P8ijZd4vggckE73sOm9tRiUlq3Qv/2ss
	oqS+/AP61ZbbM0oZ4e9z1vVWLRot5CDSdqRyLQSo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0Sdo0f/Lm111MgAkkChkD5CJdvPfdy/778KnW9MRVhE=;
	b=cWqcCf3ZGxIXQ+KUr11pt57RZzNtveLc2fKKYay7cS20S9BOvOijhRozaOp+w5PD
	jwgwxTmKxO27Wy7sTVQYEYIMgfmb/U5GytsxCLE1TefMqbCU7h3xRQlNwNT5MzCAHYZ
	oOYVeJZ/i+Ps6Icl4kIr0CuJrx76x8Cwbod4AjdU=
Content-Type: multipart/mixed; boundary="===============7588258742912878632=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-bcrypt: upgrading to 4.0.0 FAILED
Message-ID: 
 <01010182f959c1f0-af10ae0f-0792-4f48-8fc4-5d5176454206-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:45 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170173

--===============7588258742912878632==
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
--===============7588258742912878632==
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
DISTRO_VERSION       = "4.1+snapshot-3423989f241e485492c510e8ff3305a23fac87d8"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3423989f241e485492c510e8ff3305a23fac87d8"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 45 Local 38 Mirrors 0 Missed 7 Current 321 (84% match, 98% complete)
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.0-r0/temp/run.do_compile.2075171:158 exit 1 from 'nativepython3 -m picobuild --source /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.0-r0/bcrypt-4.0.0 --dest /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.0-r0/dist --wheel'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.0-r0/temp/run.do_compile.2075171, line 158
| 	#2: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.0-r0/temp/run.do_compile.2075171, line 153
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.0-r0/temp/run.do_compile.2075171, line 162
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
ERROR: python3-bcrypt-4.0.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.0-r0/temp/run.do_compile.2075171', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-bcrypt/4.0.0-r0/temp/log.do_compile.2075171
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb:do_compile) failed with exit code '1'

--===============7588258742912878632==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-bcrypt-upgrade-3.2.2-4.0.0.patch"

RnJvbSA1ZTkzMDEzZTU0MzY2NDVjM2U4OTY5ZTJmMjVhN2IyOWQ3MjVlMTZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwNjo0Mjo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
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

--===============7588258742912878632==--

