Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C6FC7115F
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:04 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.8900.1749993299217274675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=n0OtWrBt;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SxFVe7El;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019773baaa62-36755fe8-85b4-4222-bc2d-c5d93cd6e205-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6E9MHjlCsdA9mB0+0IVP4lywYDwnry+WEigwMyjoO0w=;
	b=n0OtWrBthB4XW4kGB6q1Ub6TmyZyf4BnASGJPx93GN0NpSzgDXgDzP9UyHnqbS5x
	PJHrsqapCWUe5xAdHU2mYn4jsd6V6OoVTMqaYpOPwlVBvhma0VK4y7VKN2Q2HtR5fNY
	1RUGriEnIjQ18y9qDG7gXJ+92zxAGhS/t/U332Ng=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6E9MHjlCsdA9mB0+0IVP4lywYDwnry+WEigwMyjoO0w=;
	b=SxFVe7El5dA6w7RlC9ilRe674cgDZZJPqfeLaoTzyapVe0cos4fK0IBBOPd0Nj28
	gS0MpyQISSDq+f79qeRasR5dqQ7BXWOzkj4StA9ba3dwwpFIFVl4BrfgLKh2sPryF+S
	XQraylSW2Veq2eD+ZQtW5o5ZqjMX5zHP5ejZHrVQ=
Content-Type: multipart/mixed; boundary="===============5224754242185600016=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 5.23.1 SUCCEEDED
Message-ID: <0101019773baaa62-36755fe8-85b4-4222-bc2d-c5d93cd6e205-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:15:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218734

--===============5224754242185600016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *debianutils* to *5.23.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-5.22-5.23.1.patch
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
From 65bce676b8a5b5e0e65fdaec723ebe566c24187e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 12:49:55 +0000
Subject: [PATCH] debianutils: upgrade 5.22 -> 5.23.1

---
 .../debianutils/{debianutils_5.22.bb => debianutils_5.23.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.22.bb => debianutils_5.23.1.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.22.bb b/meta/recipes-support/debianutils/debianutils_5.23.1.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.22.bb
rename to meta/recipes-support/debianutils/debianutils_5.23.1.bb
index f5deead51a..85955883a4 100644
--- a/meta/recipes-support/debianutils/debianutils_5.22.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.23.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master;tag=debian/${PV} \
            "
 
-SRCREV = "528fac5c7448989f33c54599ae6e4c2b84d41e21"
+SRCREV = "ab0eaf33b783ba578773af2557753d2b973ba5bb"
 
 inherit autotools update-alternatives
 
-- 
2.47.1


--===============5224754242185600016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGSIZE changed from 93792 to 93800 (+0%)
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGV changed from 5.22 [default] to 5.23.1 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PV changed from "5.22" to "5.23.1"
packages/core2-64-poky-linux/debianutils/debianutils-dev: PKGV changed from 5.22 [default] to 5.23.1 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dev: PV changed from "5.22" to "5.23.1"
packages/core2-64-poky-linux/debianutils/debianutils-doc: PKGV changed from 5.22 [default] to 5.23.1 [default]
packages/core2-64-poky-linux/debianutils/debianutils-doc: PV changed from "5.22" to "5.23.1"
packages/core2-64-poky-linux/debianutils/debianutils-locale: PKGV changed from 5.22 [default] to 5.23.1 [default]
packages/core2-64-poky-linux/debianutils/debianutils-locale: PV changed from "5.22" to "5.23.1"
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 5.22 [default] to 5.23.1 [default]
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PV changed from "5.22" to "5.23.1"
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGV changed from 5.22 [default] to 5.23.1 [default]
packages/core2-64-poky-linux/debianutils/debianutils-src: PV changed from "5.22" to "5.23.1"
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 5.22 [default] to 5.23.1 [default]
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PV changed from "5.22" to "5.23.1"
packages/core2-64-poky-linux/debianutils/debianutils: PKGSIZE changed from 49679 to 49708 (+0%)
packages/core2-64-poky-linux/debianutils/debianutils: PKGV changed from 5.22 [default] to 5.23.1 [default]
packages/core2-64-poky-linux/debianutils/debianutils: PV changed from "5.22" to "5.23.1"
packages/core2-64-poky-linux/debianutils: SRC_URI changed from "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master;tag=debian/5.22" to "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master;tag=debian/5.23.1"
packages/core2-64-poky-linux/debianutils: PKGV changed from 5.22 [default] to 5.23.1 [default]
packages/core2-64-poky-linux/debianutils: PV changed from "5.22" to "5.23.1"

--===============5224754242185600016==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-5.22-5.23.1.patch"

RnJvbSA2NWJjZTY3NmI4YTViNWUwZTY1ZmRhZWM3MjNlYmU1NjZjMjQxODdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMTI6NDk6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
ZWJpYW51dGlsczogdXBncmFkZSA1LjIyIC0+IDUuMjMuMQoKLS0tCiAuLi4vZGViaWFudXRpbHMv
e2RlYmlhbnV0aWxzXzUuMjIuYmIgPT4gZGViaWFudXRpbHNfNS4yMy4xLmJifSAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy97ZGViaWFudXRpbHNfNS4yMi5iYiA9PiBkZWJp
YW51dGlsc181LjIzLjEuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4yMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuMjMuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181
LjIyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51
dGlsc181LjIzLjEuYmIKaW5kZXggZjVkZWVhZDUxYS4uODU5NTU4ODNhNCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4yMi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181LjIzLjEuYmIK
QEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vZGViaWFuL2NvcHly
aWdodDttZDU9NGI2NjdmMzA0MTFkMjFiYzhmZDdkYjg1ZDUwMmE4ZTkKIFNSQ19VUkkgPSAiZ2l0
Oi8vc2Fsc2EuZGViaWFuLm9yZy9kZWJpYW4vZGViaWFudXRpbHMuZ2l0O3Byb3RvY29sPWh0dHBz
O2JyYW5jaD1tYXN0ZXI7dGFnPWRlYmlhbi8ke1BWfSBcCiAgICAgICAgICAgICIKIAotU1JDUkVW
ID0gIjUyOGZhYzVjNzQ0ODk4OWYzM2M1NDU5OWFlNmU0YzJiODRkNDFlMjEiCitTUkNSRVYgPSAi
YWIwZWFmMzNiNzgzYmE1Nzg3NzNhZjI1NTc3NTNkMmI5NzNiYTViYiIKIAogaW5oZXJpdCBhdXRv
dG9vbHMgdXBkYXRlLWFsdGVybmF0aXZlcwogCi0tIAoyLjQ3LjEKCg==

--===============5224754242185600016==--

