Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD33C74A4B
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:32 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.145822.1673805742529754417
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=S8vpCtWO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010185b698c4a8-168b4bd8-1482-479f-b116-9d9a648e8d51-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yMjeUEpw1zqST6hIc+dGyYaFbIUpKzyWhNYbfu/VbVM=;
	b=S8vpCtWOPvAQ6/9YbEWHFBhqf3K8z5W5gHmzVvrsDF2plv8CwrhmzRLW9wzpA1yf
	jhAxBPjw4eC8tguXiWYxzeORELcYFFaCyLqGdIygHEC+/VULXprZKoHphFV71qtIcjS
	X1eQGBJk8l6nhceLpbyTHZ1nsDE5tdwniAQSue48=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805743;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yMjeUEpw1zqST6hIc+dGyYaFbIUpKzyWhNYbfu/VbVM=;
	b=CMUtmtV3s3Z/oLUBx3W7UkqBTR7x20slMV/Xu07u31ifthKlpIssAsLJy1Ck4yzI
	hRgGmR2daKetPbbu+ko0JaAn4F0+fNLVYRVU21THl6IcUOGLDYFG6uFQLnxyBrG95OD
	s1pwD4N/QhN+JtXjPcXlancGvTSgNl/bmS+g8Ja4=
Content-Type: multipart/mixed; boundary="===============4900939252593866831=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pbr: upgrading to 5.11.1 SUCCEEDED
Message-ID: <01010185b698c4a8-168b4bd8-1482-479f-b116-9d9a648e8d51-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175906

--===============4900939252593866831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pbr* to *5.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pbr-upgrade-5.11.0-5.11.1.patch
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
--===============4900939252593866831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pbr: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pbr/pbr-5.11.0.tar.gz file://0001-change-shebang-to-python3.patch" to "https://files.pythonhosted.org/packages/source/p/pbr/pbr-5.11.1.tar.gz file://0001-change-shebang-to-python3.patch"
packages/core2-32-poky-linux/python3-pbr: PKGV changed from 5.11.0 [default] to 5.11.1 [default]
packages/core2-32-poky-linux/python3-pbr: PV changed from "5.11.0" to "5.11.1"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dbg: PKGV changed from 5.11.0 [default] to 5.11.1 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dbg: PV changed from "5.11.0" to "5.11.1"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dev: PKGV changed from 5.11.0 [default] to 5.11.1 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dev: PV changed from "5.11.0" to "5.11.1"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-doc: PKGV changed from 5.11.0 [default] to 5.11.1 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-doc: PV changed from "5.11.0" to "5.11.1"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-locale: PKGV changed from 5.11.0 [default] to 5.11.1 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-locale: PV changed from "5.11.0" to "5.11.1"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-src: PKGV changed from 5.11.0 [default] to 5.11.1 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-src: PV changed from "5.11.0" to "5.11.1"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-staticdev: PKGV changed from 5.11.0 [default] to 5.11.1 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-staticdev: PV changed from "5.11.0" to "5.11.1"
packages/core2-32-poky-linux/python3-pbr/python3-pbr: PKGV changed from 5.11.0 [default] to 5.11.1 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr: PV changed from "5.11.0" to "5.11.1"
packages/core2-32-poky-linux/python3-pbr/python3-pbr: PKGSIZE changed from 697700 to 698124 (+0%)
Changes to packages/core2-32-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.11/site-packages/pbr-5.11.0.dist-info moved to /usr/lib/python3.11/site-packages/pbr-5.11.1.dist-info

--===============4900939252593866831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.11/site-packages/pbr-5.11.0.dist-info moved to /usr/lib/python3.11/site-packages/pbr-5.11.1.dist-info

--===============4900939252593866831==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pbr-upgrade-5.11.0-5.11.1.patch"

RnJvbSBiYjg0ZTI5NWI0NzViMmNlNzEyM2YxOWRhOGU1MzY2YjY3MjkyMjRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTI6MTA6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBicjogdXBncmFkZSA1LjExLjAgLT4gNS4xMS4xCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcGJyXzUuMTEuMC5iYiA9PiBweXRob24zLXBicl81LjExLjEuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGJyXzUuMTEuMC5iYiA9PiBweXRo
b24zLXBicl81LjExLjEuYmJ9ICgzMyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBicl81LjExLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGJyXzUuMTEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDMzJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGJyXzUuMTEuMC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBicl81LjExLjEu
YmIKaW5kZXggMTY5NjdmNmQxNy4uNTIwZGJlZjhkZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBicl81LjExLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBicl81LjExLjEuYmIKQEAgLTEsNCArMSw0IEBACiBp
bmhlcml0IHNldHVwdG9vbHMzCiByZXF1aXJlIHB5dGhvbi1wYnIuaW5jCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJiOTdiYzY2OTViMmFmZjAyMTQ0MTMzYzJlNzM5OWQ1ODg1MjIzZDQyYjc5MTJm
ZmFlYzJjYTM4OThlNjczYmZlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImFlZmM1MTY3NWIwYjUz
M2Q1NmJiNWZkMWM4YzZjMDUyMmZlMzE4OTY2Nzk4ODJlMWM0YzYzZDVlNGEwZmNjYjMiCi0tIAoy
LjM3LjMKCg==

--===============4900939252593866831==--

