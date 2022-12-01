Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D655C64EBC
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:34 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.46821.1669908626627548229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MWyuGLvS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010184ce4f7947-4a6baa8d-6d0a-4fb8-b07c-d61080c4e959-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XRS0z0rDfn9LwyPrQ2DcqkdD7wLo5e7bS8rPcHAAQGA=;
	b=MWyuGLvSxBVWxIkN+yn01UthfyPBSxkv5zqyzxTlqdnjuvpXc6bCMqhaX/Sc2EoM
	lRg+QgrfPE1Z5bAVmpYe2ZJ3YrAou4XY7MnJqITuPDzKonEtEvMX+w2aAbl0LamJmF8
	W5jvk43iuRo1WkkH55GxNfZtvEC4gUDM9gDxpLz4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XRS0z0rDfn9LwyPrQ2DcqkdD7wLo5e7bS8rPcHAAQGA=;
	b=BqJHZFZ+g9bQk8JnOCBnDIHOrMUFgYabS23E3OoWtZfQha2yrQHig3Dz719YVUgj
	oW3VEpwtMiUBdQ2oDF8OCz0wPFjRHWRJ6ik0Wn9zG8DMssqLw0EUjoNXHtUzLcXd8om
	Z+BwDrJLRcRkf/LKw3ZPjAAf0y1lqT+7K6igWV+A=
Content-Type: multipart/mixed; boundary="===============5662446911003232515=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors: upgrading to 38.0.4 SUCCEEDED
Message-ID: <01010184ce4f7947-4a6baa8d-6d0a-4fb8-b07c-d61080c4e959-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174138

--===============5662446911003232515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography-vectors* to *38.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-vectors-upgrade-38.0.3-38.0.4.patch
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
--===============5662446911003232515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors: PKGV changed from 38.0.3 [default] to 38.0.4 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-38.0.3.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-38.0.4.tar.gz"
packages/core2-32-poky-linux/python3-cryptography-vectors: PV changed from "38.0.3" to "38.0.4"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 38.0.3 [default] to 38.0.4 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "38.0.3" to "38.0.4"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 38.0.3 [default] to 38.0.4 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "38.0.3" to "38.0.4"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 38.0.3 [default] to 38.0.4 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "38.0.3" to "38.0.4"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 38.0.3 [default] to 38.0.4 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "38.0.3" to "38.0.4"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 38.0.3 [default] to 38.0.4 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "38.0.3" to "38.0.4"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 38.0.3 [default] to 38.0.4 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "38.0.3" to "38.0.4"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 38.0.3 [default] to 38.0.4 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "38.0.3" to "38.0.4"
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.11/site-packages/cryptography_vectors-38.0.3.dist-info moved to /usr/lib/python3.11/site-packages/cryptography_vectors-38.0.4.dist-info

--===============5662446911003232515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.11/site-packages/cryptography_vectors-38.0.3.dist-info moved to /usr/lib/python3.11/site-packages/cryptography_vectors-38.0.4.dist-info

--===============5662446911003232515==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-upgrade-38.0.3-38.0.4.patch"

RnJvbSBlOWE1NDA4NzkwNTZiN2Q4YzUwM2MxMTY5OTU4ZDQwYzc1ZDc2YzZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwOToxMDo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnM6IHVwZ3JhZGUgMzguMC4zIC0+IDM4LjAuNAoKLS0t
CiAuLi52ZWN0b3JzXzM4LjAuMy5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM4
LjAuNC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNyeXB0
b2dyYXBoeS12ZWN0b3JzXzM4LjAuMy5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3Jz
XzM4LjAuNC5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfMzguMC4zLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM4LjAuNC5iYgpz
aW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfMzguMC4zLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfMzgu
MC40LmJiCmluZGV4IDllNGM0MGUwYzQuLmEzNmNiZWIwOWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc18zOC4wLjMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS12ZWN0b3JzXzM4LjAuNC5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9OGMzNjE3ZGI0ZmI2ZmFlMDFmMWQyNTNhYjkxNTExZTQgXAogIyBO
T1RFOiBNYWtlIHN1cmUgdG8ga2VlcCB0aGlzIHJlY2lwZSBhdCB0aGUgc2FtZSB2ZXJzaW9uIGFz
IHB5dGhvbjMtY3J5cHRvZ3JhcGh5CiAjICAgICAgIFVwZ3JhZGUgYm90aCByZWNpcGVzIGF0IHRo
ZSBzYW1lIHRpbWUKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFjZGFmZDQyZjUzNDhkNzdlNGU3
ZTQ3OTFhZWZkMWY2MmIxNmJkNTUyYTAyNzRhZmM5MzQ2NTMzZmUzMmU5MjUiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNmVjNjI2OTViZWM1ZGY4MTAyODhkZGNlYWU5OThhZTY5MWNkYjhhMTYyODA4
ZDZjYmM5NjBkM2RlYjlhN2RiMSIKIAogUFlQSV9QQUNLQUdFID0gImNyeXB0b2dyYXBoeV92ZWN0
b3JzIgogCi0tIAoyLjMxLjEKCg==

--===============5662446911003232515==--

