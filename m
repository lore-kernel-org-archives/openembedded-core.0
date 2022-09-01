Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74503C6FD1D
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:57 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.12458.1662040786529742452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WOaAhW+9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010182f959c1e9-9b9fb882-fa9f-4242-bb35-a9f2828b87b2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AeXHbjFEeo278opBUQFKUHCPRy+nWI345XZ6Y99RKxY=;
	b=WOaAhW+92SAol2KwKsH68V7EoaEgIid6GgyXGpqB7uQfUl0cu+BV2InnQg/jjURP
	xsU+1bZJSzDDllDEUd5TukV6WP7HK5vKTufTFZXq/JSaQA+eBDH0+lKoYRGetJnmV0P
	T5Th4Zduuitgp+OqINyUGswdVm1j8FTvyGzLLVz0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AeXHbjFEeo278opBUQFKUHCPRy+nWI345XZ6Y99RKxY=;
	b=GDR8PIAtiAwDmrCCpIDQtMMqm5zNdv4JqWfWtlB2ZZ0sU0hxlbOzm9c5W4GONbxJ
	BxlL5xQTqIHb1As73DBvg3foqFeVInW2sxyAEhhourVPn1yGYP1+p+txx+JeLYOj69A
	ox1qcAJBaB0XoPWYmxQqstUOMynNrlf4l2sAkRH4=
Content-Type: multipart/mixed; boundary="===============3775932506947362204=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.2.2 SUCCEEDED
Message-ID: 
 <01010182f959c1e9-9b9fb882-fa9f-4242-bb35-a9f2828b87b2-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:45 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170178

--===============3775932506947362204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-mako* to *1.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.2.1-1.2.2.patch
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
--===============3775932506947362204==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.2.1-1.2.2.patch"

RnJvbSA0MDVjYTc5NThjNTZmZDhhODczYzhmYmE0MjBlNzg5OTM1NzQ5OTA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwNzoxNToxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFrbzogdXBncmFkZSAxLjIuMSAtPiAxLjIuMgoKLS0tCiAuLi4vcHl0aG9uL3tweXRo
b24zLW1ha29fMS4yLjEuYmIgPT4gcHl0aG9uMy1tYWtvXzEuMi4yLmJifSAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW1ha29fMS4yLjEuYmIgPT4gcHl0aG9u
My1tYWtvXzEuMi4yLmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW1ha29fMS4yLjIuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1ha29fMS4yLjEuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi4yLmJi
CmluZGV4IDgxNTVjMzc5ODQuLmUzNzc0ZWU2MjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi4yLmJiCkBAIC04LDcgKzgsNyBAQCBQWVBJ
X1BBQ0tBR0UgPSAiTWFrbyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxk
X21ldGEKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImYwNTRhNWZmNDc0MzQ5MmYxYWE5ZWNjNDcx
NzJjYjMzYjQyYjlkOTkzY2ZmY2MxNDZjOWRlMTdlNzE3YjAzMDciCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMzcyNDg2OWIzNjNiYTYzMGEyNzJhNWY4OWY2OGMwNzAzNTIxMzdiOGZkMTc1NzY1MDAx
N2I3ZTA2ZmRhMTYzZiIKIAogUkRFUEVORFM6JHtQTn0gPSAiJHtQWVRIT05fUE59LWh0bWwgXAog
ICAgICAgICAgICAgICAgICAgJHtQWVRIT05fUE59LW1hcmt1cHNhZmUgXAotLSAKMi4zMS4xCgo=

--===============3775932506947362204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-mako: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/python3-mako: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.2.1.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.2.2.tar.gz"
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako: PV changed from "1.2.1" to "1.2.2"
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 507554 to 507898 (+0%)
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.10/site-packages/Mako-1.2.1.dist-info moved to /usr/lib/python3.10/site-packages/Mako-1.2.2.dist-info

--===============3775932506947362204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.10/site-packages/Mako-1.2.1.dist-info moved to /usr/lib/python3.10/site-packages/Mako-1.2.2.dist-info

--===============3775932506947362204==--

