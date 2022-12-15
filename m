Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E99C6FA8E
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.144492.1671136350616678441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IR9f/IPp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010185177d14f2-9c5de0bb-e015-4706-9525-8d095bbf5f75-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cuq9SiX8Ra3e7mZOMA6lysLmkbCv3zFNjRxaV8XV8Tk=;
	b=IR9f/IPpPE+NXv0k7m2mTA2uKzfosyNLFKvOgm/W9X2wqe0rwtIJGas4uSweSkoh
	in3pejioIzZ3fRF7Abz7mbmqLd0HNOqF2L8oUHcmfXK8O0qrZ1cCr6aBl7ftcDbci5w
	c2FlEfc8Cp65vyvEg5PqJpk8t3FhWUb/sfYkEXXM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cuq9SiX8Ra3e7mZOMA6lysLmkbCv3zFNjRxaV8XV8Tk=;
	b=hkwx3fUe2R1u9dFWAdQVccqOJCmoXer6c6RW5FtUmvu0WziIBEOWG7nTxj2nJ8rL
	MbjI71Eqma1sBHSzrK5pFUi3WlBmf/k2uKYlmnUIw8kVC/iBowz4ddTeVrsDxU692ET
	RLKMbgtUsPJYnW961Mth0yJgGI5isv78g88NLRig=
Content-Type: multipart/mixed; boundary="===============8347591943088531660=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodomex: upgrading to 3.16.0 SUCCEEDED
Message-ID: <01010185177d14f2-9c5de0bb-e015-4706-9525-8d095bbf5f75-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174657

--===============8347591943088531660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycryptodomex* to *3.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodomex-upgrade-3.15.0-3.16.0.patch
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
--===============8347591943088531660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycryptodomex: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodomex: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.15.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodomex/pycryptodomex-3.16.0.tar.gz"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dbg: PKGSIZE changed from 1042136 to 1042132 (-0%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-dev: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-doc: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-locale: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-src: PKGSIZE changed from 2772679 to 2772209 (-0%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-staticdev: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex-tests: PKGSIZE changed from 2847506 to 2848084 (+0%)
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodomex/python3-pycryptodomex: PKGSIZE changed from 3650210 to 3650298 (+0%)
Changes to packages/core2-32-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodomex-3.15.0.dist-info moved to /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info

--===============8347591943088531660==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodomex-upgrade-3.15.0-3.16.0.patch"

RnJvbSA1NGE3NDBmZTVjMWVkOWY5NTdhMmNiOTBiZmIxYjA1NzAzODZkMzhjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTE6NDc6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Y3J5cHRvZG9tZXg6IHVwZ3JhZGUgMy4xNS4wIC0+IDMuMTYuMAoKLS0tCiAuLi4t
cHljcnlwdG9kb21leF8zLjE1LjAuYmIgPT4gcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMTYuMC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5Y3J5cHRvZG9t
ZXhfMy4xNS4wLmJiID0+IHB5dGhvbjMtcHljcnlwdG9kb21leF8zLjE2LjAuYmJ9ICg2OSUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRv
ZG9tZXhfMy4xNS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5
Y3J5cHRvZG9tZXhfMy4xNi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggNjklCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMTUuMC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Y3J5cHRv
ZG9tZXhfMy4xNi4wLmJiCmluZGV4IGUyMmNlMzA4MzMuLjM2ZWY3NzI4NjMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWV4XzMuMTUu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9k
b21leF8zLjE2LjAuYmIKQEAgLTEsNyArMSw3IEBACiByZXF1aXJlIHB5dGhvbi1weWNyeXB0b2Rv
bWUuaW5jCiBpbmhlcml0IHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3MzQx
ZjFiYjJkYWRiMGQxYTAwNDdmMzRjM2E1ODIwOGE5MjQyM2NkYmQzMjQ0ZDk5OGU0YjI4ZGY1ZWFj
MGVkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImU5YmE5ZDhlZDYzODczM2M5ZTk1NjY0NDcwYjcx
ZDYyNGE2ZGVmMTQ5ZTJkYjZjYzUyYzFhY2E1YTZhMmRmMWQiCiAKIEZJTEVTOiR7UE59LXRlc3Rz
ID0gIiBcCiAgICAgJHtQWVRIT05fU0lURVBBQ0tBR0VTX0RJUn0vQ3J5cHRvZG9tZS9TZWxmVGVz
dC8gXAotLSAKMi4zNy4zCgo=

--===============8347591943088531660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pycryptodomex (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodomex-3.15.0.dist-info moved to /usr/lib/python3.11/site-packages/pycryptodomex-3.16.0.dist-info

--===============8347591943088531660==--

