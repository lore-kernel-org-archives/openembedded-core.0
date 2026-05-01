Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A74BCD3428
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 14:25:52 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15627.1777645547084213696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 07:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SMIH0/Gh;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NXJsrY1X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019de3ee7eaa-a517a8d1-3bfa-4b9f-b743-0c575d6bd5e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1777645551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vNJwPzIiRY7JnKPAUC+/rcduPd0KOLe23FrDBTK/BdY=;
	b=SMIH0/Gho8csW486tucGXojRoa5CvPpmLJDwTCrRGml6D9Ie+XVPWoH2dO22sJip
	/6LH018PM1bP3+HnmM2P2sFK76PSzvoLuL03Dvp6UC0Bm+VLOEDTI9uV89ce/pt6z3o
	iKHfIr4+G0zdRzm47EGF83rca8hK2yIIsfmD4WFI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1777645551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vNJwPzIiRY7JnKPAUC+/rcduPd0KOLe23FrDBTK/BdY=;
	b=NXJsrY1XtscCJlFxIVkkKntz9eUHCJoSdsChQOLgMFTSqOe7KEss3ZxnINl/GA69
	D+w+paikD8M/nHEe6sL43MgK5qLrMXWAJ8GG5agGiZ01+xcMO1ICjVhpF1bckiOcODm
	fa7+jKoNwOVBIKiv/qcJgzeIHWHSC9C6kBxQpbeo=
Content-Type: multipart/mixed; boundary="===============8255543327650894127=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-llvm-translator: upgrading to 22.1.2 SUCCEEDED
Message-ID: <0101019de3ee7eaa-a517a8d1-3bfa-4b9f-b743-0c575d6bd5e9-000000@us-west-2.amazonses.com>
Date: Fri, 1 May 2026 14:25:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 14:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236277

--===============8255543327650894127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-llvm-translator* to *22.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-llvm-translator-upgrade-22.1.1-22.1.2.patch
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
From 28afc4b184b41fe85591069afa2113c50254c0c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 May 2026 12:26:41 +0000
Subject: [PATCH] spirv-llvm-translator: upgrade 22.1.1 -> 22.1.2

---
 ...lvm-translator_22.1.1.bb => spirv-llvm-translator_22.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_22.1.1.bb => spirv-llvm-translator_22.1.2.bb} (94%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.1.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.2.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_22.1.1.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_22.1.2.bb
index b4ec006abc..2ee9819060 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.1.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_220"
-SRCREV = "114f5ee1cec66fe2ca733c12770c1bc196675d32"
+SRCREV = "f676199fd00f2229fb35006d5124687c0785a01d"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${SPIRV_BRANCH};tag=v${PV} \
 "
-- 
2.47.1


--===============8255543327650894127==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-llvm-translator-upgrade-22.1.1-22.1.2.patch"

RnJvbSAyOGFmYzRiMTg0YjQxZmU4NTU5MTA2OWFmYTIxMTNjNTAyNTRjMGMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXkgMjAyNiAxMjoyNjo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LWxsdm0tdHJhbnNsYXRvcjogdXBncmFkZSAyMi4xLjEgLT4gMjIuMS4yCgotLS0KIC4uLmx2
bS10cmFuc2xhdG9yXzIyLjEuMS5iYiA9PiBzcGlydi1sbHZtLXRyYW5zbGF0b3JfMjIuMS4yLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3tzcGlydi1sbHZtLXRyYW5zbGF0b3Jf
MjIuMS4xLmJiID0+IHNwaXJ2LWxsdm0tdHJhbnNsYXRvcl8yMi4xLjIuYmJ9ICg5NCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtbGx2bS10cmFuc2xhdG9y
XzIyLjEuMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWxsdm0tdHJhbnNs
YXRvcl8yMi4xLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtbGx2bS10cmFuc2xhdG9yXzIyLjEuMS5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtbGx2bS10cmFuc2xhdG9yXzIyLjEu
Mi5iYgppbmRleCBiNGVjMDA2YWJjLi4yZWU5ODE5MDYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1sbHZtLXRyYW5zbGF0b3JfMjIuMS4xLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWxsdm0tdHJhbnNsYXRvcl8yMi4xLjIuYmIK
QEAgLTYsNyArNiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuVFhUO21k
NT00N2UzMTFhYTljYWVkZDFiM2FiZjA5OGJkNzgxNGQxZCIKIAogIyBwYXR0ZXJuOiBsbHZtX2Jy
YW5jaF8yMDAsIGN1cnJlbnRseSB0aGVyZSBhcmUgbm8gbWlub3IgcmVsZWFzZXMsIHNvLCBubyBs
bHZtX2JyYW5jaF8yMDEKIFNQSVJWX0JSQU5DSCA9ICJsbHZtX3JlbGVhc2VfMjIwIgotU1JDUkVW
ID0gIjExNGY1ZWUxY2VjNjZmZTJjYTczM2MxMjc3MGMxYmMxOTY2NzVkMzIiCitTUkNSRVYgPSAi
ZjY3NjE5OWZkMDBmMjIyOWZiMzUwMDZkNTEyNDY4N2MwNzg1YTAxZCIKIFNSQ19VUkkgPSAiIFwK
ICAgICBnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9TUElSVi1MTFZNLVRyYW5zbGF0b3I7
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPSR7U1BJUlZfQlJBTkNIfTt0YWc9diR7UFZ9IFwKICIKLS0g
CjIuNDcuMQoK

--===============8255543327650894127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/spirv-llvm-translator: SRC_URI changed from "git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=llvm_release_220;tag=v22.1.1" to "git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=llvm_release_220;tag=v22.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator: PV changed from "22.1.1" to "22.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-bin: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-bin: PV changed from "22.1.1" to "22.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PKGSIZE changed from 133829440 to 133887208 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PV changed from "22.1.1" to "22.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PKGSIZE changed from 26547 to 26587 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PV changed from "22.1.1" to "22.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-doc: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-doc: PV changed from "22.1.1" to "22.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-locale: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-locale: PV changed from "22.1.1" to "22.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PKGSIZE changed from 2424104 to 2426218 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: FILELIST: directory renamed /usr/src/debug/spirv-llvm-translator/22.1.1/tools/llvm-spirv -> /usr/src/debug/spirv-llvm-translator/22.1.2/tools/llvm-spirv, directory renamed /usr/src/debug/spirv-llvm-translator/22.1.1/include -> /usr/src/debug/spirv-llvm-translator/22.1.2/include, directory renamed /usr/src/debug/spirv-llvm-translator/22.1.1/lib/SPIRV/Mangler -> /usr/src/debug/spirv-llvm-translator/22.1.2/lib/SPIRV/Mangler, directory renamed /usr/src/debug/spirv-llvm-translator/22.1.1/lib/SPIRV -> /usr/src/debug/spirv-llvm-translator/22.1.2/lib/SPIRV, directory renamed /usr/src/debug/spirv-llvm-translator/22.1.1/lib/SPIRV/libSPIRV -> /usr/src/debug/spirv-llvm-translator/22.1.2/lib/SPIRV/libSPIRV
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PV changed from "22.1.1" to "22.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-staticdev: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-staticdev: PV changed from "22.1.1" to "22.1.2"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PKGSIZE changed from 5882288 to 5886384 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PKGV changed from 22.1.1 [default] to 22.1.2 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PV changed from "22.1.1" to "22.1.2"

--===============8255543327650894127==--

