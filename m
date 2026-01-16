Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6B8D4A5ED
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:06 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1484.1768526754809234104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IjC0IV+0;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=atxLXRFl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019bc468b1d6-23c5cd5a-280d-4fc1-9caf-59d055cdbe5b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526754;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tNCFAJD7RXwyvxY+Bc+oQBddL/6dzXsZe4OZa7ru8j8=;
	b=IjC0IV+0dFDCkeAqlBWH4xE0Mp80vs/q7toxGDESytkc7IyyRjKhYQ9R00LmHoY8
	pwAS7eJQeuj97yQXN7dNRtlv1tedcARkhLPbkryK+wijTyktKijgEG9ySSjlygzH1A8
	9RyDS8xF1YTJx6taNzbEr45rqzmX4eR5N8/jymak=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526754;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tNCFAJD7RXwyvxY+Bc+oQBddL/6dzXsZe4OZa7ru8j8=;
	b=atxLXRFlESj0LzMyEjMaqa8oJvx3N4UJxoFnLvXbJ/PUy2A/NWVYOT2iBA6Vjjon
	5DQTCDfHSby7vkpCu8dqcGyyXPp00irpEc6PjhQru/fPFQL/9nN9sL/zFCvDwt0D8b9
	Rf6DhJInWdX5YG1t6xsIEmQWjSse0WDGtkaghwG8=
Content-Type: multipart/mixed; boundary="===============7975818427521173321=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xorgproto: upgrading to 2025.1 SUCCEEDED
Message-ID: <0101019bc468b1d6-23c5cd5a-280d-4fc1-9caf-59d055cdbe5b-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229492

--===============7975818427521173321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xorgproto* to *2025.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xorgproto-upgrade-2024.1-2025.1.patch
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
From d408ea49ee3a00957c138ad984b009cd3e89ab39 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jan 2026 00:05:16 +0000
Subject: [PATCH] xorgproto: upgrade 2024.1 -> 2025.1

---
 .../xorg-proto/{xorgproto_2024.1.bb => xorgproto_2025.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-proto/{xorgproto_2024.1.bb => xorgproto_2025.1.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb
rename to meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
index d79dc23f1b..e187c56fbc 100644
--- a/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=0b9fe3db4015bcbe920e7c67a39ee3f1"
 
 SRC_URI = "${XORG_MIRROR}/individual/proto/${BP}.tar.xz"
-SRC_URI[sha256sum] = "372225fd40815b8423547f5d890c5debc72e88b91088fbfb13158c20495ccb59"
+SRC_URI[sha256sum] = "56898c716c0578df8a2d828c9c3e5c528277705c0484381a81960fe1a67668e8"
 
 inherit meson
 
-- 
2.47.1


--===============7975818427521173321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xorgproto: PKGV changed from 2024.1 [default] to 2025.1 [default]
packages/x86-64-v3-poky-linux/xorgproto: SRC_URI changed from "https://www.x.org/releases//individual/proto/xorgproto-2024.1.tar.xz" to "https://www.x.org/releases//individual/proto/xorgproto-2025.1.tar.xz"
packages/x86-64-v3-poky-linux/xorgproto: PV changed from "2024.1" to "2025.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dbg: PKGV changed from 2024.1 [default] to 2025.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dbg: PV changed from "2024.1" to "2025.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dev: PKGV changed from 2024.1 [default] to 2025.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dev: PV changed from "2024.1" to "2025.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-dev: PKGSIZE changed from 1169393 to 1183251 (+1%)
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-doc: PKGV changed from 2024.1 [default] to 2025.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-doc: PV changed from "2024.1" to "2025.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-doc: PKGSIZE changed from 303975 to 303973 (-0%)
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-locale: PKGV changed from 2024.1 [default] to 2025.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-locale: PV changed from "2024.1" to "2025.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-src: PKGV changed from 2024.1 [default] to 2025.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-src: PV changed from "2024.1" to "2025.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-staticdev: PKGV changed from 2024.1 [default] to 2025.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto-staticdev: PV changed from "2024.1" to "2025.1"
packages/x86-64-v3-poky-linux/xorgproto/xorgproto: PKGV changed from 2024.1 [default] to 2025.1 [default]
packages/x86-64-v3-poky-linux/xorgproto/xorgproto: PV changed from "2024.1" to "2025.1"

--===============7975818427521173321==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xorgproto-upgrade-2024.1-2025.1.patch"

RnJvbSBkNDA4ZWE0OWVlM2EwMDk1N2MxMzhhZDk4NGIwMDljZDNlODlhYjM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSmFuIDIwMjYgMDA6MDU6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
b3JncHJvdG86IHVwZ3JhZGUgMjAyNC4xIC0+IDIwMjUuMQoKLS0tCiAuLi4veG9yZy1wcm90by97
eG9yZ3Byb3RvXzIwMjQuMS5iYiA9PiB4b3JncHJvdG9fMjAyNS4xLmJifSAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1wcm90by97eG9yZ3Byb3RvXzIwMjQuMS5iYiA9PiB4b3Jn
cHJvdG9fMjAyNS4xLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLXByb3RvL3hvcmdwcm90b18yMDI0LjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
eG9yZy1wcm90by94b3JncHJvdG9fMjAyNS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXByb3RvL3hvcmdwcm90b18yMDI0LjEu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXByb3RvL3hvcmdwcm90b18y
MDI1LjEuYmIKaW5kZXggZDc5ZGMyM2YxYi4uZTE4N2M1NmZiYyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3hvcmctcHJvdG8veG9yZ3Byb3RvXzIwMjQuMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1wcm90by94b3JncHJvdG9fMjAyNS4xLmJiCkBAIC05LDcg
KzksNyBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJ
TkcteDExcHJvdG87bWQ1PTBiOWZlM2RiNDAxNWJjYmU5MjBlN2M2N2EzOWVlM2YxIgogCiBTUkNf
VVJJID0gIiR7WE9SR19NSVJST1J9L2luZGl2aWR1YWwvcHJvdG8vJHtCUH0udGFyLnh6IgotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjM3MjIyNWZkNDA4MTViODQyMzU0N2Y1ZDg5MGM1ZGViYzcyZTg4
YjkxMDg4ZmJmYjEzMTU4YzIwNDk1Y2NiNTkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTY4OThj
NzE2YzA1NzhkZjhhMmQ4MjhjOWMzZTVjNTI4Mjc3NzA1YzA0ODQzODFhODE5NjBmZTFhNjc2Njhl
OCIKIAogaW5oZXJpdCBtZXNvbgogCi0tIAoyLjQ3LjEKCg==

--===============7975818427521173321==--

