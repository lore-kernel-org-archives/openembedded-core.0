Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5355CEED62A
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 18:59:59 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.29664.1694804392835748236
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZKJmLqFl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=p70/9jEs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a9a36b816-67dfdd26-159b-46d7-95b1-92cfeccb0672-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IWCaLDH75prK/1XkErJwySyIZM6uImM5lrCyItZdaxc=;
	b=ZKJmLqFlpruX/5ol4XrH8YD8pscE2DRdDHVy7XdqtGW4v4ka/IIu1YzqCbNy5YpM
	pePAA2oTUFfF/V990eMALlbPErapPKVQKXeO0HPtFb7I83Npt8aKs5QJ/49ia1qLeXH
	7adaf7P0UaDPi9+lMujFcqtgnCsWo/lD1wWyTgWI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IWCaLDH75prK/1XkErJwySyIZM6uImM5lrCyItZdaxc=;
	b=p70/9jEs/6jxqB0L9wBaP47eTlBj3UH1yDzhO24T5zYTouBYJtB4DAS8Wc0H9wx5
	Jf2j88mrnH1IGaApJab+8/5eUfGA/+h9kpWsquQ3jfJbCA/xVzQGwaxdpwGybQyrrgZ
	5iyPc5/lar+JPw8kfD/TYemKDlGWM7zj6CFSzuzQ=
Content-Type: multipart/mixed; boundary="===============8137986341396809656=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] seatd: upgrading to 0.8.0 SUCCEEDED
Message-ID: <0101018a9a36b816-67dfdd26-159b-46d7-95b1-92cfeccb0672-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 18:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187685

--===============8137986341396809656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *seatd* to *0.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-seatd-upgrade-0.7.0-0.8.0.patch
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
From 8a23752517e2812c0327041306d649036f38f58c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 07:31:11 +0000
Subject: [PATCH] seatd: upgrade 0.7.0 -> 0.8.0

---
 meta/recipes-core/seatd/{seatd_0.7.0.bb => seatd_0.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/seatd/{seatd_0.7.0.bb => seatd_0.8.0.bb} (96%)

diff --git a/meta/recipes-core/seatd/seatd_0.7.0.bb b/meta/recipes-core/seatd/seatd_0.8.0.bb
similarity index 96%
rename from meta/recipes-core/seatd/seatd_0.7.0.bb
rename to meta/recipes-core/seatd/seatd_0.8.0.bb
index 59ef6ad9c1..14c5b1b7ae 100644
--- a/meta/recipes-core/seatd/seatd_0.7.0.bb
+++ b/meta/recipes-core/seatd/seatd_0.8.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
 
 SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
            file://init"
-SRCREV = "a803ba0502cccf147eec7fbcacd11c5b8643c0e0"
+SRCREV = "3e9ef69f14f630a719dd464f3c90a7932f1c8296"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig update-rc.d
-- 
2.39.2


--===============8137986341396809656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/seatd: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-dbg: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-dbg: PKGSIZE changed from 259252 to 259012 (-0%)
packages/core2-32-poky-linux/seatd/seatd-dbg: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-dev: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-dev: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-doc: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-doc: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-locale: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-locale: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-src: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-src: PKGSIZE changed from 132662 to 132790 (+0%)
packages/core2-32-poky-linux/seatd/seatd-src: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd-staticdev: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd-staticdev: PV changed from "0.7.0" to "0.8.0"
packages/core2-32-poky-linux/seatd/seatd: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/core2-32-poky-linux/seatd/seatd: PV changed from "0.7.0" to "0.8.0"

--===============8137986341396809656==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-seatd-upgrade-0.7.0-0.8.0.patch"

RnJvbSA4YTIzNzUyNTE3ZTI4MTJjMDMyNzA0MTMwNmQ2NDkwMzZmMzhmNThjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMDc6MzE6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
ZWF0ZDogdXBncmFkZSAwLjcuMCAtPiAwLjguMAoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS9zZWF0
ZC97c2VhdGRfMC43LjAuYmIgPT4gc2VhdGRfMC44LjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNv
cmUvc2VhdGQve3NlYXRkXzAuNy4wLmJiID0+IHNlYXRkXzAuOC4wLmJifSAoOTYlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuNy4wLmJiIGIvbWV0YS9yZWNp
cGVzLWNvcmUvc2VhdGQvc2VhdGRfMC44LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc2VhdGQvc2VhdGRfMC43LjAuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuOC4wLmJiCmluZGV4IDU5ZWY2YWQ5YzEuLjE0
YzViMWI3YWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuNy4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuOC4wLmJiCkBAIC04LDcg
KzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03MTVhOTlkMmRk
NTUyZTYxODhlNzRkNGVkMjkxNGQ1YSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXQuc3IuaHQvfmtl
bm55bGV2aW5zZW4vc2VhdGQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciBcCiAgICAgICAg
ICAgIGZpbGU6Ly9pbml0IgotU1JDUkVWID0gImE4MDNiYTA1MDJjY2NmMTQ3ZWVjN2ZiY2FjZDEx
YzViODY0M2MwZTAiCitTUkNSRVYgPSAiM2U5ZWY2OWYxNGY2MzBhNzE5ZGQ0NjRmM2M5MGE3OTMy
ZjFjODI5NiIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIGluaGVyaXQgbWVzb24gcGtnY29uZmln
IHVwZGF0ZS1yYy5kCi0tIAoyLjM5LjIKCg==

--===============8137986341396809656==--

