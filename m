Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F35C5ACB3
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:15 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.14622.1700059030012817962
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=c+UUBpWe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gu1G5j90;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018bd36a2bda-777ad553-f9f7-4f21-9eff-75a8c137c29d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=E0bKUVbDEuSfBsH+OUF3lm8s6n7jd495ATR8tM8sWzA=;
	b=c+UUBpWeWscWt4Z3YKR9PPc+BLBGtmuMlrSf9AywYBfhY1t3EqDJuxTNAWm6pynn
	JFwegLzkjXHVVe5yUkkQlSb9RSnlOxwkWLQFV8knnOpgGMeBR5Fti/6HVFtZ0FyjjON
	didZgSysuWY5wm08lOH5v2qNxZjfROxQNHifUeOA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=E0bKUVbDEuSfBsH+OUF3lm8s6n7jd495ATR8tM8sWzA=;
	b=gu1G5j90Sn+p+bv/n1jPz3BegTwn/edVnECKFmevs0UzZw0zaM6KyDAw4npNfQAe
	KLoDmf04sxJ9oG7rP+gMhY/TTlmI8J1EB5NFHbdl8egZN+B1GynSahJLjZbtiFiognp
	kNVtgcYmaM7H/LGcHyTtQzsAfdolJ3mVAU283K1o=
Content-Type: multipart/mixed; boundary="===============2725813901964102720=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-omx: upgrading to 1.22.7 SUCCEEDED
Message-ID: <0101018bd36a2bda-777ad553-f9f7-4f21-9eff-75a8c137c29d-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190707

--===============2725813901964102720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-omx* to *1.22.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-omx-upgrade-1.22.6-1.22.7.patch
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
From 1f5bbd508e15ccccf3b4bc4b53943ac2891f4e40 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 12:58:54 +0000
Subject: [PATCH] gstreamer1.0-omx: upgrade 1.22.6 -> 1.22.7

---
 .../{gstreamer1.0-omx_1.22.6.bb => gstreamer1.0-omx_1.22.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.6.bb => gstreamer1.0-omx_1.22.7.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.7.bb
index 2579aa3d66..ad40cf5513 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.22.7.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "223833c42518ad7eb1923bb4dd3726809f59a66d6e9aaaa69cb29ad0750c8758"
+SRC_URI[sha256sum] = "d7a18ec47d40a472bd5cba2015e0be72b732f1699895398cec5cd8e6a3a53b44"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.39.2


--===============2725813901964102720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dbg: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-dev: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-doc: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-locale: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-src: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx-staticdev: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx/gstreamer1.0-omx: PV changed from "1.22.6" to "1.22.7"
packages/core2-64-poky-linux/gstreamer1.0-omx: PKGV changed from 1.22.6 [default] to 1.22.7 [default]
packages/core2-64-poky-linux/gstreamer1.0-omx: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.6.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-1.22.7.tar.xz"
packages/core2-64-poky-linux/gstreamer1.0-omx: PV changed from "1.22.6" to "1.22.7"

--===============2725813901964102720==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-omx-upgrade-1.22.6-1.22.7.patch"

RnJvbSAxZjViYmQ1MDhlMTVjY2NjZjNiNGJjNGI1Mzk0M2FjMjg5MWY0ZTQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTI6NTg6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtb214OiB1cGdyYWRlIDEuMjIuNiAtPiAxLjIyLjcKCi0tLQogLi4uL3tnc3Ry
ZWFtZXIxLjAtb214XzEuMjIuNi5iYiA9PiBnc3RyZWFtZXIxLjAtb214XzEuMjIuNy5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtb214XzEu
MjIuNi5iYiA9PiBnc3RyZWFtZXIxLjAtb214XzEuMjIuNy5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8xLjIy
LjYuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9t
eF8xLjIyLjcuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1vbXhfMS4yMi42LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLW9teF8xLjIy
LjcuYmIKaW5kZXggMjU3OWFhM2Q2Ni4uYWQ0MGNmNTUxMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1vbXhfMS4yMi42LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtb214XzEuMjIu
Ny5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5H
O21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyBcCiAKIFNSQ19VUkkgPSAiaHR0
cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3Qtb214L2dzdC1vbXgtJHtQVn0u
dGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjIzODMzYzQyNTE4YWQ3ZWIxOTIzYmI0
ZGQzNzI2ODA5ZjU5YTY2ZDZlOWFhYWE2OWNiMjlhZDA3NTBjODc1OCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJkN2ExOGVjNDdkNDBhNDcyYmQ1Y2JhMjAxNWUwYmU3MmI3MzJmMTY5OTg5NTM5OGNl
YzVjZDhlNmEzYTUzYjQ0IgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LW9teC0ke1BWfSIKIAotLSAK
Mi4zOS4yCgo=

--===============2725813901964102720==--

