Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CDBCA9EDB
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.7623.1685693431636385776
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N+oAGKjZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101887b2881ca-07839501-129b-47c9-b1eb-11eec62edc99-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=P6YGozDCdrtmA63ba1/z/TQY04Ji7rlzefHSQRMxraU=;
	b=N+oAGKjZkEucvrS8KUQj/OpL+wf0dH+PGFcViQfGGypKcLf1gVIEs1t7Gb72FHhT
	3IPn0RVzoN4ssxQ10jghrmMqoIvPZmVtvxBrIMeu6WNn3HAGVA/VvdY+e0vFMYzWrcn
	ZDwHqwsTtofnzD34d+TBympRhTFDtMfP6iMxe95E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=P6YGozDCdrtmA63ba1/z/TQY04Ji7rlzefHSQRMxraU=;
	b=NyGQAaKmiKTaaPAXYg4F8vUSb/xxNhRqs3wQmX+HTP0dqq+oqOWDKc8jcNkT1nC3
	GwBIB0ckrgxO3lyGhEVm9/nWBe+dJouW2poG0X/Idc7EutRFR2V1ZmL4al7dVz+/4tw
	WrDtK743cvDZin1OZaedMQA5pw7KVmwETH16v+cU=
Content-Type: multipart/mixed; boundary="===============0316176702177455803=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.75.9 SUCCEEDED
Message-ID: <010101887b2881ca-07839501-129b-47c9-b1eb-11eec62edc99-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182188

--===============0316176702177455803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.75.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.71.0-6.75.9.patch
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
--===============0316176702177455803==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.71.0-6.75.9.patch"

RnJvbSA2ZjdhNDU3ZGFiMWI4NTNhYTQ5ZTY3OGYzMjIzMTQ3NDU0MTI4ZjEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNDo0NjowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjcxLjAgLT4gNi43NS45CgotLS0KIC4uLnl0aG9u
My1oeXBvdGhlc2lzXzYuNzEuMC5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi43NS45LmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182Ljcx
LjAuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuNzUuOS5iYn0gKDkxJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjcxLjAu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182Ljc1
LjkuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi43MS4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182Ljc1LjkuYmIKaW5kZXgg
MTVmNDA5MGM2ZC4uZTRlMjQ2ODQ5OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi43MS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNzUuOS5iYgpAQCAtMTMsNyArMTMs
NyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0X3JsZS5weSBcCiAgICAgIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYjJjM2JiZWFkNzIxODljMGJiYTZlMTI4NDhiNDg0Y2VhZmFk
YjZlODcyYWMzMWU0MDAxMzIyODIzOTM2NjIyMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkMDA2
Mjc5Y2JmYWVmOTkwYWM2MDI3M2ZjNTk4YTUwNTJhMTBhZTQwZWEzMGI3ODYwYWRlMGE3NjdhMmU2
ZmMyIgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBweXRob24zLWF0dHJzIFwKLS0gCjIu
MzkuMgoK

--===============0316176702177455803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hypothesis-6.71.0.dist-info -> /usr/lib/python3.11/site-packages/hypothesis-6.75.9.dist-info, added "/usr/lib/python3.11/site-packages/hypothesis/extra/__pycache__/_patching.cpython-311.pyc /usr/lib/python3.11/site-packages/hypothesis/extra/_patching.py"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.71.0.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.75.9.dist-info
  /usr/lib/python3.11/site-packages/hypothesis/extra/_patching.py was added
  /usr/lib/python3.11/site-packages/hypothesis/extra/__pycache__/_patching.cpython-311.pyc was added

--===============0316176702177455803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.71.0 [default] to 6.75.9 [default]
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.71.0.tar.gz;downloadfilename=hypothesis-6.71.0.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.75.9.tar.gz;downloadfilename=hypothesis-6.75.9.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.71.0" to "6.75.9"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.71.0 [default] to 6.75.9 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.71.0" to "6.75.9"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.71.0 [default] to 6.75.9 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.71.0" to "6.75.9"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.71.0 [default] to 6.75.9 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.71.0" to "6.75.9"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.71.0 [default] to 6.75.9 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.71.0" to "6.75.9"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.71.0 [default] to 6.75.9 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.71.0" to "6.75.9"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.71.0 [default] to 6.75.9 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.71.0" to "6.75.9"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.71.0 [default] to 6.75.9 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.71.0" to "6.75.9"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: FILELIST: directory renamed /usr/lib/python3.11/site-packages/hypothesis-6.71.0.dist-info -> /usr/lib/python3.11/site-packages/hypothesis-6.75.9.dist-info, added "/usr/lib/python3.11/site-packages/hypothesis/extra/__pycache__/_patching.cpython-311.pyc /usr/lib/python3.11/site-packages/hypothesis/extra/_patching.py"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.71.0 [default] to 6.75.9 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2806255 to 2865213 (+2%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.71.0" to "6.75.9"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.11/site-packages/hypothesis-6.71.0.dist-info moved to /usr/lib/python3.11/site-packages/hypothesis-6.75.9.dist-info
  /usr/lib/python3.11/site-packages/hypothesis/extra/_patching.py was added
  /usr/lib/python3.11/site-packages/hypothesis/extra/__pycache__/_patching.cpython-311.pyc was added

--===============0316176702177455803==--

