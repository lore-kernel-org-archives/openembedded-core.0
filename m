Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8928410F6FB7
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:21 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14758.1775054165341412693
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=g+Nr/TLL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=X/4b+s1e;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019d4979305a-9bb9ef37-9b10-49f3-a31f-d8efab16ee91-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054172;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=c2prpk3zPicaL+NzXX9JbDIXA36KYeLqedbA4Fd45q8=;
	b=g+Nr/TLLnqAG9qAtiCMfOc4kREs0CtGaQke2qPlYgNkTyH5xmmPyamGmyL/8Hb/U
	gIuNKi13CcUmNCYBIXQAM+nJKqot273b2ebqSkSo0job+UFfW4y05hcNUgO8ykaKOCZ
	rUvKbt1W5lC5A9FvX1AKpweI01agkkY/7hjcoyTo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054172;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=c2prpk3zPicaL+NzXX9JbDIXA36KYeLqedbA4Fd45q8=;
	b=X/4b+s1e0qP7NaZkIpBBy8W03E07oc3hEjdYzUPklkvait4esqb6y38k4p7p2foE
	NKyDlCs8bv4Ou5noZWFcVEFH7etMwL15dHApn+o/ko81MmgYYNgblr5xZGzflrDECzg
	GSaw56Bi7hBuofiLrngd2jN1DQxo0axK/44aoD/c=
Content-Type: multipart/mixed; boundary="===============5569233646675498500=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-llvm-translator: upgrading to 22.1.1 SUCCEEDED
Message-ID: <0101019d4979305a-9bb9ef37-9b10-49f3-a31f-d8efab16ee91-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234418

--===============5569233646675498500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-llvm-translator* to *22.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-llvm-translator-upgrade-22.0.0-22.1.1.patch
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
From 023989bcd078b7a8ef9b3f55e5d4c9563b571ffc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 13:25:41 +0000
Subject: [PATCH] spirv-llvm-translator: upgrade 22.0.0 -> 22.1.1

---
 ...m-translator_22.0.0.bb => spirv-llvm-translator_22.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_22.0.0.bb => spirv-llvm-translator_22.1.1.bb} (90%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_22.0.0.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.1.bb
similarity index 90%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_22.0.0.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_22.1.1.bb
index 20f4ba8464..e82dd60e86 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_22.0.0.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.1.bb
@@ -5,8 +5,8 @@ LICENSE = "NCSA"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
-SPIRV_BRANCH = "main"
-SRCREV = "f821423888319dd2f0c436fc9ab86c798ac48ba1"
+SPIRV_BRANCH = "llvm_release_220"
+SRCREV = "114f5ee1cec66fe2ca733c12770c1bc196675d32"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${SPIRV_BRANCH} \
 "
-- 
2.47.1


--===============5569233646675498500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/spirv-llvm-translator: SRC_URI changed from "git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=main" to "git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=llvm_release_220"
packages/x86-64-v3-poky-linux/spirv-llvm-translator: PKGV changed from 22.0.0 [default] to 22.1.1 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator: PV changed from "22.0.0" to "22.1.1"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-bin: PV changed from "22.0.0" to "22.1.1"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-bin: PKGV changed from 22.0.0 [default] to 22.1.1 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PKGSIZE changed from 133832968 to 133829440 (-0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PV changed from "22.0.0" to "22.1.1"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PKGV changed from 22.0.0 [default] to 22.1.1 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PKGSIZE changed from 26431 to 26547 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PV changed from "22.0.0" to "22.1.1"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PKGV changed from 22.0.0 [default] to 22.1.1 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-doc: PV changed from "22.0.0" to "22.1.1"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-doc: PKGV changed from 22.0.0 [default] to 22.1.1 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-locale: PV changed from "22.0.0" to "22.1.1"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-locale: PKGV changed from 22.0.0 [default] to 22.1.1 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PKGSIZE changed from 2419969 to 2424104 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PV changed from "22.0.0" to "22.1.1"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PKGV changed from 22.0.0 [default] to 22.1.1 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: FILELIST: directory renamed /usr/src/debug/spirv-llvm-translator/22.0.0/lib/SPIRV/libSPIRV -> /usr/src/debug/spirv-llvm-translator/22.1.1/lib/SPIRV/libSPIRV, directory renamed /usr/src/debug/spirv-llvm-translator/22.0.0/tools/llvm-spirv -> /usr/src/debug/spirv-llvm-translator/22.1.1/tools/llvm-spirv, directory renamed /usr/src/debug/spirv-llvm-translator/22.0.0/lib/SPIRV -> /usr/src/debug/spirv-llvm-translator/22.1.1/lib/SPIRV, directory renamed /usr/src/debug/spirv-llvm-translator/22.0.0/include -> /usr/src/debug/spirv-llvm-translator/22.1.1/include, directory renamed /usr/src/debug/spirv-llvm-translator/22.0.0/lib/SPIRV/Mangler -> /usr/src/debug/spirv-llvm-translator/22.1.1/lib/SPIRV/Mangler
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-staticdev: PV changed from "22.0.0" to "22.1.1"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-staticdev: PKGV changed from 22.0.0 [default] to 22.1.1 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PKGSIZE changed from 5878192 to 5882288 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PV changed from "22.0.0" to "22.1.1"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PKGV changed from 22.0.0 [default] to 22.1.1 [default]

--===============5569233646675498500==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-llvm-translator-upgrade-22.0.0-22.1.1.patch"

RnJvbSAwMjM5ODliY2QwNzhiN2E4ZWY5YjNmNTVlNWQ0Yzk1NjNiNTcxZmZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMzoyNTo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LWxsdm0tdHJhbnNsYXRvcjogdXBncmFkZSAyMi4wLjAgLT4gMjIuMS4xCgotLS0KIC4uLm0t
dHJhbnNsYXRvcl8yMi4wLjAuYmIgPT4gc3BpcnYtbGx2bS10cmFuc2xhdG9yXzIyLjEuMS5iYn0g
fCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIve3NwaXJ2LWxsdm0tdHJhbnNsYXRv
cl8yMi4wLjAuYmIgPT4gc3BpcnYtbGx2bS10cmFuc2xhdG9yXzIyLjEuMS5iYn0gKDkwJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1sbHZtLXRyYW5zbGF0
b3JfMjIuMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtbGx2bS10cmFu
c2xhdG9yXzIyLjEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1sbHZtLXRyYW5zbGF0b3JfMjIuMC4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1sbHZtLXRyYW5zbGF0b3JfMjIu
MS4xLmJiCmluZGV4IDIwZjRiYTg0NjQuLmU4MmRkNjBlODYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWxsdm0tdHJhbnNsYXRvcl8yMi4wLjAuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtbGx2bS10cmFuc2xhdG9yXzIyLjEuMS5i
YgpAQCAtNSw4ICs1LDggQEAgTElDRU5TRSA9ICJOQ1NBIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRS5UWFQ7bWQ1PTQ3ZTMxMWFhOWNhZWRkMWIzYWJmMDk4YmQ3ODE0ZDFkIgog
CiAjIHBhdHRlcm46IGxsdm1fYnJhbmNoXzIwMCwgY3VycmVudGx5IHRoZXJlIGFyZSBubyBtaW5v
ciByZWxlYXNlcywgc28sIG5vIGxsdm1fYnJhbmNoXzIwMQotU1BJUlZfQlJBTkNIID0gIm1haW4i
Ci1TUkNSRVYgPSAiZjgyMTQyMzg4ODMxOWRkMmYwYzQzNmZjOWFiODZjNzk4YWM0OGJhMSIKK1NQ
SVJWX0JSQU5DSCA9ICJsbHZtX3JlbGVhc2VfMjIwIgorU1JDUkVWID0gIjExNGY1ZWUxY2VjNjZm
ZTJjYTczM2MxMjc3MGMxYmMxOTY2NzVkMzIiCiBTUkNfVVJJID0gIiBcCiAgICAgZ2l0Oi8vZ2l0
aHViLmNvbS9LaHJvbm9zR3JvdXAvU1BJUlYtTExWTS1UcmFuc2xhdG9yO3Byb3RvY29sPWh0dHBz
O2JyYW5jaD0ke1NQSVJWX0JSQU5DSH0gXAogIgotLSAKMi40Ny4xCgo=

--===============5569233646675498500==--

