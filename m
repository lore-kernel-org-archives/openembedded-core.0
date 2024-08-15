Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56FEC54E8F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:05 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.131412.1723748333004023832
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dKyizSEi;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=eX4IaADc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019157683e8b-a06c9cda-9e25-49f2-a859-b329c1044522-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Lwqz6MSpSVsWXeQkw/Ml5xEulfIMNzUjw47hAB17dZw=;
	b=dKyizSEiWMKyR2u06RmwujMGOBvktRkpu2+KDNiE7SUT/msICHZgw2UWII+jTlMb
	mamchthoiLpSFB+kKnHLAqwvi/WDPGqBqGFUx8lGQPLc6jAENDv+rknkq4neKDYyrcx
	PUDZ+XLX6lQ2j6bTDRvLxgt0tyF9JEMvs7K+F81g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Lwqz6MSpSVsWXeQkw/Ml5xEulfIMNzUjw47hAB17dZw=;
	b=eX4IaADcf2O7Y8RKJ7Q4XGTlQcaJM+8jF2/BJLbuWF1sez0KyBMZFy7sAzbMQFrX
	2p7flkiHZqWFunDhg7MEMUx+WE6xZw9eUTxivX2MxHmTUtfHvvDjrrj1k6sZKWn6nce
	LOLzwAsjbic6C/2XQbsSYJ6MMpPHFzydt52DyEUA=
Content-Type: multipart/mixed; boundary="===============0989053312486640407=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.24.6 SUCCEEDED
Message-ID: <0101019157683e8b-a06c9cda-9e25-49f2-a859-b329c1044522-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203430

--===============0989053312486640407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-libav* to *1.24.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.24.5-1.24.6.patch
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
From 51c337cf7d49726beb433c427a18c8ad5ff7f1ee Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 16:21:49 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.24.5 -> 1.24.6

---
 ...streamer1.0-libav_1.24.5.bb => gstreamer1.0-libav_1.24.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.5.bb => gstreamer1.0-libav_1.24.6.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
index 24c6c792c5..7a72f9120e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7fd16bdfa56ed51c40b474648fc35c4edde3e8ac934b12b82b49727b5d703521"
+SRC_URI[sha256sum] = "4bbd08481a390f907e342aa3f25ab885c80ec0a53f3b14244cf733cc8622f2bf"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.44.0


--===============0989053312486640407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGSIZE changed from 913048 to 905824 (-1%)
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGSIZE changed from 537167 to 534443 (-1%)
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.24.5" to "1.24.6"
packages/core2-64-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.24.5.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.24.6.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-libav: PKGV changed from 1.24.5 [default] to 1.24.6 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav: PV changed from "1.24.5" to "1.24.6"

--===============0989053312486640407==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.24.5-1.24.6.patch"

RnJvbSA1MWMzMzdjZjdkNDk3MjZiZWI0MzNjNDI3YTE4YzhhZDVmZjdmMWVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTY6MjE6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtbGliYXY6IHVwZ3JhZGUgMS4yNC41IC0+IDEuMjQuNgoKLS0tCiAuLi5zdHJl
YW1lcjEuMC1saWJhdl8xLjI0LjUuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjQuNi5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1saWJh
dl8xLjI0LjUuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjQuNi5iYn0gKDkxJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxp
YmF2XzEuMjQuNS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yNC42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZfMS4yNC41
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLWxpYmF2XzEuMjQuNi5iYgppbmRleCAyNGM2Yzc5MmM1Li43YTcyZjkxMjBlIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjQuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLWxpYmF2XzEuMjQuNi5iYgpAQCAtMTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT02OTMzM2RhYTA0NGNiNzdlNDg2Y2MzNjEyOWY3YTc3MCBc
CiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5m
cmVlZGVza3RvcC5vcmcvc3JjL2dzdC1saWJhdi9nc3QtbGliYXYtJHtQVn0udGFyLnh6IgotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjdmZDE2YmRmYTU2ZWQ1MWM0MGI0NzQ2NDhmYzM1YzRlZGRlM2U4
YWM5MzRiMTJiODJiNDk3MjdiNWQ3MDM1MjEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGJiZDA4
NDgxYTM5MGY5MDdlMzQyYWEzZjI1YWI4ODVjODBlYzBhNTNmM2IxNDI0NGNmNzMzY2M4NjIyZjJi
ZiIKIAogUyA9ICIke1dPUktESVJ9L2dzdC1saWJhdi0ke1BWfSIKIAotLSAKMi40NC4wCgo=

--===============0989053312486640407==--

