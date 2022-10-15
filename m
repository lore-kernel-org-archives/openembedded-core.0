Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD5BC64E95
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.24535.1665871393716352491
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UU5VAysW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010183ddac33cf-0f7d8a48-fbcb-4547-8c4a-d221de6fe028-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Tdg/PEQ7DLUqphFQi7N/GPUmNdyu4CCCPdNP6qLUpE4=;
	b=UU5VAysWALKRwd8xwqWpRVoF9hQLgtrPwCwF5e7E3dhunjCVvhyNIM3zHpX5VtBh
	MNUncItfO4cxIyAmOie4LsEMhfJJ6tRM8aSYBTf3cK+S8OGeV7j5JAWLcV7kdJub3lw
	sFK8U5U3YlRDq0gdeda3ymQi/ZmAgplaDhw1ULG4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Tdg/PEQ7DLUqphFQi7N/GPUmNdyu4CCCPdNP6qLUpE4=;
	b=BpGNqLPJAlWqURL5oLczZQB9/2zMiWsltShzfDC3x7DXw0MWw+5l9sNdB7ix7nNN
	qZOuq7pVhDtmGHw9cvHhCvVLAW8YNmElg1lJIVyny5w1GfokUApgLf8tXCAU3Req7E1
	rpUpn8d6YSncholbVi1f+u45WvHaWqHirmKhriLY=
Content-Type: multipart/mixed; boundary="===============2490847786833985606=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.2.3 SUCCEEDED
Message-ID: <01010183ddac33cf-0f7d8a48-fbcb-4547-8c4a-d221de6fe028-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171784

--===============2490847786833985606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-mako* to *1.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.2.2-1.2.3.patch
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
--===============2490847786833985606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.10/site-packages/Mako-1.2.2.dist-info moved to /usr/lib/python3.10/site-packages/Mako-1.2.3.dist-info

--===============2490847786833985606==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.2.2-1.2.3.patch"

RnJvbSBiZjY4ZWUxYjIwYWJlOTlmYzliOWIyYTJkYThkZDkwYWYxZWEzMWQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTA6MjY6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1ha286IHVwZ3JhZGUgMS4yLjIgLT4gMS4yLjMKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1tYWtvXzEuMi4yLmJiID0+IHB5dGhvbjMtbWFrb18xLjIuMy5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYWtvXzEuMi4yLmJiID0+IHB5dGhv
bjMtbWFrb18xLjIuMy5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjIuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tYWtvXzEuMi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMi4yLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjIuMy5i
YgppbmRleCBlMzc3NGVlNjIxLi4xMmFjZmVlNzc3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjIuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjIuMy5iYgpAQCAtOCw3ICs4LDcgQEAgUFlQ
SV9QQUNLQUdFID0gIk1ha28iCiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWls
ZF9tZXRhCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzNzI0ODY5YjM2M2JhNjMwYTI3MmE1Zjg5
ZjY4YzA3MDM1MjEzN2I4ZmQxNzU3NjUwMDE3YjdlMDZmZGExNjNmIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjdmZGU5NjQ2NmZjZmVlZGIwZWVkOTRmMTg3ZjIwYjIzZDg1ZTRjYjQxNDQ0YmUwZTU0
MmUyYzhjNjVjMzk2Y2QiCiAKIFJERVBFTkRTOiR7UE59ID0gIiR7UFlUSE9OX1BOfS1odG1sIFwK
ICAgICAgICAgICAgICAgICAgICR7UFlUSE9OX1BOfS1tYXJrdXBzYWZlIFwKLS0gCjIuMzEuMQoK

--===============2490847786833985606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.2.2.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.2.3.tar.gz"
packages/core2-32-poky-linux/python3-mako: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-src: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/python3-mako/python3-mako: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 507898 to 507908 (+0%)
Changes to packages/core2-32-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.10/site-packages/Mako-1.2.2.dist-info moved to /usr/lib/python3.10/site-packages/Mako-1.2.3.dist-info

--===============2490847786833985606==--

