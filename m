Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B63C64EB1
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.24356.1665871393808807778
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=V2D90810;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010183ddac31a2-b0065a55-73ba-4a57-a0b3-32cd5a10a0fb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ukEJdLhuNnyXtYHTSiSE3TlSnF0K4GfWn04YB6hdw4Y=;
	b=V2D90810Tq/YFIHZznOP3DxuofFUYRcBstKiFqaxjCY1CMUMPBOiQmpScHNPjBeL
	OYQZKAauPKq1QjPlLbKnm20WvNcgs32+ghztA0tP4sxw9KBr8qWMGHnOatTu/0aKzGP
	ysDwluehJO/2+tIpDjLyYUoYTlsB7mI55JKMSIM0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ukEJdLhuNnyXtYHTSiSE3TlSnF0K4GfWn04YB6hdw4Y=;
	b=MTdq5gNEEebzJPBAPqMnGOhDYbkI537iauxstW7sV+1PFGptBhaHCQUNLRADv4bg
	NEDu6OKMsOZ+Ka+eUJNYza3rrsgd/UisQokGp1CKDw90SQKJ10pB0osEOh3D2CrXj65
	mB1l2LOM4Q/Kys/8P3xHsewNMyJkIkv+3QW5Vqm8=
Content-Type: multipart/mixed; boundary="===============3155420279568616225=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2022.9.24 SUCCEEDED
Message-ID: <01010183ddac31a2-b0065a55-73ba-4a57-a0b3-32cd5a10a0fb-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171781

--===============3155420279568616225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-certifi* to *2022.9.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2022.9.14-2022.9.24.patch
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
--===============3155420279568616225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.10/site-packages/certifi-2022.9.14.dist-info moved to /usr/lib/python3.10/site-packages/certifi-2022.9.24.dist-info

--===============3155420279568616225==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2022.9.14-2022.9.24.patch"

RnJvbSBlNzI4MThlZTJiZDI0YWE0ZGQ3M2ZiYjExMzJiMjhkMjk3ZTliYzg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMDk6NDE6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNlcnRpZmk6IHVwZ3JhZGUgMjAyMi45LjE0IC0+IDIwMjIuOS4yNAoKLS0tCiAuLi55
dGhvbjMtY2VydGlmaV8yMDIyLjkuMTQuYmIgPT4gcHl0aG9uMy1jZXJ0aWZpXzIwMjIuOS4yNC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNlcnRpZmlfMjAy
Mi45LjE0LmJiID0+IHB5dGhvbjMtY2VydGlmaV8yMDIyLjkuMjQuYmJ9ICg4NiUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyMi45
LjE0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAy
Mi45LjI0LmJiCnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjIuOS4xNC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyMi45LjI0LmJiCmlu
ZGV4IDExN2EzMmIxZDQuLmE2Yjc0NjcwNTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjIuOS4xNC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDIyLjkuMjQuYmIKQEAgLTcsNyAr
Nyw3IEBAIEhPTUVQQUdFID0gIiBodHRwOi8vY2VydGlmaS5pby8iCiBMSUNFTlNFID0gIklTQyIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNjMmI3NDA0MzY5YzU4N2Mz
NTU5YWZiNjA0ZmNlMmYyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzY5NzM4ODViOTU0MmU2
YmQwMWRlYTI4N2IyYjRiM2IyMTIzNjMwN2M1NjMyNGZjYzNmMTE2MGYyZDY1NWVkNSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICIwZDljNjAxMTI0ZTVhNmJhOTcxMmRiYzYwZDljNTNjMjFlMzRmNWY2
NDFmZTgzMDAyMzE3Mzk0MzExYmRjZTE0IgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAot
LSAKMi4zMS4xCgo=

--===============3155420279568616225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-certifi: PV changed from "2022.9.14" to "2022.9.24"
packages/core2-32-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2022.9.14.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2022.9.24.tar.gz"
packages/core2-32-poky-linux/python3-certifi: PKGV changed from 2022.9.14 [default] to 2022.9.24 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2022.9.14" to "2022.9.24"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2022.9.14 [default] to 2022.9.24 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2022.9.14" to "2022.9.24"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2022.9.14 [default] to 2022.9.24 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2022.9.14" to "2022.9.24"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2022.9.14 [default] to 2022.9.24 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2022.9.14" to "2022.9.24"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2022.9.14 [default] to 2022.9.24 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2022.9.14" to "2022.9.24"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2022.9.14 [default] to 2022.9.24 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2022.9.14" to "2022.9.24"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2022.9.14 [default] to 2022.9.24 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PV changed from "2022.9.14" to "2022.9.24"
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2022.9.14 [default] to 2022.9.24 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 301096 to 298454 (-1%)
Changes to packages/core2-32-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.10/site-packages/certifi-2022.9.14.dist-info moved to /usr/lib/python3.10/site-packages/certifi-2022.9.24.dist-info

--===============3155420279568616225==--

