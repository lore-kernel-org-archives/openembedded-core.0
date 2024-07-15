Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777F0C52D6F
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:14 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1380.1721071148820887241
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LnRFOoeF;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=h4ZIpVZ9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010190b7d59c83-65803428-f459-4005-8147-dc7cfed60fdd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ae4wVb/DEIP+sMvexNNnkgltny2djmuGsICm7QNM5wQ=;
	b=LnRFOoeFYhZ4Q5VH9IyI/jtSjC1lVacBlXMnqOZxnGrA7SWGZuBFjtFvs+sh/IHB
	Vy6l4W4AfwHKmtT9nvkR5DKDsj5oYXTFgf/PcfK5c0L3hu2xv+Dn5CgKiS9kXrbQjSl
	lZecPRrIIF+QrMplZGh86dACfLOYk6Q4Gszdc7pE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071148;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ae4wVb/DEIP+sMvexNNnkgltny2djmuGsICm7QNM5wQ=;
	b=h4ZIpVZ9l+HBPk+uQ9hJ4vU7FarBDdYGWfhTSZwTsqui6z7E19owYx/rbqPiPddk
	try7IwXkT3wgrwRZWbkg7YvwbDV6sjzTliDB5wp7LeCuUDMJO61R3wn7v8NEerdlZVt
	ORuNTkPDlnSZC3BF04TFyhHA9TUTkskq0vqfxE70=
Content-Type: multipart/mixed; boundary="===============7392669172784379168=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.24.5 SUCCEEDED
Message-ID: <01010190b7d59c83-65803428-f459-4005-8147-dc7cfed60fdd-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202040

--===============7392669172784379168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-libav* to *1.24.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.24.4-1.24.5.patch
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
From e66a00e44b2e398c7e4668c627f971f6ee806262 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 16:08:07 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.24.4 -> 1.24.5

---
 ...streamer1.0-libav_1.24.4.bb => gstreamer1.0-libav_1.24.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.4.bb => gstreamer1.0-libav_1.24.5.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb
index dfd26f7df7..24c6c792c5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4d3803f36008e847fc4842c8dd366162baf8359526cc46c1851bf68bb638da73"
+SRC_URI[sha256sum] = "7fd16bdfa56ed51c40b474648fc35c4edde3e8ac934b12b82b49727b5d703521"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.44.0


--===============7392669172784379168==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.24.4-1.24.5.patch"

RnJvbSBlNjZhMDBlNDRiMmUzOThjN2U0NjY4YzYyN2Y5NzFmNmVlODA2MjYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTY6MDg6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtbGliYXY6IHVwZ3JhZGUgMS4yNC40IC0+IDEuMjQuNQoKLS0tCiAuLi5zdHJl
YW1lcjEuMC1saWJhdl8xLjI0LjQuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjQuNS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1saWJh
dl8xLjI0LjQuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjQuNS5iYn0gKDkxJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxp
YmF2XzEuMjQuNC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yNC41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZfMS4yNC40
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLWxpYmF2XzEuMjQuNS5iYgppbmRleCBkZmQyNmY3ZGY3Li4yNGM2Yzc5MmM1IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjQuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLWxpYmF2XzEuMjQuNS5iYgpAQCAtMTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT02OTMzM2RhYTA0NGNiNzdlNDg2Y2MzNjEyOWY3YTc3MCBc
CiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5m
cmVlZGVza3RvcC5vcmcvc3JjL2dzdC1saWJhdi9nc3QtbGliYXYtJHtQVn0udGFyLnh6IgotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjRkMzgwM2YzNjAwOGU4NDdmYzQ4NDJjOGRkMzY2MTYyYmFmODM1
OTUyNmNjNDZjMTg1MWJmNjhiYjYzOGRhNzMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2ZkMTZi
ZGZhNTZlZDUxYzQwYjQ3NDY0OGZjMzVjNGVkZGUzZThhYzkzNGIxMmI4MmI0OTcyN2I1ZDcwMzUy
MSIKIAogUyA9ICIke1dPUktESVJ9L2dzdC1saWJhdi0ke1BWfSIKIAotLSAKMi40NC4wCgo=

--===============7392669172784379168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.24.4 [default] to 1.24.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav: PV changed from "1.24.4" to "1.24.5"
packages/core2-64-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.24.4.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.24.5.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-libav: PKGV changed from 1.24.4 [default] to 1.24.5 [default]

--===============7392669172784379168==--

