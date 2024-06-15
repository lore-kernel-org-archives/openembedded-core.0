Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD4FC3065C
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:25 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.18609.1718475799137046325
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=U8Ti8ShT;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=l+hixJ6z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101901d23bf29-080240da-2bc6-43a7-9a0b-e0ea8f1990fb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mcMTjgw5yVPVPtMjh2QsowgMVBSbUNgyt1jbG8X5WZk=;
	b=U8Ti8ShTX44AvPmjxbWeKTAYnKKmai0Uyw+sSkwHiEavE6xOWp4CMuq0OJ7lAxKb
	iZTEjN6YwvWeSIiBexHDnfTaFI2FqvcKaTjaxsATeef7yv27opP97hVq0PnIKbHM0cd
	Tgkv43Hqp8wObFh9j+StxGlNS8OEHxHJncmF2t8Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mcMTjgw5yVPVPtMjh2QsowgMVBSbUNgyt1jbG8X5WZk=;
	b=l+hixJ6zZ8luqsWvgRD2Vo4rR1uVhx8UVbcie9hSyH1ak84q5TVuLlP3BqiN0stA
	XOY2cGVIIuQc53XCr59TvqGGBj8l9FhI1RVxDAii1oR8/CoJ47UJEovw8FJWygBoK9u
	BsOnXyeVrZVPJJkAdOWeu/IpKbpWKzqxwZliWybA=
Content-Type: multipart/mixed; boundary="===============4671096188879014309=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] debianutils: upgrading to 5.19 SUCCEEDED
Message-ID: <010101901d23bf29-080240da-2bc6-43a7-9a0b-e0ea8f1990fb-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200742

--===============4671096188879014309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *debianutils* to *5.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-debianutils-upgrade-5.17-5.19.patch
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
From 50d5ae55d67280f25f4ca5ec952079010ee06c1d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 17:25:12 +0000
Subject: [PATCH] debianutils: upgrade 5.17 -> 5.19

---
 .../debianutils/{debianutils_5.17.bb => debianutils_5.19.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.17.bb => debianutils_5.19.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.17.bb b/meta/recipes-support/debianutils/debianutils_5.19.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.17.bb
rename to meta/recipes-support/debianutils/debianutils_5.19.bb
index c5f25bae40..0fe9b1ec14 100644
--- a/meta/recipes-support/debianutils/debianutils_5.17.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.19.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "baf12e98a02883d1b76081e32f2185ee3497570b"
+SRCREV = "295d7674cdd526f3c9ec9de76db50efa280a5df0"
 
 inherit autotools update-alternatives
 
-- 
2.44.0


--===============4671096188879014309==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-debianutils-upgrade-5.17-5.19.patch"

RnJvbSA1MGQ1YWU1NWQ2NzI4MGYyNWY0Y2E1ZWM5NTIwNzkwMTBlZTA2YzFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMTc6MjU6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
ZWJpYW51dGlsczogdXBncmFkZSA1LjE3IC0+IDUuMTkKCi0tLQogLi4uL2RlYmlhbnV0aWxzL3tk
ZWJpYW51dGlsc181LjE3LmJiID0+IGRlYmlhbnV0aWxzXzUuMTkuYmJ9ICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMve2RlYmlhbnV0aWxzXzUuMTcuYmIgPT4gZGViaWFu
dXRpbHNfNS4xOS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9k
ZWJpYW51dGlscy9kZWJpYW51dGlsc181LjE3LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGVi
aWFudXRpbHMvZGViaWFudXRpbHNfNS4xOS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181LjE3LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9kZWJpYW51dGlscy9kZWJpYW51dGlsc181
LjE5LmJiCmluZGV4IGM1ZjI1YmFlNDAuLjBmZTliMWVjMTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2RlYmlhbnV0aWxzL2RlYmlhbnV0aWxzXzUuMTcuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGViaWFudXRpbHMvZGViaWFudXRpbHNfNS4xOS5iYgpAQCAtMTEsNyAr
MTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9kZWJpYW4vY29weXJpZ2h0O21kNT00
YjY2N2YzMDQxMWQyMWJjOGZkN2RiODVkNTAyYThlOQogU1JDX1VSSSA9ICJnaXQ6Ly9zYWxzYS5k
ZWJpYW4ub3JnL2RlYmlhbi9kZWJpYW51dGlscy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1h
c3RlciBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gImJhZjEyZTk4YTAyODgzZDFiNzYwODFl
MzJmMjE4NWVlMzQ5NzU3MGIiCitTUkNSRVYgPSAiMjk1ZDc2NzRjZGQ1MjZmM2M5ZWM5ZGU3NmRi
NTBlZmEyODBhNWRmMCIKIAogaW5oZXJpdCBhdXRvdG9vbHMgdXBkYXRlLWFsdGVybmF0aXZlcwog
Ci0tIAoyLjQ0LjAKCg==

--===============4671096188879014309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/debianutils/debianutils-dbg: PKGV changed from 5.17 [default] to 5.19 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dbg: PV changed from "5.17" to "5.19"
packages/core2-64-poky-linux/debianutils/debianutils-dev: PKGV changed from 5.17 [default] to 5.19 [default]
packages/core2-64-poky-linux/debianutils/debianutils-dev: PV changed from "5.17" to "5.19"
packages/core2-64-poky-linux/debianutils/debianutils-doc: PKGV changed from 5.17 [default] to 5.19 [default]
packages/core2-64-poky-linux/debianutils/debianutils-doc: PV changed from "5.17" to "5.19"
packages/core2-64-poky-linux/debianutils/debianutils-locale: PKGV changed from 5.17 [default] to 5.19 [default]
packages/core2-64-poky-linux/debianutils/debianutils-locale: PV changed from "5.17" to "5.19"
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PKGV changed from 5.17 [default] to 5.19 [default]
packages/core2-64-poky-linux/debianutils/debianutils-run-parts: PV changed from "5.17" to "5.19"
packages/core2-64-poky-linux/debianutils/debianutils-src: PKGV changed from 5.17 [default] to 5.19 [default]
packages/core2-64-poky-linux/debianutils/debianutils-src: PV changed from "5.17" to "5.19"
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PKGV changed from 5.17 [default] to 5.19 [default]
packages/core2-64-poky-linux/debianutils/debianutils-staticdev: PV changed from "5.17" to "5.19"
packages/core2-64-poky-linux/debianutils/debianutils: PKGV changed from 5.17 [default] to 5.19 [default]
packages/core2-64-poky-linux/debianutils/debianutils: PKGSIZE changed from 49574 to 49656 (+0%)
packages/core2-64-poky-linux/debianutils/debianutils: PV changed from "5.17" to "5.19"
packages/core2-64-poky-linux/debianutils: PKGV changed from 5.17 [default] to 5.19 [default]
packages/core2-64-poky-linux/debianutils: PV changed from "5.17" to "5.19"

--===============4671096188879014309==--

