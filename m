Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59357C88C98
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.13529.1681581685953243876
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NBiSZgi4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018786143900-aef758b8-f388-480c-a9ed-2e406f7e6efa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CPfsc0OFT7DeH4qw4ViylFIG7rm8vGSpCJise3VfPg4=;
	b=NBiSZgi4eJhl46jqLoSOFfbDid3fDSwZdOAnFwmq1CWu8G56NZYhiDDElXDPZYvn
	ssMssBnpI24cRyxcnT8pet4nmTubsOsrkL5kIMHqvXyxrCBXlYnwxXasdmNq7a7vLyX
	yHCNT5iHbcYmOwxd139V9GzNugwMq490liVSHeQY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CPfsc0OFT7DeH4qw4ViylFIG7rm8vGSpCJise3VfPg4=;
	b=lv90BL80v8ecKlF4jWdRfYvErN6Ds7C6Ya6ejnyB2YS47bjB01aotNPJsH+vroYl
	6FGsr9mqPbeyiej7zQkQnJq81RrwIGjdpnE1dXzN4+X/rIAGPEhlaM38UyhQv7mehe7
	Nv5YK3WS3gGlf4/RiLnk6AtOFHmjfQ+eaLEYVAYQ=
Content-Type: multipart/mixed; boundary="===============6390083551139709100=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ghostscript: upgrading to 10.01.1 FAILED
Message-ID: <0101018786143900-aef758b8-f388-480c-a9ed-2e406f7e6efa-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180056

--===============6390083551139709100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ghostscript* to *10.01.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ghostscript-upgrade-10.0.0-10.01.1.patch
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
--===============6390083551139709100==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ghostscript-upgrade-10.0.0-10.01.1.patch"

RnJvbSBjNDFjMzRkN2Q2MGE3OWFiNTljYTYwYjAxMmQ3M2E0NGZkNGU5M2Y5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTE6MjU6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aG9zdHNjcmlwdDogdXBncmFkZSAxMC4wLjAgLT4gMTAuMDEuMQoKLS0tCiAuLi4ve2dob3N0c2Ny
aXB0XzEwLjAuMC5iYiA9PiBnaG9zdHNjcmlwdF8xMC4wMS4xLmJifSAgICAgICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQve2dob3N0c2NyaXB0XzEwLjAuMC5iYiA9
PiBnaG9zdHNjcmlwdF8xMC4wMS4xLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdF8xMC4wLjAuYmIgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHRfMTAuMDEuMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQv
Z2hvc3RzY3JpcHRfMTAuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hv
c3RzY3JpcHQvZ2hvc3RzY3JpcHRfMTAuMDEuMS5iYgppbmRleCA1NmE5MzYzMmUyLi5iNGZhOWEx
OTlhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3Rz
Y3JpcHRfMTAuMC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9n
aG9zdHNjcmlwdF8xMC4wMS4xLmJiCkBAIC00NSw3ICs0NSw3IEBAIFNSQ19VUkk6Y2xhc3MtbmF0
aXZlID0gIiR7U1JDX1VSSV9CQVNFfSBcCiAgICAgICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
YmFzZS1nZW5odC5jLWFkZC1hLXByZXByb2Nlc3Nvci1kZWZpbmUtdG8tYWxsb3ctZm9wZS5wYXRj
aCBcCiAgICAgICAgICAgICAgICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJh
NTc3NjRkNzBjYWY4NWUyZmMwYjBmNTliODNiOTJlMjU3NzU2MzE3MTRkY2RiOTdjYzZlMGNlYTQx
NGJiNWEzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRkZjE4YTgwOGNkNDM2OWYyNWUwMmRiY2Vj
MmYxMzNjYjZkNjc0NjI3YjJjNmIxNTAyMDIwZTU4ZDQzZTMyY2UiCiAKICMgUHV0IHNvbWV0aGlu
ZyBsaWtlCiAjCi0tIAoyLjM5LjIKCg==

--===============6390083551139709100==
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
meta-yocto-bsp       = "tmp-auh-upgrades:16f7e89ca9ae7479df6708365e0560c5d3d9fdd9"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 139 Local 130 Mirrors 0 Missed 9 Current 335 (93% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1608 of 1701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_fetch)
NOTE: Running task 1609 of 1701 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_fetch)
NOTE: recipe ghostscript-10.01.1-r0: task do_fetch: Started
NOTE: recipe ghostscript-native-10.01.1-r0: task do_fetch: Started
NOTE: recipe ghostscript-10.01.1-r0: task do_fetch: Succeeded
NOTE: Running task 1680 of 1701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_unpack)
NOTE: recipe ghostscript-native-10.01.1-r0: task do_fetch: Succeeded
NOTE: Running task 1681 of 1701 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_unpack)
NOTE: Running task 1682 of 1701 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ghostscript-10.01.1-r0: task do_unpack: Started
NOTE: recipe ghostscript-native-10.01.1-r0: task do_unpack: Started
NOTE: recipe ghostscript-native-10.01.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ghostscript-native-10.01.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ghostscript-10.01.1-r0: task do_unpack: Succeeded
NOTE: Running task 1683 of 1701 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_patch)
NOTE: recipe ghostscript-10.01.1-r0: task do_patch: Started
NOTE: recipe ghostscript-10.01.1-r0: task do_patch: Failed
NOTE: recipe ghostscript-native-10.01.1-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1683 tasks of which 1677 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: ghostscript-10.01.1-r0 do_patch: Applying patch 'cross-compile.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ghostscript/10.01.1-r0/ghostscript-10.01.1'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ghostscript/10.01.1-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch cross-compile.patch
patching file configure.ac
Hunk #1 FAILED at 138.
Hunk #2 FAILED at 2530.
2 out of 2 hunks FAILED -- rejects in file configure.ac
Patch cross-compile.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ghostscript/10.01.1-r0/temp/log.do_patch.690222
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_patch) failed with exit code '1'

--===============6390083551139709100==--

