Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDD5C54F2E
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:06 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.131103.1723748334706902600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Di6ENoPC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=PC7Ai0/p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101915768405b-26099ceb-882e-4bfe-ac2e-8681ce2899a4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uHwEcaRVStvP8X4wH95I7AfQ9AVwFipvuf/7nfD5uj0=;
	b=Di6ENoPCBEhuZ2N4SUDuKrakP6o5h8Gny4x63DOdw7PdT2dbix5MvpyJ03nbJ7Po
	VS9hg5Ge8G2pTpuwafg5T50y8BzJPhSa88Uj8Z3RjuKUN4fkB3VyvwxyWT2BDbQzIBj
	tMt6nC8EUISpjDIiMvz7aUAS9GU5+QL6jcPgMgYo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uHwEcaRVStvP8X4wH95I7AfQ9AVwFipvuf/7nfD5uj0=;
	b=PC7Ai0/paWIIXwbNK1xJspNMrGXJmhIBYwVljXbABlylARp4AU7yJToyKUnVwmFa
	xf8HB9Y00UBehPOX6gJTNe8FkryTR8bbo5J5120U8JeJAQOsW8tzUcl5tUflni9m7dM
	BNC97U/PZ/qN15zValp4JgjjSQt1GFGzJRG5alwQ=
Content-Type: multipart/mixed; boundary="===============5603273916680646504=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nghttp2: upgrading to 1.62.1 SUCCEEDED
Message-ID: <010101915768405b-26099ceb-882e-4bfe-ac2e-8681ce2899a4-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203411

--===============5603273916680646504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nghttp2* to *1.62.1* has Succeeded.

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
From dac90df7cac6cf4efa7e388700050eb114c6a0b6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 18:40:53 +0000
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


--===============5603273916680646504==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nghttp2-upgrade-1.62.0-1.62.1.patch"

RnJvbSBkYWM5MGRmN2NhYzZjZjRlZmE3ZTM4ODcwMDA1MGViMTE0YzZhMGI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTg6NDA6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
Z2h0dHAyOiB1cGdyYWRlIDEuNjIuMCAtPiAxLjYyLjEKCi0tLQogLi4uL25naHR0cDIve25naHR0
cDJfMS42Mi4wLmJiID0+IG5naHR0cDJfMS42Mi4xLmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbmdodHRwMi97bmdodHRwMl8xLjYyLjAuYmIgPT4gbmdodHRwMl8xLjYy
LjEuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9u
Z2h0dHAyXzEuNjIuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8x
LjYyLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNjIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNjIuMS5iYgppbmRleCA1YTgyMGQ4Y2Q1Li44YWI2YjE3
ZmViIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25naHR0cDJfMS42
Mi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjYyLjEu
YmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9NzY0YWJkZjMwYjJlYWRkMzdjZTQ3ZGNiY2UwZWExZWMiCiAKIFNS
Q19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BWfS9uZ2h0dHAyLSR7UFZ9
LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyNjc5ODMwOGZhMGExMmRhYmRiN2JhOGM3
N2Y3NDM4MzAxOWQzYTBmMWYzNmQyNTk1OGI4MzZhZjIyNDc0OTU4IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjIzNDVkNGRjMTM2ZmRhMjhjZTI0M2UwYmIyMWYyZTdlOGVmNjI5M2Q2MmM3OTlhYmJm
NmY2MzNhNjg4N2FmNzIiCiAKIGluaGVyaXQgY21ha2UgbWFucGFnZXMgcHl0aG9uM25hdGl2ZSBn
aXRodWItcmVsZWFzZXMKIFBBQ0tBR0VDT05GSUdbbWFucGFnZXNdID0gIiIKLS0gCjIuNDQuMAoK

--===============5603273916680646504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/nghttp2: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2: SRC_URI changed from "https://github.com/nghttp2/nghttp2/releases//download/v1.62.0/nghttp2-1.62.0.tar.xz" to "https://github.com/nghttp2/nghttp2/releases//download/v1.62.1/nghttp2-1.62.1.tar.xz"
packages/core2-64-poky-linux/nghttp2: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/libnghttp2: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/libnghttp2: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-dbg: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-dev: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-doc: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-doc: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-locale: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-locale: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-proxy: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-proxy: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-src: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-src: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2-staticdev: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2-staticdev: PKGV changed from 1.62.0 [default] to 1.62.1 [default]
packages/core2-64-poky-linux/nghttp2/nghttp2: PV changed from "1.62.0" to "1.62.1"
packages/core2-64-poky-linux/nghttp2/nghttp2: PKGV changed from 1.62.0 [default] to 1.62.1 [default]

--===============5603273916680646504==--

