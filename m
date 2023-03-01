Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC91C87FE1
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.24045.1677681915413961590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aXOtd5Sz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101869da26eff-58831b1c-204f-432e-8a43-922b4c9a9749-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UdfF3XqRI9pWGguJMIbDj/7n4u5W55JXhcoTt2kKN4I=;
	b=aXOtd5SzZH9N3fHnSxXy0OxeyZRcYvQv9Od2D6Fjoaf8b8X/ziy1hMu7pemrCE/+
	AwiyjAe9V14tyn8fp7TBTrdUPKHftlu05JBoHMfPNmMXHJMk9OiOKf6fdROq7KQNSj6
	6Zyk4B4DTNAHyjGO815mSfW+JR6ZnIw6oCy9Bm3Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UdfF3XqRI9pWGguJMIbDj/7n4u5W55JXhcoTt2kKN4I=;
	b=MWWY/fJQ2fNk49KI7UBreCcVD1NCeytmQlYXcdKcbj+V9D2QKKwELErnvB4syJji
	4BoYpot6GRmZ9+Rx2xIDh3HmIR5nPQgMm+/Sn121geGht+fwCDHpyAHQILuKYwfGdy8
	RaQoGb3SUGPnjN+aKMg1oU2yz9CsdF8RT40TjXLE=
Content-Type: multipart/mixed; boundary="===============5882776693105824452=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] meson: upgrading to 1.0.1 SUCCEEDED
Message-ID: <010101869da26eff-58831b1c-204f-432e-8a43-922b4c9a9749-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177917

--===============5882776693105824452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *meson* to *1.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-meson-upgrade-1.0.0-1.0.1.patch
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
--===============5882776693105824452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/meson: SRC_URI changed from "https://github.com/mesonbuild/meson/releases//download/1.0.0/meson-1.0.0.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch" to "https://github.com/mesonbuild/meson/releases//download/1.0.1/meson-1.0.1.tar.gz file://meson-setup.py file://meson-wrapper file://0001-python-module-do-not-manipulate-the-environment-when.patch file://disable-rpath-handling.patch file://0001-Make-CPU-family-warnings-fatal.patch file://0002-Support-building-allarch-recipes-again.patch file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch"
packages/core2-32-poky-linux/meson: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/meson: PV changed from "1.0.0" to "1.0.1"
packages/core2-32-poky-linux/meson/meson-dbg: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/meson/meson-dbg: PV changed from "1.0.0" to "1.0.1"
packages/core2-32-poky-linux/meson/meson-dev: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/meson/meson-dev: PV changed from "1.0.0" to "1.0.1"
packages/core2-32-poky-linux/meson/meson-doc: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/meson/meson-doc: PV changed from "1.0.0" to "1.0.1"
packages/core2-32-poky-linux/meson/meson-locale: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/meson/meson-locale: PV changed from "1.0.0" to "1.0.1"
packages/core2-32-poky-linux/meson/meson-src: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/meson/meson-src: PV changed from "1.0.0" to "1.0.1"
packages/core2-32-poky-linux/meson/meson-staticdev: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/meson/meson-staticdev: PV changed from "1.0.0" to "1.0.1"
packages/core2-32-poky-linux/meson/meson: PKGV changed from 1.0.0 [default] to 1.0.1 [default]
packages/core2-32-poky-linux/meson/meson: PKGSIZE changed from 7899847 to 7868353 (-0%)
packages/core2-32-poky-linux/meson/meson: PV changed from "1.0.0" to "1.0.1"
Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.11/site-packages/meson-1.0.0.dist-info moved to /usr/lib/python3.11/site-packages/meson-1.0.1.dist-info

--===============5882776693105824452==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-meson-upgrade-1.0.0-1.0.1.patch"

RnJvbSBlZDU5NzM5Mzc4OWU4YWZkZmFlNzE3MmYwYTUxNTgyMjU3NzVjYTgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAwODowOTo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
c29uOiB1cGdyYWRlIDEuMC4wIC0+IDEuMC4xCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9t
ZXNvbi97bWVzb25fMS4wLjAuYmIgPT4gbWVzb25fMS4wLjEuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL21lc29uL3ttZXNvbl8xLjAuMC5iYiA9PiBtZXNvbl8xLjAuMS5iYn0gKDk4JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4wLjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4wLjEuYmIKc2ltaWxhcml0eSBp
bmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL21lc29uL21lc29uXzEu
MC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbWVzb24vbWVzb25fMS4wLjEu
YmIKaW5kZXggNTc4ZGZiOWQ2NC4uY2UxMmEzMTI2YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL21lc29uL21lc29uXzEuMC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9tZXNvbi9tZXNvbl8xLjAuMS5iYgpAQCAtMTcsNyArMTcsNyBAQCBTUkNfVVJJID0gIiR7R0lU
SFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS9tZXNvbi0ke1BWfS50YXIuZ3ogXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMi1TdXBwb3J0LWJ1aWxkaW5nLWFsbGFyY2gtcmVjaXBlcy1hZ2Fpbi5w
YXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUNoZWNrLWZvci1jbGFuZy1iZWZvcmUtZ3Vl
c3NpbmctZ2NjLW9yLWxjYy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJhYTUwYTRiYTQ1NTdjMjVlN2Q0ODQ0NmFiZmRlODU3OTU3ZGNkZjU4Mzg1ZmZmYmU2NzBi
YTBlOGVmYWNjZTA1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ5MjZiNzMwZGU2ZjUxODcyOGNj
N2M1N2JjNWU3MDE2NjdiYWUwYzM1MjJmOWUzNjk0MjdiMmNjNzgzOWQzYzEiCiAKIGluaGVyaXQg
cHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBnaXRodWItcmVsZWFzZXMKIAotLSAKMi4zOS4y
Cgo=

--===============5882776693105824452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/meson (sysroot):
  /usr/lib/python3.11/site-packages/meson-1.0.0.dist-info moved to /usr/lib/python3.11/site-packages/meson-1.0.1.dist-info

--===============5882776693105824452==--

