Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC71CA9EBB
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.3770.1684186748424566621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Mvu+Cuoa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188215a5362-62f165d7-9277-4c48-adaf-c91e3b98f3f2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h7DXwOo9tIGETAzFi+3E/2LiND7IcVcMSfWLiN418lk=;
	b=Mvu+CuoaBh207g1ZQRwQ8NsgGis0lhy4tO2QM1qLcrSajW87Z00BOsK4P8w+vK7j
	qUEtqte7eibsEyRk1lW7zH5vZFJ7BUO+QCa5jD+PEcBxbMyILVDLCPuIQQ6Hxl4ByeG
	/eEO0ncVJX2sdFvtXezIw4OGdemGE+dgqezbtpTs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h7DXwOo9tIGETAzFi+3E/2LiND7IcVcMSfWLiN418lk=;
	b=QtE8/nFDZ2/74zfNCpsOHrQDX7TA+xk8Fo6u1F6Dt6qcOvoUFG04cvsDSA2vXY+s
	E76D1hFliGzF5aaYnHjMPSjMtaLyYGZHftMWJrb6eR2PF7vtKXYustqpP+8EGeswYTY
	v/qHChdIc86e39Z+If+GpiP42i4QAaXlV2VF+Wy0=
Content-Type: multipart/mixed; boundary="===============4586766096551833793=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-rust: upgrading to 1.6.0 SUCCEEDED
Message-ID: <01010188215a5362-62f165d7-9277-4c48-adaf-c91e3b98f3f2-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181319

--===============4586766096551833793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools-rust* to *1.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-rust-upgrade-1.5.2-1.6.0.patch
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
--===============4586766096551833793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools-rust: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.5.2.tar.gz;downloadfilename=setuptools-rust-1.5.2.tar.gz https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.5.2.tar.gz;downloadfilename=setuptools-rust-1.5.2.tar.gz https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-1.5.2.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.6.0.tar.gz;downloadfilename=setuptools-rust-1.6.0.tar.gz https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.6.0.tar.gz;downloadfilename=setuptools-rust-1.6.0.tar.gz https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-1.6.0.tar.gz"
packages/core2-32-poky-linux/python3-setuptools-rust: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGSIZE changed from 154279 to 156404 (+1%)
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PV changed from "1.5.2" to "1.6.0"
Changes to packages/core2-32-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.11/site-packages/setuptools_rust-1.5.2.dist-info moved to /usr/lib/python3.11/site-packages/setuptools_rust-1.6.0.dist-info

--===============4586766096551833793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.11/site-packages/setuptools_rust-1.5.2.dist-info moved to /usr/lib/python3.11/site-packages/setuptools_rust-1.6.0.dist-info

--===============4586766096551833793==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-rust-upgrade-1.5.2-1.6.0.patch"

RnJvbSA2NjRiNWYwZjhjODg3ZjNlMjE5ZTdmNmNiMmJkMzdhMDUyZmRkNDA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTI6MjA6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtcnVzdDogdXBncmFkZSAxLjUuMiAtPiAxLjYuMAoKLS0tCiAuLi5l
dHVwdG9vbHMtcnVzdF8xLjUuMi5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjYuMC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNldHVwdG9vbHMt
cnVzdF8xLjUuMi5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtcnVzdF8xLjYuMC5iYn0gKDkyJSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29scy1ydXN0XzEuNS4yLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LXNldHVwdG9vbHMtcnVzdF8xLjYuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy1ydXN0XzEu
NS4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29scy1ydXN0XzEuNi4wLmJiCmluZGV4IDUwMjk2N2ZkMjAuLmNiZTZhYzU4OGEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXJ1
c3RfMS41LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNl
dHVwdG9vbHMtcnVzdF8xLjYuMC5iYgpAQCAtMTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wMTFjZDkyZTcwMmRkOWU2YjFhMjYxNTdiNmZkNTNmNSIK
IFNSQ19VUkkgPSAiJHtQWVBJX1NSQ19VUkl9IFwKICAgICAgICAgICAgaHR0cHM6Ly9maWxlcy5w
eXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzY3LzA4L2UxYWEyYzU4MmM2MmFjNzZlNGQ2MGY4ZTQ1
NGJkM2JiYTkzMzc4MWEwNmE4OGI0ZTM4Nzk3NDQ1ODIyYS9zZXR1cHRvb2xzLXJ1c3QtJHtQVn0u
dGFyLmd6IFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ4ZGFjY2IxNGRj
MGVhZTFiNmI2ZWIzZWNlZjc5Njc1YmQzN2I0MDY1MzY5Zjc5YzM1MzkzZGQ1YzU1NjUyYzciCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYzg2ZTczNGRlYWMzMzA1OTc5OThiZmJjMDhkYTQ1MTg3ZTZi
Mjc4MzdlMjNiZDkxZWFkYjMyMDczMjM5MjI2MiIKIAogaW5oZXJpdCBjYXJnbyBweXBpIHB5dGhv
bl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKIAotLSAKMi4zOS4yCgo=

--===============4586766096551833793==--

