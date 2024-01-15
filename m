Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CE6C47DB4
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:33:58 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.88294.1705340031127489287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UJH+i3We;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RkQqjTJj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018d0e2fd0cc-1f824a86-ecb8-4b40-ab1f-4c0ab35c5c82-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cRryTjxACJN5Q1Eo05Kv+H388bTIAveyuTq4Z4GVqho=;
	b=UJH+i3WePkV/QBaROOqra8E5Xh5a7SN2fG1PgtRNnGOnhJDCAE71jru8c+k429tj
	Uy7r9hJ62LhUeMifdnTwai1CO3OFHosgx9kNUqHl5iQ8c8mthizH6vMB0ciP0Am3KeD
	VVp59Ysz7aR9l0jUFgsAO2kz3V6I3S8OU67/YLUo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cRryTjxACJN5Q1Eo05Kv+H388bTIAveyuTq4Z4GVqho=;
	b=RkQqjTJjBhm6NFQ9qLryEsnjkeuEHOxoz22ZVqrG647hnKjyR4WpBuyvDb+MUMBY
	CveXS3QLqVE1BUFyZ26D4WN+GzYvm33QuTyGTZYugqOkQzX6Uy2NgijIQ7O9WEOy2cS
	1mV62ojG5QUUGyF7g6mPeUfH09tVumcixJ8m2Hmc=
Content-Type: multipart/mixed; boundary="===============3133716693423635049=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 5.16 SUCCEEDED
Message-ID: <0101018d0e2fd0cc-1f824a86-ecb8-4b40-ab1f-4c0ab35c5c82-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193784

--===============3133716693423635049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *debianutils* to *5.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-5.15-5.16.patch
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
From 4788310a174a7e024c7964d175d71bb26ec894d2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 16:49:25 +0000
Subject: [PATCH] debianutils: upgrade 5.15 -> 5.16

---
 .../debianutils/{debianutils_5.15.bb => debianutils_5.16.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.15.bb => debianutils_5.16.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.15.bb b/meta/recipes-support/debianutils/debianutils_5.16.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.15.bb
rename to meta/recipes-support/debianutils/debianutils_5.16.bb
index b1368a3b2e..ec629d8b73 100644
--- a/meta/recipes-support/debianutils/debianutils_5.15.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.16.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "d886c15810b58e57411048f57d7fb941a6819987"
+SRCREV = "9e0facf19b17b6d090a5dcc8cacb0c16e5ad9f72"
 
 inherit autotools update-alternatives
 
-- 
2.42.0


--===============3133716693423635049==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-5.15-5.16.patch"

RnJvbSA0Nzg4MzEwYTE3NGE3ZTAyNGM3OTY0ZDE3NWQ3MWJiMjZlYzg5NGQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMTY6NDk6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
ZWJpYW51dGlsczogdXBncmFkZSA1LjE1IC0+IDUuMTYKCi0tLQogLi4uL2RlYmlhbnV0aWxzL3tk
ZWJpYW51dGlsc181LjE1LmJiID0+IGRlYmlhbnV0aWxzXzUuMTYuYmJ9ICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMve2RlYmlhbnV0aWxzXzUuMTUuYmIgPT4gZGViaWFu
dXRpbHNfNS4xNi5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9k
ZWJpYW51dGlscy9kZWJpYW51dGlsc181LjE1LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGVi
aWFudXRpbHMvZGViaWFudXRpbHNfNS4xNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181LjE1LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181
LjE2LmJiCmluZGV4IGIxMzY4YTNiMmUuLmVjNjI5ZDhiNzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuMTUuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4xNi5iYgpAQCAtMTEsNyAr
MTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9kZWJpYW4vY29weXJpZ2h0O21kNT00
YjY2N2YzMDQxMWQyMWJjOGZkN2RiODVkNTAyYThlOQogU1JDX1VSSSA9ICJnaXQ6Ly9zYWxzYS5k
ZWJpYW4ub3JnL2RlYmlhbi9kZWJpYW51dGlscy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1h
c3RlciBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gImQ4ODZjMTU4MTBiNThlNTc0MTEwNDhm
NTdkN2ZiOTQxYTY4MTk5ODciCitTUkNSRVYgPSAiOWUwZmFjZjE5YjE3YjZkMDkwYTVkY2M4Y2Fj
YjBjMTZlNWFkOWY3MiIKIAogaW5oZXJpdCBhdXRvdG9vbHMgdXBkYXRlLWFsdGVybmF0aXZlcwog
Ci0tIAoyLjQyLjAKCg==

--===============3133716693423635049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGV changed from 5.15 [default] to 5.16 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PV changed from "5.15" to "5.16"
packages/core2-64-poky-linux/debianutils/debianutils-dev: PKGV changed from 5.15 [default] to 5.16 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dev: PV changed from "5.15" to "5.16"
packages/core2-64-poky-linux/debianutils/debianutils-doc: PKGV changed from 5.15 [default] to 5.16 [default]
packages/core2-64-poky-linux/debianutils/debianutils-doc: PV changed from "5.15" to "5.16"
packages/core2-64-poky-linux/debianutils/debianutils-locale: PKGV changed from 5.15 [default] to 5.16 [default]
packages/core2-64-poky-linux/debianutils/debianutils-locale: PV changed from "5.15" to "5.16"
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 5.15 [default] to 5.16 [default]
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PV changed from "5.15" to "5.16"
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGV changed from 5.15 [default] to 5.16 [default]
packages/core2-64-poky-linux/debianutils/debianutils-src: PV changed from "5.15" to "5.16"
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 5.15 [default] to 5.16 [default]
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PV changed from "5.15" to "5.16"
packages/core2-64-poky-linux/debianutils/debianutils: PKGV changed from 5.15 [default] to 5.16 [default]
packages/core2-64-poky-linux/debianutils/debianutils: PV changed from "5.15" to "5.16"
packages/core2-64-poky-linux/debianutils: PKGV changed from 5.15 [default] to 5.16 [default]
packages/core2-64-poky-linux/debianutils: PV changed from "5.15" to "5.16"

--===============3133716693423635049==--

