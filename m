Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03651D591C3
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:16:49 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.4789.1731964607255621831
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Owx3AtvM;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=GbCQ29Q1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019341229783-a2d1e4fc-3238-4295-b9df-b1a2b1c0f978-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964606;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oWJoPJpwM6j6mCQw9kjajhvliAZb5RvuVtFbg/fC6uE=;
	b=Owx3AtvM4DIvURzmgGCV4UZMO1q06F+8qHlDw3ptX+ec1qKw6W089TUX3GrsjHsy
	BK2Xy6q+p1+SfoVF/5yPaz7tiX+W5oe5UBPLAj3B5Xcz4DfydT8Nm2E84WIFVM9XJhG
	YQQ7zzY0A6xL6xasCroFZBUUIJVBNxkFLWY49p8g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964606;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oWJoPJpwM6j6mCQw9kjajhvliAZb5RvuVtFbg/fC6uE=;
	b=GbCQ29Q1ef0j+NqxvOICB92Z9NTzvNlHUdiBb7cbB6bz/qAWV/yQqpkLeYbsiJgG
	zOYTpOG8Ghm4otvT/GpM/KDtPBnFERWIisfnnWsNH/mO0dIhqfxCvzYJCOZBggFVhcx
	gF5XoJjO14+FnUGdOi6CDQMYCW0O4kRNJvhJyk2s=
Content-Type: multipart/mixed; boundary="===============8672458670095721495=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2024.10.0 SUCCEEDED
Message-ID: <0101019341229783-a2d1e4fc-3238-4295-b9df-b1a2b1c0f978-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207248

--===============8672458670095721495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2024.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2024.09.0-2024.10.0.patch
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
From b545c6e11109676180b4930e3205bce65dd794a6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 03:39:34 +0000
Subject: [PATCH] barebox-tools: upgrade 2024.09.0 -> 2024.10.0

---
 .../{barebox-tools_2024.09.0.bb => barebox-tools_2024.10.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/barebox/{barebox-tools_2024.09.0.bb => barebox-tools_2024.10.0.bb} (93%)

diff --git a/meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb b/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
similarity index 93%
rename from meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb
rename to meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
index 13a308b3da..386656f7ad 100644
--- a/meta/recipes-bsp/barebox/barebox-tools_2024.09.0.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools_2024.10.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 DEPENDS = "bison-native flex-native libusb1"
 
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "4d4ea7e232aeba2b3cb9ccf0dbf8cd8e01c65b6c615f64c3bd0c4f24f23a47da"
+SRC_URI[sha256sum] = "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b16dee7442d71a5af88d"
 
 S = "${WORKDIR}/barebox-${PV}"
 B = "${WORKDIR}/build"
-- 
2.44.1


--===============8672458670095721495==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2024.09.0-2024.10.0.patch"

RnJvbSBiNTQ1YzZlMTExMDk2NzYxODBiNDkzMGUzMjA1YmNlNjVkZDc5NGE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMDM6Mzk6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXJlYm94LXRvb2xzOiB1cGdyYWRlIDIwMjQuMDkuMCAtPiAyMDI0LjEwLjAKCi0tLQogLi4uL3ti
YXJlYm94LXRvb2xzXzIwMjQuMDkuMC5iYiA9PiBiYXJlYm94LXRvb2xzXzIwMjQuMTAuMC5iYn0g
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L3tiYXJlYm94LXRvb2xzXzIwMjQuMDkuMC5i
YiA9PiBiYXJlYm94LXRvb2xzXzIwMjQuMTAuMC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC10b29sc18yMDI0LjA5LjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC10b29sc18yMDI0LjEwLjAuYmIKc2ltaWxhcml0eSBp
bmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtdG9v
bHNfMjAyNC4wOS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJv
eC10b29sc18yMDI0LjEwLjAuYmIKaW5kZXggMTNhMzA4YjNkYS4uMzg2NjU2ZjdhZCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtdG9vbHNfMjAyNC4wOS4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LXRvb2xzXzIwMjQuMTAuMC5i
YgpAQCAtOCw3ICs4LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9
ZjUxMjVkMTNlMDAwYjljYTFmMGQzMzY0Mjg2YzQxOTIiCiBERVBFTkRTID0gImJpc29uLW5hdGl2
ZSBmbGV4LW5hdGl2ZSBsaWJ1c2IxIgogCiBTUkNfVVJJID0gImh0dHBzOi8vYmFyZWJveC5vcmcv
ZG93bmxvYWQvYmFyZWJveC0ke1BWfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRk
NGVhN2UyMzJhZWJhMmIzY2I5Y2NmMGRiZjhjZDhlMDFjNjViNmM2MTVmNjRjM2JkMGM0ZjI0ZjIz
YTQ3ZGEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTU1YjIwYmZhNzM1ODczMmQyYzBjMDljY2Zk
NGMxYTY5MDg3YjdlMmM2MTBiMTZkZWU3NDQyZDcxYTVhZjg4ZCIKIAogUyA9ICIke1dPUktESVJ9
L2JhcmVib3gtJHtQVn0iCiBCID0gIiR7V09SS0RJUn0vYnVpbGQiCi0tIAoyLjQ0LjEKCg==

--===============8672458670095721495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2024.09.0" to "2024.10.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2024.09.0 [default] to 2024.10.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2024.09.0" to "2024.10.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2024.09.0 [default] to 2024.10.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2024.09.0" to "2024.10.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2024.09.0 [default] to 2024.10.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2024.09.0" to "2024.10.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2024.09.0 [default] to 2024.10.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2024.09.0" to "2024.10.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2024.09.0 [default] to 2024.10.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2024.09.0" to "2024.10.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2024.09.0 [default] to 2024.10.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PV changed from "2024.09.0" to "2024.10.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2024.09.0 [default] to 2024.10.0 [default]
packages/core2-64-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2024.09.0.tar.bz2" to "https://barebox.org/download/barebox-2024.10.0.tar.bz2"
packages/core2-64-poky-linux/barebox-tools: PV changed from "2024.09.0" to "2024.10.0"
packages/core2-64-poky-linux/barebox-tools: PKGV changed from 2024.09.0 [default] to 2024.10.0 [default]

--===============8672458670095721495==--

