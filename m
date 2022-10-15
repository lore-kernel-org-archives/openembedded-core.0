Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05586C65BA4
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web08.24446.1665871392133082811
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=laGS4PDe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010183ddac2967-d0bce422-d201-4da1-b5c6-19c0f60df597-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871391;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=j1GbO2hY739HqtAS3r5UfxRtNj7H9WPtmTWUZlXXQ3k=;
	b=laGS4PDeCrg3r+Mk9nhgCK3WswpQR5kDURDpamVIWSZw5ykChlBBvUer2+g2N1Sn
	laMbp35od0jINBaMijQnP7ux8srEwT4Bc07F2xkXn9dJmdsNlyAtjx4Fc0ET35uTEcj
	ZsdUTqMgepi9ZhmtJCAoaegZMua7H6e65tTuum5E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871391;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=j1GbO2hY739HqtAS3r5UfxRtNj7H9WPtmTWUZlXXQ3k=;
	b=g+hZrOGvImIJvHHSXOWdW29Mmhu1tdUIfhNElHRsr7Uzmp3o/AqJ/ZM42ar3kGui
	Qp795AitEkuGx9kisEHlwsYp3civnOKJoSvnGSEz1q9xOOX2sWGieqn1U9LJ7QuWVSv
	HJwZo3wdI82qRLVDlCBxRoTB6B1LHKoypfR4qE6E=
Content-Type: multipart/mixed; boundary="===============0063988747718795002=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot-tools: upgrading to 2022.10 SUCCEEDED
Message-ID: <01010183ddac2967-d0bce422-d201-4da1-b5c6-19c0f60df597-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171741

--===============0063988747718795002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *u-boot-tools* to *2022.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-u-boot-tools-upgrade-2022.07-2022.10.patch
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
--===============0063988747718795002==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-u-boot-tools-upgrade-2022.07-2022.10.patch"

RnJvbSA2MjE1YWY2Y2NlNGVmMzk2ZDkzODBiODFiZjhkNGI5MDgwMmQ4MzJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMDY6MTk6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
LWJvb3QtdG9vbHM6IHVwZ3JhZGUgMjAyMi4wNyAtPiAyMDIyLjEwCgotLS0KIG1ldGEvcmVjaXBl
cy1ic3AvdS1ib290L3UtYm9vdC1jb21tb24uaW5jICAgICAgICAgICAgICAgICAgICAgICB8IDIg
Ky0KIC4uLi91LWJvb3Qve3UtYm9vdC10b29sc18yMDIyLjA3LmJiID0+IHUtYm9vdC10b29sc18y
MDIyLjEwLmJifSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC97dS1ib290LXRvb2xzXzIwMjIu
MDcuYmIgPT4gdS1ib290LXRvb2xzXzIwMjIuMTAuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVzLWJz
cC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMKaW5kZXggZDdmZDNjNzIyNy4uNjBjNzdjYmVjNCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMKKysr
IGIvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290LWNvbW1vbi5pbmMKQEAgLTEyLDcgKzEy
LDcgQEAgUEUgPSAiMSIKIAogIyBXZSB1c2UgdGhlIHJldmlzaW9uIGluIG9yZGVyIHRvIGF2b2lk
IGhhdmluZyB0byBmZXRjaCBpdCBmcm9tIHRoZQogIyByZXBvIGR1cmluZyBwYXJzZQotU1JDUkVW
ID0gImUwOTJlMzI1MDI3MGExMDE2Yzg3N2RhN2JkZDkzODRmMTRiMTMyMWUiCitTUkNSRVYgPSAi
NGRlYmM1N2EzZGE2YzNmNGQzZjg5YTYzN2U5OTIwNmY0Y2VhMGE5NiIKIAogU1JDX1VSSSA9ICJn
aXQ6Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvdS1ib290LmdpdDtwcm90b2NvbD1odHRwczticmFu
Y2g9bWFzdGVyIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3Qt
dG9vbHNfMjAyMi4wNy5iYiBiL21ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC10b29sc18y
MDIyLjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
YnNwL3UtYm9vdC91LWJvb3QtdG9vbHNfMjAyMi4wNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWJzcC91LWJvb3QvdS1ib290LXRvb2xzXzIwMjIuMTAuYmIKLS0gCjIuMzEuMQoK

--===============0063988747718795002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/u-boot-tools: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/core2-32-poky-linux/u-boot-tools: PV changed from "2022.07" to "2022.10"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-dbg: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-dbg: PKGSIZE changed from 3099452 to 3049016 (-2%)
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-dbg: PV changed from "2022.07" to "2022.10"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-dev: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-dev: PV changed from "2022.07" to "2022.10"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-doc: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-doc: PV changed from "2022.07" to "2022.10"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-locale: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-locale: PV changed from "2022.07" to "2022.10"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-mkenvimage: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-mkenvimage: PV changed from "2022.07" to "2022.10"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-mkimage: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-mkimage: PKGSIZE changed from 1037580 to 1049872 (+1%)
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-mkimage: PV changed from "2022.07" to "2022.10"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-src: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-src: PKGSIZE changed from 1209508 to 1226652 (+1%)
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-src: PV changed from "2022.07" to "2022.10"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-staticdev: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools-staticdev: PV changed from "2022.07" to "2022.10"
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools: PKGV changed from 2022.07 [default] to 2022.10 [default]
packages/core2-32-poky-linux/u-boot-tools/u-boot-tools: PV changed from "2022.07" to "2022.10"

--===============0063988747718795002==--

