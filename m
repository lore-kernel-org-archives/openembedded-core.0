Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C367EC6371D
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.46818.1669908626291012531
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bKVmt2eo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010184ce4f7bbc-12a5b196-7adb-417a-81ec-04c8990a85fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8eTyA3zOuvl6NSdGPguTvSLeHmfCOIDD2J1tBirRi2U=;
	b=bKVmt2eoVP5Y051o8rTltWve76QNJFi9ssdgtz6BxI/VWQvXT95qDFWzSpOUr88y
	1PWXu/4wNr88K4EQwFtPJGz3yoibFndPorADPfgp1m3fGtZZ0kR4lHHdWhc3OeqX4sX
	sviA1V46Taq1K8r2eV2NphCWCfbAXRcsbQ/o975w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8eTyA3zOuvl6NSdGPguTvSLeHmfCOIDD2J1tBirRi2U=;
	b=dnIEPlNMCrFTGu7QAoZS71yXSmYI7jK0s2dsQmAdmZcudxedvTKQUps3bvIrgK4D
	TFoBaQj8rwx8Je0qIpFiIjhIqBW44b2N6CjI9/ofsAZvuHGBZjPZCF/mMPOaQlJVR7x
	iW2rWa0PeEeGuzWBHY/arDDnhX13E64U0ZNBHkzw=
Content-Type: multipart/mixed; boundary="===============6838213984138513320=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-subunit: upgrading to 1.4.2 SUCCEEDED
Message-ID: <01010184ce4f7bbc-12a5b196-7adb-417a-81ec-04c8990a85fd-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174161

--===============6838213984138513320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-subunit* to *1.4.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-subunit-upgrade-1.4.1-1.4.2.patch
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
--===============6838213984138513320==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-subunit-upgrade-1.4.1-1.4.2.patch"

RnJvbSBiOTVlNWZkNTU4NzJjODljYmEyYzRiYjkwNzA4OGQyZDQ0NWEyNjBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAxMDowNjoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3VidW5pdDogdXBncmFkZSAxLjQuMSAtPiAxLjQuMgoKLS0tCiAuLi4ve3B5dGhvbjMt
c3VidW5pdF8xLjQuMS5iYiA9PiBweXRob24zLXN1YnVuaXRfMS40LjIuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXN1YnVuaXRfMS40LjEuYmIgPT4g
cHl0aG9uMy1zdWJ1bml0XzEuNC4yLmJifSAoODElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zdWJ1bml0XzEuNC4xLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXN1YnVuaXRfMS40LjIuYmIKc2ltaWxhcml0eSBpbmRl
eCA4MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXN1
YnVuaXRfMS40LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1zdWJ1bml0XzEuNC4yLmJiCmluZGV4IGM1ZmFlYWE1MTMuLmEwMThlZjFkYzggMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zdWJ1bml0XzEuNC4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zdWJ1bml0XzEu
NC4yLmJiCkBAIC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFETUUu
cnN0O2JlZ2lubGluZT0xO2VuZGxpbmU9MjA7bWQ1PTkwOWMwOGUyOTE2NDdmZAogCiBQWVBJX1BB
Q0tBR0UgPSAicHl0aG9uLXN1YnVuaXQiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1ZmU1Njg2
OTA0NDI4NTAxMzc2ZTdiMTE1OTMyMjZkMzc2MzhmYmQ5ODFjMWZjOWVkNmFhYzE4MDUyNWQ3OGMx
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI5ODhkMzI0ZDU1ZWMzNWRkMDM3ZTUwMmUzZjc0YWMz
OGY0ZTQ1N2JkNDRlZTBlZGY1ZTg5OGY3ZWUxMTM0ZDQiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRv
b2xzMwogCi0tIAoyLjMxLjEKCg==

--===============6838213984138513320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-subunit: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python-subunit/python-subunit-1.4.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python-subunit/python-subunit-1.4.2.tar.gz"
packages/core2-32-poky-linux/python3-subunit: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/python3-subunit: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-dbg: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-dbg: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-dev: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-dev: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-doc: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-doc: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-locale: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-locale: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-src: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-src: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-staticdev: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-staticdev: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/python3-subunit/python3-subunit: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit: PKGSIZE changed from 933063 to 934572 (+0%)
packages/core2-32-poky-linux/python3-subunit/python3-subunit: PV changed from "1.4.1" to "1.4.2"
Changes to packages/core2-32-poky-linux/python3-subunit (sysroot):
  /usr/lib/python3.11/site-packages/python_subunit-1.4.1.dist-info moved to /usr/lib/python3.11/site-packages/python_subunit-1.4.2.dist-info

--===============6838213984138513320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-subunit (sysroot):
  /usr/lib/python3.11/site-packages/python_subunit-1.4.1.dist-info moved to /usr/lib/python3.11/site-packages/python_subunit-1.4.2.dist-info

--===============6838213984138513320==--

