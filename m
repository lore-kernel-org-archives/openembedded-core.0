Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B0ECA0ED5
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:56:03 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.12483.1752594935998325326
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UI8yaYSB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=pSmrGSF6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101980eccb861-18737950-ddae-4532-9589-7912b3ac95ac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0OH4JpdwV4mO+D+7We/uQisa0315NxFp1BPi9i9xDvY=;
	b=UI8yaYSB5JuBz3G5PvBvL0GCBJ1HoSiTsL18EjeVXeUsdM4rjfxsDahtQMWCVDZH
	sf8c4G/9kRr2E8IDqOVmOr9YMg4kFjwFi4Z51/3pT7+csjgXvCnYoUC5FfVMgZPV6mM
	RQKLyTet1e4B2x1WG/S/xVXaUzHFZumB/iQN0yGQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0OH4JpdwV4mO+D+7We/uQisa0315NxFp1BPi9i9xDvY=;
	b=pSmrGSF69CQhexeUHZVwJQA+YvKOo3orOWPyzSNkhGnpq1ZoqnElmifRGnPbpj0l
	Z4mcINlYJa6S3GXquNpxvaWOyfbtiqLBz4Q9p00FVQ241r/V60Kv+bGtGil8oT//lP0
	kEOvMD3XpSWowhhO4XP/G7GI5iiqCjf/LL8aKLr8=
Content-Type: multipart/mixed; boundary="===============5058255176255982551=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] boost-build-native: upgrading to 1.88.0 SUCCEEDED
Message-ID: <010101980eccb861-18737950-ddae-4532-9589-7912b3ac95ac-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220390

--===============5058255176255982551==
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
From fd247d687faa32458b5f59f08cd2414ea4884795 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 14:49:50 +0000
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


--===============5058255176255982551==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-boost-build-native-upgrade-1.87.0-1.88.0.patch"

RnJvbSBmZDI0N2Q2ODdmYWEzMjQ1OGI1ZjU5ZjA4Y2QyNDE0ZWE0ODg0Nzk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTQ6NDk6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
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

--===============5058255176255982551==--

