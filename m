Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9D5CA9EBF
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.3720.1684186750066759856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JwTCmxdW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010188215a59a4-e4e2f77d-3f9e-4735-a069-532d1335d733-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ThrAAIfu17/O0UUIJkr6FiGvnyGKBdbFC6HOHJg5oG0=;
	b=JwTCmxdWSDPCowAKul+mw51L/lRWTmPJUa9ZavYfz3HS558urQv4Dwo6EI+0rRIY
	al4uGA39Ez8DrrrCL26snzyNVTSOvn7S4fX0xxXyVw2QvKQ8IR1wkb/mMJuuLRDM2cJ
	Msx4SAlnqtiARWcaKnkMSrpKTB2YxAK2PMXiwpaw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ThrAAIfu17/O0UUIJkr6FiGvnyGKBdbFC6HOHJg5oG0=;
	b=oA2s64tU+nBsBsEdMbo8QSSDDIRMN+ND3JD9/cWD5/2LPI1JaWhfGHboI1r4Jhrl
	Klebi888QRby06ke/dlrTYWVFPIiTzL9MAgbvA7/acFr4YGJmZ64oztFavdvkWZt6TV
	TBzuI0f6JWNMOjJqhbglCN+JWfnEwUFPDjlbN/W8=
Content-Type: multipart/mixed; boundary="===============4964054392032825481=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.246.1 SUCCEEDED
Message-ID: <01010188215a59a4-e4e2f77d-3f9e-4735-a069-532d1335d733-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181347

--===============4964054392032825481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.246.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.243.0-1.3.246.1.patch
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
--===============4964054392032825481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.243.0 [default] to 1.3.246.1 [default]
packages/core2-32-poky-linux/glslang/glslang-dbg: PV changed from "1.3.243.0" to "1.3.246.1"
packages/core2-32-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.243.0 [default] to 1.3.246.1 [default]
packages/core2-32-poky-linux/glslang/glslang-dev: PV changed from "1.3.243.0" to "1.3.246.1"
packages/core2-32-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.243.0 [default] to 1.3.246.1 [default]
packages/core2-32-poky-linux/glslang/glslang-doc: PV changed from "1.3.243.0" to "1.3.246.1"
packages/core2-32-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.243.0 [default] to 1.3.246.1 [default]
packages/core2-32-poky-linux/glslang/glslang-locale: PV changed from "1.3.243.0" to "1.3.246.1"
packages/core2-32-poky-linux/glslang/glslang-src: PKGV changed from 1.3.243.0 [default] to 1.3.246.1 [default]
packages/core2-32-poky-linux/glslang/glslang-src: PV changed from "1.3.243.0" to "1.3.246.1"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.243.0 [default] to 1.3.246.1 [default]
packages/core2-32-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.243.0" to "1.3.246.1"
packages/core2-32-poky-linux/glslang/glslang: PKGV changed from 1.3.243.0 [default] to 1.3.246.1 [default]
packages/core2-32-poky-linux/glslang/glslang: PV changed from "1.3.243.0" to "1.3.246.1"
packages/core2-32-poky-linux/glslang: PKGV changed from 1.3.243.0 [default] to 1.3.246.1 [default]
packages/core2-32-poky-linux/glslang: PV changed from "1.3.243.0" to "1.3.246.1"

--===============4964054392032825481==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.243.0-1.3.246.1.patch"

RnJvbSBkN2RlOTk4M2Y3ZmNjYTQzNmNkNmQ0YTZlODU3ZDU3YTg2NjM4YjQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTc6MzQ6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bHNsYW5nOiB1cGdyYWRlIDEuMy4yNDMuMCAtPiAxLjMuMjQ2LjEKCi0tLQogLi4uL2dsc2xhbmcv
e2dsc2xhbmdfMS4zLjI0My4wLmJiID0+IGdsc2xhbmdfMS4zLjI0Ni4xLmJifSAgICAgICAgfCAw
CiAxIGZpbGUgY2hhbmdlZCwgMCBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL3tnbHNsYW5nXzEuMy4yNDMuMC5iYiA9PiBn
bHNsYW5nXzEuMy4yNDYuMS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjQzLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yNDYuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjQzLjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI0
Ni4xLmJiCi0tIAoyLjM5LjIKCg==

--===============4964054392032825481==--

