Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91440C25B73
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.129657.1692086044332856552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hQ+AqT0N;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=obTDI4tT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010189f8300452-9c62ffbe-356c-4df8-a1b0-e157e08e3fd9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fUMwNlXiIe4WNipsvFXuyuzb8+yBMdaOD7ad0RZ4Tk8=;
	b=hQ+AqT0NUcrcmlMgxEQHgwVC2DkCUdz48hFo5duf6yrdyYz1l9yod7pe8tpSCpW9
	xnlgOEZpGtxQ7o76DUn2bn79wsDcg5fcRL2GpWo0GD6hr/j68VxyPgFg5ylUfhPZO3z
	P9tM+qwzeWSZgC5pP1O5Ha5B5YLx4Di0DkTYjrIQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fUMwNlXiIe4WNipsvFXuyuzb8+yBMdaOD7ad0RZ4Tk8=;
	b=obTDI4tThH1yXlaRhfGGQA5Lv8aIODsZ9eaSjt1ge2ogKn+jIm8qiusAYud4nQIA
	qxJmrcwu4CllT7/IlO604geKAPmV4pMCOFs3TWUUPKfg1P6Ip1kb1odlvmHzRcbhQrP
	GYK71ziIEWUOatQKWbCVCi9DuKbLlVDR/n464xv4=
Content-Type: multipart/mixed; boundary="===============5555759518312633403=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.3.250.1 SUCCEEDED
Message-ID: <01010189f8300452-9c62ffbe-356c-4df8-a1b0-e157e08e3fd9-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186026

--===============5555759518312633403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-headers* to *1.3.250.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.250.0-1.3.250.1.patch
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
From a6a9428a0131ddda7cfcf3c63abee69247169ce0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Aug 2023 07:06:19 +0000
Subject: [PATCH] spirv-headers: upgrade 1.3.250.0 -> 1.3.250.1

---
 .../{spirv-headers_1.3.250.0.bb => spirv-headers_1.3.250.1.bb}    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.250.0.bb => spirv-headers_1.3.250.1.bb} (100%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.250.1.bb
similarity index 100%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.250.1.bb
-- 
2.39.2


--===============5555759518312633403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/spirv-headers: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.250.0" to "1.3.250.1"

--===============5555759518312633403==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.250.0-1.3.250.1.patch"

RnJvbSBhNmE5NDI4YTAxMzFkZGRhN2NmY2YzYzYzYWJlZTY5MjQ3MTY5Y2UwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXVnIDIwMjMgMDc6MDY6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yNTAuMCAtPiAxLjMuMjUwLjEKCi0tLQogLi4uL3tz
cGlydi1oZWFkZXJzXzEuMy4yNTAuMC5iYiA9PiBzcGlydi1oZWFkZXJzXzEuMy4yNTAuMS5iYn0g
ICAgfCAwCiAxIGZpbGUgY2hhbmdlZCwgMCBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3tzcGlydi1oZWFkZXJzXzEuMy4yNTAu
MC5iYiA9PiBzcGlydi1oZWFkZXJzXzEuMy4yNTAuMS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjMuMjUwLjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1oZWFkZXJzXzEuMy4yNTAuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIv
c3BpcnYtaGVhZGVyc18xLjMuMjUwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy9zcGlyL3NwaXJ2LWhlYWRlcnNfMS4zLjI1MC4xLmJiCi0tIAoyLjM5LjIKCg==

--===============5555759518312633403==--

