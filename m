Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6932DC83F1A
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:12 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.1430.1751386808115691791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bBuXYUXR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Z/EVxDhk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010197c6c9dc26-72cef087-ce35-4e9e-a5d7-051ca0135c3d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386807;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=daOAt3nGtMtPLXxw2D6+Lc3DHRh90/+2sA05mdEnfAQ=;
	b=bBuXYUXRtm5peflT6HjNC+iE5DztvgU3G35NOwXJwEvcVnp+dO1U6tfSZtOgeiKz
	HC5Oe28cbHM4qifuIR8cAn6S79XruO78D7Mgz92lzblVHG8s9r7JewAwF4X2HUpKAaD
	j7E3I4GoYaWwkx9xrWqXe+AQCKSELfT/tfpBhzS0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386807;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=daOAt3nGtMtPLXxw2D6+Lc3DHRh90/+2sA05mdEnfAQ=;
	b=Z/EVxDhk3aeb5QybsinrIjNjC3uVIF/X5KCjk3ValVz/pTbaNA9JIuRicJ3GCxL5
	Ct3xOkKvfwgxL3dtUCri0b5GxqgFz+VfbTmiyd/4/JbBUhqV4hLVo6ydilnTu0Y0du+
	JwRapgEyLf7U18vH2SiTwBcY8zNGmpnkLUdQ+CLo=
Content-Type: multipart/mixed; boundary="===============6095770867385629790=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mobile-broadband-provider-info: upgrading to 20250613 SUCCEEDED
Message-ID: <01010197c6c9dc26-72cef087-ce35-4e9e-a5d7-051ca0135c3d-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219615

--===============6095770867385629790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mobile-broadband-provider-info* to *20250613* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mobile-broadband-provider-info-upgrade-20240407-2025.patch
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
From 9f69b0a89f6d658dacd7b1ddc58d3b82e39041b7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 07:38:29 +0000
Subject: [PATCH] mobile-broadband-provider-info: upgrade 20240407 -> 20250613

---
 ...o_20240407.bb => mobile-broadband-provider-info_20250613.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/mobile-broadband-provider-info/{mobile-broadband-provider-info_20240407.bb => mobile-broadband-provider-info_20250613.bb} (91%)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20240407.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb
similarity index 91%
rename from meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20240407.bb
rename to meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb
index 2e8702a045..ecc9464e2c 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20240407.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
-SRCREV = "55ba955d53305df96123534488fd160ea882b4dd"
+SRCREV = "2a1b409491a531aedcf3eb3ba907929d96bd181a"
 
 inherit meson
 
-- 
2.47.1


--===============6095770867385629790==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mobile-broadband-provider-info-upgrade-20240407-2025.patch"

RnJvbSA5ZjY5YjBhODlmNmQ2NThkYWNkN2IxZGRjNThkM2I4MmUzOTA0MWI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwNzozODoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1v
YmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mbzogdXBncmFkZSAyMDI0MDQwNyAtPiAyMDI1MDYx
MwoKLS0tCiAuLi5vXzIwMjQwNDA3LmJiID0+IG1vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5m
b18yMDI1MDYxMy5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vYmlsZS1icm9h
ZGJhbmQtcHJvdmlkZXItaW5mby97bW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvXzIwMjQw
NDA3LmJiID0+IG1vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mb18yMDI1MDYxMy5iYn0gKDkx
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vYmlsZS1icm9hZGJh
bmQtcHJvdmlkZXItaW5mby9tb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm9fMjAyNDA0MDcu
YmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXIt
aW5mby9tb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm9fMjAyNTA2MTMuYmIKc2ltaWxhcml0
eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb2JpbGUt
YnJvYWRiYW5kLXByb3ZpZGVyLWluZm8vbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvXzIw
MjQwNDA3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vYmlsZS1icm9h
ZGJhbmQtcHJvdmlkZXItaW5mby9tb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm9fMjAyNTA2
MTMuYmIKaW5kZXggMmU4NzAyYTA0NS4uZWNjOTQ2NGUyYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9tb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm8vbW9iaWxlLWJy
b2FkYmFuZC1wcm92aWRlci1pbmZvXzIwMjQwNDA3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvL21vYmlsZS1icm9hZGJhbmQt
cHJvdmlkZXItaW5mb18yMDI1MDYxMy5iYgpAQCAtOCw3ICs4LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ODc5NjQ1NzliMmE4ZWNlNGJjNjc0NGQyZGM5YThiMDQi
CiBQRSA9ICIxIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbW9i
aWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFp
biIKLVNSQ1JFViA9ICI1NWJhOTU1ZDUzMzA1ZGY5NjEyMzUzNDQ4OGZkMTYwZWE4ODJiNGRkIgor
U1JDUkVWID0gIjJhMWI0MDk0OTFhNTMxYWVkY2YzZWIzYmE5MDc5MjlkOTZiZDE4MWEiCiAKIGlu
aGVyaXQgbWVzb24KIAotLSAKMi40Ny4xCgo=

--===============6095770867385629790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mobile-broadband-provider-info: PKGV changed from 20240407 [default] to 20250613 [default]
packages/core2-64-poky-linux/mobile-broadband-provider-info: PV changed from "20240407" to "20250613"
packages/core2-64-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dbg: PKGV changed from 20240407 [default] to 20250613 [default]
packages/core2-64-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dbg: PV changed from "20240407" to "20250613"
packages/core2-64-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dev: PKGV changed from 20240407 [default] to 20250613 [default]
packages/core2-64-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dev: PV changed from "20240407" to "20250613"
packages/core2-64-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-doc: PKGV changed from 20240407 [default] to 20250613 [default]
packages/core2-64-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-doc: PV changed from "20240407" to "20250613"
packages/core2-64-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-locale: PKGV changed from 20240407 [default] to 20250613 [default]
packages/core2-64-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-locale: PV changed from "20240407" to "20250613"
packages/core2-64-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-src: PKGV changed from 20240407 [default] to 20250613 [default]
packages/core2-64-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-src: PV changed from "20240407" to "20250613"
packages/core2-64-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-staticdev: PKGV changed from 20240407 [default] to 20250613 [default]
packages/core2-64-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-staticdev: PV changed from "20240407" to "20250613"
packages/core2-64-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PKGV changed from 20240407 [default] to 20250613 [default]
packages/core2-64-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PKGSIZE changed from 512499 to 518547 (+1%)
packages/core2-64-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PV changed from "20240407" to "20250613"

--===============6095770867385629790==--

