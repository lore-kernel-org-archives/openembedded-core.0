Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8D5C6371D
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web08.24446.1665871392133082811
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fUUG22jN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010183ddac356a-40418f30-092e-4c2d-a10d-f3b4e2bad3b9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eqMFJpn1PTsSd4cQaxRJgoqMkx2AnLXHRSHQ/zasIuc=;
	b=fUUG22jNVvemHtC3wwlHlGT3/pbRtIVeZbxdf9xIolHSx3lfWDm+n45jivHIDCOp
	dMS3XP7Mze+JBZxQwpv2PtFV1fTP8l25TaG0obbr5OgjVPlCsJPXQ4LgY8FaWSX/Yre
	r8ZuKsNEu1CHlzuaojPdmVqfgGQ4m8QLOrMwjc0w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eqMFJpn1PTsSd4cQaxRJgoqMkx2AnLXHRSHQ/zasIuc=;
	b=jE2eAPNeunJ2uFqpOxx7i+/Lo0amQi/EK0yrA15sscrt58XqpMWyT/pECjTSedGZ
	7c69Elvl4Pf6ELeMoE5tjU/jvsplVJvMYtWhtzWDVi/Nbzk4KNidvqG8zSILVtnbI3P
	SiOuG/NtmyzIQ7RQFL7/NELDEHk7JHQ7dEld1bS4=
Content-Type: multipart/mixed; boundary="===============8840669988082615298=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.29.3 SUCCEEDED
Message-ID: <01010183ddac356a-40418f30-092e-4c2d-a10d-f3b4e2bad3b9-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171801

--===============8840669988082615298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.29.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.29.2-2.29.3.patch
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
--===============8840669988082615298==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.29.2-2.29.3.patch"

RnJvbSBkNzZiYjVjNzhhODNjMDg5Yjk3M2YzYTA0OTk3YTQ1YzhlZThlZDU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTE6MTk6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuMjkuMiAtPiAyLjI5LjMKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3JlcG8ve3JlcG9fMi4yOS4yLmJiID0+IHJlcG9fMi4yOS4zLmJifSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9yZXBvL3tyZXBvXzIuMjkuMi5iYiA9PiByZXBvXzIuMjkuMy5iYn0gKDk1JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuMjkuMi5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4yOS4zLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4yOS4y
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuMjkuMy5iYgpp
bmRleCA0MmZkMThhYzI0Li42NmI2MzJjMjlkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcmVwby9yZXBvXzIuMjkuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVw
by9yZXBvXzIuMjkuMy5iYgpAQCAtMTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9MSUNFTlNFO21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJjZS5jb20vZ2l0LXJlcG8uZ2l0O3Byb3RvY29s
PWh0dHBzO2JyYW5jaD1tYWluIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtcHl0aG9uMy1zaGVi
YW5nLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjg5MWU4ZjcyY2UzNTUxYTE5YzM3
NzQ1NjU3NGJiZmJlYWM1YzhiOGUiCitTUkNSRVYgPSAiYWNjNGM4NTdhMGI2ZTJlMzNlMzY0NzAy
OGNiZDMxMjQ5OGZkNTkwMCIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJj
ZS5jb20vZ2l0LXJlcG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJldmlldy9naXQt
cmVwby5naXQiCiAKLS0gCjIuMzEuMQoK

--===============8840669988082615298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/repo: PV changed from "2.29.2" to "2.29.3"
packages/core2-32-poky-linux/repo: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/core2-32-poky-linux/repo/repo-dbg: PV changed from "2.29.2" to "2.29.3"
packages/core2-32-poky-linux/repo/repo-dbg: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/core2-32-poky-linux/repo/repo-dev: PV changed from "2.29.2" to "2.29.3"
packages/core2-32-poky-linux/repo/repo-dev: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/core2-32-poky-linux/repo/repo-doc: PV changed from "2.29.2" to "2.29.3"
packages/core2-32-poky-linux/repo/repo-doc: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/core2-32-poky-linux/repo/repo-locale: PV changed from "2.29.2" to "2.29.3"
packages/core2-32-poky-linux/repo/repo-locale: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/core2-32-poky-linux/repo/repo-src: PV changed from "2.29.2" to "2.29.3"
packages/core2-32-poky-linux/repo/repo-src: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/core2-32-poky-linux/repo/repo-staticdev: PV changed from "2.29.2" to "2.29.3"
packages/core2-32-poky-linux/repo/repo-staticdev: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/core2-32-poky-linux/repo/repo: PV changed from "2.29.2" to "2.29.3"
packages/core2-32-poky-linux/repo/repo: PKGV changed from 2.29.2 [default] to 2.29.3 [default]

--===============8840669988082615298==--

