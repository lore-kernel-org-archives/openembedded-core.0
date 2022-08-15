Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32EFC3276B
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.6462.1660589820810211972
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jggk0y+B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010182a2ddc8aa-497e1c3e-e2fc-4fa2-b91c-9efee4899549-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9Xq68tpzrK9tCzHM7VNKuz2h8lL62iDBWT093UGDme8=;
	b=jggk0y+ByvAp4cpXrVS/ZG+yvMj1nBW5q25CiGdymrpdg29LpYFnrjwDFzZ8kFQY
	K8O2qHYWx+VXwlGt8KemiqI35aXDuRo+PuZMZrPrsoaydxQe4uh/wSNt3kLcdyAAhpC
	YhFBnE0/ei3EjtChf5ZADw75oI9z1ICiIBmyfqow=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9Xq68tpzrK9tCzHM7VNKuz2h8lL62iDBWT093UGDme8=;
	b=A549ao2OmgDh8NamlUXBszntf5rqL0ttIHKGhMcQTJdcM8mPaHccU0BzwodyUZRt
	MT9F8IY/SYqIXHlPkDVTOsmuIRtbwNWginN0BvfYPibB34li2IMWEAMmXAl/6LhOPwb
	xNzQuK5AprdyvbZ7aTOqyHYRE4HXwbGSo3VLNG/U=
Content-Type: multipart/mixed; boundary="===============4104042534370707490=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-more-itertools: upgrading to 8.14.0 SUCCEEDED
Message-ID: 
 <01010182a2ddc8aa-497e1c3e-e2fc-4fa2-b91c-9efee4899549-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:00 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169374

--===============4104042534370707490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-more-itertools* to *8.14.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-more-itertools-upgrade-8.13.0-8.14.0.patch
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
--===============4104042534370707490==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-more-itertools-upgrade-8.13.0-8.14.0.patch"

RnJvbSAyMDZmMmQwMDc1OTYzMjA2ODNmZWIyM2ZhMmQ5MzM1MTRkMTYwOWJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMDg6MDg6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1vcmUtaXRlcnRvb2xzOiB1cGdyYWRlIDguMTMuMCAtPiA4LjE0LjAKCi0tLQogLi4u
b3JlLWl0ZXJ0b29sc184LjEzLjAuYmIgPT4gcHl0aG9uMy1tb3JlLWl0ZXJ0b29sc184LjE0LjAu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tb3JlLWl0ZXJ0
b29sc184LjEzLjAuYmIgPT4gcHl0aG9uMy1tb3JlLWl0ZXJ0b29sc184LjE0LjAuYmJ9ICg4NiUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1vcmUt
aXRlcnRvb2xzXzguMTMuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1tb3JlLWl0ZXJ0b29sc184LjE0LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1vcmUtaXRlcnRvb2xzXzgu
MTMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1v
cmUtaXRlcnRvb2xzXzguMTQuMC5iYgppbmRleCA5NGY2ZjllNGQ1Li5jOTU1ZjkzZDliIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbW9yZS1pdGVydG9v
bHNfOC4xMy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1t
b3JlLWl0ZXJ0b29sc184LjE0LjAuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS9lcmlrcm9zZS9tb3JlLWl0ZXJ0b29scyIKIExJQ0VOU0UgPSAiTUlUIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MzM5NmVhMzBmOWQyMTM4OWQ3
ODU3NzE5ODE2ZjgzYjUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhNDI5MDFhMGE1YjE2OWQ5
MjVmNmYyMTdjZDVhMTkwZTMyZWY1NDM2MDkwNWI5YzM5ZWU3ZGI1MzEzYmZlYzBmIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImMwOTQ0M2NkM2Q1NDM4YjhkYWZjY2Q4NjdhNmJjMWNiMDg5NDM4OWU5
MGNiNTNkMjI3NDU2YjBiMGJjY2I3NTAiCiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3Jl
IHB0ZXN0CiAKLS0gCjIuMzEuMQoK

--===============4104042534370707490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-more-itertools: PKGV changed from 8.13.0 [default] to 8.14.0 [default]
packages/core2-32-poky-linux/python3-more-itertools: PV changed from "8.13.0" to "8.14.0"
packages/core2-32-poky-linux/python3-more-itertools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-8.13.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/m/more-itertools/more-itertools-8.14.0.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PKGV changed from 8.13.0 [default] to 8.14.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dbg: PV changed from "8.13.0" to "8.14.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dev: PKGV changed from 8.13.0 [default] to 8.14.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-dev: PV changed from "8.13.0" to "8.14.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-doc: PKGV changed from 8.13.0 [default] to 8.14.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-doc: PV changed from "8.13.0" to "8.14.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-locale: PKGV changed from 8.13.0 [default] to 8.14.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-locale: PV changed from "8.13.0" to "8.14.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGSIZE changed from 199119 to 202792 (+2%)
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PKGV changed from 8.13.0 [default] to 8.14.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-ptest: PV changed from "8.13.0" to "8.14.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-src: PKGV changed from 8.13.0 [default] to 8.14.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-src: PV changed from "8.13.0" to "8.14.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PKGV changed from 8.13.0 [default] to 8.14.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools-staticdev: PV changed from "8.13.0" to "8.14.0"
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PKGSIZE changed from 354573 to 358500 (+1%)
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PKGV changed from 8.13.0 [default] to 8.14.0 [default]
packages/core2-32-poky-linux/python3-more-itertools/python3-more-itertools: PV changed from "8.13.0" to "8.14.0"
Changes to packages/core2-32-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.10/site-packages/more_itertools-8.13.0.dist-info moved to /usr/lib/python3.10/site-packages/more_itertools-8.14.0.dist-info

--===============4104042534370707490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-more-itertools (sysroot):
  /usr/lib/python3.10/site-packages/more_itertools-8.13.0.dist-info moved to /usr/lib/python3.10/site-packages/more_itertools-8.14.0.dist-info

--===============4104042534370707490==--

