Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FE0CA0EC6
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:07:49 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.88631.1754057268575607682
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mKDLZtbT;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ZjXSdfAR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019865f5da3e-4059a5d0-7275-4c3a-9520-e6237e10533d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057267;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RNuiKDLjrGB4lh+LC/UY5+1jlj3pFXu9Vhz21AyUbHk=;
	b=mKDLZtbTANXWjC5IonDdaffd3TfdePeXJBbUrrd0bZLbqkFMRmQgWf3x9p7CPDPt
	ZDHdRCEN/HutXuaxj9OC0J0HkCCjAD5jsL6Rfx4/YxDNISN7OGSgBiIEWzILQ0gUU0z
	DIJY3rQ+22Gd15ReVX3l+isU0iPh0RKYYe8AWxvc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057267;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RNuiKDLjrGB4lh+LC/UY5+1jlj3pFXu9Vhz21AyUbHk=;
	b=ZjXSdfAREBOZ/lpbZlj79qYEEfbbDgT8f9Cjp4cwRhOiukF4JLBbmVNFUR5I4eNI
	nBXx9hCzYAANOOrODb8kUb/cvqtTacjVEx3qnI/WsBu0cukFtA7PqZXtaSBYIvEKi1a
	EXcWRTamnua3np7ORPz+/95x6S3FVG8gavqvCYlU=
Content-Type: multipart/mixed; boundary="===============6020391570128440489=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.79 SUCCEEDED
Message-ID: <0101019865f5da3e-4059a5d0-7275-4c3a-9520-e6237e10533d-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221265

--===============6020391570128440489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ell* to *0.79* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.78-0.79.patch
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
From f6002c458f7b5b7a5d59a1714d68cf97e3ca893f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 08:47:48 +0000
Subject: [PATCH] ell: upgrade 0.78 -> 0.79

---
 meta/recipes-core/ell/{ell_0.78.bb => ell_0.79.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.78.bb => ell_0.79.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.78.bb b/meta/recipes-core/ell/ell_0.79.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.78.bb
rename to meta/recipes-core/ell/ell_0.79.bb
index ad16426bad..8bd0f8badd 100644
--- a/meta/recipes-core/ell/ell_0.78.bb
+++ b/meta/recipes-core/ell/ell_0.79.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "28ee1a586b4891c96e68667a424684e64ad35120f345e89d6705bd4023d2d40a"
+SRC_URI[sha256sum] = "28dabdb1966fd2e47363c44e041de507e9420411b846947efa01b4cb0cda0d6b"
-- 
2.47.1


--===============6020391570128440489==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ell-upgrade-0.78-0.79.patch"

RnJvbSBmNjAwMmM0NThmN2I1YjdhNWQ1OWExNzE0ZDY4Y2Y5N2UzY2E4OTNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAwODo0Nzo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVs
bDogdXBncmFkZSAwLjc4IC0+IDAuNzkKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUvZWxsL3tlbGxf
MC43OC5iYiA9PiBlbGxfMC43OS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9lbGwve2VsbF8w
Ljc4LmJiID0+IGVsbF8wLjc5LmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL2VsbC9lbGxfMC43OC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC43OS5iYgpz
aW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxs
XzAuNzguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC43OS5iYgppbmRl
eCBhZDE2NDI2YmFkLi44YmQwZjhiYWRkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9l
bGwvZWxsXzAuNzguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2VsbF8wLjc5LmJiCkBA
IC0xNSw0ICsxNSw0IEBAIERFUEVORFMgPSAiZGJ1cyIKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2Nv
bmZpZwogCiBTUkNfVVJJID0gImh0dHBzOi8vbWlycm9ycy5lZGdlLmtlcm5lbC5vcmcvcHViL2xp
bnV4L2xpYnMvJHtCUE59LyR7QlBOfS0ke1BWfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMjhlZTFhNTg2YjQ4OTFjOTZlNjg2NjdhNDI0Njg0ZTY0YWQzNTEyMGYzNDVlODlkNjcwNWJk
NDAyM2QyZDQwYSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyOGRhYmRiMTk2NmZkMmU0NzM2M2M0
NGUwNDFkZTUwN2U5NDIwNDExYjg0Njk0N2VmYTAxYjRjYjBjZGEwZDZiIgotLSAKMi40Ny4xCgo=

--===============6020391570128440489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ell/ell-dbg: PKGSIZE changed from 1774560 to 1774592 (+0%)
packages/core2-64-poky-linux/ell/ell-dbg: PKGV changed from 0.78 [default] to 0.79 [default]
packages/core2-64-poky-linux/ell/ell-dbg: PV changed from "0.78" to "0.79"
packages/core2-64-poky-linux/ell/ell-dev: PKGSIZE changed from 130261 to 130256 (-0%)
packages/core2-64-poky-linux/ell/ell-dev: PKGV changed from 0.78 [default] to 0.79 [default]
packages/core2-64-poky-linux/ell/ell-dev: PV changed from "0.78" to "0.79"
packages/core2-64-poky-linux/ell/ell-doc: PKGV changed from 0.78 [default] to 0.79 [default]
packages/core2-64-poky-linux/ell/ell-doc: PV changed from "0.78" to "0.79"
packages/core2-64-poky-linux/ell/ell-locale: PKGV changed from 0.78 [default] to 0.79 [default]
packages/core2-64-poky-linux/ell/ell-locale: PV changed from "0.78" to "0.79"
packages/core2-64-poky-linux/ell/ell-src: PKGV changed from 0.78 [default] to 0.79 [default]
packages/core2-64-poky-linux/ell/ell-src: PV changed from "0.78" to "0.79"
packages/core2-64-poky-linux/ell/ell-staticdev: PKGV changed from 0.78 [default] to 0.79 [default]
packages/core2-64-poky-linux/ell/ell-staticdev: PV changed from "0.78" to "0.79"
packages/core2-64-poky-linux/ell/ell: PKGV changed from 0.78 [default] to 0.79 [default]
packages/core2-64-poky-linux/ell/ell: PV changed from "0.78" to "0.79"
packages/core2-64-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.78.tar.xz" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.79.tar.xz"
packages/core2-64-poky-linux/ell: PKGV changed from 0.78 [default] to 0.79 [default]
packages/core2-64-poky-linux/ell: PV changed from "0.78" to "0.79"

--===============6020391570128440489==--

