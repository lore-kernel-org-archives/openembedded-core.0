Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1FBC25B64
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:15:00 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.22311.1701436490326875064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QsKhCnDO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=A2lcyfJo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018c258484e1-b3905484-b9a1-42b7-851d-8e783b3d0e43-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rA/LyBUh35hXD5p6OGF79WAqZCykBUcfNvphAcgDeQs=;
	b=QsKhCnDOemL3LmVnX7Wg0DL5jH0DsPBjlGHmnWBr9xSFshdzeUzDCBBn9O/1t2yH
	LIplGAKSQDzzYkj0/opMweWpE8O/NYK/hEWMEJpRi3DXPboz4jU9V5v/QctnCRZRsg1
	D6cXwCn8n1/UvX+K2y6aEonaRujr7hlSaVtMsQmo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436491;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rA/LyBUh35hXD5p6OGF79WAqZCykBUcfNvphAcgDeQs=;
	b=A2lcyfJoB42qADHaGC6YOh8IyxslLzDKS0BPQgayFgpKeA9ZItr/l03vx3OkzIku
	2Kg+LYaqSlG34yP1x10gMhXTAV+kzXO09NFoe8OS4ep96CfOxPtI0xTjqlW1mIViMt1
	JQRwdgxHU+mKWYoLq7XaIvD9uij7+JXEora3l8OE=
Content-Type: multipart/mixed; boundary="===============2496650453032323773=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors: upgrading to 41.0.7 SUCCEEDED
Message-ID: <0101018c258484e1-b3905484-b9a1-42b7-851d-8e783b3d0e43-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191582

--===============2496650453032323773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography-vectors* to *41.0.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-vectors-upgrade-41.0.5-41.0.7.patch
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
From c8057f02aada839f9d22eb7bcf13673373f352d6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 08:24:15 +0000
Subject: [PATCH] python3-cryptography-vectors: upgrade 41.0.5 -> 41.0.7

---
 ...vectors_41.0.5.bb => python3-cryptography-vectors_41.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_41.0.5.bb => python3-cryptography-vectors_41.0.7.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.7.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_41.0.7.bb
index 44c67fdd76..4bfdb5f100 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.7.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "75e82aea2982729312af735adb2983f347bb21fff88ad5dda3673ed70e1d1caf"
+SRC_URI[sha256sum] = "7b36f976b6e58cc1801310e1c93c584c6539d371da7f8538edd8fc463dc80d5b"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.39.2


--===============2496650453032323773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-cryptography-vectors: PKGV changed from 41.0.5 [default] to 41.0.7 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors: PV changed from "41.0.5" to "41.0.7"
packages/core2-64-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-41.0.5.tar.gz;downloadfilename=cryptography_vectors-41.0.5.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-41.0.7.tar.gz;downloadfilename=cryptography_vectors-41.0.7.tar.gz"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 41.0.5 [default] to 41.0.7 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "41.0.5" to "41.0.7"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 41.0.5 [default] to 41.0.7 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "41.0.5" to "41.0.7"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 41.0.5 [default] to 41.0.7 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "41.0.5" to "41.0.7"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 41.0.5 [default] to 41.0.7 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "41.0.5" to "41.0.7"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 41.0.5 [default] to 41.0.7 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "41.0.5" to "41.0.7"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 41.0.5 [default] to 41.0.7 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "41.0.5" to "41.0.7"
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 41.0.5 [default] to 41.0.7 [default]
packages/core2-64-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "41.0.5" to "41.0.7"
Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.11/site-packages/cryptography_vectors-41.0.5.dist-info moved to /usr/lib/python3.11/site-packages/cryptography_vectors-41.0.7.dist-info

--===============2496650453032323773==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-upgrade-41.0.5-41.0.7.patch"

RnJvbSBjODA1N2YwMmFhZGE4MzlmOWQyMmViN2JjZjEzNjczMzczZjM1MmQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAwODoyNDoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnM6IHVwZ3JhZGUgNDEuMC41IC0+IDQxLjAuNwoKLS0t
CiAuLi52ZWN0b3JzXzQxLjAuNS5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzQx
LjAuNy5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNyeXB0
b2dyYXBoeS12ZWN0b3JzXzQxLjAuNS5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3Jz
XzQxLjAuNy5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfNDEuMC41LmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzQxLjAuNy5iYgpz
aW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfNDEuMC41LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfNDEu
MC43LmJiCmluZGV4IDQ0YzY3ZmRkNzYuLjRiZmRiNWYxMDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc180MS4wLjUu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS12ZWN0b3JzXzQxLjAuNy5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9OGMzNjE3ZGI0ZmI2ZmFlMDFmMWQyNTNhYjkxNTExZTQgXAogIyBO
T1RFOiBNYWtlIHN1cmUgdG8ga2VlcCB0aGlzIHJlY2lwZSBhdCB0aGUgc2FtZSB2ZXJzaW9uIGFz
IHB5dGhvbjMtY3J5cHRvZ3JhcGh5CiAjICAgICAgIFVwZ3JhZGUgYm90aCByZWNpcGVzIGF0IHRo
ZSBzYW1lIHRpbWUKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc1ZTgyYWVhMjk4MjcyOTMxMmFm
NzM1YWRiMjk4M2YzNDdiYjIxZmZmODhhZDVkZGEzNjczZWQ3MGUxZDFjYWYiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiN2IzNmY5NzZiNmU1OGNjMTgwMTMxMGUxYzkzYzU4NGM2NTM5ZDM3MWRhN2Y4
NTM4ZWRkOGZjNDYzZGM4MGQ1YiIKIAogUFlQSV9QQUNLQUdFID0gImNyeXB0b2dyYXBoeV92ZWN0
b3JzIgogCi0tIAoyLjM5LjIKCg==

--===============2496650453032323773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.11/site-packages/cryptography_vectors-41.0.5.dist-info moved to /usr/lib/python3.11/site-packages/cryptography_vectors-41.0.7.dist-info

--===============2496650453032323773==--

