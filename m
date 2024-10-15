Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2176CFC536
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:15:50 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11791.1728994550332482951
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dpqeB37B;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ARyqAJOj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010192901b1f17-1548e0d1-cbf1-49e4-a01b-9a02aad83f90-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pJVpMu3ZZWHmINaYnYeoKwyHVyrWbe8RcHbmH/W45iE=;
	b=dpqeB37BjQydp87SJ1xrANcicSf98IjwLbnJpXgvsCY9reZxfnV46XkGfCk3rIPN
	mG0t13nbLEGzdt4Opypm83SQQpyGC7wtuGI5ledvRLrU5A81MTGeZUGMfUC3LLPyAgz
	88DwHn7r31Ni7yQlXg3K0LpzNT7DpHJF978uPJZo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pJVpMu3ZZWHmINaYnYeoKwyHVyrWbe8RcHbmH/W45iE=;
	b=ARyqAJOjLjVw1SGDvcjFHn0wYk0pPZyDqC/xIKw5f7fa69U+R3FLKDT9vT2sBU46
	QO2OQTFhdmtD4r5/12+OL3pAKSmbOFpiKes9V2yXokXQeMb6rDveoeduzmilxegg0Q0
	hdajkXSKkxs4gOdXsFLjOOOggLYTYdQl9wDyOwMY=
Content-Type: multipart/mixed; boundary="===============0242969616631905634=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2024.09.0 SUCCEEDED
Message-ID: <01010192901b1f17-1548e0d1-cbf1-49e4-a01b-9a02aad83f90-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205820

--===============0242969616631905634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2024.09.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2024.08.0-2024.09.0.patch
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
From 29b83ed1eddb15721881f39cdd02ec279e52f8c6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 07:07:37 +0000
Subject: [PATCH] barebox-tools: upgrade 2024.08.0 -> 2024.09.0

---
 .../{barebox-tools_2024.08.0.bb => barebox-tools_2024.09.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/barebox/{barebox-tools_2024.08.0.bb => barebox-tools_2024.09.0.bb} (93%)

diff --git a/meta/recipes-bsp/barebox/barebox-tools_2024.08.0.bb b/meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb
similarity index 93%
rename from meta/recipes-bsp/barebox/barebox-tools_2024.08.0.bb
rename to meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb
index ed49ce5373..13a308b3da 100644
--- a/meta/recipes-bsp/barebox/barebox-tools_2024.08.0.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 DEPENDS = "bison-native flex-native libusb1"
 
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "b08a762da8d63dd18b4f2d9f5d0a8da001b6e608d1b3eff6dcebc6a2e575d535"
+SRC_URI[sha256sum] = "4d4ea7e232aeba2b3cb9ccf0dbf8cd8e01c65b6c615f64c3bd0c4f24f23a47da"
 
 S = "${WORKDIR}/barebox-${PV}"
 B = "${WORKDIR}/build"
-- 
2.44.1


--===============0242969616631905634==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2024.08.0-2024.09.0.patch"

RnJvbSAyOWI4M2VkMWVkZGIxNTcyMTg4MWYzOWNkZDAyZWMyNzllNTJmOGM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDc6MDc6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXJlYm94LXRvb2xzOiB1cGdyYWRlIDIwMjQuMDguMCAtPiAyMDI0LjA5LjAKCi0tLQogLi4uL3ti
YXJlYm94LXRvb2xzXzIwMjQuMDguMC5iYiA9PiBiYXJlYm94LXRvb2xzXzIwMjQuMDkuMC5iYn0g
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L3tiYXJlYm94LXRvb2xzXzIwMjQuMDguMC5i
YiA9PiBiYXJlYm94LXRvb2xzXzIwMjQuMDkuMC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC10b29sc18yMDI0LjA4LjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC10b29sc18yMDI0LjA5LjAuYmIKc2ltaWxhcml0eSBp
bmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtdG9v
bHNfMjAyNC4wOC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJv
eC10b29sc18yMDI0LjA5LjAuYmIKaW5kZXggZWQ0OWNlNTM3My4uMTNhMzA4YjNkYSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtdG9vbHNfMjAyNC4wOC4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LXRvb2xzXzIwMjQuMDkuMC5i
YgpAQCAtOCw3ICs4LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9
ZjUxMjVkMTNlMDAwYjljYTFmMGQzMzY0Mjg2YzQxOTIiCiBERVBFTkRTID0gImJpc29uLW5hdGl2
ZSBmbGV4LW5hdGl2ZSBsaWJ1c2IxIgogCiBTUkNfVVJJID0gImh0dHBzOi8vYmFyZWJveC5vcmcv
ZG93bmxvYWQvYmFyZWJveC0ke1BWfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImIw
OGE3NjJkYThkNjNkZDE4YjRmMmQ5ZjVkMGE4ZGEwMDFiNmU2MDhkMWIzZWZmNmRjZWJjNmEyZTU3
NWQ1MzUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGQ0ZWE3ZTIzMmFlYmEyYjNjYjljY2YwZGJm
OGNkOGUwMWM2NWI2YzYxNWY2NGMzYmQwYzRmMjRmMjNhNDdkYSIKIAogUyA9ICIke1dPUktESVJ9
L2JhcmVib3gtJHtQVn0iCiBCID0gIiR7V09SS0RJUn0vYnVpbGQiCi0tIAoyLjQ0LjEKCg==

--===============0242969616631905634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2024.08.0 [default] to 2024.09.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2024.08.0" to "2024.09.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2024.08.0 [default] to 2024.09.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2024.08.0" to "2024.09.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2024.08.0 [default] to 2024.09.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2024.08.0" to "2024.09.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2024.08.0 [default] to 2024.09.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2024.08.0" to "2024.09.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2024.08.0 [default] to 2024.09.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2024.08.0" to "2024.09.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2024.08.0 [default] to 2024.09.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2024.08.0" to "2024.09.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2024.08.0 [default] to 2024.09.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PV changed from "2024.08.0" to "2024.09.0"
packages/core2-64-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2024.08.0.tar.bz2" to "https://barebox.org/download/barebox-2024.09.0.tar.bz2"
packages/core2-64-poky-linux/barebox-tools: PKGV changed from 2024.08.0 [default] to 2024.09.0 [default]
packages/core2-64-poky-linux/barebox-tools: PV changed from "2024.08.0" to "2024.09.0"

--===============0242969616631905634==--

