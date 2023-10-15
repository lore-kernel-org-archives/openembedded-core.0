Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC53C04FEA
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:24 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.102698.1697399113536845655
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MMyjvRwC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Wde9u0n9;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b34df02f4-3ad39e74-f8d4-4d86-b3b8-ecf0d9873a0b-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=b+yewJ49LMLTNjp0NmAbM3/ORqHWkYA0vRejWVKoZLA=;
	b=MMyjvRwCDNRPrvfILM7kwRnPqq1pAYGMlBMTZYCnV8EeDxK3NlEBji55U7ZzUb1C
	cztUft6wXAM+biCvIdLFVJPGWbdqAUwyABdcFwEKwFhLVc8obxYJcGQ5Hd8j3/PJQyA
	+3pUsx3oxGVBJth4867fP4KYIEI2T/JNnn/FW5O0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=b+yewJ49LMLTNjp0NmAbM3/ORqHWkYA0vRejWVKoZLA=;
	b=Wde9u0n9Af2nxuAWlhGcyjS4W2bXNA8Zdpw5KKQLidekkMY5QROvUa3SKDwfhicA
	+V/D1ALPbbn8E9G9ATYD39hGtCd+Hm8tMTH+UDBaIJa98C6U8ERP54hZvnxFdFspT4X
	BfrAC4nhyjY7eG/sE1e/K14CaRG0VJa5jKqSn3vQ=
Content-Type: multipart/mixed; boundary="===============5135525016551050671=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Stefano Babic <sbabic@denx.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libubootenv: upgrading to 0.3.5 SUCCEEDED
Message-ID: <0101018b34df02f4-3ad39e74-f8d4-4d86-b3b8-ecf0d9873a0b-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189164

--===============5135525016551050671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libubootenv* to *0.3.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libubootenv-upgrade-0.3.4-0.3.5.patch
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

-- >8 --
From d98b573e662b6489109355241ca653ad37195d09 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 05:57:23 +0000
Subject: [PATCH] libubootenv: upgrade 0.3.4 -> 0.3.5

---
 .../u-boot/{libubootenv_0.3.4.bb => libubootenv_0.3.5.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.3.4.bb => libubootenv_0.3.5.bb} (93%)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.4.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb
similarity index 93%
rename from meta/recipes-bsp/u-boot/libubootenv_0.3.4.bb
rename to meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb
index ac1e03b8e9..b68bbb430a 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.4.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1-or-later.txt;md5=4fbd65380cdd255951
 SECTION = "libs"
 
 SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https;branch=master"
-SRCREV = "4dfb5254fc0540a36e87914bc14644c047ea7678"
+SRCREV = "3f4d15e36ceb58085b08dd13f3f2788e9299877b"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============5135525016551050671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libubootenv/libubootenv-staticdev: PKGSIZE changed from 66958 to 74282 (+11%)
packages/core2-32-poky-linux/libubootenv/libubootenv: FILELIST: removed "/usr/lib/libubootenv.so.0.3.4", added "/usr/lib/libubootenv.so.0.3.5"
Changes to packages/core2-32-poky-linux/libubootenv (sysroot):
  /usr/lib/libubootenv.so.0 changed symlink target from libubootenv.so.0.3.4 to libubootenv.so.0.3.5
  /usr/lib/libubootenv.so.0.3.4 moved to /usr/lib/libubootenv.so.0.3.5

--===============5135525016551050671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libubootenv: PKGV changed from 0.3.4 [default] to 0.3.5 [default]
packages/core2-32-poky-linux/libubootenv: PV changed from "0.3.4" to "0.3.5"
packages/core2-32-poky-linux/libubootenv/libubootenv-bin: PKGV changed from 0.3.4 [default] to 0.3.5 [default]
packages/core2-32-poky-linux/libubootenv/libubootenv-bin: PV changed from "0.3.4" to "0.3.5"
packages/core2-32-poky-linux/libubootenv/libubootenv-dbg: PKGV changed from 0.3.4 [default] to 0.3.5 [default]
packages/core2-32-poky-linux/libubootenv/libubootenv-dbg: PV changed from "0.3.4" to "0.3.5"
packages/core2-32-poky-linux/libubootenv/libubootenv-dbg: PKGSIZE changed from 76496 to 82060 (+7%)
packages/core2-32-poky-linux/libubootenv/libubootenv-dbg: FILELIST: removed "/usr/lib/.debug/libubootenv.so.0.3.4", added "/usr/lib/.debug/libubootenv.so.0.3.5"
packages/core2-32-poky-linux/libubootenv/libubootenv-dev: PKGV changed from 0.3.4 [default] to 0.3.5 [default]
packages/core2-32-poky-linux/libubootenv/libubootenv-dev: PV changed from "0.3.4" to "0.3.5"
packages/core2-32-poky-linux/libubootenv/libubootenv-dev: PKGSIZE changed from 5941 to 6161 (+4%)
packages/core2-32-poky-linux/libubootenv/libubootenv-doc: PKGV changed from 0.3.4 [default] to 0.3.5 [default]
packages/core2-32-poky-linux/libubootenv/libubootenv-doc: PV changed from "0.3.4" to "0.3.5"
packages/core2-32-poky-linux/libubootenv/libubootenv-locale: PKGV changed from 0.3.4 [default] to 0.3.5 [default]
packages/core2-32-poky-linux/libubootenv/libubootenv-locale: PV changed from "0.3.4" to "0.3.5"
packages/core2-32-poky-linux/libubootenv/libubootenv-src: PKGV changed from 0.3.4 [default] to 0.3.5 [default]
packages/core2-32-poky-linux/libubootenv/libubootenv-src: PV changed from "0.3.4" to "0.3.5"
packages/core2-32-poky-linux/libubootenv/libubootenv-src: PKGSIZE changed from 53870 to 56978 (+6%)
packages/core2-32-poky-linux/libubootenv/libubootenv-staticdev: PKGV changed from 0.3.4 [default] to 0.3.5 [default]
packages/core2-32-poky-linux/libubootenv/libubootenv-staticdev: PV changed from "0.3.4" to "0.3.5"
packages/core2-32-poky-linux/libubootenv/libubootenv-staticdev: PKGSIZE changed from 66958 to 74282 (+11%)
packages/core2-32-poky-linux/libubootenv/libubootenv: PKGV changed from 0.3.4 [default] to 0.3.5 [default]
packages/core2-32-poky-linux/libubootenv/libubootenv: PV changed from "0.3.4" to "0.3.5"
packages/core2-32-poky-linux/libubootenv/libubootenv: FILELIST: removed "/usr/lib/libubootenv.so.0.3.4", added "/usr/lib/libubootenv.so.0.3.5"
Changes to packages/core2-32-poky-linux/libubootenv (sysroot):
  /usr/lib/libubootenv.so.0 changed symlink target from libubootenv.so.0.3.4 to libubootenv.so.0.3.5
  /usr/lib/libubootenv.so.0.3.4 moved to /usr/lib/libubootenv.so.0.3.5

--===============5135525016551050671==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libubootenv-upgrade-0.3.4-0.3.5.patch"

RnJvbSBkOThiNTczZTY2MmI2NDg5MTA5MzU1MjQxY2E2NTNhZDM3MTk1ZDA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMDU6NTc6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1Ym9vdGVudjogdXBncmFkZSAwLjMuNCAtPiAwLjMuNQoKLS0tCiAuLi4vdS1ib290L3tsaWJ1
Ym9vdGVudl8wLjMuNC5iYiA9PiBsaWJ1Ym9vdGVudl8wLjMuNS5iYn0gICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtYnNwL3UtYm9vdC97bGlidWJvb3RlbnZfMC4zLjQuYmIgPT4gbGlidWJvb3RlbnZf
MC4zLjUuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvbGli
dWJvb3RlbnZfMC4zLjQuYmIgYi9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC9saWJ1Ym9vdGVudl8w
LjMuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtYnNw
L3UtYm9vdC9saWJ1Ym9vdGVudl8wLjMuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWJzcC91
LWJvb3QvbGlidWJvb3RlbnZfMC4zLjUuYmIKaW5kZXggYWMxZTAzYjhlOS4uYjY4YmJiNDMwYSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvbGlidWJvb3RlbnZfMC4zLjQuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvbGlidWJvb3RlbnZfMC4zLjUuYmIKQEAgLTEx
LDcgKzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRVMvTEdQTC0yLjEt
b3ItbGF0ZXIudHh0O21kNT00ZmJkNjUzODBjZGQyNTU5NTEKIFNFQ1RJT04gPSAibGlicyIKIAog
U1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3NiYWJpYy9saWJ1Ym9vdGVudjtwcm90b2NvbD1o
dHRwczticmFuY2g9bWFzdGVyIgotU1JDUkVWID0gIjRkZmI1MjU0ZmMwNTQwYTM2ZTg3OTE0YmMx
NDY0NGMwNDdlYTc2NzgiCitTUkNSRVYgPSAiM2Y0ZDE1ZTM2Y2ViNTgwODViMDhkZDEzZjNmMjc4
OGU5Mjk5ODc3YiIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zOS4yCgo=

--===============5135525016551050671==--

