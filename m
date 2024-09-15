Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A954FC3ABAD
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:22 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.115630.1726410840308063020
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=H42zeJHq;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=trFgm/LC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010191f61ad634-23c8bbbf-3d97-4563-8a3d-cf64c224eeed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410839;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aJShCrzJOm6ipLDa13GCQaI67UE4JN//Uk84iQjgdwc=;
	b=H42zeJHqAY5YF6CLZPdOxuzUQ4cijzwrYSqXOhMAA8xCDzxsGe3HYTr3QyMGHJCL
	gtLF0NO0YlXVkYWZ6hfvaDqufFTEv2GoYh3+oQAF0yhPEGvOyu3EvpMJFYm16ur+RsW
	XpNMEVNRbhHq1p6eddHpaz/rmeo60E9X+SWw4aDU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410839;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aJShCrzJOm6ipLDa13GCQaI67UE4JN//Uk84iQjgdwc=;
	b=trFgm/LCYvUgc93hCL/YpW4kpNBn7+LCt1/zIgbPoNIKa3jq6d55JI0PnaW5oi0j
	qlxGE2XVuLVVBsJYuksxS0WHSz5cd4B1sdbCQfLcM1+dJwrZSPkMDI0KNofIMCSN6p/
	F4CPgE/x/EayFj458z6Oea9AcEEdFe297BP2VLos=
Content-Type: multipart/mixed; boundary="===============0761115646707116048=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.69 SUCCEEDED
Message-ID: <01010191f61ad634-23c8bbbf-3d97-4563-8a3d-cf64c224eeed-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:33:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204509

--===============0761115646707116048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ell* to *0.69* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.68-0.69.patch
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
From 2783ccb7abf568152f36f5a0271df2e6a0c7947d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 07:42:28 +0000
Subject: [PATCH] ell: upgrade 0.68 -> 0.69

---
 meta/recipes-core/ell/{ell_0.68.bb => ell_0.69.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.68.bb => ell_0.69.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.68.bb b/meta/recipes-core/ell/ell_0.69.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.68.bb
rename to meta/recipes-core/ell/ell_0.69.bb
index 40c057afc2..a9060e3762 100644
--- a/meta/recipes-core/ell/ell_0.68.bb
+++ b/meta/recipes-core/ell/ell_0.69.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ddcbf381d758f61a02954bf5d2907c8900462abb7b2dcf45589874978bc10125"
+SRC_URI[sha256sum] = "6cfc0888edc94de9f0623798609587b2cc11b92b892945f317e8d199afe7b12e"
-- 
2.44.0


--===============0761115646707116048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ell/ell-dbg: PV changed from "0.68" to "0.69"
packages/core2-64-poky-linux/ell/ell-dbg: PKGV changed from 0.68 [default] to 0.69 [default]
packages/core2-64-poky-linux/ell/ell-dbg: PKGSIZE changed from 1730216 to 1734712 (+0%)
packages/core2-64-poky-linux/ell/ell-dev: PV changed from "0.68" to "0.69"
packages/core2-64-poky-linux/ell/ell-dev: PKGV changed from 0.68 [default] to 0.69 [default]
packages/core2-64-poky-linux/ell/ell-dev: PKGSIZE changed from 127722 to 128951 (+1%)
packages/core2-64-poky-linux/ell/ell-doc: PV changed from "0.68" to "0.69"
packages/core2-64-poky-linux/ell/ell-doc: PKGV changed from 0.68 [default] to 0.69 [default]
packages/core2-64-poky-linux/ell/ell-locale: PV changed from "0.68" to "0.69"
packages/core2-64-poky-linux/ell/ell-locale: PKGV changed from 0.68 [default] to 0.69 [default]
packages/core2-64-poky-linux/ell/ell-src: PV changed from "0.68" to "0.69"
packages/core2-64-poky-linux/ell/ell-src: PKGV changed from 0.68 [default] to 0.69 [default]
packages/core2-64-poky-linux/ell/ell-src: PKGSIZE changed from 1415737 to 1418914 (+0%)
packages/core2-64-poky-linux/ell/ell-staticdev: PV changed from "0.68" to "0.69"
packages/core2-64-poky-linux/ell/ell-staticdev: PKGV changed from 0.68 [default] to 0.69 [default]
packages/core2-64-poky-linux/ell/ell: PV changed from "0.68" to "0.69"
packages/core2-64-poky-linux/ell/ell: PKGV changed from 0.68 [default] to 0.69 [default]
packages/core2-64-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.68.tar.xz" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.69.tar.xz"
packages/core2-64-poky-linux/ell: PV changed from "0.68" to "0.69"
packages/core2-64-poky-linux/ell: PKGV changed from 0.68 [default] to 0.69 [default]

--===============0761115646707116048==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ell-upgrade-0.68-0.69.patch"

RnJvbSAyNzgzY2NiN2FiZjU2ODE1MmYzNmY1YTAyNzFkZjJlNmEwYzc5NDdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDc6NDI6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bGw6IHVwZ3JhZGUgMC42OCAtPiAwLjY5CgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL2VsbC97ZWxs
XzAuNjguYmIgPT4gZWxsXzAuNjkuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZWxsL3tlbGxf
MC42OC5iYiA9PiBlbGxfMC42OS5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS9lbGwvZWxsXzAuNjguYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuNjkuYmIK
c2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2Vs
bF8wLjY4LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuNjkuYmIKaW5k
ZXggNDBjMDU3YWZjMi4uYTkwNjBlMzc2MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
ZWxsL2VsbF8wLjY4LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC42OS5iYgpA
QCAtMTUsNCArMTUsNCBAQCBERVBFTkRTID0gImRidXMiCiBpbmhlcml0IGF1dG90b29scyBwa2dj
b25maWcKIAogU1JDX1VSSSA9ICJodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi9s
aW51eC9saWJzLyR7QlBOfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImRkY2JmMzgxZDc1OGY2MWEwMjk1NGJmNWQyOTA3Yzg5MDA0NjJhYmI3YjJkY2Y0NTU4OTg3
NDk3OGJjMTAxMjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmNmYzA4ODhlZGM5NGRlOWYwNjIz
Nzk4NjA5NTg3YjJjYzExYjkyYjg5Mjk0NWYzMTdlOGQxOTlhZmU3YjEyZSIKLS0gCjIuNDQuMAoK

--===============0761115646707116048==--

