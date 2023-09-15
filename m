Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86161EEEC2C
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:02 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.29471.1694804394311367624
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PIX5zWR6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EejW5XFd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018a9a36c6e3-01ac95c3-7202-4d46-b8fb-ecca04fb7e1d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=41UHoli45HuoXhMzACcIFjQ7+LHQWkL73EAd7IGb8ew=;
	b=PIX5zWR6TqczT3Gd1axgfJlYwq24T79BhN4Ci/FX0rBNVbpyX1iQmBtofwfW5+DO
	ts+yA3Oqyt1Q/i6A5KDSAnVDUPLXyiFXTs6HL3UAEwxHytqht8v8ixX04o+UqApLYur
	3OqFbrFJyrplHq2HSkK+1OfG5l/7xINqvfWDjSvw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=41UHoli45HuoXhMzACcIFjQ7+LHQWkL73EAd7IGb8ew=;
	b=EejW5XFdNFV/qTdVyA9LbjAILP4zhQ54xJ1QuQXUkXAB0rHopwjPzY0q32X6QtkR
	JVTMdXDZ38XcFQTbJq5QcEbQXb8rRAMftNnXCOBoi7U6yx5Uj8NVcRlArGx2Iu9DDap
	cROUh3f/byyDFZdZ3hAgVNpWV3M3EoQhum80vN2M=
Content-Type: multipart/mixed; boundary="===============9184581381262502960=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 5.13 SUCCEEDED
Message-ID: <0101018a9a36c6e3-01ac95c3-7202-4d46-b8fb-ecca04fb7e1d-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187754

--===============9184581381262502960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *debianutils* to *5.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-5.12-5.13.patch
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
From 753172a978095c4f94b4bd46d2cde8c019be6691 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 18:15:44 +0000
Subject: [PATCH] debianutils: upgrade 5.12 -> 5.13

---
 .../debianutils/{debianutils_5.12.bb => debianutils_5.13.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.12.bb => debianutils_5.13.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.12.bb b/meta/recipes-support/debianutils/debianutils_5.13.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.12.bb
rename to meta/recipes-support/debianutils/debianutils_5.13.bb
index 4002a44cdb..915277b42c 100644
--- a/meta/recipes-support/debianutils/debianutils_5.12.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.13.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=74765f57ae5dd2b10ffbc39528d98753
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "78bdc9165504b61ff4ea25a95d9865c45bfe7520"
+SRCREV = "d49a78eb264c1b2ad3d0d6de8e1fb776bda9c943"
 
 inherit autotools update-alternatives
 
-- 
2.39.2


--===============9184581381262502960==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-5.12-5.13.patch"

RnJvbSA3NTMxNzJhOTc4MDk1YzRmOTRiNGJkNDZkMmNkZThjMDE5YmU2NjkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTg6MTU6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
ZWJpYW51dGlsczogdXBncmFkZSA1LjEyIC0+IDUuMTMKCi0tLQogLi4uL2RlYmlhbnV0aWxzL3tk
ZWJpYW51dGlsc181LjEyLmJiID0+IGRlYmlhbnV0aWxzXzUuMTMuYmJ9ICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMve2RlYmlhbnV0aWxzXzUuMTIuYmIgPT4gZGViaWFu
dXRpbHNfNS4xMy5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9k
ZWJpYW51dGlscy9kZWJpYW51dGlsc181LjEyLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGVi
aWFudXRpbHMvZGViaWFudXRpbHNfNS4xMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181LjEyLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181
LjEzLmJiCmluZGV4IDQwMDJhNDRjZGIuLjkxNTI3N2I0MmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuMTIuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4xMy5iYgpAQCAtMTEsNyAr
MTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9kZWJpYW4vY29weXJpZ2h0O21kNT03
NDc2NWY1N2FlNWRkMmIxMGZmYmMzOTUyOGQ5ODc1MwogU1JDX1VSSSA9ICJnaXQ6Ly9zYWxzYS5k
ZWJpYW4ub3JnL2RlYmlhbi9kZWJpYW51dGlscy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1h
c3RlciBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gIjc4YmRjOTE2NTUwNGI2MWZmNGVhMjVh
OTVkOTg2NWM0NWJmZTc1MjAiCitTUkNSRVYgPSAiZDQ5YTc4ZWIyNjRjMWIyYWQzZDBkNmRlOGUx
ZmI3NzZiZGE5Yzk0MyIKIAogaW5oZXJpdCBhdXRvdG9vbHMgdXBkYXRlLWFsdGVybmF0aXZlcwog
Ci0tIAoyLjM5LjIKCg==

--===============9184581381262502960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/debianutils/debianutils-dbg: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/debianutils/debianutils-dbg: PV changed from "5.12" to "5.13"
packages/core2-32-poky-linux/debianutils/debianutils-dbg: PKGSIZE changed from 68632 to 68636 (+0%)
packages/core2-32-poky-linux/debianutils/debianutils-dev: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/debianutils/debianutils-dev: PV changed from "5.12" to "5.13"
packages/core2-32-poky-linux/debianutils/debianutils-doc: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/debianutils/debianutils-doc: PV changed from "5.12" to "5.13"
packages/core2-32-poky-linux/debianutils/debianutils-doc: PKGSIZE changed from 13535 to 13539 (+0%)
packages/core2-32-poky-linux/debianutils/debianutils-locale: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/debianutils/debianutils-locale: PV changed from "5.12" to "5.13"
packages/core2-32-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/debianutils/debianutils-run-parts: PV changed from "5.12" to "5.13"
packages/core2-32-poky-linux/debianutils/debianutils-src: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/debianutils/debianutils-src: PV changed from "5.12" to "5.13"
packages/core2-32-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/debianutils/debianutils-staticdev: PV changed from "5.12" to "5.13"
packages/core2-32-poky-linux/debianutils/debianutils: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/debianutils/debianutils: PV changed from "5.12" to "5.13"
packages/core2-32-poky-linux/debianutils: PKGV changed from 5.12 [default] to 5.13 [default]
packages/core2-32-poky-linux/debianutils: PV changed from "5.12" to "5.13"

--===============9184581381262502960==--

