Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6E0C54F59
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:17 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1267.1710522011054565494
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eLX7DbdI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=nAcztKpv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018e430ea086-d77e8826-eff2-473c-8732-8de566ae3b0d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522016;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=459/lHk29UA5vz1zCYNN/80zW947tSgrcCR1V9zQofY=;
	b=eLX7DbdImdwvd4n9evkSsqrDaj3vc/1590pzedOAxff7w2gqn/yXn91ZyIMA5IE6
	DoxSDUHuDALVne/yaWdynuHiC8TcnjOPB4wmpbm1P0sMA3CFxTulmyYk1mV4RPhbQpo
	5Rx1cKRJ1QAsjm0IWUnkFQhCIapmnLCG2KLZAHc0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522016;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=459/lHk29UA5vz1zCYNN/80zW947tSgrcCR1V9zQofY=;
	b=nAcztKpv7Jm4fCzqbu4xAyHcdX7Vn9l4O8jb7EfwKZRR5qB27Z57y6cg9dsw7JHP
	75y7dJYzl00gtEzbmrY8fGyAbzwHQTfZii0U5HFkdZSGwyi8j+VUPBbIX2gmWE/4jKd
	TaCpAqFF72l9nBmAURHGucHds7Q0whyK2/bDVoaE=
Content-Type: multipart/mixed; boundary="===============8966170709560425423=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 5.17 SUCCEEDED
Message-ID: <0101018e430ea086-d77e8826-eff2-473c-8732-8de566ae3b0d-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197237

--===============8966170709560425423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *debianutils* to *5.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-5.16-5.17.patch
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
From 6e4b3ff6dadedcaafabfd0f91620f0b2294efd4a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 15:06:44 +0000
Subject: [PATCH] debianutils: upgrade 5.16 -> 5.17

---
 .../debianutils/{debianutils_5.16.bb => debianutils_5.17.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.16.bb => debianutils_5.17.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.16.bb b/meta/recipes-support/debianutils/debianutils_5.17.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.16.bb
rename to meta/recipes-support/debianutils/debianutils_5.17.bb
index ec629d8b73..c5f25bae40 100644
--- a/meta/recipes-support/debianutils/debianutils_5.16.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.17.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "9e0facf19b17b6d090a5dcc8cacb0c16e5ad9f72"
+SRCREV = "baf12e98a02883d1b76081e32f2185ee3497570b"
 
 inherit autotools update-alternatives
 
-- 
2.42.0


--===============8966170709560425423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/debianutils/debianutils-dbg: PV changed from "5.16" to "5.17"
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dev: PV changed from "5.16" to "5.17"
packages/core2-64-poky-linux/debianutils/debianutils-dev: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-64-poky-linux/debianutils/debianutils-doc: PV changed from "5.16" to "5.17"
packages/core2-64-poky-linux/debianutils/debianutils-doc: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-64-poky-linux/debianutils/debianutils-locale: PV changed from "5.16" to "5.17"
packages/core2-64-poky-linux/debianutils/debianutils-locale: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PV changed from "5.16" to "5.17"
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGSIZE changed from 30109 to 30127 (+0%)
packages/core2-64-poky-linux/debianutils/debianutils-src: PV changed from "5.16" to "5.17"
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PV changed from "5.16" to "5.17"
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-64-poky-linux/debianutils/debianutils: PV changed from "5.16" to "5.17"
packages/core2-64-poky-linux/debianutils/debianutils: PKGV changed from 5.16 [default] to 5.17 [default]
packages/core2-64-poky-linux/debianutils: PV changed from "5.16" to "5.17"
packages/core2-64-poky-linux/debianutils: PKGV changed from 5.16 [default] to 5.17 [default]

--===============8966170709560425423==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-5.16-5.17.patch"

RnJvbSA2ZTRiM2ZmNmRhZGVkY2FhZmFiZmQwZjkxNjIwZjBiMjI5NGVmZDRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTU6MDY6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
ZWJpYW51dGlsczogdXBncmFkZSA1LjE2IC0+IDUuMTcKCi0tLQogLi4uL2RlYmlhbnV0aWxzL3tk
ZWJpYW51dGlsc181LjE2LmJiID0+IGRlYmlhbnV0aWxzXzUuMTcuYmJ9ICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMve2RlYmlhbnV0aWxzXzUuMTYuYmIgPT4gZGViaWFu
dXRpbHNfNS4xNy5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9k
ZWJpYW51dGlscy9kZWJpYW51dGlsc181LjE2LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGVi
aWFudXRpbHMvZGViaWFudXRpbHNfNS4xNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181LjE2LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181
LjE3LmJiCmluZGV4IGVjNjI5ZDhiNzMuLmM1ZjI1YmFlNDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuMTYuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4xNy5iYgpAQCAtMTEsNyAr
MTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9kZWJpYW4vY29weXJpZ2h0O21kNT00
YjY2N2YzMDQxMWQyMWJjOGZkN2RiODVkNTAyYThlOQogU1JDX1VSSSA9ICJnaXQ6Ly9zYWxzYS5k
ZWJpYW4ub3JnL2RlYmlhbi9kZWJpYW51dGlscy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1h
c3RlciBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gIjllMGZhY2YxOWIxN2I2ZDA5MGE1ZGNj
OGNhY2IwYzE2ZTVhZDlmNzIiCitTUkNSRVYgPSAiYmFmMTJlOThhMDI4ODNkMWI3NjA4MWUzMmYy
MTg1ZWUzNDk3NTcwYiIKIAogaW5oZXJpdCBhdXRvdG9vbHMgdXBkYXRlLWFsdGVybmF0aXZlcwog
Ci0tIAoyLjQyLjAKCg==

--===============8966170709560425423==--

