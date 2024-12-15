Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D6AE77187
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:50 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.33388.1734254989337652462
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=HToC4dZo;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=nVQ7Q8uA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010193c9a70c88-6d8f2f9f-218f-4912-9436-f54750d2af44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254988;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OOpLiJxGpCbsaIA7fsP1VkcnCDU2zlWBP61XrcDG2NI=;
	b=HToC4dZoWjK4sh6QMuOvDrJXqsRMSFiOEWVd6dNg43GAS2/lm38udZYJKhC31amX
	IkkBA8iT5fP2RrC04wsO9nY1b1hBgvgsk1bWx7yqXlCHkVIkKHILTtd45JWzTkppYuq
	CuXHshZxCu6jqVESdV0HmW+QkzIKWiygiZ9dVFgM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254988;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OOpLiJxGpCbsaIA7fsP1VkcnCDU2zlWBP61XrcDG2NI=;
	b=nVQ7Q8uAaMzqqCEbC00xwc7iLWkGfXrjjLAnnn9iHOrV+EvbJbehLKLtXqgk7iun
	2cLT2R9xP4cyPTdAdbQysO9SP3Azo3JO2BdtwHTxzx1Q/MfDdfSG+3WV/JplPGUaCDU
	GfLCkz1A0bjOuUvCHtGtOoUoaqALl6wNSIRj5c+8=
Content-Type: multipart/mixed; boundary="===============4637701333688000096=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] boost-build-native: upgrading to 1.87.0 SUCCEEDED
Message-ID: <01010193c9a70c88-6d8f2f9f-218f-4912-9436-f54750d2af44-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208736

--===============4637701333688000096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *boost-build-native* to *1.87.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-boost-build-native-upgrade-1.86.0-1.87.0.patch
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
From b7eb8d9d0a41af907c01737ffcb90b3f9f5e663a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 08:48:07 +0000
Subject: [PATCH] boost-build-native: upgrade 1.86.0 -> 1.87.0

---
 ...{boost-build-native_1.86.0.bb => boost-build-native_1.87.0.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-support/boost/{boost-build-native_1.86.0.bb => boost-build-native_1.87.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-build-native_1.86.0.bb b/meta/recipes-support/boost/boost-build-native_1.87.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost-build-native_1.86.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.87.0.bb
-- 
2.44.1


--===============4637701333688000096==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-boost-build-native-upgrade-1.86.0-1.87.0.patch"

RnJvbSBiN2ViOGQ5ZDBhNDFhZjkwN2MwMTczN2ZmY2I5MGIzZjlmNWU2NjNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDg6NDg6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
b29zdC1idWlsZC1uYXRpdmU6IHVwZ3JhZGUgMS44Ni4wIC0+IDEuODcuMAoKLS0tCiAuLi57Ym9v
c3QtYnVpbGQtbmF0aXZlXzEuODYuMC5iYiA9PiBib29zdC1idWlsZC1uYXRpdmVfMS44Ny4wLmJi
fSB8IDAKIDEgZmlsZSBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3Qve2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg2
LjAuYmIgPT4gYm9vc3QtYnVpbGQtbmF0aXZlXzEuODcuMC5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3QtYnVpbGQtbmF0aXZlXzEuODYuMC5i
YiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jvb3N0L2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg3LjAu
YmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2Jvb3N0L2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg2LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1zdXBwb3J0L2Jvb3N0L2Jvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg3LjAuYmIKLS0gCjIuNDQuMQoK

--===============4637701333688000096==--

