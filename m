Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0476CC6FA91
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:56 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web12.12463.1662040785809310642
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aAThB6x1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010182f959c62a-08925a92-d698-481f-96c2-63b31edbc1f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6Q4agb8SDYmKwbZyUHphUtTt4+BfNt9aupmL84GOb5I=;
	b=aAThB6x1Ll2L+mVe6ftOLY/B+BVP2MzICuaNGcrFwTyS40XmoXkzc8hGW3UCCUtv
	vrHeNNoDtjZwSVLojcLOGmPHOVI4wCKFb1qh/aVHPIfQ17LDScPzaPNFu6RXfOSrZH/
	dkU1iIBIeJ8m6nU+ZdMJ/BMbF48uFDtDfgSaz6Og=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6Q4agb8SDYmKwbZyUHphUtTt4+BfNt9aupmL84GOb5I=;
	b=SKFXMPnuQbt7Uu5jVjQM/QXi1D+ctiUq3ilLZzLZjzP3MxxtYw9WlXZFZlkQwQLL
	8/PlgS5JU57MROIoQ8hQdth63Y7cuWSGTNE8os89H7iOLldeCNHodHN/lM2OzL/SZ8J
	0Kt5oG0FxZuHDnIHbftvcA7UeIHu2h2n5UJrvOns=
Content-Type: multipart/mixed; boundary="===============4768621271397029324=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.3.224.1 SUCCEEDED
Message-ID: 
 <01010182f959c62a-08925a92-d698-481f-96c2-63b31edbc1f6-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170199

--===============4768621271397029324==
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
--===============4768621271397029324==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.216.0-1.3.224.1.patch"

RnJvbSAzYmE5ZThkMzViNzlmZWMxYTAxN2UyNTFjMTBiNWYxOWVkOGNlOWRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAxMDoxNjozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LWhlYWRlcnM6IHVwZ3JhZGUgMS4zLjIxNi4wIC0+IDEuMy4yMjQuMQoKLS0tCiAuLi4ve3Nw
aXJ2LWhlYWRlcnNfMS4zLjIxNi4wLmJiID0+IHNwaXJ2LWhlYWRlcnNfMS4zLjIyNC4xLmJifSAg
ICB8IDAKIDEgZmlsZSBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIve3NwaXJ2LWhlYWRlcnNfMS4zLjIxNi4w
LmJiID0+IHNwaXJ2LWhlYWRlcnNfMS4zLjIyNC4xLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1oZWFkZXJzXzEuMy4yMTYuMC5iYiBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRlcnNfMS4zLjIyNC4xLmJiCnNpbWls
YXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9z
cGlydi1oZWFkZXJzXzEuMy4yMTYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3NwaXIvc3BpcnYtaGVhZGVyc18xLjMuMjI0LjEuYmIKLS0gCjIuMzEuMQoK

--===============4768621271397029324==
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

--===============4768621271397029324==--

