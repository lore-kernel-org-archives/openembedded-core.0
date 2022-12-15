Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D38C678D9
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.145443.1671136352585008539
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OEV+luSE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010185177d1548-0138725c-14d2-4788-ac94-5a32d856cd84-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xqFtr8pnHhb6cJb0AfIaYBWjuW2Q24n4vzoUVVprjy4=;
	b=OEV+luSESF5RYhVjk4bi51u0q+k3tFQdqWjZfwYsVpcfd0XCK6G0lFJmiQUPKuwi
	aLVYu/AMcZIX4WIuT2atKO7fbiKZcL8tgUrf+O0nfQA1wqsNBZ8O0I3AieDmu46AXPi
	VEOGlL2t/NfcO+LxQhSFI5vJDFiTbfH0K6HejyFY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xqFtr8pnHhb6cJb0AfIaYBWjuW2Q24n4vzoUVVprjy4=;
	b=lFdD76YIFnw8VYGddwuhl4Ve2YaZpvpAwjn/NaTrU5KUz0/Pl2gYg9JAr6wXVm6v
	S+ykxz1Nxvq2lmUFefqYPU/egV9BZQy7U3Uqcqh+mQMoAnk+rjbRhJI4tPMdpUVd4Mm
	LHFDCnky2LlqBXcOWImTVZyw/mwj5n0JxASKMei8=
Content-Type: multipart/mixed; boundary="===============3416254619714321678=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-subunit: upgrading to 1.4.2 SUCCEEDED
Message-ID: <01010185177d1548-0138725c-14d2-4788-ac94-5a32d856cd84-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174665

--===============3416254619714321678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-subunit* to *1.4.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-subunit-upgrade-1.4.1-1.4.2.patch
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
--===============3416254619714321678==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-subunit-upgrade-1.4.1-1.4.2.patch"

RnJvbSA1N2FhNzc5ODcwNGFlMzRhY2Q5YjllZDQxNzNjYzgzNDM5NzI0YjZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTE6NTQ6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXN1YnVuaXQ6IHVwZ3JhZGUgMS40LjEgLT4gMS40LjIKCi0tLQogLi4uL3tweXRob24z
LXN1YnVuaXRfMS40LjEuYmIgPT4gcHl0aG9uMy1zdWJ1bml0XzEuNC4yLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zdWJ1bml0XzEuNC4xLmJiID0+
IHB5dGhvbjMtc3VidW5pdF8xLjQuMi5iYn0gKDgxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3VidW5pdF8xLjQuMS5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zdWJ1bml0XzEuNC4yLmJiCnNpbWlsYXJpdHkgaW5k
ZXggODElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
dWJ1bml0XzEuNC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc3VidW5pdF8xLjQuMi5iYgppbmRleCBjNWZhZWFhNTEzLi5hMDE4ZWYxZGM4IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3VidW5pdF8xLjQu
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3VidW5pdF8x
LjQuMi5iYgpAQCAtNiw3ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vUkVBRE1F
LnJzdDtiZWdpbmxpbmU9MTtlbmRsaW5lPTIwO21kNT05MDljMDhlMjkxNjQ3ZmQKIAogUFlQSV9Q
QUNLQUdFID0gInB5dGhvbi1zdWJ1bml0IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWZlNTY4
NjkwNDQyODUwMTM3NmU3YjExNTkzMjI2ZDM3NjM4ZmJkOTgxYzFmYzllZDZhYWMxODA1MjVkNzhj
MSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyOTg4ZDMyNGQ1NWVjMzVkZDAzN2U1MDJlM2Y3NGFj
MzhmNGU0NTdiZDQ0ZWUwZWRmNWU4OThmN2VlMTEzNGQ0IgogCiBpbmhlcml0IHB5cGkgc2V0dXB0
b29sczMKIAotLSAKMi4zNy4zCgo=

--===============3416254619714321678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-subunit: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/python-subunit/python-subunit-1.4.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/python-subunit/python-subunit-1.4.2.tar.gz"
packages/core2-32-poky-linux/python3-subunit: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/python3-subunit: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-dbg: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-dbg: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-dev: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-dev: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-doc: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-doc: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-locale: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-locale: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-src: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-src: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit-staticdev: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/python3-subunit/python3-subunit-staticdev: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit: PV changed from "1.4.1" to "1.4.2"
packages/core2-32-poky-linux/python3-subunit/python3-subunit: PKGV changed from 1.4.1 [default] to 1.4.2 [default]
packages/core2-32-poky-linux/python3-subunit/python3-subunit: PKGSIZE changed from 933063 to 934572 (+0%)
Changes to packages/core2-32-poky-linux/python3-subunit (sysroot):
  /usr/lib/python3.11/site-packages/python_subunit-1.4.1.dist-info moved to /usr/lib/python3.11/site-packages/python_subunit-1.4.2.dist-info

--===============3416254619714321678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-subunit (sysroot):
  /usr/lib/python3.11/site-packages/python_subunit-1.4.1.dist-info moved to /usr/lib/python3.11/site-packages/python_subunit-1.4.2.dist-info

--===============3416254619714321678==--

