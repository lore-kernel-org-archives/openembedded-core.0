Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58B6C6FD24
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:57 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.12457.1662040786025339084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ag9l94xE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010182f959c013-797b9e90-c53c-4bb9-a407-11d34fffda13-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rVdURnL3aAdGBE8SqAutqb+t7jCDlP7gKaEN9b4ufps=;
	b=ag9l94xEULFKsq5r2sUVtwGWrPb4JekHAM1dhXHzcl/OuVmN9cWrJ0bIqhc16m76
	59kDIptowLf9ux1iY9wggHR1Y6KRAW6D+zCYb4sEDe/py48OvI33wFfx046VFKyVkhe
	0zZz4G7ErqslAp/DXpDBKtJ0aY9q0dEh6H5bgF6w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040785;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rVdURnL3aAdGBE8SqAutqb+t7jCDlP7gKaEN9b4ufps=;
	b=Ur/FwiApXvx8lM3f7buq/sByn2Iwctar48awaajcMo/kPQZ6gAE1PnqiVlR+PG/E
	HEHg4jhOXqJvaeZWVHHAK71Jn0xsLwR0qTz4Ekqkf9qv5Ej26CGTQWSx3Uf7IXCQp9h
	KZ3rWUUM24T52bfCN4DGXJIZfPuGVHykdUmxhmW4=
Content-Type: multipart/mixed; boundary="===============7694556112647945500=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ninja: upgrading to 1.11.1 SUCCEEDED
Message-ID: 
 <01010182f959c013-797b9e90-c53c-4bb9-a407-11d34fffda13-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:45 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170170

--===============7694556112647945500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ninja* to *1.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ninja-upgrade-1.11.0-1.11.1.patch
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
--===============7694556112647945500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ninja: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/ninja: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/ninja/ninja-dbg: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/ninja/ninja-dbg: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/ninja/ninja-dbg: PKGSIZE changed from 6885812 to 6885824 (+0%)
packages/core2-32-poky-linux/ninja/ninja-dev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/ninja/ninja-dev: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/ninja/ninja-doc: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/ninja/ninja-doc: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/ninja/ninja-locale: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/ninja/ninja-locale: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/ninja/ninja-src: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/ninja/ninja-src: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/ninja/ninja-src: PKGSIZE changed from 407189 to 407229 (+0%)
packages/core2-32-poky-linux/ninja/ninja-staticdev: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/ninja/ninja-staticdev: PV changed from "1.11.0" to "1.11.1"
packages/core2-32-poky-linux/ninja/ninja: PKGV changed from 1.11.0 [default] to 1.11.1 [default]
packages/core2-32-poky-linux/ninja/ninja: PV changed from "1.11.0" to "1.11.1"

--===============7694556112647945500==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ninja-upgrade-1.11.0-1.11.1.patch"

RnJvbSBlMjczZWVkN2I1NjE5NjdmNWZlMzg4MjJjMTY4NWY0OThiNWJhZTIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwNjozNzo1NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5p
bmphOiB1cGdyYWRlIDEuMTEuMCAtPiAxLjExLjEKCi0tLQogLi4uL3JlY2lwZXMtZGV2dG9vbHMv
bmluamEve25pbmphXzEuMTEuMC5iYiA9PiBuaW5qYV8xLjExLjEuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL25pbmphL3tuaW5qYV8xLjExLjAuYmIgPT4gbmluamFfMS4xMS4xLmJifSAo
OTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9uaW5qYS9uaW5qYV8xLjEx
LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbmluamEvbmluamFfMS4xMS4xLmJiCnNpbWls
YXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9uaW5qYS9u
aW5qYV8xLjExLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9uaW5qYS9uaW5q
YV8xLjExLjEuYmIKaW5kZXggNGVjMzYxY2MxYS4uMjU1ZjVlZmI3MCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL25pbmphL25pbmphXzEuMTEuMC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbmluamEvbmluamFfMS4xMS4xLmJiCkBAIC02LDcgKzYsNyBAQCBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1hODE1ODZhNjRhZDRlNDc2Yzc5MWNkYTdl
MmYyYzUyZSIKIAogREVQRU5EUyA9ICJyZTJjLW5hdGl2ZSBuaW5qYS1uYXRpdmUiCiAKLVNSQ1JF
ViA9ICI1MWVkZWViMDYzYTgyNjkzNTczZGI0Mzc4MmQ5ZTM3MzNiMjg0MGU0IgorU1JDUkVWID0g
ImE1MjRiZjNmNmJhY2QxYjRhZDg1ZDcxOWVlZDI3MzdkODU2MmYyN2EiCiAKIFNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9uaW5qYS1idWlsZC9uaW5qYS5naXQ7YnJhbmNoPXJlbGVhc2U7cHJv
dG9jb2w9aHR0cHMiCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+Liop
IgotLSAKMi4zMS4xCgo=

--===============7694556112647945500==--

