Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35E0C64EB6
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web08.877.1667349633706037208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=a44KFaye;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018435c85797-4f43d9c6-dec7-4b0f-92ca-2f6c72b83419-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rZ0f4jGKycYU6ZbEZK9onlxrz81osjIlCbvApHeOz3c=;
	b=a44KFayejxECrv/6a1q28mwgKbKXrVkgGH9PYT7UZLcSDmRAVkPT7RfmIZa4Z7Qo
	/wiXtOpKg4n+b1NtnePQWAPmU2WgfK/TBP/hWiRXFtZxpbw5fUzwFhHUBpexRUbZhPn
	kokUxuansp5YlUiurgMof6EDFCtdhxZH91GY4C3g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rZ0f4jGKycYU6ZbEZK9onlxrz81osjIlCbvApHeOz3c=;
	b=EWEnUmdkwh1sHg17GF1CczKYlnZL9XAPZw+LYpt7kkM1CFRtaO7HiymxPKECDUGu
	K9M+tNd59wdj2vAiY0wCs2et6QmHO0zDMZsRhxcrR7LDG5LfSwRJxqBsjXXUxZ3WHr3
	Nwphuv10/DqSSVKgDpMWMCf479CJWLF5u4jWokzg=
Content-Type: multipart/mixed; boundary="===============3530365276211685124=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.56.4 SUCCEEDED
Message-ID: <0101018435c85797-4f43d9c6-dec7-4b0f-92ca-2f6c72b83419-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172436

--===============3530365276211685124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.56.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.56.1-6.56.4.patch
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
--===============3530365276211685124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.56.1" to "6.56.4"
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.56.1.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.56.4.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.56.1 [default] to 6.56.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.56.1" to "6.56.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.56.1 [default] to 6.56.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.56.1" to "6.56.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.56.1 [default] to 6.56.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.56.1" to "6.56.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.56.1 [default] to 6.56.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.56.1" to "6.56.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.56.1 [default] to 6.56.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.56.1" to "6.56.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.56.1 [default] to 6.56.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.56.1" to "6.56.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.56.1 [default] to 6.56.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.56.1" to "6.56.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.56.1 [default] to 6.56.4 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2723470 to 2723339 (-0%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.56.1" to "6.56.4"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.56.1 [default] to 6.56.4 [default]
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.56.1.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.56.4.dist-info

--===============3530365276211685124==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.56.1-6.56.4.patch"

RnJvbSA4NzlmZmI1MGFjNWFjY2RkYTg4YjkxZGM2MmNkMTQ4YWRkYjc2ZDg5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMDowMjoxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjU2LjEgLT4gNi41Ni40CgotLS0KIC4uLnl0aG9u
My1oeXBvdGhlc2lzXzYuNTYuMS5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi41Ni40LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182LjU2
LjEuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuNTYuNC5iYn0gKDkxJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjU2LjEu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjU2
LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi41Ni4xLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjU2LjQuYmIKaW5kZXgg
YzE2ZGFhYmVlZi4uMDQwZWNhZmYzZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi41Ni4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNTYuNC5iYgpAQCAtMTMsNyArMTMs
NyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0X3JsZS5weSBcCiAgICAgIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiY2VmZGFmNjE0MzE3MGYxYWEyOGFkZjQ4MTZkMTI1NDdhYjYw
ZjkzYzE0M2Y3ZDUyMDU1MDdkOWU0ODA0ZmNjZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzMTNi
YzFjMGYzNzdlYzZjOTg4MTVkMzIzN2E2OWFkZDc1NThlYWRlZTRlZmZlNGVkNjEzZDBiYTM2NTEz
YTUyIgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBweXRob24zLWF0dHJzIFwKLS0gCjIu
MzEuMQoK

--===============3530365276211685124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.56.1.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.56.4.dist-info

--===============3530365276211685124==--

