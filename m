Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FC1C64E96
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:14 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.173796.1692224339564616974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=F+PiWbVl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CBRWQ75Y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a006e6cea-cc3b2515-11f9-43c6-b797-7843d27c9e91-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=urtVO9n03m76NgP3T0e0z8VXsuvCwrx7xrITVV/Zxaw=;
	b=F+PiWbVlN90LMVHYGIXARH4KsNhVO27yJhs+1ad2ljyqe+/GAlht0PseLQ9FxSZw
	oIIer+z35qzH3LMjJXACF6gnSmqCuWczNs6Id91TppYZgUxjlNHC4ZHd6CMT74iOwGc
	uRMHcFX7/eTz6KoKXgbX86PeB4YE4x6GzY9HoNZw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=urtVO9n03m76NgP3T0e0z8VXsuvCwrx7xrITVV/Zxaw=;
	b=CBRWQ75YuenHB8c3toT1C94jgMtirv75bNNppsya4mdPzOh8tDBYtLhsBM5QXa1/
	w8wAiC9hggaYrCGj2CrA1ILQbyP1B4efY9MB/X/gh2x93RbYjEAvnL14ryz9E7pO+Tt
	ETDCnVJnx8oBdZRnlqSB2jKHkBtYcpQOvoNGN9a0=
Content-Type: multipart/mixed; boundary="===============4635417503160952426=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.22.5 SUCCEEDED
Message-ID: <0101018a006e6cea-cc3b2515-11f9-43c6-b797-7843d27c9e91-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186236

--===============4635417503160952426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-libav* to *1.22.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.22.4-1.22.5.patch
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
From bf9772916dcfbebd953aef48daede36e919f9040 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 17:14:58 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.22.4 -> 1.22.5

---
 ...streamer1.0-libav_1.22.4.bb => gstreamer1.0-libav_1.22.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.4.bb => gstreamer1.0-libav_1.22.5.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.5.bb
index 4d59353e08..af9dc5d2d5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9a751bc740de768e791c37a95f0a924c6a41d12fd7f37f54ce6a4e834be122d3"
+SRC_URI[sha256sum] = "8583f0c1f4fcb01eed11fa1e3c21126543a8bd739ed4fc1db31f756a5ab01d9a"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.39.2


--===============4635417503160952426==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.22.4-1.22.5.patch"

RnJvbSBiZjk3NzI5MTZkY2ZiZWJkOTUzYWVmNDhkYWVkZTM2ZTkxOWY5MDQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMTc6MTQ6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtbGliYXY6IHVwZ3JhZGUgMS4yMi40IC0+IDEuMjIuNQoKLS0tCiAuLi5zdHJl
YW1lcjEuMC1saWJhdl8xLjIyLjQuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjIuNS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1saWJh
dl8xLjIyLjQuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjIuNS5iYn0gKDkxJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxp
YmF2XzEuMjIuNC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yMi41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZfMS4yMi40
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLWxpYmF2XzEuMjIuNS5iYgppbmRleCA0ZDU5MzUzZTA4Li5hZjlkYzVkMmQ1IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjIuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLWxpYmF2XzEuMjIuNS5iYgpAQCAtMTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT02OTMzM2RhYTA0NGNiNzdlNDg2Y2MzNjEyOWY3YTc3MCBc
CiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5m
cmVlZGVza3RvcC5vcmcvc3JjL2dzdC1saWJhdi9nc3QtbGliYXYtJHtQVn0udGFyLnh6IgotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjlhNzUxYmM3NDBkZTc2OGU3OTFjMzdhOTVmMGE5MjRjNmE0MWQx
MmZkN2YzN2Y1NGNlNmE0ZTgzNGJlMTIyZDMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODU4M2Yw
YzFmNGZjYjAxZWVkMTFmYTFlM2MyMTEyNjU0M2E4YmQ3MzllZDRmYzFkYjMxZjc1NmE1YWIwMWQ5
YSIKIAogUyA9ICIke1dPUktESVJ9L2dzdC1saWJhdi0ke1BWfSIKIAotLSAKMi4zOS4yCgo=

--===============4635417503160952426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.22.4 [default] to 1.22.5 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav: PV changed from "1.22.4" to "1.22.5"
packages/core2-32-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.22.4.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.22.5.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-libav: PKGV changed from 1.22.4 [default] to 1.22.5 [default]

--===============4635417503160952426==--

