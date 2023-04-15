Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833B6C7EE37
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:29 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.13519.1681581684878815842
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hPtTDP+/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018786143e3f-483ebcdf-11f0-44b4-b99f-3c28f96d06d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kMVydrCFHm2f01qq3oaUlJu+3PkCYP1usekhOScWGcs=;
	b=hPtTDP+/wNq6mrOfBHfCpGEI8u/tnllDEcLUYmw/7fkG6ndetCnOZC0cJDzULsWB
	q61RmKUBRaiitEklLdwW0Ci5TCiiWJ3GfD+LSjkSORmchlwYanrL+1TW2X7PRxKXifE
	jH4WaJ+DbPvKU4SIJHUYARvR3JpQ8dRQO0hTPBpY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kMVydrCFHm2f01qq3oaUlJu+3PkCYP1usekhOScWGcs=;
	b=J7Q+uksGWL35DmJWSlXwUph3hmayBYwl4VAxMBni9vHOo7btuax89hnbWvm/c7xK
	cQY7BL+/BwFczN962mNIyAmhu80p6mIuUQNq/DltffOvmrH2v9YrOkQA+y1+UvO0wkv
	M3N0sJJxkrdEc5GgleDj6SJG6PjzghoJ2313A8XY=
Content-Type: multipart/mixed; boundary="===============6734312244509174022=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cryptodev-linux: upgrading to 1.13 SUCCEEDED
Message-ID: <0101018786143e3f-483ebcdf-11f0-44b4-b99f-3c28f96d06d7-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180085

--===============6734312244509174022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cryptodev-linux* to *1.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-cryptodev-linux-upgrade-1.12-1.13.patch
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
--===============6734312244509174022==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cryptodev-linux-upgrade-1.12-1.13.patch"

RnJvbSA2NGViYjVjMDIwOGQ3ZmI4MzQ4MDI1MDZmZDMzZTg2MmQxNDY5MmQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTU6MjY6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
cnlwdG9kZXYtbGludXg6IHVwZ3JhZGUgMS4xMiAtPiAxLjEzCgotLS0KIC4uLi97Y3J5cHRvZGV2
LWxpbnV4XzEuMTIuYmIgPT4gY3J5cHRvZGV2LWxpbnV4XzEuMTMuYmJ9ICAgICAgICB8IDAKIG1l
dGEvcmVjaXBlcy1rZXJuZWwvY3J5cHRvZGV2L2NyeXB0b2Rldi5pbmMgICAgICAgICAgICAgICAg
ICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2NyeXB0b2Rldi97Y3J5cHRvZGV2LWxpbnV4
XzEuMTIuYmIgPT4gY3J5cHRvZGV2LWxpbnV4XzEuMTMuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvY3J5cHRvZGV2L2NyeXB0b2Rldi1saW51eF8xLjEyLmJiIGIv
bWV0YS9yZWNpcGVzLWtlcm5lbC9jcnlwdG9kZXYvY3J5cHRvZGV2LWxpbnV4XzEuMTMuYmIKc2lt
aWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwvY3J5cHRv
ZGV2L2NyeXB0b2Rldi1saW51eF8xLjEyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVs
L2NyeXB0b2Rldi9jcnlwdG9kZXYtbGludXhfMS4xMy5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWtlcm5lbC9jcnlwdG9kZXYvY3J5cHRvZGV2LmluYyBiL21ldGEvcmVjaXBlcy1rZXJuZWwv
Y3J5cHRvZGV2L2NyeXB0b2Rldi5pbmMKaW5kZXggZWYzNDJhMTU3Yy4uNjFjNjg4ZjFkMCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9jcnlwdG9kZXYvY3J5cHRvZGV2LmluYworKysg
Yi9tZXRhL3JlY2lwZXMta2VybmVsL2NyeXB0b2Rldi9jcnlwdG9kZXYuaW5jCkBAIC0xMCw3ICsx
MCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlm
NWZjZTQ0ODZhODBmZGFmNGE0MjYzIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vY3J5
cHRvZGV2LWxpbnV4L2NyeXB0b2Rldi1saW51eDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBz
IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gImUwYzI1ZTI4OWQ2YmFmMWQ4M2MyYjljYjUyM2Qz
YmMyMzdkMGMwYzkiCitTUkNSRVYgPSAiNzk1ZjVmZGExNDg1ZDQ0N2NkYmFkMzQyZTgzMDRiZTMx
N2Q0ZjdlOCIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zOS4yCgo=

--===============6734312244509174022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dbg: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dbg: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dev: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dev: PKGSIZE changed from 9848 to 9914 (+1%)
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-dev: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-doc: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-doc: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-locale: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-locale: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-src: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-src: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-staticdev: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux-staticdev: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux/cryptodev-linux: PV changed from "1.12" to "1.13"
packages/core2-32-poky-linux/cryptodev-linux: PKGV changed from 1.12 [default] to 1.13 [default]
packages/core2-32-poky-linux/cryptodev-linux: PV changed from "1.12" to "1.13"

--===============6734312244509174022==--

