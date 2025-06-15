Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586BFC83027
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.8864.1749993282607658291
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PDrNQ/V7;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UnCllWVI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019773ba58e1-036e7de8-a2a0-43ac-aef0-af45796f1dee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8tn+tVRaMI3y3btxhQk5YlHzvHl0JrNYAli5R5k13AQ=;
	b=PDrNQ/V7IhHor3sjD3w3Gh0yz4vP/RbGVXBMBK26w3QRvJfI7HBbV1mtM9DwcOmq
	Tp+0PaZFpykbPDka+vrgNlWJnTDcKJfFL6qFYaay9uNbk1gOcyEHqOJ198QP4RWQ52i
	E9Dp1m3DHOyJxHhM7u5p8mz2XFAMGtWJW2Wzm3L0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8tn+tVRaMI3y3btxhQk5YlHzvHl0JrNYAli5R5k13AQ=;
	b=UnCllWVI2pSXKc3VZyGr/R83iWKco4mRry/dj4IdKhRZ/3pnPYf3ABBsGe5dr0nN
	J6+ZLW65fbmJUjQuzRljtzOIvoH/ToyKEIQFB4CyfanPjGeHLDMTf4sHZ+MRmGFG+hH
	ofNJfo2gg+1IhrX3M4OWxbV3TKts6R6jfhlSUnUY=
Content-Type: multipart/mixed; boundary="===============7330516394224121454=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.78 SUCCEEDED
Message-ID: <0101019773ba58e1-036e7de8-a2a0-43ac-aef0-af45796f1dee-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218661

--===============7330516394224121454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ell* to *0.78* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.76-0.78.patch
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
From f1ef614d0326d38f5b54756536aeb9fc9fa27384 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 07:16:20 +0000
Subject: [PATCH] ell: upgrade 0.76 -> 0.78

---
 meta/recipes-core/ell/{ell_0.76.bb => ell_0.78.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.76.bb => ell_0.78.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.76.bb b/meta/recipes-core/ell/ell_0.78.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.76.bb
rename to meta/recipes-core/ell/ell_0.78.bb
index fcc56e02f7..ad16426bad 100644
--- a/meta/recipes-core/ell/ell_0.76.bb
+++ b/meta/recipes-core/ell/ell_0.78.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a0bf2b5a78450c0c167e3f65c18452ffe4c0f179d48c2a3661e6afaca8017ef9"
+SRC_URI[sha256sum] = "28ee1a586b4891c96e68667a424684e64ad35120f345e89d6705bd4023d2d40a"
-- 
2.47.1


--===============7330516394224121454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ell/ell-dbg: PKGV changed from 0.76 [default] to 0.78 [default]
packages/core2-64-poky-linux/ell/ell-dbg: PV changed from "0.76" to "0.78"
packages/core2-64-poky-linux/ell/ell-dbg: PKGSIZE changed from 1771704 to 1773712 (+0%)
packages/core2-64-poky-linux/ell/ell-dev: PKGV changed from 0.76 [default] to 0.78 [default]
packages/core2-64-poky-linux/ell/ell-dev: PV changed from "0.76" to "0.78"
packages/core2-64-poky-linux/ell/ell-dev: PKGSIZE changed from 129808 to 130261 (+0%)
packages/core2-64-poky-linux/ell/ell-doc: PKGV changed from 0.76 [default] to 0.78 [default]
packages/core2-64-poky-linux/ell/ell-doc: PV changed from "0.76" to "0.78"
packages/core2-64-poky-linux/ell/ell-locale: PKGV changed from 0.76 [default] to 0.78 [default]
packages/core2-64-poky-linux/ell/ell-locale: PV changed from "0.76" to "0.78"
packages/core2-64-poky-linux/ell/ell-src: PKGV changed from 0.76 [default] to 0.78 [default]
packages/core2-64-poky-linux/ell/ell-src: PV changed from "0.76" to "0.78"
packages/core2-64-poky-linux/ell/ell-staticdev: PKGV changed from 0.76 [default] to 0.78 [default]
packages/core2-64-poky-linux/ell/ell-staticdev: PV changed from "0.76" to "0.78"
packages/core2-64-poky-linux/ell/ell: PKGV changed from 0.76 [default] to 0.78 [default]
packages/core2-64-poky-linux/ell/ell: PV changed from "0.76" to "0.78"
packages/core2-64-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.76.tar.xz" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.78.tar.xz"
packages/core2-64-poky-linux/ell: PKGV changed from 0.76 [default] to 0.78 [default]
packages/core2-64-poky-linux/ell: PV changed from "0.76" to "0.78"

--===============7330516394224121454==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ell-upgrade-0.76-0.78.patch"

RnJvbSBmMWVmNjE0ZDAzMjZkMzhmNWI1NDc1NjUzNmFlYjlmYzlmYTI3Mzg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDc6MTY6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bGw6IHVwZ3JhZGUgMC43NiAtPiAwLjc4CgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL2VsbC97ZWxs
XzAuNzYuYmIgPT4gZWxsXzAuNzguYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZWxsL3tlbGxf
MC43Ni5iYiA9PiBlbGxfMC43OC5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS9lbGwvZWxsXzAuNzYuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuNzguYmIK
c2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2Vs
bF8wLjc2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuNzguYmIKaW5k
ZXggZmNjNTZlMDJmNy4uYWQxNjQyNmJhZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
ZWxsL2VsbF8wLjc2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC43OC5iYgpA
QCAtMTUsNCArMTUsNCBAQCBERVBFTkRTID0gImRidXMiCiBpbmhlcml0IGF1dG90b29scyBwa2dj
b25maWcKIAogU1JDX1VSSSA9ICJodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi9s
aW51eC9saWJzLyR7QlBOfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImEwYmYyYjVhNzg0NTBjMGMxNjdlM2Y2NWMxODQ1MmZmZTRjMGYxNzlkNDhjMmEzNjYxZTZh
ZmFjYTgwMTdlZjkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjhlZTFhNTg2YjQ4OTFjOTZlNjg2
NjdhNDI0Njg0ZTY0YWQzNTEyMGYzNDVlODlkNjcwNWJkNDAyM2QyZDQwYSIKLS0gCjIuNDcuMQoK

--===============7330516394224121454==--

