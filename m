Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD628C6FA8A
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:32 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web12.10518.1663251511841592713
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PZLxFLvU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101834183f558-1ee9e4e7-0a3c-4ab0-8af7-1bf71ffe17e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251511;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4YUzBm8PlMXy2tuoss+ZHyq5Hz5uv4s0L8DYxw80co0=;
	b=PZLxFLvUzE5VBK9F4peW5PZA5A4aDQg9rA1bxiTqVE/jGqEIXs0fjb5ZpR1riZlL
	+DamR/ja9H9p0yPdziFe1EwZ46dj6JhvEIDbjxFxQKvUHMJNq9I/3H/2g/UFFWkiS+f
	bEDP+JhZMJHdeandCsy0Msy7vvpGSyG3MZCgz+og=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251511;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4YUzBm8PlMXy2tuoss+ZHyq5Hz5uv4s0L8DYxw80co0=;
	b=TBiJRrl81MmT1MrMTMQJPxRwE840MRIZ0c6vcoHkkbPaCneoDBm2KJbhbEpKN5vO
	EpBK3rzqofifuIA30dw/XAd6XikdyFKxxN/eMyAG/snYLz2qXbgvtO0NMZBJzesVdMg
	l4Af5hTdJNgd3jug09z9eS6utud5U7RGgu4hXvq4=
Content-Type: multipart/mixed; boundary="===============2556549411716711145=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ofono: upgrading to 2.0 SUCCEEDED
Message-ID: 
 <010101834183f558-1ee9e4e7-0a3c-4ab0-8af7-1bf71ffe17e9-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:30 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170699

--===============2556549411716711145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ofono* to *2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ofono-upgrade-1.34-2.0.patch
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
--===============2556549411716711145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ofono: PV changed from "1.34" to "2.0"
packages/core2-32-poky-linux/ofono: SRC_URI changed from "https://cdn.kernel.org/pub/linux/network/ofono/ofono-1.34.tar.xz file://ofono file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch" to "https://cdn.kernel.org/pub/linux/network/ofono/ofono-2.0.tar.xz file://ofono file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch"
packages/core2-32-poky-linux/ofono: PKGV changed from 1.34 [default] to 2.0 [default]
packages/core2-32-poky-linux/ofono/ofono-dbg: PV changed from "1.34" to "2.0"
packages/core2-32-poky-linux/ofono/ofono-dbg: PKGSIZE changed from 5170816 to 5170528 (-0%)
packages/core2-32-poky-linux/ofono/ofono-dbg: PKGV changed from 1.34 [default] to 2.0 [default]
packages/core2-32-poky-linux/ofono/ofono-dev: PV changed from "1.34" to "2.0"
packages/core2-32-poky-linux/ofono/ofono-dev: PKGSIZE changed from 133800 to 133798 (-0%)
packages/core2-32-poky-linux/ofono/ofono-dev: PKGV changed from 1.34 [default] to 2.0 [default]
packages/core2-32-poky-linux/ofono/ofono-doc: PV changed from "1.34" to "2.0"
packages/core2-32-poky-linux/ofono/ofono-doc: PKGV changed from 1.34 [default] to 2.0 [default]
packages/core2-32-poky-linux/ofono/ofono-locale: PV changed from "1.34" to "2.0"
packages/core2-32-poky-linux/ofono/ofono-locale: PKGV changed from 1.34 [default] to 2.0 [default]
packages/core2-32-poky-linux/ofono/ofono-src: PV changed from "1.34" to "2.0"
packages/core2-32-poky-linux/ofono/ofono-src: PKGSIZE changed from 4953546 to 4953733 (+0%)
packages/core2-32-poky-linux/ofono/ofono-src: PKGV changed from 1.34 [default] to 2.0 [default]
packages/core2-32-poky-linux/ofono/ofono-staticdev: PV changed from "1.34" to "2.0"
packages/core2-32-poky-linux/ofono/ofono-staticdev: PKGV changed from 1.34 [default] to 2.0 [default]
packages/core2-32-poky-linux/ofono/ofono-tests: PV changed from "1.34" to "2.0"
packages/core2-32-poky-linux/ofono/ofono-tests: PKGV changed from 1.34 [default] to 2.0 [default]
packages/core2-32-poky-linux/ofono/ofono: PV changed from "1.34" to "2.0"
packages/core2-32-poky-linux/ofono/ofono: PKGV changed from 1.34 [default] to 2.0 [default]

--===============2556549411716711145==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ofono-upgrade-1.34-2.0.patch"

RnJvbSA1NTM5ZTdmYzMwNmFiNGM4NzRhYzM1NjY4ZWJiZWVkMDdmZGNmODc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMDY6NDI6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
Zm9ubzogdXBncmFkZSAxLjM0IC0+IDIuMAoKLS0tCiBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L29mb25vL3tvZm9ub18xLjM0LmJiID0+IG9mb25vXzIuMC5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29mb25vL3tvZm9ub18xLjM0LmJiID0+IG9mb25vXzIuMC5iYn0gKDk1JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzEuMzQu
YmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29mb25v
L29mb25vXzEuMzQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8v
b2Zvbm9fMi4wLmJiCmluZGV4IDIzNjMxNzQ3YTcuLmFmZDQzZDI2ZjMgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMS4zNC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L29mb25vL29mb25vXzIuMC5iYgpAQCAtMTMsNyArMTMsNyBAQCBT
UkNfVVJJID0gIlwKICAgICBmaWxlOi8vMDAwMS1tYmltLWFkZC1hbi1vcHRpb25hbC1URU1QX0ZB
SUxVUkVfUkVUUlktbWFjcm8tY29weS5wYXRjaCBcCiAgICAgZmlsZTovLzAwMDItbWJpbS1GaXgt
YnVpbGQtd2l0aC1lbGwtMC4zOS1ieS1yZXN0b3JpbmctdW5saWtlbHktbS5wYXRjaCBcCiAiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYzBiOTZkMzAxMzQ0N2VjMmJjYjc0NTc5YmVmOTBlNGU1OWM2
OGRiZmE0YjljNmZiY2U1ZDEyNDAxYTQzYWFjNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiMGEz
MWJmNGQ4ZmYzMDMwYzRhZWY5Zjg0MTNkZjk5OWM1NGRmOWRiMmZmMGExZDNlYzE3MTBlMGE5ZDFh
NDllIgogCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgdXBkYXRlLXJjLmQgc3lzdGVtZCBn
b2JqZWN0LWludHJvc3BlY3Rpb24tZGF0YQogCi0tIAoyLjMxLjEKCg==

--===============2556549411716711145==--

