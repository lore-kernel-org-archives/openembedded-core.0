Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525B0C6FD22
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.10618.1663251512354019042
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QFvoDve6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 010101834183fd95-d555f2a4-4b4f-4e6a-bed7-e9efb32e7570-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N5GfqEMXlHqJNIe6wAuRTLfGssrHMSzAvIefzvd/Yd4=;
	b=QFvoDve6MkoBXYmti/68SxClQ+FxFo83MkuZdvMgypp+8aomv55uOwvnIukwySgx
	Xrf0nyl1N8/mYu8xFO8E4aui8GyrUbULvyGqyoAPCq6KioMAMYRD/c4ct/19FLJKGPt
	437Sv0BkEoJpsq388jKDOeP5heyQ/YCRqBGrz9Lk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N5GfqEMXlHqJNIe6wAuRTLfGssrHMSzAvIefzvd/Yd4=;
	b=fqWDjsvTHe6iHQHilIEEMK3IYvUFdpLMNiNDuwr38+IkN5XkQ6XYrUEkrdFU0Z6i
	THOVA0V2BXEs1rESUcXLH2Nl9OhvdGDjMGFRQqbHMgA9ah/dmVjqs3ipwU5xo4b1qoM
	P7PgqsJmRL60wZU+I+NcagBcCctpKK/0QJ8EVPag=
Content-Type: multipart/mixed; boundary="===============7955569660848752210=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.54.5 SUCCEEDED
Message-ID: 
 <010101834183fd95-d555f2a4-4b4f-4e6a-bed7-e9efb32e7570-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:32 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170724

--===============7955569660848752210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.54.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-hypothesis-upgrade-6.46.11-6.54.5.patch
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
--===============7955569660848752210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/WHEEL was removed

--===============7955569660848752210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-hypothesis: PV changed from "6.46.11" to "6.54.5"
packages/core2-32-poky-linux/python3-hypothesis: SRC_URI changed from "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.46.11.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py" to "https://files.pythonhosted.org/packages/source/h/hypothesis/hypothesis-6.54.5.tar.gz file://run-ptest file://test_binary_search.py file://test_rle.py"
packages/core2-32-poky-linux/python3-hypothesis: PKGV changed from 6.46.11 [default] to 6.54.5 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PV changed from "6.46.11" to "6.54.5"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dbg: PKGV changed from 6.46.11 [default] to 6.54.5 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PV changed from "6.46.11" to "6.54.5"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-dev: PKGV changed from 6.46.11 [default] to 6.54.5 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PV changed from "6.46.11" to "6.54.5"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-doc: PKGV changed from 6.46.11 [default] to 6.54.5 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PV changed from "6.46.11" to "6.54.5"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-locale: PKGV changed from 6.46.11 [default] to 6.54.5 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PV changed from "6.46.11" to "6.54.5"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-ptest: PKGV changed from 6.46.11 [default] to 6.54.5 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PV changed from "6.46.11" to "6.54.5"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-src: PKGV changed from 6.46.11 [default] to 6.54.5 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PV changed from "6.46.11" to "6.54.5"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis-staticdev: PKGV changed from 6.46.11 [default] to 6.54.5 [default]
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGSIZE changed from 2070320 to 2089727 (+1%)
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PV changed from "6.46.11" to "6.54.5"
packages/core2-32-poky-linux/python3-hypothesis/python3-hypothesis: PKGV changed from 6.46.11 [default] to 6.54.5 [default]
Changes to packages/core2-32-poky-linux/python3-hypothesis (sysroot):
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info/LICENSE.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/hypothesis-6.54.5.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/LICENSE.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/hypothesis-6.46.11.dist-info/WHEEL was removed

--===============7955569660848752210==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hypothesis-upgrade-6.46.11-6.54.5.patch"

RnJvbSAyNDc1YTg5YTFjODI2MmI4ZWUwZmMxMjJjOWMzZDQ4ZDI0YWMxMjYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMDk6NTU6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWh5cG90aGVzaXM6IHVwZ3JhZGUgNi40Ni4xMSAtPiA2LjU0LjUKCi0tLQogLi4udGhv
bjMtaHlwb3RoZXNpc182LjQ2LjExLmJiID0+IHB5dGhvbjMtaHlwb3RoZXNpc182LjU0LjUuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1oeXBvdGhlc2lzXzYu
NDYuMTEuYmIgPT4gcHl0aG9uMy1oeXBvdGhlc2lzXzYuNTQuNS5iYn0gKDkxJSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjQ2
LjExLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWh5cG90aGVzaXNf
Ni41NC41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNDYuMTEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNTQuNS5iYgpp
bmRleCAxZDk3NzJkNGZmLi45YWRiNjE0NDkzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtaHlwb3RoZXNpc182LjQ2LjExLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1oeXBvdGhlc2lzXzYuNTQuNS5iYgpAQCAtMTMs
NyArMTMsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGZpbGU6Ly90ZXN0X3JsZS5weSBcCiAgICAg
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjVjMWNmNjFiMjRiMDk0MzU1NTc3YTZiOGZiYmI4
ZWI1NGMxYjAyMTZmYmMwNTE5YWY5N2M0NmJkZGY0M2M0MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI4YTkwNTY4MjU2OTVmNDE1YmZhZDRlODA4YWU3MTlmYzAxMzgzYTlhYjY1OTc3NTMxOTcyNDM2
NWFmY2M3ZWM3IgogCiBSREVQRU5EUzoke1BOfSArPSAiIFwKICAgICBweXRob24zLWF0dHJzIFwK
LS0gCjIuMzEuMQoK

--===============7955569660848752210==--

