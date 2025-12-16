Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614D7D5E368
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:51 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17197.1765872154647957023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=c6MSc+LW;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=AjiPZvNU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019b262ee2c3-1a52ccd3-46c1-45d3-bda1-fc32c8421c56-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kjvRNPuO4B5LfkHiGu528gSDk7lPiA8yTyolalnz81Y=;
	b=c6MSc+LWB5eDyksA8Zkl4fSTgZZtSkI6y1jtXtwXOt38AF40k8UAzWNu0bumLQIA
	/tZStuxsk46Z6cmqVczBFbHgcLZCgpba+br5cQBn9uEhpjbzoZPL2T785fjoLE67oDL
	aQN1/RsEqhdYCYGTMUWlC4EPtjmQbrX0VJfx5P1I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kjvRNPuO4B5LfkHiGu528gSDk7lPiA8yTyolalnz81Y=;
	b=AjiPZvNUFfngPPZrTSwiyM9CVGfsNz6npjKeBSi/9NDsImwqr1E7BfOvxNAWoq/J
	ECuXX9sVBCtBEs/X/0WMjWaImV782258AxJkCGVE3AnvTOVO42Yjn4L4gqW141m7TLe
	LFY3pEmrPrWErqF0Wm36S0OQafyPMYFpD6twsHpA=
Content-Type: multipart/mixed; boundary="===============0589978049449202254=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.26.9 SUCCEEDED
Message-ID: <0101019b262ee2c3-1a52ccd3-46c1-45d3-bda1-fc32c8421c56-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227896

--===============0589978049449202254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-libav* to *1.26.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.26.7-1.26.9.patch
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
From 7acdf0e43b664ee4f8bab93a233badf21b3b7d64 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 06:06:23 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.26.7 -> 1.26.9

---
 ...streamer1.0-libav_1.26.7.bb => gstreamer1.0-libav_1.26.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.7.bb => gstreamer1.0-libav_1.26.9.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
index aa6c431daa..a652dbba33 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "91d4a7a14527d97fe0ce7ccedb3554e8f692b216429ef2b1850944bbf5435c09"
+SRC_URI[sha256sum] = "08a8e944fc61ef26df515784a089c8ac41765304a5d55b98199835b28a98dbdf"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
-- 
2.47.1


--===============0589978049449202254==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.26.7-1.26.9.patch"

RnJvbSA3YWNkZjBlNDNiNjY0ZWU0ZjhiYWI5M2EyMzNiYWRmMjFiM2I3ZDY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDY6MDY6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtbGliYXY6IHVwZ3JhZGUgMS4yNi43IC0+IDEuMjYuOQoKLS0tCiAuLi5zdHJl
YW1lcjEuMC1saWJhdl8xLjI2LjcuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjYuOS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1saWJh
dl8xLjI2LjcuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjYuOS5iYn0gKDkxJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxp
YmF2XzEuMjYuNy5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yNi45LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZfMS4yNi43
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLWxpYmF2XzEuMjYuOS5iYgppbmRleCBhYTZjNDMxZGFhLi5hNjUyZGJiYTMzIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjYuNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLWxpYmF2XzEuMjYuOS5iYgpAQCAtMTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT02OTMzM2RhYTA0NGNiNzdlNDg2Y2MzNjEyOWY3YTc3MCBc
CiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5m
cmVlZGVza3RvcC5vcmcvc3JjL2dzdC1saWJhdi9nc3QtbGliYXYtJHtQVn0udGFyLnh6IgotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjkxZDRhN2ExNDUyN2Q5N2ZlMGNlN2NjZWRiMzU1NGU4ZjY5MmIy
MTY0MjllZjJiMTg1MDk0NGJiZjU0MzVjMDkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDhhOGU5
NDRmYzYxZWYyNmRmNTE1Nzg0YTA4OWM4YWM0MTc2NTMwNGE1ZDU1Yjk4MTk5ODM1YjI4YTk4ZGJk
ZiIKIAogUyA9ICIke1VOUEFDS0RJUn0vZ3N0LWxpYmF2LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============0589978049449202254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-libav/1.26.7/ext/libav -> /usr/src/debug/gstreamer1.0-libav/1.26.9/ext/libav
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.26.7.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.26.9.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: PV changed from "1.26.7" to "1.26.9"

--===============0589978049449202254==--

