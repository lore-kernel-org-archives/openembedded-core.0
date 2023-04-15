Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666AEC88CB3
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.13527.1681581685774317346
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZmffyofE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101878614391b-bfd24ad7-f570-4b64-9c22-8d0d7dcbd4e1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FtIUfruWtBfDPjrzU3vhVMlAv4ObXDOZkJwLD3REp0A=;
	b=ZmffyofEeO7IK5Igm9QjmV/ia/5r6vY4PJlfZbOPxPy/xLvNc9kf3SzLXc5i43Fs
	cO8wgCt+Hqkv+tXiO99Adl5QdwjFfyjO4V8c6N+et6oyY2/n/ejzzu1gQOWooc45qxa
	X6Tv4+yzEh1yv3eDDEB3vq14iKse4QRu+Oe9onhg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FtIUfruWtBfDPjrzU3vhVMlAv4ObXDOZkJwLD3REp0A=;
	b=bNHkLpMm63zrIKzDvCxUpEZrn2CxAi4rdxeHVT8Cwv/xBKNADkiMHsKeaLK4YXNG
	936PNnx8k1Lem/NshfM9XOUyGfR54g8X8qSwzLy0KeIlnVC+I29IAX+woQuBUxXnfMI
	f+ac5gMtHT0QD2/gm78h4/z843pI7x7R1vzBB0ow=
Content-Type: multipart/mixed; boundary="===============8371332034060652558=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-webcolors: upgrading to 1.13 FAILED
Message-ID: <010101878614391b-bfd24ad7-f570-4b64-9c22-8d0d7dcbd4e1-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180053

--===============8371332034060652558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-webcolors* to *1.13* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-webcolors-upgrade-1.12-1.13.patch
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
--===============8371332034060652558==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-webcolors-upgrade-1.12-1.13.patch"

RnJvbSA3YjhhMTk3NjUzOGQ0MDhhMWU5ODc5OTRlNjY2ZWU1MTM5MDJjMzM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTA6MzU6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdlYmNvbG9yczogdXBncmFkZSAxLjEyIC0+IDEuMTMKCi0tLQogLi4ubG9yc18xLjEy
LmJiID0+IHB5dGhvbjMtd2ViY29sb3JzXzEuMTMuYmJ9IHwgMjMgKysrKysrKysrKysrKysrKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13ZWJjb2xvcnNfMS4xMi5i
YiA9PiBweXRob24zLXdlYmNvbG9yc18xLjEzLmJifSAoNDIlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMS4xMi5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMS4xMy5iYgpzaW1pbGFy
aXR5IGluZGV4IDQyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtd2ViY29sb3JzXzEuMTIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMS4xMy5iYgppbmRleCAwMmY2YzlmZWQ4Li5mNjM5Mjdl
ZWM1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2Vi
Y29sb3JzXzEuMTIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXdlYmNvbG9yc18xLjEzLmJiCkBAIC0xLDkgKzEsMjggQEAKKyMgRklYTUU6IHRoZSBMSUNfRklM
RVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4K
KyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRo
ZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlm
IG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3Nh
Z2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0
ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0t
LSBMSUNFTlNFCisjICsrKyBMSUNFTlNFCisjIEBAIC0xLDQgKzEsNCBAQAorIyAtQ29weXJpZ2h0
IChjKSAyMDA4LTIwMjIsIEphbWVzIEJlbm5ldHQKKyMgK0NvcHlyaWdodCAoYykgMjAwOCwgSmFt
ZXMgQmVubmV0dAorIyAgQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgIAorIyAgUmVkaXN0cmlidXRp
b24gYW5kIHVzZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0Cisj
IAorIworCiBTVU1NQVJZID0gIlNpbXBsZSBQeXRob24gbW9kdWxlIGZvciB3b3JraW5nIHdpdGgg
SFRNTC9DU1MgY29sb3IgZGVmaW5pdGlvbnMuIgogSE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9y
Zy9wcm9qZWN0L3dlYmNvbG9ycy8iCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSIKLUxJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWJjZjczNzQ3OGQyZmE4YWY1YmM5NTQyMzFk
ZjA1NmM2IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NzAyYjFlZjEy
Y2Y2NjgzMmE4OGYyNGM4ZjJlZTljMTkiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxNmQwNDNk
M2EwOGZkNmExYjFiN2UzZTllNjI2NDBkMDk3OTBkY2U4MGQyYmRkNDc5MmExNzViMzVmZTc5NGE5
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImMyMjViNjc0YzgzZmE5MjNiZTkzZDIzNTMzMGNlMDMw
MDM3M2QwMjg4NWNlZjIzMjM4ODEzYjBkNTY2ODMwNGEiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRv
b2xzMyBwdGVzdAogCi0tIAoyLjM5LjIKCg==

--===============8371332034060652558==
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
meta-yocto-bsp       = "tmp-auh-upgrades:ffccf5cae61a652b173dff77554135b89e9716dc"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 126 Local 119 Mirrors 0 Missed 7 Current 263 (94% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 912 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_fetch)
NOTE: recipe python3-webcolors-1.13-r0: task do_fetch: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_fetch: Succeeded
NOTE: Running task 1462 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_unpack)
NOTE: Running task 1463 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-webcolors-1.13-r0: task do_unpack: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_unpack: Succeeded
NOTE: Running task 1464 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_patch)
NOTE: recipe python3-webcolors-1.13-r0: task do_patch: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_patch: Succeeded
NOTE: Running task 1465 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1466 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_populate_lic)
NOTE: recipe python3-webcolors-1.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_populate_lic: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1467 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_configure)
NOTE: recipe python3-webcolors-1.13-r0: task do_configure: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_configure: Succeeded
NOTE: Running task 1468 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_configure_ptest_base)
NOTE: recipe python3-webcolors-1.13-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1469 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_compile)
NOTE: recipe python3-webcolors-1.13-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/webcolors-1.13/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/temp/run.do_compile.1154058:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/temp/run.do_compile.1154058, line 180
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/temp/run.do_compile.1154058, line 170
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/temp/run.do_compile.1154058, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/temp/run.do_compile.1154058, line 184
NOTE: recipe python3-webcolors-1.13-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1469 tasks of which 1460 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-webcolors-1.13-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-webcolors-1.13-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/temp/run.do_compile.1154058', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-webcolors/1.13-r0/temp/log.do_compile.1154058
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_compile) failed with exit code '1'

--===============8371332034060652558==--

