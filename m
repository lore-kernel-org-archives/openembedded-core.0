Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8A3C49EC5
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:03 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.6470.1660589822859826957
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bM/bD9n2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010182a2ddce41-6122af9f-7fda-4040-8b93-e4f20c87565b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7/Mqp1xELCccRm4e481007vIiSYoMlKTYUxCr0f0EH8=;
	b=bM/bD9n28s0tgkzhkOgnhvoW/AGj3N2TpdQomio1ptNhCGs14B5IIocf5eH7vHZo
	z+1BKCx4K+MAcFBTCESM7blxDWWZcJFsUyW2aDoxlUz8wHMDPgJU17u7Jq1IIgrfjrG
	DdxmOTd2QS1lPMZObgtplFcYt5fVrcMU6/Abcer8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7/Mqp1xELCccRm4e481007vIiSYoMlKTYUxCr0f0EH8=;
	b=HNUBB8mb7bBBBh0RlhErNTn97zZgtmp0fw21/OIR37+EFoaDXHe1NMlGB0f250BH
	iJGmwMf0T1a94C8RHG1DXvafs0ju3AW7kYD//zx5HpZ1Ru7sewKEWIQHhbyboh1cvu5
	axF/dArV8vC4BjwPgPbsl4bVg5yXThtq8hUYq9EU=
Content-Type: multipart/mixed; boundary="===============0069966990503292302=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mpg123: upgrading to 1.30.2 SUCCEEDED
Message-ID: 
 <01010182a2ddce41-6122af9f-7fda-4040-8b93-e4f20c87565b-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169409

--===============0069966990503292302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mpg123* to *1.30.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.30.1-1.30.2.patch
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
--===============0069966990503292302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mpg123: PKGV changed from 1.30.1 [default] to 1.30.2 [default]
packages/core2-32-poky-linux/mpg123: PV changed from "1.30.1" to "1.30.2"
packages/core2-32-poky-linux/mpg123: SRC_URI changed from "https://www.mpg123.de/download/mpg123-1.30.1.tar.bz2" to "https://www.mpg123.de/download/mpg123-1.30.2.tar.bz2"
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PKGV changed from 1.30.1 [default] to 1.30.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PV changed from "1.30.1" to "1.30.2"
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PKGSIZE changed from 1973004 to 1972996 (-0%)
packages/core2-32-poky-linux/mpg123/mpg123-dev: PKGV changed from 1.30.1 [default] to 1.30.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-dev: PV changed from "1.30.1" to "1.30.2"
packages/core2-32-poky-linux/mpg123/mpg123-doc: PKGV changed from 1.30.1 [default] to 1.30.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-doc: PV changed from "1.30.1" to "1.30.2"
packages/core2-32-poky-linux/mpg123/mpg123-locale: PKGV changed from 1.30.1 [default] to 1.30.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-locale: PV changed from "1.30.1" to "1.30.2"
packages/core2-32-poky-linux/mpg123/mpg123-src: PKGV changed from 1.30.1 [default] to 1.30.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-src: PV changed from "1.30.1" to "1.30.2"
packages/core2-32-poky-linux/mpg123/mpg123-src: PKGSIZE changed from 2035975 to 2036123 (+0%)
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: PKGV changed from 1.30.1 [default] to 1.30.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: PV changed from "1.30.1" to "1.30.2"
packages/core2-32-poky-linux/mpg123/mpg123: PKGV changed from 1.30.1 [default] to 1.30.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123: PV changed from "1.30.1" to "1.30.2"

--===============0069966990503292302==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.30.1-1.30.2.patch"

RnJvbSBhOTMyYTRiODQ4MTRiMjVkOWQ1ZjFjMmY4MGZmYTIwMGUyMmRhMDliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMTU6MzQ6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
cGcxMjM6IHVwZ3JhZGUgMS4zMC4xIC0+IDEuMzAuMgoKLS0tCiAuLi4vbXBnMTIzL3ttcGcxMjNf
MS4zMC4xLmJiID0+IG1wZzEyM18xLjMwLjIuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9tcGcxMjMve21wZzEyM18xLjMwLjEuYmIgPT4gbXBnMTIzXzEuMzAu
Mi5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMv
bXBnMTIzXzEuMzAuMS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNf
MS4zMC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4zMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9tcGcxMjMvbXBnMTIzXzEuMzAuMi5iYgppbmRleCA1MDJkOWQxMTRjLi5mNDBi
ZmYxZmY2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMvbXBnMTIz
XzEuMzAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMvbXBnMTIzXzEu
MzAuMi5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIkxHUEwtMi4xLW9ubHkiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1lN2I5YzE1ZmNmYjk4NmFiYjRjYzVl
ODQwMGEyNDE2OSIKIAogU1JDX1VSSSA9ICJodHRwczovL3d3dy5tcGcxMjMuZGUvZG93bmxvYWQv
JHtCUH0udGFyLmJ6MiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxYjIwYzljNzUxYmVhOWJlNTU2
NzQ5YmQ3Zjk3Y2Y1ODBmNTJlZDExZjI1NDA3NTZlOWFmMjZhZTAzNmU0YzU5IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImM3ZWE4NjM3NTZiYjc5ZGFlZDdjYmEyOTQyYWQzYjI2N2E0MTBmMjZkMmRm
YmQ5YWFmODQ0NTFmZjI4YTA1ZDciCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIm1wZzEyMy0o
P1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAotLSAKMi4zMS4xCgo=

--===============0069966990503292302==--

