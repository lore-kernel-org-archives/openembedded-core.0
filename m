Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9E1D5E360
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17387.1765872133847192755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=x8ZGJplW;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IDpt/BZa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b262ee481-c3caa9af-9f0c-4c83-ba73-476b07ac6c2d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872166;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eIcQvK6bx3tZ+ssKtBvvHbYuaNFXC7fTKtWH3LrONk4=;
	b=x8ZGJplWpAimw/LuMGQ9GHCCz2r5TH0oyT+3wUwCIZtj4VokI+J1gi2Nt63usitW
	BZRwdcT3NjWPnXpLeMCzQnlLkWdlq8QAlRFbs5GwoLpuv4UlFMgLQOjopU1YC9W3e3y
	IqgcnL3uxtZsE8o4dISKDMigdCjbgapJ0IcbAt9Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872166;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eIcQvK6bx3tZ+ssKtBvvHbYuaNFXC7fTKtWH3LrONk4=;
	b=IDpt/BZa3EmySf4YLNzUMnuDcb/aowjFquVSOOZ2CEqueIiFbYPbDB/CecmSKT1c
	Y2XX3tnh+4iAx/Pe7JCrd2ao36tN6JaaA1hNPgfIeJ0QyPgcd8i4Rk+niTKTm2Rssxw
	NqH4e5qUf5BFtwPxLmQzwd2G8b+gHxUA1a/QjY6g=
Content-Type: multipart/mixed; boundary="===============1620415462339997068=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.26.9 SUCCEEDED
Message-ID: <0101019b262ee481-c3caa9af-9f0c-4c83-ba73-476b07ac6c2d-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227899

--===============1620415462339997068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-vaapi* to *1.26.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.26.7-1.26.9.patch
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
From f6b979ea0cac820c7eb2a85dd0b629842646bd24 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 06:13:39 +0000
Subject: [PATCH] gstreamer1.0-vaapi: upgrade 1.26.7 -> 1.26.9

---
 ...streamer1.0-vaapi_1.26.7.bb => gstreamer1.0-vaapi_1.26.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.26.7.bb => gstreamer1.0-vaapi_1.26.9.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
index e9515405ce..dc5055bb0c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "4885d4a02bb2f17c2af618879b5e77f1acdcedcba859aabd3b970550e2940a38"
+SRC_URI[sha256sum] = "bf989040404515dc9b042f4fdc49ff33a6dccf49d544736150e967b42665598e"
 
 S = "${UNPACKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.47.1


--===============1620415462339997068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-vaapi/1.26.7/gst/vaapi -> /usr/src/debug/gstreamer1.0-vaapi/1.26.9/gst/vaapi, directory renamed /usr/src/debug/gstreamer1.0-vaapi/1.26.7/gst-libs/gst/vaapi -> /usr/src/debug/gstreamer1.0-vaapi/1.26.9/gst-libs/gst/vaapi
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-vaapi: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.26.7.tar.xz" to "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.26.9.tar.xz"

--===============1620415462339997068==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.26.7-1.26.9.patch"

RnJvbSBmNmI5NzllYTBjYWM4MjBjN2ViMmE4NWRkMGI2Mjk4NDI2NDZiZDI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDY6MTM6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtdmFhcGk6IHVwZ3JhZGUgMS4yNi43IC0+IDEuMjYuOQoKLS0tCiAuLi5zdHJl
YW1lcjEuMC12YWFwaV8xLjI2LjcuYmIgPT4gZ3N0cmVhbWVyMS4wLXZhYXBpXzEuMjYuOS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC12YWFw
aV8xLjI2LjcuYmIgPT4gZ3N0cmVhbWVyMS4wLXZhYXBpXzEuMjYuOS5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXZh
YXBpXzEuMjYuNy5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtdmFhcGlfMS4yNi45LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGlfMS4yNi43
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXZhYXBpXzEuMjYuOS5iYgppbmRleCBlOTUxNTQwNWNlLi5kYzUwNTViYjBjIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXZhYXBp
XzEuMjYuNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXZhYXBpXzEuMjYuOS5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HLkxJQjttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUx
NmMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8k
e1JFQUxQTn0vJHtSRUFMUE59LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjQ4ODVkNGEwMmJiMmYxN2MyYWY2MTg4NzliNWU3N2YxYWNkY2VkY2JhODU5YWFiZDNiOTcwNTUw
ZTI5NDBhMzgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmY5ODkwNDA0MDQ1MTVkYzliMDQyZjRm
ZGM0OWZmMzNhNmRjY2Y0OWQ1NDQ3MzYxNTBlOTY3YjQyNjY1NTk4ZSIKIAogUyA9ICIke1VOUEFD
S0RJUn0vJHtSRUFMUE59LSR7UFZ9IgogREVQRU5EUyA9ICJsaWJ2YSBnc3RyZWFtZXIxLjAgZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtYmFzZSBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYWQiCi0tIAoyLjQ3
LjEKCg==

--===============1620415462339997068==--

