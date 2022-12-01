Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DB2C64E92
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:34 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.46770.1669908626990522753
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HRKpDvSi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010184ce4f7b86-88006ad9-6ca7-442a-ba41-40c40c727464-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2VqP3rm9LqSpmX0gcuOF5unFcEZWq20HdO+lQ3Ht1eI=;
	b=HRKpDvSig7unQALWBHZvyN3Fghwml3FlfXuV433NWkXaZsTd/g19I75+qtQJl+ng
	IkG3FWfswkDmYPW2+3I3gTC2GNUQfhBbC/PgG3gYw8Dr7uXu103JGOPxKOqYLUUtgDK
	qaF2Rdz1iEhxzi+znpTiabv9VjPpO4cbJTGegOVY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2VqP3rm9LqSpmX0gcuOF5unFcEZWq20HdO+lQ3Ht1eI=;
	b=ayyITMk6O21A5L/imLxXb7VoKTNtiwr2D751d7aZm94EQOOTfV9n+cezQ8U04Rhk
	3ttcmFaFYM1eBD5A9ku6LUG9m1Tc7pXFs9JqLO8nP2611/iqhthOHtweR0tGJOSXRbh
	P/zGKFe5/kGmSHVwdGqmK8gzbcyJVP/31yNx0QXY=
Content-Type: multipart/mixed; boundary="===============3755316269766358189=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pycryptodome: upgrading to 3.16.0 SUCCEEDED
Message-ID: <01010184ce4f7b86-88006ad9-6ca7-442a-ba41-40c40c727464-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174148

--===============3755316269766358189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pycryptodome* to *3.16.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pycryptodome-upgrade-3.15.0-3.16.0.patch
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
--===============3755316269766358189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pycryptodome: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.15.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pycryptodome/pycryptodome-3.16.0.tar.gz"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dbg: PKGSIZE changed from 1042020 to 1042016 (-0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-dev: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-doc: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-locale: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-src: PKGSIZE changed from 2772679 to 2772209 (-0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-staticdev: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome-tests: PKGSIZE changed from 2843641 to 2844219 (+0%)
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PV changed from "3.15.0" to "3.16.0"
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGV changed from 3.15.0 [default] to 3.16.0 [default]
packages/core2-32-poky-linux/python3-pycryptodome/python3-pycryptodome: PKGSIZE changed from 3644614 to 3644710 (+0%)
Changes to packages/core2-32-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodome-3.15.0.dist-info moved to /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info

--===============3755316269766358189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pycryptodome (sysroot):
  /usr/lib/python3.11/site-packages/pycryptodome-3.15.0.dist-info moved to /usr/lib/python3.11/site-packages/pycryptodome-3.16.0.dist-info

--===============3755316269766358189==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pycryptodome-upgrade-3.15.0-3.16.0.patch"

RnJvbSA4YmVmZDU1NzdhOGM0YjA4ZmI5ZDFjYjJlYzBhZTcxNWNmOWQ3MGYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwOTo1NDo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHljcnlwdG9kb21lOiB1cGdyYWRlIDMuMTUuMCAtPiAzLjE2LjAKCi0tLQogLi4ubjMt
cHljcnlwdG9kb21lXzMuMTUuMC5iYiA9PiBweXRob24zLXB5Y3J5cHRvZG9tZV8zLjE2LjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weWNyeXB0b2RvbWVf
My4xNS4wLmJiID0+IHB5dGhvbjMtcHljcnlwdG9kb21lXzMuMTYuMC5iYn0gKDM4JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21l
XzMuMTUuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0
b2RvbWVfMy4xNi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggMzglCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWNyeXB0b2RvbWVfMy4xNS4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzMu
MTYuMC5iYgppbmRleCBjYWJlOTE4OWYyLi4xNWVlMzFjNjZhIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzMuMTUuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHljcnlwdG9kb21lXzMuMTYu
MC5iYgpAQCAtMSw1ICsxLDUgQEAKIHJlcXVpcmUgcHl0aG9uLXB5Y3J5cHRvZG9tZS5pbmMKIGlu
aGVyaXQgc2V0dXB0b29sczMKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkxMzVkZGRhZDUwNDU5
MmJjYzE4YjBkMmQ5NWNlODZjM2E1ZWE4N2VjNjQ0N2VmMjVjZmVkZWExMmQ2MDE4YjgiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMGU0NWQyZDg1MmE2NmVjZmI5MDRmMDkwYzNmODdkYzBkZmI4OWE0
OTk1NzBhYmFkODU5MGYxMGQ5Y2ZmYjM1MCIKIAotLSAKMi4zMS4xCgo=

--===============3755316269766358189==--

