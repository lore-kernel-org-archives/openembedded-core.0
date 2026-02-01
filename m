Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8210FE65264
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:58 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29184.1769951561247612160
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SGxsweav;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hVZTgHKu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019c1955c2c9-35a3c3c5-9604-43e3-86fe-2e08d46061b3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951576;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Yr7SrFxrbiJ45uXoSVIYkwoVRU2fDJr8cwVwE/rkaOA=;
	b=SGxsweavs+VSwVfEUxKkuCkGDZaYrQGAyUEhRCYms6XzCezhIZ6FXjSxJx6DNhPG
	QBwNQqcCMK1zf7bJYqWtXj71phwhJ/Rdzo/7Oc8An6GXJSxIXVYaw6xLthe9VUnU7d1
	5zoIFHh2S5cJmaVMCGyuReHKfUuwOrvXpLR9bBhM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951576;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Yr7SrFxrbiJ45uXoSVIYkwoVRU2fDJr8cwVwE/rkaOA=;
	b=hVZTgHKuuQwfi+p6MI8+5psuogwJRDfesc7twq0CBLVlgQnTPfrdX9rnqRNFWIR1
	qtXvbHZfY2IU75cdl8Zj+jHslLXGt4zvJvQJ7TPLWbHGW5G8ngHXuLXmIGZfD9nq/+u
	AY8KrKZuqfM/0Gf+IkVxkYlg4aZPusYBFiSWxK4s=
Content-Type: multipart/mixed; boundary="===============4427382998108856702=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-llvm-translator: upgrading to 21.1.4 SUCCEEDED
Message-ID: <0101019c1955c2c9-35a3c3c5-9604-43e3-86fe-2e08d46061b3-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230311

--===============4427382998108856702==
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
From 4ebea5d03760052cd6c3f5856343afd7166e73c9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 12:02:43 +0000
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


--===============4427382998108856702==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-llvm-translator-upgrade-21.1.3-21.1.4.patch"

RnJvbSA0ZWJlYTVkMDM3NjAwNTJjZDZjM2Y1ODU2MzQzYWZkNzE2NmU3M2M5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMjowMjo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LWxsdm0tdHJhbnNsYXRvcjogdXBncmFkZSAyMS4xLjMgLT4gMjEuMS40CgotLS0KIC4uLmx2
bS10cmFuc2xhdG9yXzIxLjEuMy5iYiA9PiBzcGlydi1sbHZtLXRyYW5zbGF0b3JfMjEuMS40LmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3tzcGlydi1sbHZtLXRyYW5zbGF0b3Jf
MjEuMS4zLmJiID0+IHNwaXJ2LWxsdm0tdHJhbnNsYXRvcl8yMS4xLjQuYmJ9ICg5NCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtbGx2bS10cmFuc2xhdG9y
XzIxLjEuMy5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWxsdm0tdHJhbnNs
YXRvcl8yMS4xLjQuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtbGx2bS10cmFuc2xhdG9yXzIxLjEuMy5iYgpyZW5hbWUg
dG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtbGx2bS10cmFuc2xhdG9yXzIxLjEu
NC5iYgppbmRleCBmOGE3YjhmMzJlLi44MGFhNmE3Zjg3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1sbHZtLXRyYW5zbGF0b3JfMjEuMS4zLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWxsdm0tdHJhbnNsYXRvcl8yMS4xLjQuYmIK
QEAgLTYsNyArNiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UuVFhUO21k
NT00N2UzMTFhYTljYWVkZDFiM2FiZjA5OGJkNzgxNGQxZCIKIAogIyBwYXR0ZXJuOiBsbHZtX2Jy
YW5jaF8yMDAsIGN1cnJlbnRseSB0aGVyZSBhcmUgbm8gbWlub3IgcmVsZWFzZXMsIHNvLCBubyBs
bHZtX2JyYW5jaF8yMDEKIFNQSVJWX0JSQU5DSCA9ICJsbHZtX3JlbGVhc2VfJHtAb2UudXRpbHMu
dHJpbV92ZXJzaW9uKCcke1BWfScsIDEpLnJlcGxhY2UoJy4nLCAnJyl9MCIKLVNSQ1JFViA9ICJh
NzljODUyYjM2Nzg1NTg4MDMyYTJkZDdjMzlhYTE1ZWM0ZDI0YjIwIgorU1JDUkVWID0gIjc1MWQx
YmRlNDQwMjBjOGYzOTZlZDI0NmE3ZGUwNGI3NzIyYzA4NTciCiBTUkNfVVJJID0gIiBcCiAgICAg
Z2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvU1BJUlYtTExWTS1UcmFuc2xhdG9yO3Byb3Rv
Y29sPWh0dHBzO3RhZz12JHtQVn07YnJhbmNoPSR7U1BJUlZfQlJBTkNIfSBcCiAiCi0tIAoyLjQ3
LjEKCg==

--===============4427382998108856702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/spirv-llvm-translator: SRC_URI changed from "git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v21.1.3;branch=llvm_release_210" to "git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v21.1.4;branch=llvm_release_210"
packages/x86-64-v3-poky-linux/spirv-llvm-translator: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator: PV changed from "21.1.3" to "21.1.4"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-bin: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-bin: PV changed from "21.1.3" to "21.1.4"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PKGSIZE changed from 132436544 to 132490392 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dbg: PV changed from "21.1.3" to "21.1.4"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PKGSIZE changed from 26345 to 26362 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-dev: PV changed from "21.1.3" to "21.1.4"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-doc: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-doc: PV changed from "21.1.3" to "21.1.4"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-locale: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-locale: PV changed from "21.1.3" to "21.1.4"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: FILELIST: directory renamed /usr/src/debug/spirv-llvm-translator/21.1.3/lib/SPIRV/libSPIRV -> /usr/src/debug/spirv-llvm-translator/21.1.4/lib/SPIRV/libSPIRV, directory renamed /usr/src/debug/spirv-llvm-translator/21.1.3/lib/SPIRV/Mangler -> /usr/src/debug/spirv-llvm-translator/21.1.4/lib/SPIRV/Mangler, directory renamed /usr/src/debug/spirv-llvm-translator/21.1.3/include -> /usr/src/debug/spirv-llvm-translator/21.1.4/include, directory renamed /usr/src/debug/spirv-llvm-translator/21.1.3/lib/SPIRV -> /usr/src/debug/spirv-llvm-translator/21.1.4/lib/SPIRV, directory renamed /usr/src/debug/spirv-llvm-translator/21.1.3/tools/llvm-spirv -> /usr/src/debug/spirv-llvm-translator/21.1.4/tools/llvm-spirv
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PKGSIZE changed from 2415102 to 2416442 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-src: PV changed from "21.1.3" to "21.1.4"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-staticdev: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator-staticdev: PV changed from "21.1.3" to "21.1.4"
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PKGV changed from 21.1.3 [default] to 21.1.4 [default]
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PKGSIZE changed from 5890576 to 5898800 (+0%)
packages/x86-64-v3-poky-linux/spirv-llvm-translator/spirv-llvm-translator: PV changed from "21.1.3" to "21.1.4"

--===============4427382998108856702==--

