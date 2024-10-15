Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32130D21690
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:15 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.11873.1728994560550410412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=UfH7GeRd;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=jyICaAVL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010192901b7fd1-54ed0b7d-9f1d-4387-8755-7df78323759c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ma8uqV9iANw5Inqm4q3KSAoC3NNDH//2b/bj1Lh5XSA=;
	b=UfH7GeRdN7KEG6vSB+tRdtLjhl6u9juvTYnBJ3L8FjvxLm7ioQE0Ko5aw0MyeOVa
	DVKGIo0YShHL6N/ZAj43v5deD7+z2QAWkXT+1oE6WsZSeWk7t3GXzACls5nITLodSAM
	Pl4g7z/OlC1tzB9RwZA53kYrRe//eOdZyXC62wII=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ma8uqV9iANw5Inqm4q3KSAoC3NNDH//2b/bj1Lh5XSA=;
	b=jyICaAVL+hn9zQA92YifdGFzCIwTV9zHAsnYjPW7/nZGerYbqTzYZN6upLcTOCmw
	T0Zdj3YRTATVskXNUiNjpYiDNl7RWKxOGV5oRXtmlbkvGfZX9Tj/nGgWvs8wI/Hh/3t
	bk/rMx/cC88knpbPjqmlUJBZDCSVdCJzb8tC+sz0=
Content-Type: multipart/mixed; boundary="===============1363977241261534329=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-vaapi: upgrading to 1.24.8 SUCCEEDED
Message-ID: <01010192901b7fd1-54ed0b7d-9f1d-4387-8755-7df78323759c-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205898

--===============1363977241261534329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-vaapi* to *1.24.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-vaapi-upgrade-1.24.6-1.24.8.patch
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
From 031fb66cbe7c56ed660b85e45bf6409aecfbfaad Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 11:56:34 +0000
Subject: [PATCH] gstreamer1.0-vaapi: upgrade 1.24.6 -> 1.24.8

---
 ...streamer1.0-vaapi_1.24.6.bb => gstreamer1.0-vaapi_1.24.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.6.bb => gstreamer1.0-vaapi_1.24.8.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.8.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.8.bb
index 015eb86316..f0770cf31b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.8.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "b5caa057e7efc51cd70504a59e5d9c7a5406d8268723c8283dd61be27fd8cacc"
+SRC_URI[sha256sum] = "c8f015eee7a4d989383e0689a099bfabec95e55159ee875cc4eb9ff8d816dccb"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.44.1


--===============1363977241261534329==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-vaapi-upgrade-1.24.6-1.24.8.patch"

RnJvbSAwMzFmYjY2Y2JlN2M1NmVkNjYwYjg1ZTQ1YmY2NDA5YWVjZmJmYWFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMTE6NTY6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtdmFhcGk6IHVwZ3JhZGUgMS4yNC42IC0+IDEuMjQuOAoKLS0tCiAuLi5zdHJl
YW1lcjEuMC12YWFwaV8xLjI0LjYuYmIgPT4gZ3N0cmVhbWVyMS4wLXZhYXBpXzEuMjQuOC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC12YWFw
aV8xLjI0LjYuYmIgPT4gZ3N0cmVhbWVyMS4wLXZhYXBpXzEuMjQuOC5iYn0gKDk1JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXZh
YXBpXzEuMjQuNi5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtdmFhcGlfMS4yNC44LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtdmFhcGlfMS4yNC42
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXZhYXBpXzEuMjQuOC5iYgppbmRleCAwMTVlYjg2MzE2Li5mMDc3MGNmMzFiIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXZhYXBp
XzEuMjQuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXZhYXBpXzEuMjQuOC5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HLkxJQjttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUx
NmMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy8k
e1JFQUxQTn0vJHtSRUFMUE59LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImI1Y2FhMDU3ZTdlZmM1MWNkNzA1MDRhNTllNWQ5YzdhNTQwNmQ4MjY4NzIzYzgyODNkZDYxYmUy
N2ZkOGNhY2MiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzhmMDE1ZWVlN2E0ZDk4OTM4M2UwNjg5
YTA5OWJmYWJlYzk1ZTU1MTU5ZWU4NzVjYzRlYjlmZjhkODE2ZGNjYiIKIAogUyA9ICIke1dPUktE
SVJ9LyR7UkVBTFBOfS0ke1BWfSIKIERFUEVORFMgPSAibGlidmEgZ3N0cmVhbWVyMS4wIGdzdHJl
YW1lcjEuMC1wbHVnaW5zLWJhc2UgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFkIgotLSAKMi40NC4x
Cgo=

--===============1363977241261534329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dbg: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-dev: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-doc: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-locale: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-src: PKGSIZE changed from 2832524 to 2832550 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-staticdev: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi-tests: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi/gstreamer1.0-vaapi: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0-vaapi: PKGV changed from 1.24.6 [default] to 1.24.8 [default]
packages/core2-64-poky-linux/gstreamer1.0-vaapi: PV changed from "1.24.6" to "1.24.8"
packages/core2-64-poky-linux/gstreamer1.0-vaapi: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.24.6.tar.xz" to "https://gstreamer.freedesktop.org/src/gstreamer-vaapi/gstreamer-vaapi-1.24.8.tar.xz"

--===============1363977241261534329==--

