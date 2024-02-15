Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3501C54E7A
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:35 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.20170.1708018346099108069
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=E/tUjtM5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kePQeSZa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018dadd3a57a-b303901e-852d-403f-bcb8-c39e94b40a19-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zBAgJXCUdpVa473mv9EeBY3p/cCk9nZiCHN8/8GaFs4=;
	b=E/tUjtM54PNHrj7arU4dBfmcuOM+w1sJfmIvKNAgmc3uUhqPpis++mpB8cUbFalf
	HT9Fv8lLw/Bc6S/qqwHwSn8HMrqwMOCTYWcZlSMQd0Am4pYy6sLl4/cCxAcmJEMIoWF
	8VD/jflv2R7ZgDCEtANFNY0tLGtSVvBZtPJ9RpEs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zBAgJXCUdpVa473mv9EeBY3p/cCk9nZiCHN8/8GaFs4=;
	b=kePQeSZahQQku7zMCzoSm4lUaF1v8LJlv+5gk1G/lTK12uDK5wRoW/jvq5cQYDQg
	VsnnEGgO61ye6UMFw83NtJ78bsnc82PoU0x0XsWCw2zktEDU+gf6KhL7tAHaazryKyo
	PpuiiGaelVIca0wDyG36pgFipioDPnu/ei7XTT6w=
Content-Type: multipart/mixed; boundary="===============5830865219297994249=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ed: upgrading to 1.20.1 SUCCEEDED
Message-ID: <0101018dadd3a57a-b303901e-852d-403f-bcb8-c39e94b40a19-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195616

--===============5830865219297994249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ed* to *1.20.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ed-upgrade-1.20-1.20.1.patch
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
From ecda16fb2a196fb8d2d1255614bc01f2bd5aae8a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 11:32:24 +0000
Subject: [PATCH] ed: upgrade 1.20 -> 1.20.1

---
 meta/recipes-extended/ed/{ed_1.20.bb => ed_1.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.20.bb => ed_1.20.1.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.20.bb b/meta/recipes-extended/ed/ed_1.20.1.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.20.bb
rename to meta/recipes-extended/ed/ed_1.20.1.bb
index 076666b04b..9ae53002c3 100644
--- a/meta/recipes-extended/ed/ed_1.20.bb
+++ b/meta/recipes-extended/ed/ed_1.20.1.bb
@@ -19,7 +19,7 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[sha256sum] = "c6030defe6ae172f1687906d7354054c75a6a9130af319d4e73c50a91959c5a6"
+SRC_URI[sha256sum] = "b1a463b297a141f9876c4b1fcd01477f645cded92168090e9a35db2af4babbca"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.42.0


--===============5830865219297994249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ed/ed-dbg: PKGSIZE changed from 160840 to 158552 (-1%)
packages/core2-64-poky-linux/ed/ed-dbg: PKGV changed from 1.20 [default] to 1.20.1 [default]
packages/core2-64-poky-linux/ed/ed-dbg: PV changed from "1.20" to "1.20.1"
packages/core2-64-poky-linux/ed/ed-dev: PKGV changed from 1.20 [default] to 1.20.1 [default]
packages/core2-64-poky-linux/ed/ed-dev: PV changed from "1.20" to "1.20.1"
packages/core2-64-poky-linux/ed/ed-doc: PKGSIZE changed from 73783 to 73729 (-0%)
packages/core2-64-poky-linux/ed/ed-doc: PKGV changed from 1.20 [default] to 1.20.1 [default]
packages/core2-64-poky-linux/ed/ed-doc: PV changed from "1.20" to "1.20.1"
packages/core2-64-poky-linux/ed/ed-locale: PKGV changed from 1.20 [default] to 1.20.1 [default]
packages/core2-64-poky-linux/ed/ed-locale: PV changed from "1.20" to "1.20.1"
packages/core2-64-poky-linux/ed/ed-src: PKGSIZE changed from 114489 to 113135 (-1%)
packages/core2-64-poky-linux/ed/ed-src: PKGV changed from 1.20 [default] to 1.20.1 [default]
packages/core2-64-poky-linux/ed/ed-src: PV changed from "1.20" to "1.20.1"
packages/core2-64-poky-linux/ed/ed-staticdev: PKGV changed from 1.20 [default] to 1.20.1 [default]
packages/core2-64-poky-linux/ed/ed-staticdev: PV changed from "1.20" to "1.20.1"
packages/core2-64-poky-linux/ed/ed: PKGV changed from 1.20 [default] to 1.20.1 [default]
packages/core2-64-poky-linux/ed/ed: PV changed from "1.20" to "1.20.1"
packages/core2-64-poky-linux/ed: PKGV changed from 1.20 [default] to 1.20.1 [default]
packages/core2-64-poky-linux/ed: SRC_URI changed from "https://ftp.gnu.org/gnu/ed/ed-1.20.tar.lz" to "https://ftp.gnu.org/gnu/ed/ed-1.20.1.tar.lz"
packages/core2-64-poky-linux/ed: PV changed from "1.20" to "1.20.1"

--===============5830865219297994249==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ed-upgrade-1.20-1.20.1.patch"

RnJvbSBlY2RhMTZmYjJhMTk2ZmI4ZDJkMTI1NTYxNGJjMDFmMmJkNWFhZThhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTE6MzI6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
ZDogdXBncmFkZSAxLjIwIC0+IDEuMjAuMQoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZWQv
e2VkXzEuMjAuYmIgPT4gZWRfMS4yMC4xLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9l
ZC97ZWRfMS4yMC5iYiA9PiBlZF8xLjIwLjEuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2VkL2VkXzEuMjAuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZWQv
ZWRfMS4yMC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1leHRlbmRlZC9lZC9lZF8xLjIwLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
ZWQvZWRfMS4yMC4xLmJiCmluZGV4IDA3NjY2NmIwNGIuLjlhZTUzMDAyYzMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9lZC9lZF8xLjIwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9lZC9lZF8xLjIwLjEuYmIKQEAgLTE5LDcgKzE5LDcgQEAgYmluZGlyID0gIiR7YmFz
ZV9iaW5kaXJ9IgogU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9L2VkLyR7QlB9LnRhci5seiIKIFVQ
U1RSRUFNX0NIRUNLX1VSSSA9ICIke0dOVV9NSVJST1J9L2VkLyIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gImM2MDMwZGVmZTZhZTE3MmYxNjg3OTA2ZDczNTQwNTRjNzVhNmE5MTMwYWYzMTlkNGU3
M2M1MGE5MTk1OWM1YTYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjFhNDYzYjI5N2ExNDFmOTg3
NmM0YjFmY2QwMTQ3N2Y2NDVjZGVkOTIxNjgwOTBlOWEzNWRiMmFmNGJhYmJjYSIKIAogRVhUUkFf
T0VNQUtFID0gIi1lIE1BS0VGTEFHUz0iCiAKLS0gCjIuNDIuMAoK

--===============5830865219297994249==--

