Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B773C7EE30
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.12299.1678895726166954456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mOffr5dm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010186e5fbbae8-df25ce8d-3872-46cb-a37c-c01e4a5ad1bf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5v/kTu3vX+W8BZbTvNkpvuNdmm7VJ0fxdZOBCTXdSMc=;
	b=mOffr5dmD//u8VcsCepdgdC9+meSP9TYog3Z9gUvmd/5rajz+Fk3bkhbBvQxWtfa
	0+cd7Nd2PQrRDkzzPH5lY1WLHyIT7Gx6NRwOQDnzR5t7FyYPnP9PjKQV70/IduMhoXb
	jn/5pApDusGJnw+uU8Vavjv4RtY1M1iljtgOc/PM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5v/kTu3vX+W8BZbTvNkpvuNdmm7VJ0fxdZOBCTXdSMc=;
	b=jM0uvSxdOYhlG61U2inx43krdt8YrmfFszkMp1dpHFeTOpIztg1qpYNPSeUrt2f/
	PCo4JCfGnzYYzSFRUqCFy+VGucQ4/gZTmuX8juByRNBmQbsTHGouNJgUVqxOoubAlzH
	uUeYscEaDGeMMxvmYL1A3SJsCev40ucBsH7Td8O8=
Content-Type: multipart/mixed; boundary="===============2816796457087714721=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 7.2.2 SUCCEEDED
Message-ID: <01010186e5fbbae8-df25ce8d-3872-46cb-a37c-c01e4a5ad1bf-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178601

--===============2816796457087714721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest* to *7.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-upgrade-7.2.1-7.2.2.patch
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
--===============2816796457087714721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.11/site-packages/pytest-7.2.1.dist-info moved to /usr/lib/python3.11/site-packages/pytest-7.2.2.dist-info

--===============2816796457087714721==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-upgrade-7.2.1-7.2.2.patch"

RnJvbSBkZWVmZDJiMWI1ZjAyMjVjYjAxZTE2ZjJiNTE1M2VmYWUyMzkxMWJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMDg6MDY6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5dGVzdDogdXBncmFkZSA3LjIuMSAtPiA3LjIuMgoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXB5dGVzdF83LjIuMS5iYiA9PiBweXRob24zLXB5dGVzdF83LjIuMi5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5dGVzdF83LjIuMS5iYiA9PiBw
eXRob24zLXB5dGVzdF83LjIuMi5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0XzcuMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF83LjIuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDky
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0
XzcuMi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHl0ZXN0XzcuMi4yLmJiCmluZGV4IGM3NjEwZDQ0MGMuLjRlMmM4NmY2NDEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3RfNy4yLjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF83LjIuMi5iYgpA
QCAtNSw3ICs1LDcgQEAgREVTQ1JJUFRJT04gPSAiVGhlIHB5dGVzdCBmcmFtZXdvcmsgbWFrZXMg
aXQgZWFzeSB0byB3cml0ZSBzbWFsbCB0ZXN0cywgeWV0IHNjYWwKIExJQ0VOU0UgPSAiTUlUIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YmQyN2U0MWI2NTUwZmUwZmM0
NTM1NmQxZDgxZWUzN2MiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkNDVlMDk1MmYzNzI3MjQx
OTE4YjhmZDBmMzc2ZjVmZjZiMzAxY2MwNzc3YzZmOWE1NTY5MzVjOTJkOGE3ZDQyIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImM5OWFiMGM3M2FjZWIwNTBmNjg5MjliYzkzYWYxOWFiNmRiMDU1ODc5
MWM2YTA3MTU3MjNhYmU5ZDBhZGU5ZDQiCiAKIERFUEVORFMgKz0gInB5dGhvbjMtc2V0dXB0b29s
cy1zY20tbmF0aXZlIgogCi0tIAoyLjM5LjIKCg==

--===============2816796457087714721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pytest: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest/pytest-7.2.1.tar.gz;downloadfilename=pytest-7.2.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest/pytest-7.2.2.tar.gz;downloadfilename=pytest-7.2.2.tar.gz"
packages/core2-32-poky-linux/python3-pytest: PV changed from "7.2.1" to "7.2.2"
packages/core2-32-poky-linux/python3-pytest: PKGV changed from 7.2.1 [default] to 7.2.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PV changed from "7.2.1" to "7.2.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PKGV changed from 7.2.1 [default] to 7.2.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PV changed from "7.2.1" to "7.2.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PKGV changed from 7.2.1 [default] to 7.2.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PV changed from "7.2.1" to "7.2.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PKGV changed from 7.2.1 [default] to 7.2.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PV changed from "7.2.1" to "7.2.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PKGV changed from 7.2.1 [default] to 7.2.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PV changed from "7.2.1" to "7.2.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PKGV changed from 7.2.1 [default] to 7.2.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PV changed from "7.2.1" to "7.2.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PKGV changed from 7.2.1 [default] to 7.2.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PV changed from "7.2.1" to "7.2.2"
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGV changed from 7.2.1 [default] to 7.2.2 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 2612891 to 2613851 (+0%)
Changes to packages/core2-32-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.11/site-packages/pytest-7.2.1.dist-info moved to /usr/lib/python3.11/site-packages/pytest-7.2.2.dist-info

--===============2816796457087714721==--

