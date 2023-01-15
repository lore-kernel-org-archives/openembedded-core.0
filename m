Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB18C74A44
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:32 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.145716.1673805743723005594
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ift8aoPh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010185b698c2ce-867e6caa-88bc-4b74-9045-910212daedd3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=O7DS6WXHPRxx8GikLngVUkEuCtR9RNsbWZ5nAwh956A=;
	b=ift8aoPhnuREUqtM7Zi2npgS6bU3QDUH489K27A+3q0MJs2w7mH7OWgfEEmUAceX
	Xsa+1d1QQDF8KyXrDBwqmT9cPqbv/Fo7udVv0yUmk7zkwe7j+90uS9Tf8Ov82Wpb0r9
	TSpKH3gLtM8uRP2DemrMBQfNnaAqSwOhhmE5oMz4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=O7DS6WXHPRxx8GikLngVUkEuCtR9RNsbWZ5nAwh956A=;
	b=g2RmMHxYggxY6mSBB8f36D5ERW1wdIbJL4KX/hF1ckdtYdXtN9uqADq72aEfSHfa
	3/8bNZZcd90A2MeAXybiuiKbWwgZcJOGBoUWq+VMrdmCjNPeNIguIw99zuGm5cOF0l1
	4CFlpXvB2leQrJnn5nz8Zr5+oMtLYRKDpOZyKc3c=
Content-Type: multipart/mixed; boundary="===============0232859667431497765=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.12.2 SUCCEEDED
Message-ID: <01010185b698c2ce-867e6caa-88bc-4b74-9045-910212daedd3-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175903

--===============0232859667431497765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.12.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.12.1-1.12.2.patch
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
--===============0232859667431497765==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.12.1-1.12.2.patch"

RnJvbSA0ODIwYTQ0ZjRhZmE0NThmYTlkMzdlYTM4N2M4ZThhMjk1MTY5Zjk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTE6NDk6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjEyLjEgLT4gMS4xMi4yCgotLS0KIC4uLntweXRo
b24zLWhhdGNobGluZ18xLjEyLjEuYmIgPT4gcHl0aG9uMy1oYXRjaGxpbmdfMS4xMi4yLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTIu
MS5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjEyLjIuYmJ9ICg4NCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjEyLjEuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTIuMi5i
YgpzaW1pbGFyaXR5IGluZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTIuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjEyLjIuYmIKaW5kZXggZmE1NmQ3
YTQyYS4uN2Y1YTI5ODc5YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWhhdGNobGluZ18xLjEyLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjEyLjIuYmIKQEAgLTgsNyArOCw3IEBAIGluaGVy
aXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiBERVBFTkRTICs9ICJweXRob24zLXBsdWdneS1uYXRp
dmUgcHl0aG9uMy1wYXRoc3BlYy1uYXRpdmUgcHl0aG9uMy1wYWNrYWdpbmctbmF0aXZlIHB5dGhv
bjMtZWRpdGFibGVzLW5hdGl2ZSIKIERFUEVORFM6cmVtb3ZlOmNsYXNzLW5hdGl2ZSA9ICJweXRo
b24zLWhhdGNobGluZy1uYXRpdmUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1YjM2YzkwM2Q0
ZDc2NzkwYjFjMWYyYjdjOGY1NDQ2ZmI3MzNmYWI2Y2UzOWIyMDM0MDFkMjMzN2Q0NDFiNDExIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjhhNmQ3MTlkOTY2NTNhMGYzOTAxMDcyYjEyNzEwYzljM2Nj
OTM0ZjkwNjFiNDQzNzc1YzY3ODliNDUzMzM0OTUiCiAKIGRvX2NvbXBpbGU6cHJlcGVuZCgpIHsK
ICAgICBleHBvcnQgUFlUSE9OUEFUSD1zcmMKLS0gCjIuMzcuMwoK

--===============0232859667431497765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.12.1.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.12.2.tar.gz"
packages/core2-32-poky-linux/python3-hatchling: PV changed from "1.12.1" to "1.12.2"
packages/core2-32-poky-linux/python3-hatchling: PKGV changed from 1.12.1 [default] to 1.12.2 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.12.1" to "1.12.2"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.12.1 [default] to 1.12.2 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.12.1" to "1.12.2"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.12.1 [default] to 1.12.2 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.12.1" to "1.12.2"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.12.1 [default] to 1.12.2 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.12.1" to "1.12.2"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.12.1 [default] to 1.12.2 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.12.1" to "1.12.2"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.12.1 [default] to 1.12.2 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.12.1" to "1.12.2"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.12.1 [default] to 1.12.2 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.12.1" to "1.12.2"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.12.1 [default] to 1.12.2 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 729772 to 732189 (+0%)
Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.12.1.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.12.2.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.12.1.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.12.2.dist-info

--===============0232859667431497765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.12.1.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.12.2.dist-info
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.11/site-packages/hatchling-1.12.1.dist-info moved to /usr/lib/python3.11/site-packages/hatchling-1.12.2.dist-info

--===============0232859667431497765==--

