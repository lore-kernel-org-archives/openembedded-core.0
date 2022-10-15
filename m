Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80084C47088
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.24354.1665871393721980419
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UkBPdAI8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010183ddac3aec-51e92a61-6d5e-4f7e-b9a7-fa545f7c9dd5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=b90W0h4EeU5it9u6HRXcbYgCaPrzx/MtlNZXF2Swnpc=;
	b=UkBPdAI8S9p2FwmsrgrsODR8UnoMml0PT3zb2GRhzdHU/Q/SmAFzcr73J2TJJORW
	Ns346EJfg3cUqug04KwUK4olgkxk9vEG/860fnJwcp3gE9Fra9Az0Ay0fw8ji/79x0q
	qE/VWvBs/7teaM1exeStJnzCAXlv2jisfr8DjClY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=b90W0h4EeU5it9u6HRXcbYgCaPrzx/MtlNZXF2Swnpc=;
	b=KxuVtO/4hRDvzIlocAgKJyr3dgyXfVmNNwDHg3jf27Bc48k41FeOzErVMMnLMxrm
	FRwzAeRpwbTLymAXTeIs4pgMhBGDnCHqb8yk9yt4tROESNB1EE+NqH37uCVGp+MPzcA
	P0wFwvu0GLc0PjS5DaeRYw3WFFIQFDdm0N0nuL9g=
Content-Type: multipart/mixed; boundary="===============8809363834453837478=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.3.224.1 SUCCEEDED
Message-ID: <01010183ddac3aec-51e92a61-6d5e-4f7e-b9a7-fa545f7c9dd5-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171836

--===============8809363834453837478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-headers* to *1.3.224.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.216.0-1.3.224.1.patch
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
--===============8809363834453837478==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.216.0-1.3.224.1.patch"

RnJvbSAzY2E3ZTAyZTkzYjI1MzdmZWU4N2FjZWUwMWE4ZjNjMGQ2YjZiMWZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTY6NDE6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yMTYuMCAtPiAxLjMuMjI0LjEKCi0tLQogLi4uL3tz
cGlydi1oZWFkZXJzXzEuMy4yMTYuMC5iYiA9PiBzcGlydi1oZWFkZXJzXzEuMy4yMjQuMS5iYn0g
ICAgfCAwCiAxIGZpbGUgY2hhbmdlZCwgMCBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3tzcGlydi1oZWFkZXJzXzEuMy4yMTYu
MC5iYiA9PiBzcGlydi1oZWFkZXJzXzEuMy4yMjQuMS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjMuMjE2LjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1oZWFkZXJzXzEuMy4yMjQuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIv
c3BpcnYtaGVhZGVyc18xLjMuMjE2LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy9zcGlyL3NwaXJ2LWhlYWRlcnNfMS4zLjIyNC4xLmJiCi0tIAoyLjMxLjEKCg==

--===============8809363834453837478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/spirv-headers: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-headers: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.216.0" to "1.3.224.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.216.0 [default] to 1.3.224.1 [default]

--===============8809363834453837478==--

