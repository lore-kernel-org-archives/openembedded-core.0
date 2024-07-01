Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCBAC5321D
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:03 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.2118.1719853076619254301
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SEiecztI;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=x0nN6JnP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101906f3b531c-2628811d-dee9-4faa-a168-ee4b123f1715-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853077;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=S2C3iUNETU/LfPleF4ckoaZVqrZAK9/zbIVlCag3WiY=;
	b=SEiecztIVqik9EkZYPXKHzLMj1sAbFtddi7DsL+ga/oSFd5YwP7PB2SQLFv8g8iB
	NJHCL532DOO3L1mCWhQ0JqGhKc0NLmSJZJkOCq04GdZLa6oekzHt/sw7gxMc4VYvjHI
	Rc0aVzLcQWkOynJamELIJAnISMB+MNQ0Bhx+FpFE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853077;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=S2C3iUNETU/LfPleF4ckoaZVqrZAK9/zbIVlCag3WiY=;
	b=x0nN6JnPvCqlWZpS6t3Tr+qJMizREaU8oajA5pEcSzsv2a4dDUXIV7Y0fymTFRbX
	bjfZ5MgsRSEMFfpAs7O8zbaghQRVWvHCWFHf1KM2ds+T9mSgdvGIp1mU+UsvBI1D5mv
	QUejF873A8mYdLuBNmhD7MYZ+ble1wGHeQU3CQGs=
Content-Type: multipart/mixed; boundary="===============4675040055877031685=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nghttp2: upgrading to 1.62.1 SUCCEEDED
Message-ID: <010101906f3b531c-2628811d-dee9-4faa-a168-ee4b123f1715-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201390

--===============4675040055877031685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *nghttp2* to *1.62.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-nghttp2-upgrade-1.62.0-1.62.1.patch
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
From 694d5b5e52bf6ec51d1ad8bcc40a4a21e8296b79 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 16:34:40 +0000
Subject: [PATCH] nghttp2: upgrade 1.62.0 -> 1.62.1

---
 .../nghttp2/{nghttp2_1.62.0.bb => nghttp2_1.62.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.62.0.bb => nghttp2_1.62.1.bb} (91%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb
similarity index 91%
rename from meta/recipes-support/nghttp2/nghttp2_1.62.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.62.1.bb
index 5a820d8cd5..8ab6b17feb 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.62.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.62.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[sha256sum] = "26798308fa0a12dabdb7ba8c77f74383019d3a0f1f36d25958b836af22474958"
+SRC_URI[sha256sum] = "2345d4dc136fda28ce243e0bb21f2e7e8ef6293d62c799abbf6f633a6887af72"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.44.0


--===============4675040055877031685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/nghttp2: SRC_URI changed from "https://github.com/nghttp2/nghttp2/releases//download/v1.62.0/nghttp2-1.62.0.tar.xz" to "https://github.com/nghttp2/nghttp2/releases//download/v1.62.1/nghttp2-1.62.1.tar.xz"
packages/core2-64-poky-linux/nghttp2: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/libnghttp2: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/libnghttp2: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-doc: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-doc: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-locale: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-locale: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-proxy: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-proxy: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-src: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-src: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-staticdev: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-staticdev: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2: PV changed from "1.62.0" to "1.62.1"

--===============4675040055877031685==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nghttp2-upgrade-1.62.0-1.62.1.patch"

RnJvbSA2OTRkNWI1ZTUyYmY2ZWM1MWQxYWQ4YmNjNDBhNGEyMWU4Mjk2Yjc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAxNjozNDo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5n
aHR0cDI6IHVwZ3JhZGUgMS42Mi4wIC0+IDEuNjIuMQoKLS0tCiAuLi4vbmdodHRwMi97bmdodHRw
Ml8xLjYyLjAuYmIgPT4gbmdodHRwMl8xLjYyLjEuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9uZ2h0dHAyL3tuZ2h0dHAyXzEuNjIuMC5iYiA9PiBuZ2h0dHAyXzEuNjIu
MS5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25n
aHR0cDJfMS42Mi4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEu
NjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9uZ2h0dHAyL25naHR0cDJfMS42Mi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9uZ2h0dHAyL25naHR0cDJfMS42Mi4xLmJiCmluZGV4IDVhODIwZDhjZDUuLjhhYjZiMTdm
ZWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjYy
LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNjIuMS5i
YgpAQCAtNSw3ICs1LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9DT1BZSU5HO21kNT03NjRhYmRmMzBiMmVhZGQzN2NlNDdkY2JjZTBlYTFlYyIKIAogU1JD
X1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L25naHR0cDItJHtQVn0u
dGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI2Nzk4MzA4ZmEwYTEyZGFiZGI3YmE4Yzc3
Zjc0MzgzMDE5ZDNhMGYxZjM2ZDI1OTU4YjgzNmFmMjI0NzQ5NTgiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMjM0NWQ0ZGMxMzZmZGEyOGNlMjQzZTBiYjIxZjJlN2U4ZWY2MjkzZDYyYzc5OWFiYmY2
ZjYzM2E2ODg3YWY3MiIKIAogaW5oZXJpdCBjbWFrZSBtYW5wYWdlcyBweXRob24zbmF0aXZlIGdp
dGh1Yi1yZWxlYXNlcwogUEFDS0FHRUNPTkZJR1ttYW5wYWdlc10gPSAiIgotLSAKMi40NC4wCgo=

--===============4675040055877031685==--

