Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37547C71133
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.11251.1747312304778815564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ir1BNYGU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=pgzDr6JS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010196d3ee3682-77e4a7f1-2d2b-4d3d-b9a8-734379c17967-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312326;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fbReIei5FKJIQVKRuAporGHl6MTbDOiTNxW8INO0dIk=;
	b=ir1BNYGUAEZS4qMPxcV9RRd9G5+rh2H7347c1n9Q7LpeJ0zb1vRDRY4/YQE81hEs
	LOJ+REEn0Au1O5aZQBpUc3kcXROShT4ZX6SdpoMr+qxPeHesyZ3hoYnN9KgBjMeFyUR
	qfsyZXmxl9Coyn70lmOaF9w9XrLIjbyJ+OOaS5Q0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312326;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fbReIei5FKJIQVKRuAporGHl6MTbDOiTNxW8INO0dIk=;
	b=pgzDr6JSa7FcwDnhQ75VzF2D+7J00HVaxqsQIT55AR9GuDLuq1LyeaKEmTtRXyUk
	jyYVo9JQ0otei+ZgkGxLKDFr0Hgrws/s5jUqsQnSOU3LSuyckcT+IndYPEF2JR3iyG0
	kUFkz28HzUYpbDg/F54PEjrXVQX2gLJodnc++ep8=
Content-Type: multipart/mixed; boundary="===============0536541331411966613=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] boost-build-native: upgrading to 1.88.0 SUCCEEDED
Message-ID: <01010196d3ee3682-77e4a7f1-2d2b-4d3d-b9a8-734379c17967-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:32:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216653

--===============0536541331411966613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *boost-build-native* to *1.88.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-boost-build-native-upgrade-1.87.0-1.88.0.patch
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
From 4c8a07b53b1c2b9ec0eea3c35f0817e9a8adf633 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 11:49:19 +0000
Subject: [PATCH] boost-build-native: upgrade 1.87.0 -> 1.88.0

---
 ...{boost-build-native_1.87.0.bb => boost-build-native_1.88.0.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-support/boost/{boost-build-native_1.87.0.bb => boost-build-native_1.88.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-build-native_1.87.0.bb b/meta/recipes-support/boost/boost-build-native_1.88.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost-build-native_1.87.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.88.0.bb
-- 
2.47.1


--===============0536541331411966613==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-boost-build-native-upgrade-1.87.0-1.88.0.patch"

RnJvbSA0YzhhMDdiNTNiMWMyYjllYzBlZWEzYzM1ZjA4MTdlOWE4YWRmNjMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMTE6NDk6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
b29zdC1idWlsZC1uYXRpdmU6IHVwZ3JhZGUgMS44Ny4wIC0+IDEuODguMAoKLS0tCiAuLi57Ym9v
c3QtYnVpbGQtbmF0aXZlXzEuODcuMC5iYiA9PiBib29zdC1idWlsZC1uYXRpdmVfMS44OC4wLmJi
fSB8IDAKIDEgZmlsZSBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3Qve2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg3
LjAuYmIgPT4gYm9vc3QtYnVpbGQtbmF0aXZlXzEuODguMC5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3QtYnVpbGQtbmF0aXZlXzEuODcuMC5i
YiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0L2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg4LjAu
YmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2Jvb3N0L2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg3LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2Jvb3N0L2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg4LjAuYmIKLS0gCjIuNDcuMQoK

--===============0536541331411966613==--

