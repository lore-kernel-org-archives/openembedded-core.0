Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682ABC47091
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.349.1664643227592673808
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OGJWpecd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 010101839477db3b-c77c2f29-35e9-4390-b43a-4d0244fa8a49-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OkT5ndqP0fGZx1C7eIguoC2/U7haELwqZS8Zcja8uEk=;
	b=OGJWpecdiJZnUH1/A+bty/R7RcjYrYgO33Bdg7YRiOAHV/ngofXj/0vwHQ2ytZuj
	VXI6w1cXseCMI2JTp5RUfBU1/O9bKj+ofaTHJpYPpuPQAPTrKHi1FhSuAZ6IiHjqpwC
	foYdGItOLPL+FzBRJUuBiVpzDIyDBDxXU7L9UWz8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OkT5ndqP0fGZx1C7eIguoC2/U7haELwqZS8Zcja8uEk=;
	b=kDJo/CwrXh28rFO1JMpGvexla+5kyBQtI6alyhPNsHKQC6EDhF4qbJ1YPpiSCZHK
	hbKXiUCaQSdQjCcnnuPzMvOit4MEB0Q0j34FeUigqjUywK3YFYftsZMQp4kSicAvTd8
	mxegvk8wiuHU8XUXBY/BCOK75BLY25pHWnIirxXI=
Content-Type: multipart/mixed; boundary="===============2670819158468319657=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.55.0 SUCCEEDED
Message-ID: 
 <010101839477db3b-c77c2f29-35e9-4390-b43a-4d0244fa8a49-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171283

--===============2670819158468319657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.55.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.54.5-6.55.0.patch
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
--===============2670819158468319657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.55.0.dist-info

--===============2670819158468319657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.54.5 [default] to 6.55.0 [default]
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.54.5.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.55.0.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.54.5" to "6.55.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.54.5 [default] to 6.55.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.54.5" to "6.55.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.54.5 [default] to 6.55.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.54.5" to "6.55.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.54.5 [default] to 6.55.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.54.5" to "6.55.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.54.5 [default] to 6.55.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.54.5" to "6.55.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.54.5 [default] to 6.55.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.54.5" to "6.55.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.54.5 [default] to 6.55.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.54.5" to "6.55.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.54.5 [default] to 6.55.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.54.5" to "6.55.0"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.54.5 [default] to 6.55.0 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2089727 to 2102084 (+1%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.54.5" to "6.55.0"
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info moved to /usr/lib/python3.10/site-packages/hypothesis-6.55.0.dist-info

--===============2670819158468319657==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.54.5-6.55.0.patch"

RnJvbSAxOWNhZjJmYzZmZGEzZDQ1NjkzYTI4ZmQ5NDg0MmU1Y2Q2ODA5NDZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwODoyMToyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtaHlwb3RoZXNpczogdXBncmFkZSA2LjU0LjUgLT4gNi41NS4wCgotLS0KIC4uLnl0aG9u
My1oeXBvdGhlc2lzXzYuNTQuNS5iYiA9PiBweXRob24zLWh5cG90aGVzaXNfNi41NS4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaHlwb3RoZXNpc182LjU0
LjUuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuNTUuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjU0LjUu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjU1
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi41NC41LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjU1LjAuYmIKaW5kZXgg
OWFkYjYxNDQ5My4uNTE4MTA4MjVmYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNfNi41NC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNTUuMC5iYgpAQCAtMTMsNyArMTMs
NyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0X3JsZS5weSBcCiAgICAgIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiOGE5MDU2ODI1Njk1ZjQxNWJmYWQ0ZTgwOGFlNzE5ZmMwMTM4
M2E5YWI2NTk3NzUzMTk3MjQzNjVhZmNjN2VjNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzZDYw
MDg1YWMzNGY1ZWRmOTE1MzhjZjE0OTZmOGEyNDhkMDU1MzVlZDY3Y2IzOTZiYWJkZjA2MjE4NjZl
MjFhIgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBweXRob24zLWF0dHJzIFwKLS0gCjIu
MzEuMQoK

--===============2670819158468319657==--

