Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633ACE77186
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:50 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.33343.1734254982070621269
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bXqvq7YW;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=J6+GcAGK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010193c9a70d97-9cb2a25a-089d-4536-86a1-e2c4589a8b57-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254988;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mTPYINJhvLz3ogGrbXSG1o7jd+DNaWIn4UQI8vn5xtw=;
	b=bXqvq7YWp40QVvl0EvXQcQAx0V/2bNAogKHo0nNyBcLZkKhvJvcNAPCO2LCbmhyd
	qkutC8yJsaQBUXa5l6ugc1HYMK9e8tkVtIH0jP5S4O0Hoyx87y+kaekOsBzFSHqUeT2
	aEWTXZ4ga1OK3842vb1yFeQLdw8DApsMlalLn4qo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254988;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mTPYINJhvLz3ogGrbXSG1o7jd+DNaWIn4UQI8vn5xtw=;
	b=J6+GcAGKCNhlGS9Kwr9jNd87Ji4qhGUAfHOBeFV6cy1qqcAVRR29/33UyM1cPVp2
	QD7SGl3GiC1ChSYExd/XCdJrvEBM1ooZgz3GqXxP0lDrkZOtHfSY4dUoXcjultwb71O
	WdlL+Yv1RhkipKs9KEA/tTj3ZDVdGKpT/p9u0wwA=
Content-Type: multipart/mixed; boundary="===============0364847650338714742=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 5.21 SUCCEEDED
Message-ID: <01010193c9a70d97-9cb2a25a-089d-4536-86a1-e2c4589a8b57-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208734

--===============0364847650338714742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *debianutils* to *5.21* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-5.20-5.21.patch
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
From f135b4b8adf0babf71a390781aa396564d884653 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 09:06:30 +0000
Subject: [PATCH] debianutils: upgrade 5.20 -> 5.21

---
 .../debianutils/{debianutils_5.20.bb => debianutils_5.21.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.20.bb => debianutils_5.21.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.20.bb b/meta/recipes-support/debianutils/debianutils_5.21.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.20.bb
rename to meta/recipes-support/debianutils/debianutils_5.21.bb
index 61438121da..e0485b24a3 100644
--- a/meta/recipes-support/debianutils/debianutils_5.20.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.21.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "9f3d6fa6b8d91849a78d681294fa8ea7bfa9086f"
+SRCREV = "ae002b498f2e310c934a0b3f0992e83391f108c7"
 
 inherit autotools update-alternatives
 
-- 
2.44.1


--===============0364847650338714742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGSIZE changed from 74416 to 78064 (+5%)
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGV changed from 5.20 [default] to 5.21 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PV changed from "5.20" to "5.21"
packages/core2-64-poky-linux/debianutils/debianutils-dev: PKGV changed from 5.20 [default] to 5.21 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dev: PV changed from "5.20" to "5.21"
packages/core2-64-poky-linux/debianutils/debianutils-doc: PKGSIZE changed from 13622 to 14141 (+4%)
packages/core2-64-poky-linux/debianutils/debianutils-doc: PKGV changed from 5.20 [default] to 5.21 [default]
packages/core2-64-poky-linux/debianutils/debianutils-doc: PV changed from "5.20" to "5.21"
packages/core2-64-poky-linux/debianutils/debianutils-locale: PKGV changed from 5.20 [default] to 5.21 [default]
packages/core2-64-poky-linux/debianutils/debianutils-locale: PV changed from "5.20" to "5.21"
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 5.20 [default] to 5.21 [default]
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PV changed from "5.20" to "5.21"
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGSIZE changed from 30127 to 33339 (+11%)
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGV changed from 5.20 [default] to 5.21 [default]
packages/core2-64-poky-linux/debianutils/debianutils-src: PV changed from "5.20" to "5.21"
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 5.20 [default] to 5.21 [default]
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PV changed from "5.20" to "5.21"
packages/core2-64-poky-linux/debianutils/debianutils: PKGV changed from 5.20 [default] to 5.21 [default]
packages/core2-64-poky-linux/debianutils/debianutils: PV changed from "5.20" to "5.21"
packages/core2-64-poky-linux/debianutils: PKGV changed from 5.20 [default] to 5.21 [default]
packages/core2-64-poky-linux/debianutils: PV changed from "5.20" to "5.21"

--===============0364847650338714742==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-5.20-5.21.patch"

RnJvbSBmMTM1YjRiOGFkZjBiYWJmNzFhMzkwNzgxYWEzOTY1NjRkODg0NjUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDk6MDY6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
ZWJpYW51dGlsczogdXBncmFkZSA1LjIwIC0+IDUuMjEKCi0tLQogLi4uL2RlYmlhbnV0aWxzL3tk
ZWJpYW51dGlsc181LjIwLmJiID0+IGRlYmlhbnV0aWxzXzUuMjEuYmJ9ICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMve2RlYmlhbnV0aWxzXzUuMjAuYmIgPT4gZGViaWFu
dXRpbHNfNS4yMS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9k
ZWJpYW51dGlscy9kZWJpYW51dGlsc181LjIwLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGVi
aWFudXRpbHMvZGViaWFudXRpbHNfNS4yMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181LjIwLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181
LjIxLmJiCmluZGV4IDYxNDM4MTIxZGEuLmUwNDg1YjI0YTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuMjAuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4yMS5iYgpAQCAtMTEsNyAr
MTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9kZWJpYW4vY29weXJpZ2h0O21kNT00
YjY2N2YzMDQxMWQyMWJjOGZkN2RiODVkNTAyYThlOQogU1JDX1VSSSA9ICJnaXQ6Ly9zYWxzYS5k
ZWJpYW4ub3JnL2RlYmlhbi9kZWJpYW51dGlscy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1h
c3RlciBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gIjlmM2Q2ZmE2YjhkOTE4NDlhNzhkNjgx
Mjk0ZmE4ZWE3YmZhOTA4NmYiCitTUkNSRVYgPSAiYWUwMDJiNDk4ZjJlMzEwYzkzNGEwYjNmMDk5
MmU4MzM5MWYxMDhjNyIKIAogaW5oZXJpdCBhdXRvdG9vbHMgdXBkYXRlLWFsdGVybmF0aXZlcwog
Ci0tIAoyLjQ0LjEKCg==

--===============0364847650338714742==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/debianutils/debianutils-src: PKGSIZE changed from 30127 to 33339 (+11%)

--===============0364847650338714742==--

