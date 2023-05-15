Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A538FC88C98
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.3700.1684186745667924058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZbXf+jbG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010188215a5c3c-fac51325-ca4c-4b2c-9985-12ee6c1d383b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4fYqHPPLUzE6n+RlMF14DVn2fcgRCJLS7Ni1QZzQP5I=;
	b=ZbXf+jbGJMRNzyR+XAsX+VtR+UVlQ7Xoan0b2I0oQUt2rUm8xUS4AF5nahyMrdBF
	uMqtqOe2iJfgWAaV0OCj7Rip9yWDvs63k2aCK+PdgjXZPTCxStEuQkX2QVtPlYo31Lf
	x9ijd3Ex3bZtJ6X4yEzjjkr0XJ75cEHYfSFtIrbY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4fYqHPPLUzE6n+RlMF14DVn2fcgRCJLS7Ni1QZzQP5I=;
	b=qfVPU8DlRUfdg6/m4+GG2SWHCx14vbQKmm+5Dsmdlqe51e470ms1t92f0+Mdb07C
	YjHAkKz9ABQCgImPUYSVtpoh59y8H690lKkwLCTORoM0qavMGw773475ohiNbixwS4t
	2JnT8QMRiWz1ic25rjJTQOfwl4aBBPF/eFg8S6Yk=
Content-Type: multipart/mixed; boundary="===============5032296614042596313=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.3.246.1 SUCCEEDED
Message-ID: <01010188215a5c3c-fac51325-ca4c-4b2c-9985-12ee6c1d383b-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181352

--===============5032296614042596313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-headers* to *1.3.246.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.243.0-1.3.246.1.patch
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
--===============5032296614042596313==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.243.0-1.3.246.1.patch"

RnJvbSAzZmFlMDhjYTllNTUxY2M5ZTEwMmYyMjE4MTg4NWU5MjFkODQ2YWQzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTk6MDg6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yNDMuMCAtPiAxLjMuMjQ2LjEKCi0tLQogLi4uL3tz
cGlydi1oZWFkZXJzXzEuMy4yNDMuMC5iYiA9PiBzcGlydi1oZWFkZXJzXzEuMy4yNDYuMS5iYn0g
ICAgfCAwCiAxIGZpbGUgY2hhbmdlZCwgMCBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3tzcGlydi1oZWFkZXJzXzEuMy4yNDMu
MC5iYiA9PiBzcGlydi1oZWFkZXJzXzEuMy4yNDYuMS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjMuMjQzLjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1oZWFkZXJzXzEuMy4yNDYuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIv
c3BpcnYtaGVhZGVyc18xLjMuMjQzLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy9zcGlyL3NwaXJ2LWhlYWRlcnNfMS4zLjI0Ni4xLmJiCi0tIAoyLjM5LjIKCg==

--===============5032296614042596313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/spirv-headers: PKGV changed from 1.3.243.0 [default] to 1.3.246.1 [default]
packages/core2-32-poky-linux/spirv-headers: PV changed from "1.3.243.0" to "1.3.246.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.243.0 [default] to 1.3.246.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.243.0" to "1.3.246.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.243.0 [default] to 1.3.246.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.243.0" to "1.3.246.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.243.0 [default] to 1.3.246.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.243.0" to "1.3.246.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.243.0 [default] to 1.3.246.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.243.0" to "1.3.246.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.243.0 [default] to 1.3.246.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.243.0" to "1.3.246.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.243.0 [default] to 1.3.246.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.243.0" to "1.3.246.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.243.0 [default] to 1.3.246.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.243.0" to "1.3.246.1"

--===============5032296614042596313==--

