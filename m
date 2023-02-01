Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2D1C7EE33
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.30005.1675272855187785531
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RMkaE4x+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101860e0b1b31-fec41248-be62-4ac0-be55-320a85d59c61-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QPk5Nu4hzDfQJwiXKzehgNhc+KSpUiXJgwjpwYt8rPg=;
	b=RMkaE4x+mMSobkyjy3vt/dWEpuU/2/jdYMOYBUudXFjAf80MFYEq4zMTol7v9p1m
	ThrkKxG+5iXqipizhDRFXiXlu8dM7P1Ub5pQkGfLjondb9hY3ki2ygObicO8dTaUUEX
	cAlPFAm8WIOjClNXPLcdHy/GQ/2kLhwU5gZy736s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QPk5Nu4hzDfQJwiXKzehgNhc+KSpUiXJgwjpwYt8rPg=;
	b=FwiyqLSeze7iM3LYuCH1CCVqPVcoRODsnJuUGen+tTr2qOkxFT6sD6sT1ReGuAG8
	c2iqtI38nWJH/tVq77VMcEsqTZPMdpp+cG58FGiCmJanbnUepw4Smh2OoNaHaQWT7bh
	fye0lKrVjKPrYUvVSDtLhRIU4Z94Ldbu2VdpsFK8=
Content-Type: multipart/mixed; boundary="===============7169087169133936831=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.65.2 SUCCEEDED
Message-ID: <010101860e0b1b31-fec41248-be62-4ac0-be55-320a85d59c61-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176586

--===============7169087169133936831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.65.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.62.0-6.65.2.patch
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
--===============7169087169133936831==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.62.0-6.65.2.patch"

RnJvbSAzNmJmNWRiMzI2YTE4NTljNmNmYzU3OWEzNjU3Y2M0ZTU4YWE0NTJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMToyMzowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjYyLjAgLT4gNi42NS4yCgotLS0KIC4uLnl0aG9u
My1oeXBvdGhlc2lzXzYuNjIuMC5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi42NS4yLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182LjYy
LjAuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuNjUuMi5iYn0gKDkxJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjYyLjAu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjY1
LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi42Mi4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjY1LjIuYmIKaW5kZXgg
NDM2OWE2OTdiZC4uZjQwOWU5YjY0NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi42Mi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNjUuMi5iYgpAQCAtMTMsNyArMTMs
NyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0X3JsZS5weSBcCiAgICAgIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNzZmMTE0MWU4MjM3ZjZkZDA3ODBhMTcxYmVjNWQ2YWVjODcz
MjA4Y2NjMjdiNWY5NzUzZDRjY2NkODkwNDI3MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4MjEy
NzlmMDVmYWQzODU3NTI3MWJlM2ZkZmZmMWUyMjIzMjYxM2YzZDIxYjNmYzk5MWQ3MzUwNTdmOWI1
YjQ3IgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBweXRob24zLWF0dHJzIFwKLS0gCjIu
MzcuMwoK

--===============7169087169133936831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.62.0" to "6.65.2"
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.62.0.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.65.2.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.62.0 [default] to 6.65.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.62.0" to "6.65.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.62.0 [default] to 6.65.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.62.0" to "6.65.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.62.0 [default] to 6.65.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.62.0" to "6.65.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.62.0 [default] to 6.65.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.62.0" to "6.65.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.62.0 [default] to 6.65.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.62.0" to "6.65.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.62.0 [default] to 6.65.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.62.0" to "6.65.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.62.0 [default] to 6.65.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.62.0" to "6.65.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.62.0 [default] to 6.65.2 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.62.0" to "6.65.2"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2743645 to 2775308 (+1%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.62.0 [default] to 6.65.2 [default]
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.62.0.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.65.2.dist-info

--===============7169087169133936831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.62.0.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.65.2.dist-info

--===============7169087169133936831==--

