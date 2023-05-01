Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A08C88C97
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.107431.1682976350762402033
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=f/sX328+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010187d9351f43-395e506a-d82a-4b9e-bc55-8a9a172db661-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Kr0IcqbRsE1rmX9tkuuOBFuBXzCug+WhMK0oBwXFIWQ=;
	b=f/sX328+8vicQ5/brfXvqKwIeqmyyATm+dLVqMivZL7xk6oN1WrKnBkUg8vxqc4v
	47Z1b3kESebMGz4iGVZrqOmVjDBtIU7sdgrwSgdLLL1DKmVZdj5hlZIbiAN6Su7ZCRa
	hw+L/LdtKzrf6qLg1rETkfpT1L6M6MNWkQNowAdU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Kr0IcqbRsE1rmX9tkuuOBFuBXzCug+WhMK0oBwXFIWQ=;
	b=QIDxaMHGU40BtdXxsAqQJuOgbdDpf2Nu/HNmgJ6YfQUMUHkZJS5QGcw2/aECFtSR
	phDtphpGwMqE+NsCWTah+itKf9w4oKGOVh7WaoSm3z+zOy6rvQUo4fr3nXMxHNLn8nm
	Kplv/Bj1tLcfubXgEkd9T9rSkSGNCmOoKBLoJccU=
Content-Type: multipart/mixed; boundary="===============6949141481889435741=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.75.1 SUCCEEDED
Message-ID: <01010187d9351f43-395e506a-d82a-4b9e-bc55-8a9a172db661-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180626

--===============6949141481889435741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.75.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.71.0-6.75.1.patch
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
--===============6949141481889435741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.71.0" to "6.75.1"
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.71.0.tar.gz;downloadfilename=hypothesis-6.71.0.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.75.1.tar.gz;downloadfilename=hypothesis-6.75.1.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.71.0 [default] to 6.75.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.71.0" to "6.75.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.71.0 [default] to 6.75.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.71.0" to "6.75.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.71.0 [default] to 6.75.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.71.0" to "6.75.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.71.0 [default] to 6.75.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.71.0" to "6.75.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.71.0 [default] to 6.75.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.71.0" to "6.75.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.71.0 [default] to 6.75.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.71.0" to "6.75.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.71.0 [default] to 6.75.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.71.0" to "6.75.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.71.0 [default] to 6.75.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.71.0" to "6.75.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hypothesis-6.71.0.dist-info -> /usr/lib/python3.11/site-packages/hypothesis-6.75.1.dist-info, added "/usr/lib/python3.11/site-packages/hypothesis/extra/__pycache__/_patching.cpython-311.pyc /usr/lib/python3.11/site-packages/hypothesis/extra/_patching.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.71.0 [default] to 6.75.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2806255 to 2855198 (+2%)
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.71.0.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.75.1.dist-info
  /usr/lib/python3.11/site-packages/hypothesis/extra/_patching.py was added
  /usr/lib/python3.11/site-packages/hypothesis/extra/__pycache__/_patching.cpython-311.pyc was added

--===============6949141481889435741==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.71.0-6.75.1.patch"

RnJvbSA4YWI3ZjZhODM5M2Y4MGM2NWU5YTFkMzk5MDUwMTQyN2U3NzE5YjZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxMDoyOToyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjcxLjAgLT4gNi43NS4xCgotLS0KIC4uLnl0aG9u
My1oeXBvdGhlc2lzXzYuNzEuMC5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi43NS4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182Ljcx
LjAuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuNzUuMS5iYn0gKDkxJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjcxLjAu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182Ljc1
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi43MS4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182Ljc1LjEuYmIKaW5kZXgg
OGVjODg1ZmFiZi4uMzViNTQzOTQ2YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi43MS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNzUuMS5iYgpAQCAtMTMsNyArMTMs
NyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0X3JsZS5weSBcCiAgICAgIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYjJjM2JiZWFkNzIxODljMGJiYTZlMTI4NDhiNDg0Y2VhZmFk
YjZlODcyYWMzMWU0MDAxMzIyODIzOTM2NjIyMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3OTQw
YWU5NzVhYjQ4Zjg2ZDM2Y2VkZmQwZWVjY2I4ZTM3ZTk5NzQ2Nzg1ZjdkNmJiMTdiNGE4ZWM0ZWMw
N2E4IgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBweXRob24zLWF0dHJzIFwKLS0gCjIu
MzkuMgoK

--===============6949141481889435741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hypothesis-6.71.0.dist-info -> /usr/lib/python3.11/site-packages/hypothesis-6.75.1.dist-info, added "/usr/lib/python3.11/site-packages/hypothesis/extra/_patching.py /usr/lib/python3.11/site-packages/hypothesis/extra/__pycache__/_patching.cpython-311.pyc"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.71.0.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.75.1.dist-info
  /usr/lib/python3.11/site-packages/hypothesis/extra/_patching.py was added
  /usr/lib/python3.11/site-packages/hypothesis/extra/__pycache__/_patching.cpython-311.pyc was added

--===============6949141481889435741==--

