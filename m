Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0D9C54EF0
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:07 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.20662.1672605966737325340
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fqNizYPZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101856f159e02-6291a283-ec5c-40dc-8dc3-43110d94be3d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oa/j643vRsnymbhDiz3gjiCeqGJbV8zmdgCuxIL6mnw=;
	b=fqNizYPZMgAiMTddDOwC/SAAIpLZT2Ku0dI8+BQXoWB27H0JyBYWt207rd58VqYA
	v0fkp2MTr5HLKG7MhXpIXmElMBhpZqD1vHT1dg51NDvpC6/sDEqto4tSZQaas9Gjvmt
	XBHfvwSGixnmB60l1GzBmtTORgOY33MOifmOpDlM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oa/j643vRsnymbhDiz3gjiCeqGJbV8zmdgCuxIL6mnw=;
	b=cNCZWEMro+uAAYgePSi7KecnRlru0Gnja6HTgHCw4OS5Cu2/Fjt2DynvOqY8wvnY
	P3HWVbGPqVnOdZOtL3d7rS/dFClUmNrYZKGz9yWKx2qphLvPtpUQiPlHq4HPg34rWln
	ztr8KBdUiPoq3YLhcZDQmPhrdfWLk6VU4Na/65Kc=
Content-Type: multipart/mixed; boundary="===============4418751577426871545=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.30 SUCCEEDED
Message-ID: <010101856f159e02-6291a283-ec5c-40dc-8dc3-43110d94be3d-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175248

--===============4418751577426871545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-git* to *3.1.30* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.29-3.1.30.patch
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
--===============4418751577426871545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.29.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.30.dist-info

--===============4418751577426871545==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.29-3.1.30.patch"

RnJvbSA0NTJmZGNkNDhkNDg4ZGZlNDUwOWY3ZGFhYTk0MDcyMWI5ODRhNGZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAwODo1ODoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZ2l0OiB1cGdyYWRlIDMuMS4yOSAtPiAzLjEuMzAKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1naXRfMy4xLjI5LmJiID0+IHB5dGhvbjMtZ2l0XzMuMS4zMC5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1naXRfMy4xLjI5LmJiID0+IHB5dGhv
bjMtZ2l0XzMuMS4zMC5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4yOS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1naXRfMy4xLjMwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1naXRfMy4xLjI5LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4zMC5i
YgppbmRleCBlNzVmOGI0ZTNmLi44MGY1MDAxOWIxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4yOS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4zMC5iYgpAQCAtMTIsNyArMTIsNyBAQCBQ
WVBJX1BBQ0tBR0UgPSAiR2l0UHl0aG9uIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9v
bHNfYnVpbGRfbWV0YQogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2MzNmJmYzRhM2Y5MTNlNjY4
MDVhMjhlODQ3MDNlNDE5ZDljMjY0YzEwNzdlNTM3YjU0ZjBlMWFmODVkYmVmZCIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI3NjljMmQ4M2UxM2Y1ZDkzOGI3Njg4NDc5ZGEzNzRjNGUzZDQ5ZjcxNTQ5
YWFmNDYyYjY0NmRiOTYwMmVhNmY4IgogCiBERVBFTkRTICs9ICIgJHtQWVRIT05fUE59LWdpdGRi
IgogCi0tIAoyLjM3LjMKCg==

--===============4418751577426871545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-git: PKGV changed from 3.1.29 [default] to 3.1.30 [default]
packages/core2-32-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.29.tar.gz" to "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.30.tar.gz"
packages/core2-32-poky-linux/python3-git: PV changed from "3.1.29" to "3.1.30"
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.29 [default] to 3.1.30 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.29" to "3.1.30"
packages/core2-32-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.29 [default] to 3.1.30 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.29" to "3.1.30"
packages/core2-32-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.29 [default] to 3.1.30 [default]
packages/core2-32-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.29" to "3.1.30"
packages/core2-32-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.29 [default] to 3.1.30 [default]
packages/core2-32-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.29" to "3.1.30"
packages/core2-32-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.29 [default] to 3.1.30 [default]
packages/core2-32-poky-linux/python3-git/python3-git-src: PV changed from "3.1.29" to "3.1.30"
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.29 [default] to 3.1.30 [default]
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.29" to "3.1.30"
packages/core2-32-poky-linux/python3-git/python3-git: PKGV changed from 3.1.29 [default] to 3.1.30 [default]
packages/core2-32-poky-linux/python3-git/python3-git: PKGSIZE changed from 1302154 to 1315316 (+1%)
packages/core2-32-poky-linux/python3-git/python3-git: PV changed from "3.1.29" to "3.1.30"
Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.11/site-packages/GitPython-3.1.29.dist-info moved to /usr/lib/python3.11/site-packages/GitPython-3.1.30.dist-info

--===============4418751577426871545==--

