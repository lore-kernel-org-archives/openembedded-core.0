Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D00C678D7
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.144510.1671136352544425339
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cl+N4yEn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010185177d1276-9815cdc4-493a-4b69-a9a6-d764fd83cb71-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h5Ok/YWpwDDrzxvuawgEWJ8ooJnIsU1XM7ci3zSKt+8=;
	b=cl+N4yEnhPLGViyj5ztUAS5IKJc5E2SKRriC8VfVAn/AFyX2DiAl9kes4hOE3s4d
	vL7W3nZrRrKrteUV1c1NkY+k9F7lIkP55MGxEUH6CNFRAFJxP5nxGVF+nwco961O4JE
	6Xl/nns7YYsW9Gegipejqtp75ov0QEnuuG8eZ/Cg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h5Ok/YWpwDDrzxvuawgEWJ8ooJnIsU1XM7ci3zSKt+8=;
	b=BRvB6lzxwPsQp54Hi9mXNXU2V7hcy94XUaYNi1EX9RBAw11VwP1pMbq8oV7PEEv+
	FvSjoEVycipg8rIWlYWHG2BiHLUWWOqHZpn1l/BsITxqMBmNQv8RStLWzy9DJksN7eE
	nZ0JQUUKdqkhSNWdpINrqMS60TryE8X6dF4QCgi0=
Content-Type: multipart/mixed; boundary="===============9187344202504132826=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2022.12 SUCCEEDED
Message-ID: <01010185177d1276-9815cdc4-493a-4b69-a9a6-d764fd83cb71-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174664

--===============9187344202504132826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2022.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2022.11-2022.12.patch
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
--===============9187344202504132826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2022.11 [default] to 2022.12 [default]
packages/core2-32-poky-linux/python3-dtschema: PV changed from "2022.11" to "2022.12"
packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.11.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2022.12.tar.gz"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2022.11" to "2022.12"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2022.11 [default] to 2022.12 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2022.11" to "2022.12"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2022.11 [default] to 2022.12 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2022.11" to "2022.12"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2022.11 [default] to 2022.12 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2022.11" to "2022.12"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2022.11 [default] to 2022.12 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2022.11" to "2022.12"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2022.11 [default] to 2022.12 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2022.11" to "2022.12"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2022.11 [default] to 2022.12 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2022.11" to "2022.12"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 293109 to 296349 (+1%)
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.11/site-packages/dtschema-2022.11.dist-info -> /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info, added "/usr/lib/python3.11/site-packages/dtschema/schemas/cache.yaml /usr/lib/python3.11/site-packages/dtschema/schemas/cpu.yaml"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2022.11 [default] to 2022.12 [default]
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2022.11.dist-info moved to /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info
  /usr/lib/python3.11/site-packages/dtschema/schemas/cache.yaml was added
  /usr/lib/python3.11/site-packages/dtschema/schemas/cpu.yaml was added

--===============9187344202504132826==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2022.11-2022.12.patch"

RnJvbSA1NzJmODRjOTc5Yzk5MzhlOGZlNGNhMDBiM2EzNDRhZjU3ZjA3YzFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTA6NDc6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjIuMTEgLT4gMjAyMi4xMgoKLS0tCiAuLi57cHl0
aG9uMy1kdHNjaGVtYV8yMDIyLjExLmJiID0+IHB5dGhvbjMtZHRzY2hlbWFfMjAyMi4xMi5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWR0c2NoZW1hXzIwMjIu
MTEuYmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjEyLmJifSAoODMlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjExLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjIuMTIu
YmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjIuMTEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjEyLmJiCmluZGV4IGZkODdk
YjJjMmIuLjlkODYwMTExYzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjExLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIyLjEyLmJiCkBAIC03LDcgKzcsNyBAQCBpbmhl
cml0IHB5cGkgc2V0dXB0b29sczMKIAogUFlQSV9QQUNLQUdFID0gImR0c2NoZW1hIgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiODI1ZTUxYjhiYjgyYTJkNDgzM2QxNWMyNWZmMmI5YTNmNWE1M2Iz
NmE0OTBkN2M0YjZiMTM2MDM3ZTgyMzMyMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmNTMyZDQz
M2E5MTVlNTA3ZDRiNDI2YjdlZjU3YTY3MzBkMjNjMDkzOGI2ODJmYjQ4NjZmOWRmYTgwYTU4ZWM2
IgogCiBERVBFTkRTICs9ICJweXRob24zLXNldHVwdG9vbHMtc2NtLW5hdGl2ZSIKIFJERVBFTkRT
OiR7UE59ICs9ICJweXRob24zLXJ1YW1lbC15YW1sIHB5dGhvbjMtanNvbnNjaGVtYSBweXRob24z
LXJmYzM5ODciCi0tIAoyLjM3LjMKCg==

--===============9187344202504132826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: FILELIST: directory renamed /usr/lib/python3.11/site-packages/dtschema-2022.11.dist-info -> /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info, added "/usr/lib/python3.11/site-packages/dtschema/schemas/cpu.yaml /usr/lib/python3.11/site-packages/dtschema/schemas/cache.yaml"
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2022.11.dist-info moved to /usr/lib/python3.11/site-packages/dtschema-2022.12.dist-info
  /usr/lib/python3.11/site-packages/dtschema/schemas/cache.yaml was added
  /usr/lib/python3.11/site-packages/dtschema/schemas/cpu.yaml was added

--===============9187344202504132826==--

