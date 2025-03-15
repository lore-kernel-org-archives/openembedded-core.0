Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CB9C3600A
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.10359.1742048293319178328
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KUn8JcGA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DDi4mFxW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101959a2b6f30-de4fca99-6ae8-42a5-879f-c950a5cf24ad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=drhrVDb6mNsimvmirL0K1NGGMia1mJY8F5hJJHD3rzk=;
	b=KUn8JcGAmB5kWbUcfCdXIkc7SbCsPeThKmqfnq+NS2tZnOERz3ES3b7reVv+xR2m
	CjuLMeN5chhuFTL+rr4ccT1U5AwYAvEoPrggIM3cB5zlRZRtQhcWCeNKlVJjgGtMGMQ
	oVwkXf4xdqw3D/OkcrOknjOEMoZvrl9c8Psxcv4A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=drhrVDb6mNsimvmirL0K1NGGMia1mJY8F5hJJHD3rzk=;
	b=DDi4mFxWjVSlft9x4P4a4AslZCmmVlG9uoQz0gnfcJK4kn0fnYyOU1pvTHZp3nQu
	Jl1npXxJWFb8kWgks4ixe1o7QrQSlIy2EEJS3hNkCVSKAIy4HG/8Magc7ljTk6mOFP8
	8aNgz7geXuInNpMlp2AxzFzUKSmsADneYVApJiNo=
Content-Type: multipart/mixed; boundary="===============7181283599365326317=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.74 SUCCEEDED
Message-ID: <010101959a2b6f30-de4fca99-6ae8-42a5-879f-c950a5cf24ad-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212888

--===============7181283599365326317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ell* to *0.74* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.73-0.74.patch
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
From 3eff8c94a9e0797ee11e39c9d93c45c75a859048 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 07:21:46 +0000
Subject: [PATCH] ell: upgrade 0.73 -> 0.74

---
 meta/recipes-core/ell/{ell_0.73.bb => ell_0.74.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.73.bb => ell_0.74.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.73.bb b/meta/recipes-core/ell/ell_0.74.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.73.bb
rename to meta/recipes-core/ell/ell_0.74.bb
index c6691c7e54..afacedac2e 100644
--- a/meta/recipes-core/ell/ell_0.73.bb
+++ b/meta/recipes-core/ell/ell_0.74.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ae97f848b45a59be7741369880badfa8c08a55a24b21eae3468342cc012df11b"
+SRC_URI[sha256sum] = "f1690913024f80fafff19ecf010accb58a56784d78937bae536c016b8276bb75"
-- 
2.44.1


--===============7181283599365326317==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ell-upgrade-0.73-0.74.patch"

RnJvbSAzZWZmOGM5NGE5ZTA3OTdlZTExZTM5YzlkOTNjNDVjNzVhODU5MDQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDc6MjE6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bGw6IHVwZ3JhZGUgMC43MyAtPiAwLjc0CgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL2VsbC97ZWxs
XzAuNzMuYmIgPT4gZWxsXzAuNzQuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZWxsL3tlbGxf
MC43My5iYiA9PiBlbGxfMC43NC5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS9lbGwvZWxsXzAuNzMuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuNzQuYmIK
c2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2Vs
bF8wLjczLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuNzQuYmIKaW5k
ZXggYzY2OTFjN2U1NC4uYWZhY2VkYWMyZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
ZWxsL2VsbF8wLjczLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC43NC5iYgpA
QCAtMTUsNCArMTUsNCBAQCBERVBFTkRTID0gImRidXMiCiBpbmhlcml0IGF1dG90b29scyBwa2dj
b25maWcKIAogU1JDX1VSSSA9ICJodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi9s
aW51eC9saWJzLyR7QlBOfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImFlOTdmODQ4YjQ1YTU5YmU3NzQxMzY5ODgwYmFkZmE4YzA4YTU1YTI0YjIxZWFlMzQ2ODM0
MmNjMDEyZGYxMWIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjE2OTA5MTMwMjRmODBmYWZmZjE5
ZWNmMDEwYWNjYjU4YTU2Nzg0ZDc4OTM3YmFlNTM2YzAxNmI4Mjc2YmI3NSIKLS0gCjIuNDQuMQoK

--===============7181283599365326317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ell/ell-dbg: PKGSIZE changed from 1762184 to 1762568 (+0%)
packages/core2-64-poky-linux/ell/ell-dbg: PV changed from "0.73" to "0.74"
packages/core2-64-poky-linux/ell/ell-dbg: PKGV changed from 0.73 [default] to 0.74 [default]
packages/core2-64-poky-linux/ell/ell-dev: PV changed from "0.73" to "0.74"
packages/core2-64-poky-linux/ell/ell-dev: PKGV changed from 0.73 [default] to 0.74 [default]
packages/core2-64-poky-linux/ell/ell-doc: PV changed from "0.73" to "0.74"
packages/core2-64-poky-linux/ell/ell-doc: PKGV changed from 0.73 [default] to 0.74 [default]
packages/core2-64-poky-linux/ell/ell-locale: PV changed from "0.73" to "0.74"
packages/core2-64-poky-linux/ell/ell-locale: PKGV changed from 0.73 [default] to 0.74 [default]
packages/core2-64-poky-linux/ell/ell-src: PKGSIZE changed from 1436231 to 1437173 (+0%)
packages/core2-64-poky-linux/ell/ell-src: PV changed from "0.73" to "0.74"
packages/core2-64-poky-linux/ell/ell-src: PKGV changed from 0.73 [default] to 0.74 [default]
packages/core2-64-poky-linux/ell/ell-staticdev: PV changed from "0.73" to "0.74"
packages/core2-64-poky-linux/ell/ell-staticdev: PKGV changed from 0.73 [default] to 0.74 [default]
packages/core2-64-poky-linux/ell/ell: PV changed from "0.73" to "0.74"
packages/core2-64-poky-linux/ell/ell: PKGV changed from 0.73 [default] to 0.74 [default]
packages/core2-64-poky-linux/ell: PV changed from "0.73" to "0.74"
packages/core2-64-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.73.tar.xz" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.74.tar.xz"
packages/core2-64-poky-linux/ell: PKGV changed from 0.73 [default] to 0.74 [default]

--===============7181283599365326317==--

