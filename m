Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FBFC2BB43
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:37 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.4055.1659679409322197996
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Y41ovytv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101826c99fc53-6955c48c-bc44-466d-9177-258f63cebaa0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mB/5qjDrvbsbNPOFNy/XB+JNnQWpp05B1sztydWxTk8=;
	b=Y41ovytvsCbBf12gjd/TZFfmSPRRmu/pIyaTXLdPX6G5UuEq0cx20q2XMNViips8
	sgBVYcEvvjGXcDLsBFFxiShcbdVo9ae6WhltssUtlv65vG6gjdrAj+G0jvyMhU+HrML
	btuvg3YZ9uiqpXakfWzH7fQkvwwFCPFVQPLG4hNc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mB/5qjDrvbsbNPOFNy/XB+JNnQWpp05B1sztydWxTk8=;
	b=OGEuSbthDHQtqnMQowyNYwH8LEDV7HJw8rnEJKtvyhHIezNnKxmEy03xIwZ1SNme
	RjobNS8BNMLpWSOoVHEoBgTV9P/ZGdLa2je2qK9zrMZlb7HVpQDzFxf29OZFdYxA8FV
	eD6/ZSQfTaiebvNPFOCqZc6W3vvQnMe9W6WMaTDs=
Content-Type: multipart/mixed; boundary="===============5389640997704531241=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.54.1 SUCCEEDED
Message-ID: 
 <010101826c99fc53-6955c48c-bc44-466d-9177-258f63cebaa0-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:27 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168918

--===============5389640997704531241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.54.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.50.1-6.54.1.patch
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
--===============5389640997704531241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.50.1.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.54.1.dist-info

--===============5389640997704531241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.50.1.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.54.1.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.50.1" to "6.54.1"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.50.1 [default] to 6.54.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.50.1" to "6.54.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.50.1 [default] to 6.54.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.50.1" to "6.54.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.50.1 [default] to 6.54.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.50.1" to "6.54.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.50.1 [default] to 6.54.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.50.1" to "6.54.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.50.1 [default] to 6.54.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.50.1" to "6.54.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.50.1 [default] to 6.54.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.50.1" to "6.54.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.50.1 [default] to 6.54.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.50.1" to "6.54.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.50.1 [default] to 6.54.1 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2079543 to 2087579 (+0%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.50.1" to "6.54.1"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.50.1 [default] to 6.54.1 [default]
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.50.1.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.54.1.dist-info

--===============5389640997704531241==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.50.1-6.54.1.patch"

RnJvbSA3NTU0YjQ2NTY5MzE1YjI0MTc2YWQ4MDQxNDRkNjQwNDgyMmUzMzgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNCBBdWcgMjAyMiAyMjowNzo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjUwLjEgLT4gNi41NC4xCgotLS0KIC4uLnl0aG9u
My1oeXBvdGhlc2lzXzYuNTAuMS5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi41NC4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182LjUw
LjEuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuNTQuMS5iYn0gKDkxJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjUwLjEu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjU0
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi41MC4xLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjU0LjEuYmIKaW5kZXgg
MGM5M2MxMjQ5My4uYWZjZDVlNjRlZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi41MC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNTQuMS5iYgpAQCAtMTMsNyArMTMs
NyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0X3JsZS5weSBcCiAgICAgIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMWExOWFkZTNiMjc4MjVjYWI2MjJjOTVmY2YyNTE4MmEyN2E0
MmY5NzU4OWMxNjMxNzNmY2JkYWZiODYyMWQxZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkZTYz
YzM0MzA5MTgxODc1ZTcxZDBmNWQxYzEwNTFjOTMyMGExZmUwNTE3ZWE2NzMzYWY4Y2VkZjgxODE5
MWY0IgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBweXRob24zLWF0dHJzIFwKLS0gCjIu
MzEuMQoK

--===============5389640997704531241==--

