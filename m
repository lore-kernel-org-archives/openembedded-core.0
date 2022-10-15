Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438E1C6371B
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.24350.1665871392812409001
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OAZhquJB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010183ddac3478-61176bf8-4762-4532-8961-c161a3a75568-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JtHebWxb6nGImSwmuzn1hnjL3ZSf8V1mX7A5vdAuaBg=;
	b=OAZhquJBImzcUMwLP5EHfsa4W9ccKWIuZJXGqRhi3vKvxlXOjBIkxfGx6z/MxzCH
	ifkZZULwt3TqSekweUCorgLZEJfKPvVodGMnRjIRBem6VRA5cv3AvQedPJhHq/7bItu
	j7wtD6aVbtDF639T3i5yRTPsZwhpdvBtQHii4VB8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JtHebWxb6nGImSwmuzn1hnjL3ZSf8V1mX7A5vdAuaBg=;
	b=GUHQrJ7VV5g9i/2KDBDHEXR5Gxz6JuGQF0cmWTCNPrQZveAUm4BloVgAmQ4xlcxS
	0ieFep2+/MrZEL3TgHNpAhAIH4dR5RgtDbi9ogHfmaUsGzvY0qixH3tEMJLW/XbegFS
	23899zJZpcQl9TZP/vwZgEbPNcjXfkx46yhPPMV0=
Content-Type: multipart/mixed; boundary="===============2700759917083949770=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-rust: upgrading to 1.5.2 SUCCEEDED
Message-ID: <01010183ddac3478-61176bf8-4762-4532-8961-c161a3a75568-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171795

--===============2700759917083949770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools-rust* to *1.5.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-rust-upgrade-1.5.1-1.5.2.patch
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
--===============2700759917083949770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.10/site-packages/setuptools_rust-1.5.1.dist-info moved to /usr/lib/python3.10/site-packages/setuptools_rust-1.5.2.dist-info

--===============2700759917083949770==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-rust-upgrade-1.5.1-1.5.2.patch"

RnJvbSA5OGNmYWE1M2NjNjAzYjg3YWQ4OTA1MmFiZmU5OGUyMThiYjNjZmFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTE6MDI6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtcnVzdDogdXBncmFkZSAxLjUuMSAtPiAxLjUuMgoKLS0tCiAuLi5l
dHVwdG9vbHMtcnVzdF8xLjUuMS5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjUuMi5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNldHVwdG9vbHMt
cnVzdF8xLjUuMS5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjUuMi5iYn0gKDkyJSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29scy1ydXN0XzEuNS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHMtcnVzdF8xLjUuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1ydXN0XzEu
NS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29scy1ydXN0XzEuNS4yLmJiCmluZGV4IDI0YTRmNGFiZWYuLjUwMjk2N2ZkMjAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXJ1
c3RfMS41LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNl
dHVwdG9vbHMtcnVzdF8xLjUuMi5iYgpAQCAtMTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wMTFjZDkyZTcwMmRkOWU2YjFhMjYxNTdiNmZkNTNmNSIK
IFNSQ19VUkkgPSAiJHtQWVBJX1NSQ19VUkl9IFwKICAgICAgICAgICAgaHR0cHM6Ly9maWxlcy5w
eXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzY3LzA4L2UxYWEyYzU4MmM2MmFjNzZlNGQ2MGY4ZTQ1
NGJkM2JiYTkzMzc4MWEwNmE4OGI0ZTM4Nzk3NDQ1ODIyYS9zZXR1cHRvb2xzLXJ1c3QtJHtQVn0u
dGFyLmd6IFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBlMDVlNDU2NjQ1
ZDU5NDI5Y2IxMDIxMzcwYWVkZTczYzA3NjBlOTM2MGJiZmRhYWVmYjViY2VkNTMwZWI5ZDciCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZDhkYWNjYjE0ZGMwZWFlMWI2YjZlYjNlY2VmNzk2NzViZDM3
YjQwNjUzNjlmNzljMzUzOTNkZDVjNTU2NTJjNyIKIAogaW5oZXJpdCBjYXJnbyBweXBpIHB5dGhv
bl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotLSAKMi4zMS4xCgo=

--===============2700759917083949770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools-rust: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.5.1.tar.gz https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.5.1.tar.gz https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-1.5.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.5.2.tar.gz https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.5.2.tar.gz https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-1.5.2.tar.gz"
packages/core2-32-poky-linux/python3-setuptools-rust: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-setuptools-rust: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGSIZE changed from 121528 to 121629 (+0%)
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PV changed from "1.5.1" to "1.5.2"
Changes to packages/core2-32-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.10/site-packages/setuptools_rust-1.5.1.dist-info moved to /usr/lib/python3.10/site-packages/setuptools_rust-1.5.2.dist-info

--===============2700759917083949770==--

