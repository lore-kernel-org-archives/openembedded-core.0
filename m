Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC33DC83F05
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:11 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1413.1751386808187201249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1qNwEdU+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Km6uLqeB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010197c6c9dac3-838c6212-1bbe-499a-a10f-6d68b15cd2ba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386807;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xKzNf1uc++gPSjKWpMwDrQpfa/Ak8MjZoUDJC6Vd8mg=;
	b=1qNwEdU+FAeVQFMdGaklY+QhByGc8Hpinhe99t+RUTqysGprJyXMdahcYw41RmzB
	K1IltNEM/xSWXilEXahkBWjXDREModxm2hm9beTG/FTVlyYCiGF7/F2gaLWKgQy6wEq
	Yso75vNZDfBK95p4W+nHTkmVCldJonckvcZvXYKI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386807;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xKzNf1uc++gPSjKWpMwDrQpfa/Ak8MjZoUDJC6Vd8mg=;
	b=Km6uLqeBKEn061T9cobQslJt5o14YX7kYjiWeJTKNESyEo7OTrWPBJDWvA6GzYTr
	ic+eQviOXyVQIbEjiEn7tvSavhcKSihjX+OrvOl5kPkUtB66d6ki1MPxMYvBAfzWtuH
	hD9LIDov0BAVGW7oiFzPEVKzAJIt7oT4y13XPeOk=
Content-Type: multipart/mixed; boundary="===============1182085232204619629=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.78 SUCCEEDED
Message-ID: <01010197c6c9dac3-838c6212-1bbe-499a-a10f-6d68b15cd2ba-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219616

--===============1182085232204619629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ell* to *0.78* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.76-0.78.patch
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
From 9e4bb4231d6a5e0b03ed958e6456e8aa052a27fe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 07:44:07 +0000
Subject: [PATCH] ell: upgrade 0.76 -> 0.78

---
 meta/recipes-core/ell/{ell_0.76.bb => ell_0.78.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.76.bb => ell_0.78.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.76.bb b/meta/recipes-core/ell/ell_0.78.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.76.bb
rename to meta/recipes-core/ell/ell_0.78.bb
index fcc56e02f7..ad16426bad 100644
--- a/meta/recipes-core/ell/ell_0.76.bb
+++ b/meta/recipes-core/ell/ell_0.78.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a0bf2b5a78450c0c167e3f65c18452ffe4c0f179d48c2a3661e6afaca8017ef9"
+SRC_URI[sha256sum] = "28ee1a586b4891c96e68667a424684e64ad35120f345e89d6705bd4023d2d40a"
-- 
2.47.1


--===============1182085232204619629==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ell-upgrade-0.76-0.78.patch"

RnJvbSA5ZTRiYjQyMzFkNmE1ZTBiMDNlZDk1OGU2NDU2ZThhYTA1MmEyN2ZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwNzo0NDowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVs
bDogdXBncmFkZSAwLjc2IC0+IDAuNzgKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUvZWxsL3tlbGxf
MC43Ni5iYiA9PiBlbGxfMC43OC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9lbGwve2VsbF8w
Ljc2LmJiID0+IGVsbF8wLjc4LmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL2VsbC9lbGxfMC43Ni5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC43OC5iYgpz
aW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxs
XzAuNzYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC43OC5iYgppbmRl
eCBmY2M1NmUwMmY3Li5hZDE2NDI2YmFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9l
bGwvZWxsXzAuNzYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2VsbF8wLjc4LmJiCkBA
IC0xNSw0ICsxNSw0IEBAIERFUEVORFMgPSAiZGJ1cyIKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2Nv
bmZpZwogCiBTUkNfVVJJID0gImh0dHBzOi8vbWlycm9ycy5lZGdlLmtlcm5lbC5vcmcvcHViL2xp
bnV4L2xpYnMvJHtCUE59LyR7QlBOfS0ke1BWfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiYTBiZjJiNWE3ODQ1MGMwYzE2N2UzZjY1YzE4NDUyZmZlNGMwZjE3OWQ0OGMyYTM2NjFlNmFm
YWNhODAxN2VmOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyOGVlMWE1ODZiNDg5MWM5NmU2ODY2
N2E0MjQ2ODRlNjRhZDM1MTIwZjM0NWU4OWQ2NzA1YmQ0MDIzZDJkNDBhIgotLSAKMi40Ny4xCgo=

--===============1182085232204619629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ell/ell-dbg: PKGSIZE changed from 1772256 to 1774264 (+0%)
packages/core2-64-poky-linux/ell/ell-dbg: PKGV changed from 0.76 [default] to 0.78 [default]
packages/core2-64-poky-linux/ell/ell-dbg: PV changed from "0.76" to "0.78"
packages/core2-64-poky-linux/ell/ell-dev: PKGSIZE changed from 129808 to 130261 (+0%)
packages/core2-64-poky-linux/ell/ell-dev: PKGV changed from 0.76 [default] to 0.78 [default]
packages/core2-64-poky-linux/ell/ell-dev: PV changed from "0.76" to "0.78"
packages/core2-64-poky-linux/ell/ell-doc: PKGV changed from 0.76 [default] to 0.78 [default]
packages/core2-64-poky-linux/ell/ell-doc: PV changed from "0.76" to "0.78"
packages/core2-64-poky-linux/ell/ell-locale: PKGV changed from 0.76 [default] to 0.78 [default]
packages/core2-64-poky-linux/ell/ell-locale: PV changed from "0.76" to "0.78"
packages/core2-64-poky-linux/ell/ell-src: PKGV changed from 0.76 [default] to 0.78 [default]
packages/core2-64-poky-linux/ell/ell-src: PV changed from "0.76" to "0.78"
packages/core2-64-poky-linux/ell/ell-staticdev: PKGV changed from 0.76 [default] to 0.78 [default]
packages/core2-64-poky-linux/ell/ell-staticdev: PV changed from "0.76" to "0.78"
packages/core2-64-poky-linux/ell/ell: PKGV changed from 0.76 [default] to 0.78 [default]
packages/core2-64-poky-linux/ell/ell: PV changed from "0.76" to "0.78"
packages/core2-64-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.76.tar.xz" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.78.tar.xz"
packages/core2-64-poky-linux/ell: PKGV changed from 0.76 [default] to 0.78 [default]
packages/core2-64-poky-linux/ell: PV changed from "0.76" to "0.78"

--===============1182085232204619629==--

