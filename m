Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A822FC64EC1
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.24557.1665871392554524341
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gpNyKRC2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010183ddac32d2-998bc9e5-0465-46eb-bdd9-e97a862979e1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LTKMp607g8ZYuMbM9iOoGh/RBNeGzuUp51qJhRSSeIc=;
	b=gpNyKRC2CZ2D8q+3K40r8I5pguunVe5ZzC8gGqC8wV6Z7rzQwpuYAmn2g6p9i9Ku
	C3nwWDxbuGDZXYhXJUalgJp0daqHcMZ3gcTc+iib7quyk/YXBjfpPVzMvaHOGykWwJZ
	TH1Wq3lP5NrgQZGV1F2UPZUucIxKw3fqFaYDKONA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LTKMp607g8ZYuMbM9iOoGh/RBNeGzuUp51qJhRSSeIc=;
	b=YVgCnUKDdLoLuF/EpbdeMkQUHmYrJABwC0hNdU86H9IS5pEK4m8w4NWEwqA14ppA
	zTN65TEBAivBUJCb7QwGwyl2f8QZbNeJEzEPBtgcpEXu9Gr0fr8xPDztCYd7aADKVNi
	pIHMjzGe97WGIQxJ8exA0nqyiGW/ALT0Cvy9JjWM=
Content-Type: multipart/mixed; boundary="===============2875122204422370168=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.11.0 SUCCEEDED
Message-ID: <01010183ddac32d2-998bc9e5-0465-46eb-bdd9-e97a862979e1-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171772

--===============2875122204422370168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hatchling* to *1.11.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.9.0-1.11.0.patch
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
--===============2875122204422370168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info -> /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info, directory renamed /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses -> /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/licenses, added "/usr/lib/python3.10/site-packages/hatchling/version/source/__pycache__/env.cpython-310.pyc /usr/lib/python3.10/site-packages/hatchling/version/source/env.py"
Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/licenses was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/hatchling/version/source/env.py was added
  /usr/lib/python3.10/site-packages/hatchling/version/source/__pycache__/env.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/licenses was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/hatchling/version/source/env.py was added
  /usr/lib/python3.10/site-packages/hatchling/version/source/__pycache__/env.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/WHEEL was removed

--===============2875122204422370168==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.9.0-1.11.0.patch"

RnJvbSAxYThlMmU2NGY5MjlmYWNjODEyYTM3M2U0NGIxYmIwZjBiNzliYzMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTA6MTM6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjkuMCAtPiAxLjExLjAKCi0tLQogLi4uL3tweXRo
b24zLWhhdGNobGluZ18xLjkuMC5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjExLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oYXRjaGxpbmdfMS45LjAu
YmIgPT4gcHl0aG9uMy1oYXRjaGxpbmdfMS4xMS4wLmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oYXRjaGxpbmdfMS45LjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTEuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuOS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMTEuMC5iYgppbmRleCAwMTFmNWVkMTEw
Li4wMGM0YzU5OGI1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtaGF0Y2hsaW5nXzEuOS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1oYXRjaGxpbmdfMS4xMS4wLmJiCkBAIC04LDcgKzgsNyBAQCBpbmhlcml0IHB5
cGkgcHl0aG9uX2hhdGNobGluZwogREVQRU5EUyArPSAicHl0aG9uMy1wbHVnZ3ktbmF0aXZlIHB5
dGhvbjMtdG9tbGktbmF0aXZlIHB5dGhvbjMtcGF0aHNwZWMtbmF0aXZlIHB5dGhvbjMtcGFja2Fn
aW5nLW5hdGl2ZSBweXRob24zLWVkaXRhYmxlcy1uYXRpdmUiCiBERVBFTkRTOnJlbW92ZTpjbGFz
cy1uYXRpdmUgPSAicHl0aG9uMy1oYXRjaGxpbmctbmF0aXZlIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYjU3YzczNjJmNDM3Yjk0MjZlNGI5NDIyOGEyMWQyYWM1ODA0ZmJiMmFiY2IwMWFkZGUy
NTQ0YTM1YmIzMDNjZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhMjYzYThjNTA4MTdjZDJkZmNk
NGRkNmQwZDU1YTVlYmNiMDc4ZWVlYzk4NThjYzNkMDU2MzE0YjM0MzhlYzhmIgogCiBkb19jb21w
aWxlOnByZXBlbmQoKSB7CiAgICAgZXhwb3J0IFBZVEhPTlBBVEg9c3JjCi0tIAoyLjMxLjEKCg==

--===============2875122204422370168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hatchling: PKGV changed from 1.9.0 [default] to 1.11.0 [default]
packages/core2-32-poky-linux/python3-hatchling: PV changed from "1.9.0" to "1.11.0"
packages/core2-32-poky-linux/python3-hatchling: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.9.0.tar.gz" to "https://files.pythonhosted.org/packages/source/h/hatchling/hatchling-1.11.0.tar.gz"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PKGV changed from 1.9.0 [default] to 1.11.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dbg: PV changed from "1.9.0" to "1.11.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PKGV changed from 1.9.0 [default] to 1.11.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-dev: PV changed from "1.9.0" to "1.11.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PKGV changed from 1.9.0 [default] to 1.11.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-doc: PV changed from "1.9.0" to "1.11.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PKGV changed from 1.9.0 [default] to 1.11.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-locale: PV changed from "1.9.0" to "1.11.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PKGV changed from 1.9.0 [default] to 1.11.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-src: PV changed from "1.9.0" to "1.11.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PKGV changed from 1.9.0 [default] to 1.11.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling-staticdev: PV changed from "1.9.0" to "1.11.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGV changed from 1.9.0 [default] to 1.11.0 [default]
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PV changed from "1.9.0" to "1.11.0"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: FILELIST: directory renamed /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info -> /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info, directory renamed /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses -> /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/licenses, added "/usr/lib/python3.10/site-packages/hatchling/version/source/env.py /usr/lib/python3.10/site-packages/hatchling/version/source/__pycache__/env.cpython-310.pyc"
packages/core2-32-poky-linux/python3-hatchling/python3-hatchling: PKGSIZE changed from 533221 to 540925 (+1%)
Changes to packages/core2-32-poky-linux/python3-hatchling (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/licenses was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/hatchling/version/source/env.py was added
  /usr/lib/python3.10/site-packages/hatchling/version/source/__pycache__/env.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/WHEEL was removed
Changes to packages/x86_64-linux/python3-hatchling-native (sysroot):
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/licenses was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/licenses/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/hatchling-1.11.0.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/hatchling/version/source/env.py was added
  /usr/lib/python3.10/site-packages/hatchling/version/source/__pycache__/env.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/licenses/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/hatchling-1.9.0.dist-info/WHEEL was removed

--===============2875122204422370168==--

