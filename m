Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D9FC77B6F
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.30014.1675272856393680297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HyhD4gP8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101860e0b2071-41d47d41-7dcb-4e36-b40a-77f43de3f9cd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jZ9bFVsv5XoNb7aXR4JkHCztrhek5C1MjzPqicGwVGM=;
	b=HyhD4gP8+WXRPdOv50bgxwWotyWvCPiUJTOTwIDuHhALC/z3MyFaeuM+q+Sdzopx
	p3y2B2OcCpSJISnt/1ZcxjvW+hfZZEtZB+cUMhlcEvrjPgKx52Ioln3pYKlIiA+Rkz0
	VUxq16rwTMWO8VQxPhXye9W5VLBEpp0svMWJwNbc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272855;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jZ9bFVsv5XoNb7aXR4JkHCztrhek5C1MjzPqicGwVGM=;
	b=cwQYb/lw2y9wlQ4o8FJ72l9ZSxUKRnUjNyNlzKiM3+yURpmDbG99Y/Ca9gcXjnbw
	FOrgEOYpdPizUjUpAzgCTAa/58OQNT2NDVXKhBXIwhmAu/iI8nmjG3RBzVXu648oOsc
	nbYLW1jXheCZUYtcKRVcXIFb+x4ybkk1rzWPNuHU=
Content-Type: multipart/mixed; boundary="===============9032183117310856535=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-htmlhelp: upgrading to 2.0.1 FAILED
Message-ID: <010101860e0b2071-41d47d41-7dcb-4e36-b40a-77f43de3f9cd-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176607

--===============9032183117310856535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinxcontrib-htmlhelp* to *2.0.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-sphinxcontrib-htmlhelp-upgrade-2.0.0-2.0.1.patch
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
--===============9032183117310856535==
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
meta-yocto-bsp       = "tmp-auh-upgrades:9f9d8f1ea4d843581862609ca0ae3458530a7d1a"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 89 Local 82 Mirrors 0 Missed 7 Current 208 (92% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 937 of 1129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_fetch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1116 of 1129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_unpack)
NOTE: Running task 1117 of 1129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1118 of 1129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1119 of 1129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1120 of 1129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_populate_lic)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_populate_lic: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1121 of 1129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1122 of 1129 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinxcontrib-htmlhelp/2.0.1-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinxcontrib-htmlhelp/2.0.1-r0/sphinxcontrib-htmlhelp-2.0.1/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinxcontrib-htmlhelp/2.0.1-r0/temp/run.do_compile.2300:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinxcontrib-htmlhelp/2.0.1-r0/temp/run.do_compile.2300, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinxcontrib-htmlhelp/2.0.1-r0/temp/run.do_compile.2300, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinxcontrib-htmlhelp/2.0.1-r0/temp/run.do_compile.2300, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinxcontrib-htmlhelp/2.0.1-r0/temp/run.do_compile.2300, line 184
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1122 tasks of which 1114 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-sphinxcontrib-htmlhelp-2.0.1-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-sphinxcontrib-htmlhelp-2.0.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinxcontrib-htmlhelp/2.0.1-r0/temp/run.do_compile.2300', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-sphinxcontrib-htmlhelp/2.0.1-r0/temp/log.do_compile.2300
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.1.bb:do_compile) failed with exit code '1'

--===============9032183117310856535==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinxcontrib-htmlhelp-upgrade-2.0.0-2.0.1.patch"

RnJvbSA1MWZiZjU0MWM2YTM3ZjRlMWNjZDJiMDhkODUwN2M5YzJiNGZmMjVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMzowMzoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BoaW54Y29udHJpYi1odG1saGVscDogdXBncmFkZSAyLjAuMCAtPiAyLjAuMQoKLS0t
CiAuLi50bWxoZWxwXzIuMC4wLmJiID0+IHB5dGhvbjMtc3BoaW54Y29udHJpYi1odG1saGVscF8y
LjAuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNwaGlu
eGNvbnRyaWItaHRtbGhlbHBfMi4wLjAuYmIgPT4gcHl0aG9uMy1zcGhpbnhjb250cmliLWh0bWxo
ZWxwXzIuMC4xLmJifSAoNzklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1zcGhpbnhjb250cmliLWh0bWxoZWxwXzIuMC4wLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueGNvbnRyaWItaHRtbGhlbHBfMi4wLjEu
YmIKc2ltaWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXNwaGlueGNvbnRyaWItaHRtbGhlbHBfMi4wLjAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhjb250cmliLWh0bWxo
ZWxwXzIuMC4xLmJiCmluZGV4IGNkOGI5ODdlMGMuLjY0MGViNzExYjMgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhjb250cmliLWh0bWxoZWxw
XzIuMC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhp
bnhjb250cmliLWh0bWxoZWxwXzIuMC4xLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJo
dHRwczovL3d3dy5zcGhpbngtZG9jLm9yZyIKIExJQ0VOU0UgPSAiQlNELTItQ2xhdXNlIgogTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MjRkY2U1ZWY2YTEzNTYzMjQxYzI0
YmMzNjZmNDg4ODYiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmNWY4YmIyZDBkNjI5ZjM5OGJm
NDdkMGQ2OWMwN2JjMTNiNjVmNzVhODFhZDllMmY3MWE2M2Q0YjdhMmY2ZGIyIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjBjYmRkMzAyODE1MzMwMDU4NDIyYjk4YTExMzE5NWM5MjQ5ODI1ZDY4MWUx
OGYxMWU4YjFmNzhhMmYxMWVmZmYiCiAKIFBZUElfUEFDS0FHRSA9ICJzcGhpbnhjb250cmliLWh0
bWxoZWxwIgogCi0tIAoyLjM3LjMKCg==

--===============9032183117310856535==--

