Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B26C54E49
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:32 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.20152.1708018343881316405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=a1cWUcyU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dL1DmS8+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018dadd39c50-6af03613-f9a5-47ca-9e77-b07032b686ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pW5MvI8sCUxoYIbrgdV32LEITgdSUMQlmK5kvx5AvlA=;
	b=a1cWUcyUkLyP6vP5W1VGvJV9mfN39XUIpxsUUMSow/8ADlNfGtloyDIVOXNpFV+S
	bCZ5sPJ5y0sJZcyOAjM9DkXQhtQVQUSIo+JY+UE0myX4b9vpYrAmuRex7KuotD5trDm
	/FYeIrFW8/rgztPIc7V9+USjTaaaKakILKL7IBvA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pW5MvI8sCUxoYIbrgdV32LEITgdSUMQlmK5kvx5AvlA=;
	b=dL1DmS8+eyXbeg9bvtdjQd0J3jcN0aJekQRRBvD3GSd2Gy2FY0frTDRhPsYhMUz0
	GuOA0vugLwfgWJpy2XImAEDalP/oYyuTpjfYI61snyTjep0go4cIThnHqK8QyhuZytk
	xFszLVLCo7aRFcx68B3vHnMh+mx+ouRlISp9dtng=
Content-Type: multipart/mixed; boundary="===============5131409262191567686=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.62 SUCCEEDED
Message-ID: <0101018dadd39c50-6af03613-f9a5-47ca-9e77-b07032b686ff-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195560

--===============5131409262191567686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ell* to *0.62* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.61-0.62.patch
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
From 54805db3e8db6ae04f6ed27e76636a8abd0f86d6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 05:56:42 +0000
Subject: [PATCH] ell: upgrade 0.61 -> 0.62

---
 meta/recipes-core/ell/{ell_0.61.bb => ell_0.62.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.61.bb => ell_0.62.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.61.bb b/meta/recipes-core/ell/ell_0.62.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.61.bb
rename to meta/recipes-core/ell/ell_0.62.bb
index 5472714646..c6ec91afb4 100644
--- a/meta/recipes-core/ell/ell_0.61.bb
+++ b/meta/recipes-core/ell/ell_0.62.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c21ba3530d530c736f9b3e6acc954d4404c1ce4abaf2a4694e46ecec17653fa0"
+SRC_URI[sha256sum] = "f1efae12085610049714dc509c6fab3478925801609ad4232ce873b7daf1e03d"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.42.0


--===============5131409262191567686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ell/ell-dbg: PKGV changed from 0.61 [default] to 0.62 [default]
packages/core2-64-poky-linux/ell/ell-dbg: PKGSIZE changed from 1712064 to 1718568 (+0%)
packages/core2-64-poky-linux/ell/ell-dbg: PV changed from "0.61" to "0.62"
packages/core2-64-poky-linux/ell/ell-dev: PKGV changed from 0.61 [default] to 0.62 [default]
packages/core2-64-poky-linux/ell/ell-dev: PKGSIZE changed from 119717 to 120713 (+1%)
packages/core2-64-poky-linux/ell/ell-dev: PV changed from "0.61" to "0.62"
packages/core2-64-poky-linux/ell/ell-doc: PKGV changed from 0.61 [default] to 0.62 [default]
packages/core2-64-poky-linux/ell/ell-doc: PV changed from "0.61" to "0.62"
packages/core2-64-poky-linux/ell/ell-locale: PKGV changed from 0.61 [default] to 0.62 [default]
packages/core2-64-poky-linux/ell/ell-locale: PV changed from "0.61" to "0.62"
packages/core2-64-poky-linux/ell/ell-src: PKGV changed from 0.61 [default] to 0.62 [default]
packages/core2-64-poky-linux/ell/ell-src: PKGSIZE changed from 1393061 to 1397958 (+0%)
packages/core2-64-poky-linux/ell/ell-src: PV changed from "0.61" to "0.62"
packages/core2-64-poky-linux/ell/ell-staticdev: PKGV changed from 0.61 [default] to 0.62 [default]
packages/core2-64-poky-linux/ell/ell-staticdev: PV changed from "0.61" to "0.62"
packages/core2-64-poky-linux/ell/ell: PKGV changed from 0.61 [default] to 0.62 [default]
packages/core2-64-poky-linux/ell/ell: PV changed from "0.61" to "0.62"
packages/core2-64-poky-linux/ell: PKGV changed from 0.61 [default] to 0.62 [default]
packages/core2-64-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.61.tar.xz" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.62.tar.xz"
packages/core2-64-poky-linux/ell: PV changed from "0.61" to "0.62"

--===============5131409262191567686==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ell-upgrade-0.61-0.62.patch"

RnJvbSA1NDgwNWRiM2U4ZGI2YWUwNGY2ZWQyN2U3NjYzNmE4YWJkMGY4NmQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDU6NTY6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bGw6IHVwZ3JhZGUgMC42MSAtPiAwLjYyCgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL2VsbC97ZWxs
XzAuNjEuYmIgPT4gZWxsXzAuNjIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZWxsL3tlbGxf
MC42MS5iYiA9PiBlbGxfMC42Mi5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS9lbGwvZWxsXzAuNjEuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuNjIuYmIK
c2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2Vs
bF8wLjYxLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuNjIuYmIKaW5k
ZXggNTQ3MjcxNDY0Ni4uYzZlYzkxYWZiNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
ZWxsL2VsbF8wLjYxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC42Mi5iYgpA
QCAtMTUsNyArMTUsNyBAQCBERVBFTkRTID0gImRidXMiCiBpbmhlcml0IGF1dG90b29scyBwa2dj
b25maWcKIAogU1JDX1VSSSA9ICJodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi9s
aW51eC9saWJzLyR7QlBOfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImMyMWJhMzUzMGQ1MzBjNzM2ZjliM2U2YWNjOTU0ZDQ0MDRjMWNlNGFiYWYyYTQ2OTRlNDZl
Y2VjMTc2NTNmYTAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjFlZmFlMTIwODU2MTAwNDk3MTRk
YzUwOWM2ZmFiMzQ3ODkyNTgwMTYwOWFkNDIzMmNlODczYjdkYWYxZTAzZCIKIAogZG9fY29uZmln
dXJlOnByZXBlbmQgKCkgewogICAgIG1rZGlyIC1wICR7U30vYnVpbGQtYXV4Ci0tIAoyLjQyLjAK
Cg==

--===============5131409262191567686==--

