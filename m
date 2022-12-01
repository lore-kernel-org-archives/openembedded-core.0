Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E295FC64E78
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.46816.1669908626212915941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AK2QdrcZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010184ce4f7a06-2bc16b0d-44c3-4799-aab4-4fef464e16c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3hzdFzrPZS/EElZgaCU9kdertKy1guzevt/TlOoJbsQ=;
	b=AK2QdrcZWec1KEqcjQ2yxNMKvLq3JKSPRFC3Kn1Lq/KDZPhRTTBNzVZ9e1ZJAbWB
	NHQn++YMYqNWbsWmPm51WCcctfVyjavenhCUxLfZJZOftBzK7I4uz64hfbnaGAaVMUx
	//Qh5QNDLXj0X0gSjKM3XeQlmCQ1jIbyyGSqbDLg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3hzdFzrPZS/EElZgaCU9kdertKy1guzevt/TlOoJbsQ=;
	b=A8qrzsAyqXD+QoDOS9GTlfDB8NmS3F/knzBi404wxkEZvrrsF4XvsKITFF3nLZnk
	aoT0USXNMXqtEtBfO3dlrN4weReKTErlDEXV9FXKD6MCnubrLuCA1lHhUXwNj8Z+hCk
	pIcE5ptqITXjxswo8Zi8Pc3aglYFzrQ+GNKQzdGc=
Content-Type: multipart/mixed; boundary="===============5057908370203827465=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.2.4 SUCCEEDED
Message-ID: <01010184ce4f7a06-2bc16b0d-44c3-4799-aab4-4fef464e16c7-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174152

--===============5057908370203827465==
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
--===============5057908370203827465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-mako: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/core2-32-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.2.3.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.2.4.tar.gz"
packages/core2-32-poky-linux/python3-mako: PV changed from "1.2.3" to "1.2.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.2.3" to "1.2.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.2.3" to "1.2.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.2.3" to "1.2.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.2.3" to "1.2.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PV changed from "1.2.3" to "1.2.4"
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.2.3" to "1.2.4"
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 665085 to 665368 (+0%)
packages/core2-32-poky-linux/python3-mako/python3-mako: PV changed from "1.2.3" to "1.2.4"
Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.11/site-packages/Mako-1.2.3.dist-info moved to /usr/lib/python3.11/site-packages/Mako-1.2.4.dist-info

--===============5057908370203827465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.11/site-packages/Mako-1.2.3.dist-info moved to /usr/lib/python3.11/site-packages/Mako-1.2.4.dist-info

--===============5057908370203827465==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.2.3-1.2.4.patch"

RnJvbSA3N2VmMTEwNGY5YWQ4MTM0MzVmNTlmYTUwYzQ0NWRhODhlYjUxYTg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwOTozNjoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFrbzogdXBncmFkZSAxLjIuMyAtPiAxLjIuNAoKLS0tCiAuLi4vcHl0aG9uL3tweXRo
b24zLW1ha29fMS4yLjMuYmIgPT4gcHl0aG9uMy1tYWtvXzEuMi40LmJifSAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW1ha29fMS4yLjMuYmIgPT4gcHl0aG9u
My1tYWtvXzEuMi40LmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW1ha29fMS4yLjQuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1ha29fMS4yLjMuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi40LmJi
CmluZGV4IDEyYWNmZWU3NzcuLjk4NjAwNTg3MjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi40LmJiCkBAIC04LDcgKzgsNyBAQCBQWVBJ
X1BBQ0tBR0UgPSAiTWFrbyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxk
X21ldGEKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdmZGU5NjQ2NmZjZmVlZGIwZWVkOTRmMTg3
ZjIwYjIzZDg1ZTRjYjQxNDQ0YmUwZTU0MmUyYzhjNjVjMzk2Y2QiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZDYwYTM5MDNkYzNiYjAxYTE4YWQ2YTg5Y2RiZTJlNGVhZGM2OWMwYmM4ZWYxZTM3NzNi
YTUzZDQ0YzNmN2EzNCIKIAogUkRFUEVORFM6JHtQTn0gPSAiJHtQWVRIT05fUE59LWh0bWwgXAog
ICAgICAgICAgICAgICAgICAgJHtQWVRIT05fUE59LW1hcmt1cHNhZmUgXAotLSAKMi4zMS4xCgo=

--===============5057908370203827465==--

