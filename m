Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9CAC63706
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:45 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.5247.1668517536203303545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YLiqRq/a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101847b651e68-cd4cd0f1-bfd6-4d5b-9388-bfdfbf2246dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=T9kLguYV0j9WOIT5+BPgwvWlWgYVTfaba3wOtfsIOVA=;
	b=YLiqRq/ah+Yrl4SEG8dYfTGsderiMM+9BBeCQDvWRF00LlmCkIf+jYXhEs3tn+Nf
	QEp3Y1m3v5/am8nRyeOQJt89FiGOUcCgtSqHqHOkKSc4wOMbd1Q5s0vXyTh5Qz+35AK
	BhgZlscAUAysTTXbcjMrmVLQw8or8NkZZo2MVdA4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=T9kLguYV0j9WOIT5+BPgwvWlWgYVTfaba3wOtfsIOVA=;
	b=B2LOObimYD6VPCNUDcnAT0UTiPoGgYb9WmnIYbh2KdOsMllgzVHknWaw6ZMoGulr
	VrCrUv3pqYlLRpTpqpB8SU1Bxkcd2UBAHhLwKIbdnfTve/5DQWITUSBu01CcfP6Qk/0
	nNrWwj+T+FGEdRnpUuQbt7po48fVeQDE1p1E1800=
Content-Type: multipart/mixed; boundary="===============2077606834018950631=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.57.1 SUCCEEDED
Message-ID: <010101847b651e68-cd4cd0f1-bfd6-4d5b-9388-bfdfbf2246dd-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173297

--===============2077606834018950631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.57.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.56.4-6.57.1.patch
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
--===============2077606834018950631==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.56.4-6.57.1.patch"

RnJvbSAwNzIwMzNkZWNkYTMwNjg0M2I5NDMxMGI4NTRlODI3Y2Q1YTVmMTExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMDc6NTk6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi41Ni40IC0+IDYuNTcuMQoKLS0tCiAuLi55dGhv
bjMtaHlwb3RoZXNpc182LjU2LjQuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuNTcuMS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWh5cG90aGVzaXNfNi41
Ni40LmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjU3LjEuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi41Ni40
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi41
Ny4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNTYuNC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi41Ny4xLmJiCmluZGV4
IDA0MGVjYWZmM2UuLjA2NGQ3MDE0ZDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNTYuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjU3LjEuYmIKQEAgLTEzLDcgKzEz
LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBmaWxlOi8vdGVzdF9ybGUucHkgXAogICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjMxM2JjMWMwZjM3N2VjNmM5ODgxNWQzMjM3YTY5YWRkNzU1
OGVhZGVlNGVmZmU0ZWQ2MTNkMGJhMzY1MTNhNTIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWQ4
ZWQ1MTM2ZjM2OGUzNDNmMzkxNzJiMDZmNjhhYTdmZDEzMTJjZjY0M2MzMzJhYjE4YTc1ZDU2Nzg5
ZmE5MCIKIAogUkRFUEVORFM6JHtQTn0gKz0gIiBcCiAgICAgcHl0aG9uMy1hdHRycyBcCi0tIAoy
LjMxLjEKCg==

--===============2077606834018950631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.56.4.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.57.1.dist-info

--===============2077606834018950631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.56.4 [default] to 6.57.1 [default]
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.56.4" to "6.57.1"
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.56.4.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.57.1.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.56.4 [default] to 6.57.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.56.4" to "6.57.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.56.4 [default] to 6.57.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.56.4" to "6.57.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.56.4 [default] to 6.57.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.56.4" to "6.57.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.56.4 [default] to 6.57.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.56.4" to "6.57.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.56.4 [default] to 6.57.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.56.4" to "6.57.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.56.4 [default] to 6.57.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.56.4" to "6.57.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.56.4 [default] to 6.57.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.56.4" to "6.57.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.56.4 [default] to 6.57.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.56.4" to "6.57.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2723339 to 2726432 (+0%)
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.56.4.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.57.1.dist-info

--===============2077606834018950631==--

