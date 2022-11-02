Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCA0C63708
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:38 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.858.1667349632528139790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UlVSX6IC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018435c85f26-16e29fa7-f940-4456-a0bc-fedac8f974a5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5OMAGiDOa19HCkDonvs/QRwXkp6HiGPI1KgMC5as614=;
	b=UlVSX6IC8Us4IW2uXEiYeDDfou8jeBafceV4FPpfjMOHh8ZM6CsXHzeIec8WVC6u
	d6+5Uo+eru6CeYx+nJlrMWPXebuJJ+dTnyKosLRJWYQHNq0A0VXOTIZvUZ0Yhh18nfz
	eJk5M2PmRc3hJO7MCxjUEDHjQoGjyRC8mhintsHc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5OMAGiDOa19HCkDonvs/QRwXkp6HiGPI1KgMC5as614=;
	b=MvX6nr+/O3IwEziV7rK+HManLXvDo3FTr9wZzDFjhvpPhpguFG0LWuoW4iTeixVX
	CU3P3vBVKOlyilXzBj4mt8dt8NhjrTHHyETeJGHH6+7KqBZYzNhXOd0Tw+6s1HQEBYO
	7EelCvYpU62MuGQ27dnrlfG7ZCiKz3eIh6yMSyxU=
Content-Type: multipart/mixed; boundary="===============6320205859109611190=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.3.231.1 SUCCEEDED
Message-ID: <0101018435c85f26-16e29fa7-f940-4456-a0bc-fedac8f974a5-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172473

--===============6320205859109611190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-headers* to *1.3.231.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.224.1-1.3.231.1.patch
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
--===============6320205859109611190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/spirv-headers: PV changed from "1.3.224.1" to "1.3.231.1"
packages/core2-32-poky-linux/spirv-headers: PKGV changed from 1.3.224.1 [default] to 1.3.231.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.224.1" to "1.3.231.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.224.1 [default] to 1.3.231.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.224.1" to "1.3.231.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 2720528 to 2738782 (+1%)
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.224.1 [default] to 1.3.231.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.224.1" to "1.3.231.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.224.1 [default] to 1.3.231.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.224.1" to "1.3.231.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.224.1 [default] to 1.3.231.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.224.1" to "1.3.231.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.224.1 [default] to 1.3.231.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.224.1" to "1.3.231.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.224.1 [default] to 1.3.231.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.224.1" to "1.3.231.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.224.1 [default] to 1.3.231.1 [default]

--===============6320205859109611190==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.224.1-1.3.231.1.patch"

RnJvbSA3Yjg2YWZmMTBlYTlhMjBiNWNjMzcyM2QwNjE1NGE4NDRkMDE3ZTc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxNjo0Mzo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LWhlYWRlcnM6IHVwZ3JhZGUgMS4zLjIyNC4xIC0+IDEuMy4yMzEuMQoKLS0tCiAuLi4ve3Nw
aXJ2LWhlYWRlcnNfMS4zLjIyNC4xLmJiID0+IHNwaXJ2LWhlYWRlcnNfMS4zLjIzMS4xLmJifSAg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci97c3BpcnYtaGVhZGVyc18xLjMuMjI0LjEu
YmIgPT4gc3BpcnYtaGVhZGVyc18xLjMuMjMxLjEuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjMuMjI0LjEuYmIgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1oZWFkZXJzXzEuMy4yMzEuMS5iYgpzaW1pbGFy
aXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGly
di1oZWFkZXJzXzEuMy4yMjQuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Nw
aXIvc3BpcnYtaGVhZGVyc18xLjMuMjMxLjEuYmIKaW5kZXggOTQ1MDBhOTZiYS4uZmRjYzhkNTIz
ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18x
LjMuMjI0LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVy
c18xLjMuMjMxLjEuYmIKQEAgLTcsNyArNyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3Lmto
cm9ub3Mub3JnL3JlZ2lzdHJ5L3NwaXItdiIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YzkzOGI4NWJjZWI4ZmIyNmMxYTgwN2YyOGE1MmFl
MmQiCiAKLVNSQ1JFViA9ICJiMmExNTZlMWMwNDM0YmM4Yzk5YWFlYmJhMWM3YmU5OGJlN2FjNTgw
IgorU1JDUkVWID0gIjg1YTFlZDIwMGQ1MDY2MDc4NmMxYTg4ZDkxNjZlODcxMTIzY2NlMzkiCiBT
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1NQSVJWLUhlYWRlcnM7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciIKIFBFID0gIjEiCiBVUFNUUkVBTV9DSEVDS19HSVRU
QUdSRUdFWCA9ICJzZGstKD9QPHB2ZXI+XGQrKFwuXGQrKSspIgotLSAKMi4zMS4xCgo=

--===============6320205859109611190==--

