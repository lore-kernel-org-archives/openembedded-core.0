Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06B4C19F20
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:15 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8650.1698848703595410194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QvY4VwQ6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pcXkZZa5;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.31, mailfrom: 0101018b8b46039a-19813a33-3787-4f8b-af0d-7fbede376b88-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xCRqeJ/fC0UnTLMdZNLH46tL8IDcTe5TfgE9H7EZ1uw=;
	b=QvY4VwQ65HsZd29RD4ZEIQKzGJE4MURcaTZP1EPKaF6VcejFhSyz7rRnL5hHWJNo
	g63pdObzxnek+Z/pcRgGqFJdfidmVdfOfrz/ppCW4ztOyWjQqkKR54a86TPo7HHfRg3
	yU/XVphpYKpezWe63KDPXG+uAsLSyOvGPpCTg2Ks=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xCRqeJ/fC0UnTLMdZNLH46tL8IDcTe5TfgE9H7EZ1uw=;
	b=pcXkZZa5YPmRf+bE7t3FU7sVsK20bL5RCMgo+j/eS0cJ87ZueonKLW06X7BClOuf
	IxSs69Gw5Ng2QtOcpSa1qvCLDZW0UiHmXWbyRel/IIvrW2CJLQKtGwrxTwb2tz3YrEd
	JszV5kEk9n3qfhvWvpEwtSa2UNP3Jy3YFzQcDoKc=
Content-Type: multipart/mixed; boundary="===============2414191574810890980=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors: upgrading to 41.0.5 SUCCEEDED
Message-ID: <0101018b8b46039a-19813a33-3787-4f8b-af0d-7fbede376b88-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189947

--===============2414191574810890980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography-vectors* to *41.0.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-vectors-upgrade-41.0.4-41.0.5.patch
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
From 9948ceb1c29e5516416519c7b73bab625fa26cd4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 08:31:19 +0000
Subject: [PATCH] python3-cryptography-vectors: upgrade 41.0.4 -> 41.0.5

---
 ...vectors_41.0.4.bb => python3-cryptography-vectors_41.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_41.0.4.bb => python3-cryptography-vectors_41.0.5.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
index 6b5d8adee9..44c67fdd76 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.4.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "440af2813ea7aeb52181ec651a36d9ae8f0976e8b3a62b411a800fe6fa57a19e"
+SRC_URI[sha256sum] = "75e82aea2982729312af735adb2983f347bb21fff88ad5dda3673ed70e1d1caf"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.39.2


--===============2414191574810890980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cryptography-vectors: PKGV changed from 41.0.4 [default] to 41.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors: PV changed from "41.0.4" to "41.0.5"
packages/core2-64-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-41.0.4.tar.gz;downloadfilename=cryptography_vectors-41.0.4.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-41.0.5.tar.gz;downloadfilename=cryptography_vectors-41.0.5.tar.gz"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 41.0.4 [default] to 41.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "41.0.4" to "41.0.5"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 41.0.4 [default] to 41.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "41.0.4" to "41.0.5"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 41.0.4 [default] to 41.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "41.0.4" to "41.0.5"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 41.0.4 [default] to 41.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "41.0.4" to "41.0.5"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 41.0.4 [default] to 41.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "41.0.4" to "41.0.5"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 41.0.4 [default] to 41.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "41.0.4" to "41.0.5"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 41.0.4 [default] to 41.0.5 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "41.0.4" to "41.0.5"
Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.11/site-packages/cryptography_vectors-41.0.4.dist-info moved to /usr/lib/python3.11/site-packages/cryptography_vectors-41.0.5.dist-info

--===============2414191574810890980==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-upgrade-41.0.4-41.0.5.patch"

RnJvbSA5OTQ4Y2ViMWMyOWU1NTE2NDE2NTE5YzdiNzNiYWI2MjVmYTI2Y2Q0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwODozMToxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnM6IHVwZ3JhZGUgNDEuMC40IC0+IDQxLjAuNQoKLS0t
CiAuLi52ZWN0b3JzXzQxLjAuNC5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzQx
LjAuNS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNyeXB0
b2dyYXBoeS12ZWN0b3JzXzQxLjAuNC5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3Jz
XzQxLjAuNS5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfNDEuMC40LmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzQxLjAuNS5iYgpz
aW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfNDEuMC40LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfNDEu
MC41LmJiCmluZGV4IDZiNWQ4YWRlZTkuLjQ0YzY3ZmRkNzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc180MS4wLjQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS12ZWN0b3JzXzQxLjAuNS5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9OGMzNjE3ZGI0ZmI2ZmFlMDFmMWQyNTNhYjkxNTExZTQgXAogIyBO
T1RFOiBNYWtlIHN1cmUgdG8ga2VlcCB0aGlzIHJlY2lwZSBhdCB0aGUgc2FtZSB2ZXJzaW9uIGFz
IHB5dGhvbjMtY3J5cHRvZ3JhcGh5CiAjICAgICAgIFVwZ3JhZGUgYm90aCByZWNpcGVzIGF0IHRo
ZSBzYW1lIHRpbWUKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ0MGFmMjgxM2VhN2FlYjUyMTgx
ZWM2NTFhMzZkOWFlOGYwOTc2ZThiM2E2MmI0MTFhODAwZmU2ZmE1N2ExOWUiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNzVlODJhZWEyOTgyNzI5MzEyYWY3MzVhZGIyOTgzZjM0N2JiMjFmZmY4OGFk
NWRkYTM2NzNlZDcwZTFkMWNhZiIKIAogUFlQSV9QQUNLQUdFID0gImNyeXB0b2dyYXBoeV92ZWN0
b3JzIgogCi0tIAoyLjM5LjIKCg==

--===============2414191574810890980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.11/site-packages/cryptography_vectors-41.0.4.dist-info moved to /usr/lib/python3.11/site-packages/cryptography_vectors-41.0.5.dist-info

--===============2414191574810890980==--

