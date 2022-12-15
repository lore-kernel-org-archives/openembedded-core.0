Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76B9C71130
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.144506.1671136352048836677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iG7Yq6OJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010185177d1484-95c4c19f-cf90-4d64-a39b-f8920275acc6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3dsj1R4mT0LoLQZBwxWiGtalmtCl5uu//28mcb1icuc=;
	b=iG7Yq6OJ1dDRtGrxgbIwAw3U8GO2MkYpIHNsOVUru/1y3Pcx0WpIh94cCvsXNbB3
	LFXyg+jXIqnZYWWwhG+3E0q3dDi2bLf1gMvTgI/m7dmEqFzXBb767sGleuQnbp2b1LN
	IO2ZcME/vpG1gaKqNnbVX/jCRLCJjvFa6oxZ/u+o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3dsj1R4mT0LoLQZBwxWiGtalmtCl5uu//28mcb1icuc=;
	b=VCvoefTZlvSlanFBZ7TOOI+paMvs/dYAj8O/iSM1FhG/nRxfimNCLlw6X2RtjswJ
	z1SSLjlAasvgE7bSP80UlYT8jWWPiRiCv5a8kkKnGWm9rPnYIjuJJdrRic5WZkIk0mp
	N99celE8MuzmdiSMZ6pnBv4jPqcgHpN9sxkOvhAA=
Content-Type: multipart/mixed; boundary="===============0481282394923454083=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.2.4 SUCCEEDED
Message-ID: <01010185177d1484-95c4c19f-cf90-4d64-a39b-f8920275acc6-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174654

--===============0481282394923454083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-mako* to *1.2.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.2.3-1.2.4.patch
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
--===============0481282394923454083==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.2.3-1.2.4.patch"

RnJvbSA2MmNhZTdlNTM5MGUwMTNkZTVjOWU3OGI1MjI1NWUyZjllYjQwYTUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTE6MjM6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1ha286IHVwZ3JhZGUgMS4yLjMgLT4gMS4yLjQKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1tYWtvXzEuMi4zLmJiID0+IHB5dGhvbjMtbWFrb18xLjIuNC5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYWtvXzEuMi4zLmJiID0+IHB5dGhv
bjMtbWFrb18xLjIuNC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjIuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tYWtvXzEuMi40LmJiCnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi4zLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjIuNC5i
YgppbmRleCAxMmFjZmVlNzc3Li45ODYwMDU4NzIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjIuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjIuNC5iYgpAQCAtOCw3ICs4LDcgQEAgUFlQ
SV9QQUNLQUdFID0gIk1ha28iCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWls
ZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3ZmRlOTY0NjZmY2ZlZWRiMGVlZDk0ZjE4
N2YyMGIyM2Q4NWU0Y2I0MTQ0NGJlMGU1NDJlMmM4YzY1YzM5NmNkIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImQ2MGEzOTAzZGMzYmIwMWExOGFkNmE4OWNkYmUyZTRlYWRjNjljMGJjOGVmMWUzNzcz
YmE1M2Q0NGMzZjdhMzQiCiAKIFJERVBFTkRTOiR7UE59ID0gIiR7UFlUSE9OX1BOfS1odG1sIFwK
ICAgICAgICAgICAgICAgICAgICR7UFlUSE9OX1BOfS1tYXJrdXBzYWZlIFwKLS0gCjIuMzcuMwoK

--===============0481282394923454083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-mako: PV changed from "1.2.3" to "1.2.4"
packages/core2-32-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.2.3.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.2.4.tar.gz"
packages/core2-32-poky-linux/python3-mako: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.2.3" to "1.2.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.2.3" to "1.2.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.2.3" to "1.2.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.2.3" to "1.2.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PV changed from "1.2.3" to "1.2.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.2.3" to "1.2.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako: PV changed from "1.2.3" to "1.2.4"
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 665085 to 665368 (+0%)
Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.11/site-packages/Mako-1.2.3.dist-info moved to /usr/lib/python3.11/site-packages/Mako-1.2.4.dist-info

--===============0481282394923454083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.11/site-packages/Mako-1.2.3.dist-info moved to /usr/lib/python3.11/site-packages/Mako-1.2.4.dist-info

--===============0481282394923454083==--

