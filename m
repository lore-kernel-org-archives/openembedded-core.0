Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B50C531F5
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:01 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1402.1771440091416486362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Qow0mAoE;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=L0Ks7QOZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c720efc92-79e79fb7-4425-41ff-8ac6-4cadd283268a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440110;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AAyrO1m6JCIA+4GiHhMOPW9/PC2wWaBhuR+ijJG9jck=;
	b=Qow0mAoEOA2FIW/6HK+RikndSRzQHG7iScbVjxDRg7dmjwYjpLaJ0N0GZTKk8HY6
	ENMSgTWFNVUlI3av/evS8H/TIHMxdqURG5n1evgsnYsAdP5wOtpJMoky0EQrMiZJXfc
	s0b7B8JnBqLScttEKE0O0DfR7yBLpYbFk7jrD+nM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440110;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AAyrO1m6JCIA+4GiHhMOPW9/PC2wWaBhuR+ijJG9jck=;
	b=L0Ks7QOZujsidNbaYzYyUlOujgwWQi4VlHU5ciuSwMeT7OB1IHO6U/474JVz+Jh+
	VyBgOajZaALnTbXSkRDw7UU7sWwMJLBNEYCzN26JnV5PlLa2EfvQJz9nP8Tmg67auhC
	jw8ETkWsDlnHq1ell6prmlm90QWQmxWI24qZfkx0=
Content-Type: multipart/mixed; boundary="===============7083887607719593526=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-llvm-translator: upgrading to 21.1.4 SUCCEEDED
Message-ID: <0101019c720efc92-79e79fb7-4425-41ff-8ac6-4cadd283268a-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231384

--===============7083887607719593526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-llvm-translator* to *21.1.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-llvm-translator-upgrade-21.1.3-21.1.4.patch
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
From 48406cdd6c77923a071307531ce3d2699d29fb48 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 15:34:06 +0000
Subject: [PATCH] spirv-llvm-translator: upgrade 21.1.3 -> 21.1.4

---
 ...lvm-translator_21.1.3.bb => spirv-llvm-translator_21.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_21.1.3.bb => spirv-llvm-translator_21.1.4.bb} (94%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.4.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_21.1.4.bb
index f8a7b8f32e..80aa6a7f87 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-SRCREV = "a79c852b36785588032a2dd7c39aa15ec4d24b20"
+SRCREV = "751d1bde44020c8f396ed246a7de04b7722c0857"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
 "
-- 
2.47.1


--===============7083887607719593526==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-llvm-translator-upgrade-21.1.3-21.1.4.patch"

RnJvbSA0ODQwNmNkZDZjNzc5MjNhMDcxMzA3NTMxY2UzZDI2OTlkMjlmYjQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTU6MzQ6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi1sbHZtLXRyYW5zbGF0b3I6IHVwZ3JhZGUgMjEuMS4zIC0+IDIxLjEuNAoKLS0tCiAuLi5s
dm0tdHJhbnNsYXRvcl8yMS4xLjMuYmIgPT4gc3BpcnYtbGx2bS10cmFuc2xhdG9yXzIxLjEuNC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci97c3BpcnYtbGx2bS10cmFuc2xhdG9y
XzIxLjEuMy5iYiA9PiBzcGlydi1sbHZtLXRyYW5zbGF0b3JfMjEuMS40LmJifSAoOTQlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWxsdm0tdHJhbnNsYXRv
cl8yMS4xLjMuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1sbHZtLXRyYW5z
bGF0b3JfMjEuMS40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWxsdm0tdHJhbnNsYXRvcl8yMS4xLjMuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWxsdm0tdHJhbnNsYXRvcl8yMS4x
LjQuYmIKaW5kZXggZjhhN2I4ZjMyZS4uODBhYTZhN2Y4NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtbGx2bS10cmFuc2xhdG9yXzIxLjEuMy5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1sbHZtLXRyYW5zbGF0b3JfMjEuMS40LmJi
CkBAIC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLlRYVDtt
ZDU9NDdlMzExYWE5Y2FlZGQxYjNhYmYwOThiZDc4MTRkMWQiCiAKICMgcGF0dGVybjogbGx2bV9i
cmFuY2hfMjAwLCBjdXJyZW50bHkgdGhlcmUgYXJlIG5vIG1pbm9yIHJlbGVhc2VzLCBzbywgbm8g
bGx2bV9icmFuY2hfMjAxCiBTUElSVl9CUkFOQ0ggPSAibGx2bV9yZWxlYXNlXyR7QG9lLnV0aWxz
LnRyaW1fdmVyc2lvbignJHtQVn0nLCAxKS5yZXBsYWNlKCcuJywgJycpfTAiCi1TUkNSRVYgPSAi
YTc5Yzg1MmIzNjc4NTU4ODAzMmEyZGQ3YzM5YWExNWVjNGQyNGIyMCIKK1NSQ1JFViA9ICI3NTFk
MWJkZTQ0MDIwYzhmMzk2ZWQyNDZhN2RlMDRiNzcyMmMwODU3IgogU1JDX1VSSSA9ICIgXAogICAg
IGdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1NQSVJWLUxMVk0tVHJhbnNsYXRvcjtwcm90
b2NvbD1odHRwczt0YWc9diR7UFZ9O2JyYW5jaD0ke1NQSVJWX0JSQU5DSH0gXAogIgotLSAKMi40
Ny4xCgo=

--===============7083887607719593526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/spirv-llvm-translator: SRC_URI changed from "git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v21.1.3;branch=llvm_release_210" to "git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v21.1.4;branch=llvm_release_210"
packages/x86-64-v3-poky-linux/spirv-llvm-translator: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator: PV changed from "21.1.3" to "21.1.4"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-bin: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-bin: PV changed from "21.1.3" to "21.1.4"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PKGSIZE changed from 132440680 to 132495672 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PV changed from "21.1.3" to "21.1.4"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PKGSIZE changed from 26345 to 26362 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PV changed from "21.1.3" to "21.1.4"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-doc: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-doc: PV changed from "21.1.3" to "21.1.4"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-locale: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-locale: PV changed from "21.1.3" to "21.1.4"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PKGSIZE changed from 2415102 to 2416442 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: FILELIST: directory renamed /usr/src/debug/spirv-llvm-translator/21.1.3/lib/SPIRV/Mangler -> /usr/src/debug/spirv-llvm-translator/21.1.4/lib/SPIRV/Mangler, directory renamed /usr/src/debug/spirv-llvm-translator/21.1.3/include -> /usr/src/debug/spirv-llvm-translator/21.1.4/include, directory renamed /usr/src/debug/spirv-llvm-translator/21.1.3/lib/SPIRV/libSPIRV -> /usr/src/debug/spirv-llvm-translator/21.1.4/lib/SPIRV/libSPIRV, directory renamed /usr/src/debug/spirv-llvm-translator/21.1.3/tools/llvm-spirv -> /usr/src/debug/spirv-llvm-translator/21.1.4/tools/llvm-spirv, directory renamed /usr/src/debug/spirv-llvm-translator/21.1.3/lib/SPIRV -> /usr/src/debug/spirv-llvm-translator/21.1.4/lib/SPIRV
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PV changed from "21.1.3" to "21.1.4"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-staticdev: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-staticdev: PV changed from "21.1.3" to "21.1.4"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PKGSIZE changed from 5890576 to 5898800 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PV changed from "21.1.3" to "21.1.4"

--===============7083887607719593526==--

