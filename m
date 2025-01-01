Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7E2C02197
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:36 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.11503.1735723955280921410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=G7Fzb5Sy;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=CxLXqz4U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101942135b1b0-01b85f53-a969-4011-8f2e-e7a86a16ac90-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZFlLRmg3c1aJ0WE/zDiE2p1JHk9e33ucLqfzUEnGmWY=;
	b=G7Fzb5SyP6wP2uFrLn6Bo2ie6K4z1mkoUiuLqGyoImDhsVmtT8TODrOaheCUZfLM
	9O69Gb+yX0a6mwZlVy9MQ5YYr275lcsZmB2LjvFZbAWZI5XrLhWFIxLk0OCpZrcTwBF
	BerxCh7yK3JJ7aRSK7/khfoIVanu5sCCHRYMIPSg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZFlLRmg3c1aJ0WE/zDiE2p1JHk9e33ucLqfzUEnGmWY=;
	b=CxLXqz4Us1rv7l8UHQ3Iptafv/aas89ZuSLj84qyTU83pFWmulL1/OBQuwcLFCwM
	23F4nGfOKM6ID1+dhfxwt8smK0JefXTd1Jo2ntSDrXqkdxGUXgOQPq3OFein0ZCaj9r
	aNaGMcSsRuMWq70DfY03bWchxNDpaVplRtUhLx7M=
Content-Type: multipart/mixed; boundary="===============9078045920285987322=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] boost-build-native: upgrading to 1.87.0 SUCCEEDED
Message-ID: <010101942135b1b0-01b85f53-a969-4011-8f2e-e7a86a16ac90-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209241

--===============9078045920285987322==
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
From 1e430bdb2e1e6831c8e339385d7eb385338b6004 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 08:55:07 +0000
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


--===============9078045920285987322==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-boost-build-native-upgrade-1.86.0-1.87.0.patch"

RnJvbSAxZTQzMGJkYjJlMWU2ODMxYzhlMzM5Mzg1ZDdlYjM4NTMzOGI2MDA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwODo1NTowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJv
b3N0LWJ1aWxkLW5hdGl2ZTogdXBncmFkZSAxLjg2LjAgLT4gMS44Ny4wCgotLS0KIC4uLntib29z
dC1idWlsZC1uYXRpdmVfMS44Ni4wLmJiID0+IGJvb3N0LWJ1aWxkLW5hdGl2ZV8xLjg3LjAuYmJ9
IHwgMAogMSBmaWxlIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC97Ym9vc3QtYnVpbGQtbmF0aXZlXzEuODYu
MC5iYiA9PiBib29zdC1idWlsZC1uYXRpdmVfMS44Ny4wLmJifSAoMTAwJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9ib29zdC9ib29zdC1idWlsZC1uYXRpdmVfMS44Ni4wLmJi
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYm9vc3QvYm9vc3QtYnVpbGQtbmF0aXZlXzEuODcuMC5i
YgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
Ym9vc3QvYm9vc3QtYnVpbGQtbmF0aXZlXzEuODYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvYm9vc3QvYm9vc3QtYnVpbGQtbmF0aXZlXzEuODcuMC5iYgotLSAKMi40NC4xCgo=

--===============9078045920285987322==--

