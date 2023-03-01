Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A1CC88C98
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:19 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.24037.1677681914619293332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QZoFrdcP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101869da26f47-3454ca90-c7f2-416a-ae52-ae81cc5952e1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=G0mjBGOP8DethYDKecgCFNdR17op9j7xWRONF0rFVWU=;
	b=QZoFrdcPrnEH5/SFSH+vq2g4VPYzOBa/MGws8AO5BkO5Dm+2B3R88X7rDbI78f3v
	S2e1woyGwrO9TCrzQeMJ5F4PhXTvnbeRG9/vAB57jIb5Eye9tZP2mMey1wwbl1j9kgL
	KO1TQkOOBrwyP4RbGxxTkre0IKPujNJ8swsLEskE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=G0mjBGOP8DethYDKecgCFNdR17op9j7xWRONF0rFVWU=;
	b=S6f0rJlfCNTfcA0azVCm2NNMU1ZL8AN+/iQWLTQpdEHYFdHLwzJpg47FDmen2hVJ
	KGcw5t9CVDA5l/q7vdCv7fuqFceC++BfHdeuF80sSN/txRL+TVprFUhmkjWnOs3ejYJ
	rd1+QU5URysaQ+ZSQVkFe1GZvwRBAxb1+Wq6dRjM=
Content-Type: multipart/mixed; boundary="===============2516037856574357148=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.31 SUCCEEDED
Message-ID: <010101869da26f47-3454ca90-c7f2-416a-ae52-ae81cc5952e1-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177901

--===============2516037856574357148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-git* to *3.1.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.30-3.1.31.patch
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
--===============2516037856574357148==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.30-3.1.31.patch"

RnJvbSA3NmU2MzIxZWNhMzFmYzFhOWYxYzhjMzIxOTQ0MWMzZGZhNTA1ZTBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAwODoyMDoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZ2l0OiB1cGdyYWRlIDMuMS4zMCAtPiAzLjEuMzEKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1naXRfMy4xLjMwLmJiID0+IHB5dGhvbjMtZ2l0XzMuMS4zMS5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1naXRfMy4xLjMwLmJiID0+IHB5dGhv
bjMtZ2l0XzMuMS4zMS5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4zMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1naXRfMy4xLjMxLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1naXRfMy4xLjMwLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4zMS5i
YgppbmRleCA4MGY1MDAxOWIxLi4wOGI5ZjY2YmNiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4zMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4zMS5iYgpAQCAtMTIsNyArMTIsNyBAQCBQ
WVBJX1BBQ0tBR0UgPSAiR2l0UHl0aG9uIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9v
bHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzY5YzJkODNlMTNmNWQ5Mzhi
NzY4ODQ3OWRhMzc0YzRlM2Q0OWY3MTU0OWFhZjQ2MmI2NDZkYjk2MDJlYTZmOCIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI4Y2UzYmNmNjlhZGZkZjdjN2Q1MDNlNzhmZDNiMWM0OTJhZjc4MmQ1ODg5
M2I2NTBhZGIyYWM4OTEyZGRkNTczIgogCiBERVBFTkRTICs9ICIgJHtQWVRIT05fUE59LWdpdGRi
IgogCi0tIAoyLjM5LjIKCg==

--===============2516037856574357148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.30.tar.gz" to "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.31.tar.gz"
packages/core2-32-poky-linux/python3-git: PKGV changed from 3.1.30 [default] to 3.1.31 [default]
packages/core2-32-poky-linux/python3-git: PV changed from "3.1.30" to "3.1.31"
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.30 [default] to 3.1.31 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.30" to "3.1.31"
packages/core2-32-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.30 [default] to 3.1.31 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.30" to "3.1.31"
packages/core2-32-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.30 [default] to 3.1.31 [default]
packages/core2-32-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.30" to "3.1.31"
packages/core2-32-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.30 [default] to 3.1.31 [default]
packages/core2-32-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.30" to "3.1.31"
packages/core2-32-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.30 [default] to 3.1.31 [default]
packages/core2-32-poky-linux/python3-git/python3-git-src: PV changed from "3.1.30" to "3.1.31"
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.30 [default] to 3.1.31 [default]
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.30" to "3.1.31"
packages/core2-32-poky-linux/python3-git/python3-git: PKGV changed from 3.1.30 [default] to 3.1.31 [default]
packages/core2-32-poky-linux/python3-git/python3-git: PKGSIZE changed from 1315316 to 1319857 (+0%)
packages/core2-32-poky-linux/python3-git/python3-git: PV changed from "3.1.30" to "3.1.31"
Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.30.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.31.dist-info

--===============2516037856574357148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.30.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.31.dist-info

--===============2516037856574357148==--

