Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325F8C7618D
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:32 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.145713.1673805743416981975
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iQVCL7ot;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010185b698c1b7-ac48d0d8-a3d9-420b-bce1-a114eecbc75c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7/Q9dgQZgOqQSY+uBhr9cra9od0ofSAbgLycGGtjhoA=;
	b=iQVCL7otqydAdm7prtnOdUL4yNV6RN5J3s8TygO7dZ15JEMypI+lMXskWcWx9Hfg
	Oa+09dJ1uwB38NnREFNZ7vxTQCm1Jdc2Xlt8zoF4d9+RO9ufhBbE8I/+1R7Y2BNHY9U
	wRfkkTgjKMVPaIErWIAw49gHh973MNgwccJvuP/8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7/Q9dgQZgOqQSY+uBhr9cra9od0ofSAbgLycGGtjhoA=;
	b=N7QrcCui7BWhGtvq2ZJEYH1Z2l0OLsR8n9vEgdmwMTBa6sp2R+4mKeCk5tTvLy1f
	tynejhHEUrm5nwgFdY41zKVcXOlAsovsQKuTLuyVtA/23QTxI+wtDmmWGiDbsDmJ2Ux
	NEWsayhQEXQnRMxrbru55obVb/aTI2bYm2OapNuQ=
Content-Type: multipart/mixed; boundary="===============4326813796198652664=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 15.0.7 SUCCEEDED
Message-ID: <01010185b698c1b7-ac48d0d8-a3d9-420b-bce1-a114eecbc75c-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175899

--===============4326813796198652664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *15.0.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-llvm-upgrade-15.0.6-15.0.7.patch
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
--===============4326813796198652664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/llvm: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-bugpointpasses: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-bugpointpasses: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-dbg: PKGSIZE changed from 2914251584 to 2914252104 (+0%)
packages/core2-32-poky-linux/llvm/llvm-dbg: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-dbg: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-dev: FILES: removed "/usr/lib/libLLVM-15.0.6.so", added "/usr/lib/libLLVM-15.0.7.so"
packages/core2-32-poky-linux/llvm/llvm-dev: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-dev: FILELIST: removed "/usr/lib/libLLVM-15.0.6.so", added "/usr/lib/libLLVM-15.0.7.so"
packages/core2-32-poky-linux/llvm/llvm-dev: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-doc: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-doc: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-libllvm: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-libllvm: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-liblto: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-liblto: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-liboptremarks: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-liboptremarks: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-llvmhello: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-llvmhello: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-locale: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-locale: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-src: PKGSIZE changed from 200176717 to 200176811 (+0%)
packages/core2-32-poky-linux/llvm/llvm-src: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-src: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm-staticdev: PKGSIZE changed from 2044165538 to 2044165746 (+0%)
packages/core2-32-poky-linux/llvm/llvm-staticdev: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm-staticdev: PV changed from "15.0.6" to "15.0.7"
packages/core2-32-poky-linux/llvm/llvm: PKGV changed from 15.0.6 [default] to 15.0.7 [default]
packages/core2-32-poky-linux/llvm/llvm: PV changed from "15.0.6" to "15.0.7"
Changes to packages/core2-32-poky-linux/llvm (sysroot):
  /sysroot-providers/llvm15.0.6 moved to /sysroot-providers/llvm15.0.7
  /usr/bin/crossscripts/llvm-config15.0.6 moved to /usr/bin/crossscripts/llvm-config15.0.7
  /usr/lib/libLLVM-15.0.6.so moved to /usr/lib/libLLVM-15.0.7.so
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config15.0.6 to llvm-config15.0.7
  /sysroot-providers/llvm15.0.6-native moved to /sysroot-providers/llvm15.0.7-native
  /usr/bin/llvm-config15.0.6 moved to /usr/bin/llvm-config15.0.7
  /usr/bin/llvm-tblgen15.0.6 moved to /usr/bin/llvm-tblgen15.0.7

--===============4326813796198652664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/llvm/llvm-dev: FILELIST: removed "/usr/lib/libLLVM-15.0.6.so", added "/usr/lib/libLLVM-15.0.7.so"
Changes to packages/core2-32-poky-linux/llvm (sysroot):
  /sysroot-providers/llvm15.0.6 moved to /sysroot-providers/llvm15.0.7
  /usr/bin/crossscripts/llvm-config15.0.6 moved to /usr/bin/crossscripts/llvm-config15.0.7
  /usr/lib/libLLVM-15.0.6.so moved to /usr/lib/libLLVM-15.0.7.so
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config15.0.6 to llvm-config15.0.7
  /sysroot-providers/llvm15.0.6-native moved to /sysroot-providers/llvm15.0.7-native
  /usr/bin/llvm-config15.0.6 moved to /usr/bin/llvm-config15.0.7
  /usr/bin/llvm-tblgen15.0.6 moved to /usr/bin/llvm-tblgen15.0.7

--===============4326813796198652664==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-llvm-upgrade-15.0.6-15.0.7.patch"

RnJvbSAwNGU3YzA2ZjcwYTM0NWFiYmVmNzAxNmQzZGQ5NDZiZjliOGNjZTdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMDk6MzQ6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
bHZtOiB1cGdyYWRlIDE1LjAuNiAtPiAxNS4wLjcKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2xsdm0vbGx2bV9naXQuYmIgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xs
dm0vbGx2bV9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9sbHZtX2dpdC5iYgpp
bmRleCA3N2ZjY2JjY2MyLi5iNGU5ODNkMmQwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbGx2bS9sbHZtX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9s
bHZtX2dpdC5iYgpAQCAtMTksMTQgKzE5LDE0IEBAIGluaGVyaXQgY21ha2UgcGtnY29uZmlnCiAK
IFBST1ZJREVTICs9ICJsbHZtJHtQVn0iCiAKLVBWID0gIjE1LjAuNiIKK1BWID0gIjE1LjAuNyIK
IAogTUFKT1JfVkVSU0lPTiA9ICIke0BvZS51dGlscy50cmltX3ZlcnNpb24oIiR7UFZ9IiwgMSl9
IgogCiBMTFZNX1JFTEVBU0UgPSAiJHtQVn0iCiAKIEJSQU5DSCA9ICJyZWxlYXNlLyR7TUFKT1Jf
VkVSU0lPTn0ueCIKLVNSQ1JFViA9ICIwODhmMzM2MDVkOGE2MWZmNTE5YzU4MGE3MWIxZGQ1N2Qx
NmEwM2Y4IgorU1JDUkVWID0gIjhkZmRjYzdiN2JmNjY4MzRhNzYxYmQ4ZGU0NDU4NDBlZjY4ZTRk
MWEiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QuZ2l0O2Jy
YW5jaD0ke0JSQU5DSH07cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwNy1s
bHZtLWFsbG93LWVudi1vdmVycmlkZS1vZi1leGUtcGF0aC5wYXRjaDtzdHJpcGxldmVsPTIgXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMS1Bc21NYXRjaGVyRW1pdHRlci1zb3J0LUNsYXNzSW5mby1s
aXN0cy1ieS1uYW1lLWFzLXdlLnBhdGNoO3N0cmlwbGV2ZWw9MiBcCi0tIAoyLjM3LjMKCg==

--===============4326813796198652664==--

