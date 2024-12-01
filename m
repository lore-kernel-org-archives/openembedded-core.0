Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00157D10DB5
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:05:58 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.149795.1733047549145508560
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:05:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UkXeACdk;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JNX66WsD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019381af14d3-464384a3-c14a-43c8-9d9a-913f37b8dda3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Dol+IOXbG4yOj+XINlFEMnO7lHHrxqqwQFVIOG5Y2fQ=;
	b=UkXeACdkvweRCxWbmR5K4y7hvwcSr1mLq/ehg1yT4ZXosjJdoYxHG3BJMNN9PFuW
	j6jcRj4wXWmOpZJ4CBtatGbmenuxYKpMzoYDSzHbd4BySYy9d357JWijKv+kiJ50Ked
	tntoqXj5OQFLD6MD5NaO1P/QP0oxn1eAk1VX5NLg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047555;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Dol+IOXbG4yOj+XINlFEMnO7lHHrxqqwQFVIOG5Y2fQ=;
	b=JNX66WsDmaIQ36ZG+a1bsfe9TiHC/orNB5DLO42/bIxVCmBFQ5m+5rD1kAGeh/L/
	ABgfndFIzkdRqZOjnvh6aorQrID8hqCZsp/1tUz44dssxK4SunKg9fsXkcyc+aZKRdk
	5crSl1TtDBCw8WCptnREoq9IzzPPhf2fTX0EM+4s=
Content-Type: multipart/mixed; boundary="===============6962665615000015710=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.71 SUCCEEDED
Message-ID: <0101019381af14d3-464384a3-c14a-43c8-9d9a-913f37b8dda3-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:05:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208060

--===============6962665615000015710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ell* to *0.71* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.70-0.71.patch
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
From 3081d99b67356aa1d8fc70591cd6a1e607fb94e0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 06:35:28 +0000
Subject: [PATCH] ell: upgrade 0.70 -> 0.71

---
 meta/recipes-core/ell/{ell_0.70.bb => ell_0.71.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.70.bb => ell_0.71.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.70.bb b/meta/recipes-core/ell/ell_0.71.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.70.bb
rename to meta/recipes-core/ell/ell_0.71.bb
index f855b4df36..b9a0b595d4 100644
--- a/meta/recipes-core/ell/ell_0.70.bb
+++ b/meta/recipes-core/ell/ell_0.71.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "1bb7f5d73df34b46c4dd340fec98442d7dac2a7b4ce0ee3fc779ca2fbe6fe591"
+SRC_URI[sha256sum] = "850f79cc993791f00232fd31cbaf3e8212edcef25ca0515f98c6d48dfb5952d7"
-- 
2.44.1


--===============6962665615000015710==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ell-upgrade-0.70-0.71.patch"

RnJvbSAzMDgxZDk5YjY3MzU2YWExZDhmYzcwNTkxY2Q2YTFlNjA3ZmI5NGUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwNjozNToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVs
bDogdXBncmFkZSAwLjcwIC0+IDAuNzEKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUvZWxsL3tlbGxf
MC43MC5iYiA9PiBlbGxfMC43MS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9lbGwve2VsbF8w
LjcwLmJiID0+IGVsbF8wLjcxLmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL2VsbC9lbGxfMC43MC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC43MS5iYgpz
aW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxs
XzAuNzAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC43MS5iYgppbmRl
eCBmODU1YjRkZjM2Li5iOWEwYjU5NWQ0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9l
bGwvZWxsXzAuNzAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2VsbF8wLjcxLmJiCkBA
IC0xNSw0ICsxNSw0IEBAIERFUEVORFMgPSAiZGJ1cyIKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2Nv
bmZpZwogCiBTUkNfVVJJID0gImh0dHBzOi8vbWlycm9ycy5lZGdlLmtlcm5lbC5vcmcvcHViL2xp
bnV4L2xpYnMvJHtCUE59LyR7QlBOfS0ke1BWfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMWJiN2Y1ZDczZGYzNGI0NmM0ZGQzNDBmZWM5ODQ0MmQ3ZGFjMmE3YjRjZTBlZTNmYzc3OWNh
MmZiZTZmZTU5MSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4NTBmNzljYzk5Mzc5MWYwMDIzMmZk
MzFjYmFmM2U4MjEyZWRjZWYyNWNhMDUxNWY5OGM2ZDQ4ZGZiNTk1MmQ3IgotLSAKMi40NC4xCgo=

--===============6962665615000015710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ell/ell-dbg: PV changed from "0.70" to "0.71"
packages/core2-64-poky-linux/ell/ell-dbg: PKGV changed from 0.70 [default] to 0.71 [default]
packages/core2-64-poky-linux/ell/ell-dev: PV changed from "0.70" to "0.71"
packages/core2-64-poky-linux/ell/ell-dev: PKGV changed from 0.70 [default] to 0.71 [default]
packages/core2-64-poky-linux/ell/ell-doc: PV changed from "0.70" to "0.71"
packages/core2-64-poky-linux/ell/ell-doc: PKGV changed from 0.70 [default] to 0.71 [default]
packages/core2-64-poky-linux/ell/ell-locale: PV changed from "0.70" to "0.71"
packages/core2-64-poky-linux/ell/ell-locale: PKGV changed from 0.70 [default] to 0.71 [default]
packages/core2-64-poky-linux/ell/ell-src: PV changed from "0.70" to "0.71"
packages/core2-64-poky-linux/ell/ell-src: PKGSIZE changed from 1419088 to 1419081 (-0%)
packages/core2-64-poky-linux/ell/ell-src: PKGV changed from 0.70 [default] to 0.71 [default]
packages/core2-64-poky-linux/ell/ell-staticdev: PV changed from "0.70" to "0.71"
packages/core2-64-poky-linux/ell/ell-staticdev: PKGV changed from 0.70 [default] to 0.71 [default]
packages/core2-64-poky-linux/ell/ell: PV changed from "0.70" to "0.71"
packages/core2-64-poky-linux/ell/ell: PKGV changed from 0.70 [default] to 0.71 [default]
packages/core2-64-poky-linux/ell: PV changed from "0.70" to "0.71"
packages/core2-64-poky-linux/ell: PKGV changed from 0.70 [default] to 0.71 [default]
packages/core2-64-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.70.tar.xz" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.71.tar.xz"

--===============6962665615000015710==--

