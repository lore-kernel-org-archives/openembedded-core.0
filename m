Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39DCC88CBD
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.3699.1684186745541162252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PBnCBUEQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010188215a5756-56169d43-327e-44ab-a318-e58ba3c74723-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mamxvo6I4AnwsJYd5Teb5al7B8FaYkSpj31XWtFnsC4=;
	b=PBnCBUEQUAUPB23OKgIPr2TqiCPqgx+eXBhtfCmOIo5J5V+jtmC8KkuyUU2MO8D+
	yBys6Dg6IrYBwoHpf7OhJvDoVPWCZOcLHqt4PxaaJsiGWQoE4oQFWLPl/y+IlbdN4B1
	GCpwAFZ6ffyWTKgCyv/jf5vrEPgut9TFxucJBZoA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mamxvo6I4AnwsJYd5Teb5al7B8FaYkSpj31XWtFnsC4=;
	b=TUh6lN6umpqbw7lSAoqa/gr1r6aSZHzrCgqpw7WP2fT+d10BMVTNKAUpVFPzmvEx
	IhOLjbTpVejnIrd0HsuUHvc0jt5NJEM7QtU4SD1hHvG6Pxagaptj/RgWyhAngo4QfGD
	3rJtn0CHEZk14UtG6P8L7y9WAVRQ8/V19uLOnCXQ=
Content-Type: multipart/mixed; boundary="===============0835371373091421838=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ghostscript: upgrading to 10.01.1 FAILED
Message-ID: <01010188215a5756-56169d43-327e-44ab-a318-e58ba3c74723-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181338

--===============0835371373091421838==
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
--===============0835371373091421838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (899 cached, 1 parsed). 1803 targets, 40 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:27ce4f6a7deaa4a5edec313750a01ebad30f782b"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 141 Local 132 Mirrors 0 Missed 9 Current 335 (93% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1617 of 1710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_fetch)
NOTE: Running task 1618 of 1710 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_fetch)
NOTE: recipe ghostscript-10.01.1-r0: task do_fetch: Started
NOTE: recipe ghostscript-native-10.01.1-r0: task do_fetch: Started
NOTE: recipe ghostscript-10.01.1-r0: task do_fetch: Succeeded
NOTE: Running task 1689 of 1710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_unpack)
NOTE: recipe ghostscript-native-10.01.1-r0: task do_fetch: Succeeded
NOTE: Running task 1690 of 1710 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_unpack)
NOTE: Running task 1691 of 1710 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ghostscript-10.01.1-r0: task do_unpack: Started
NOTE: recipe ghostscript-native-10.01.1-r0: task do_unpack: Started
NOTE: recipe ghostscript-native-10.01.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ghostscript-native-10.01.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ghostscript-10.01.1-r0: task do_unpack: Succeeded
NOTE: Running task 1692 of 1710 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_patch)
NOTE: recipe ghostscript-10.01.1-r0: task do_patch: Started
NOTE: recipe ghostscript-10.01.1-r0: task do_patch: Failed
NOTE: recipe ghostscript-native-10.01.1-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1692 tasks of which 1686 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ghostscript/10.01.1-r0/temp/log.do_patch.3094879
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb:do_patch) failed with exit code '1'

--===============0835371373091421838==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ghostscript-upgrade-10.0.0-10.01.1.patch"

RnJvbSBhZjM2MGVhNzljMWY2MDNhYzQ0YWNhZjBlNjNkZWI3YTQxM2RhYTIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTQ6MjA6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aG9zdHNjcmlwdDogdXBncmFkZSAxMC4wLjAgLT4gMTAuMDEuMQoKLS0tCiAuLi4ve2dob3N0c2Ny
aXB0XzEwLjAuMC5iYiA9PiBnaG9zdHNjcmlwdF8xMC4wMS4xLmJifSAgICAgICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQve2dob3N0c2NyaXB0XzEwLjAuMC5iYiA9
PiBnaG9zdHNjcmlwdF8xMC4wMS4xLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9naG9zdHNjcmlwdC9naG9zdHNjcmlwdF8xMC4wLjAuYmIgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3RzY3JpcHRfMTAuMDEuMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQv
Z2hvc3RzY3JpcHRfMTAuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hv
c3RzY3JpcHQvZ2hvc3RzY3JpcHRfMTAuMDEuMS5iYgppbmRleCA4NmVjZGJlMjRhLi44YjI5OGY4
M2QxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2hvc3RzY3JpcHQvZ2hvc3Rz
Y3JpcHRfMTAuMC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9naG9zdHNjcmlwdC9n
aG9zdHNjcmlwdF8xMC4wMS4xLmJiCkBAIC00Niw3ICs0Niw3IEBAIFNSQ19VUkk6Y2xhc3MtbmF0
aXZlID0gIiR7U1JDX1VSSV9CQVNFfSBcCiAgICAgICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
YmFzZS1nZW5odC5jLWFkZC1hLXByZXByb2Nlc3Nvci1kZWZpbmUtdG8tYWxsb3ctZm9wZS5wYXRj
aCBcCiAgICAgICAgICAgICAgICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJh
NTc3NjRkNzBjYWY4NWUyZmMwYjBmNTliODNiOTJlMjU3NzU2MzE3MTRkY2RiOTdjYzZlMGNlYTQx
NGJiNWEzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRkZjE4YTgwOGNkNDM2OWYyNWUwMmRiY2Vj
MmYxMzNjYjZkNjc0NjI3YjJjNmIxNTAyMDIwZTU4ZDQzZTMyY2UiCiAKICMgUHV0IHNvbWV0aGlu
ZyBsaWtlCiAjCi0tIAoyLjM5LjIKCg==

--===============0835371373091421838==--

