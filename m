Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC3DC77B72
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.144522.1671136354149467556
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nZowYFdq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010185177d1d30-19ef5b1c-dc9e-4b48-ad23-dd30ee29c642-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136353;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Bjnfl6LgGLscej12ju76scJBaZRBepG3Ah1sk81oIng=;
	b=nZowYFdqpk0i4T6DHmey4FdCaMDWt12BRy2JneYcrMVfl38yeklsaoY6llKmZW85
	rRz2B2mJysPjjbJY2sEI5aY1YM2LeYzOc+/gNFogvxkd0dnWNB011eGGfE/R7G218cQ
	I4mzNAfDxenX6glP7K5yzqiD3+1HCxEipQrHI4iM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136353;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Bjnfl6LgGLscej12ju76scJBaZRBepG3Ah1sk81oIng=;
	b=Rt3M4uhtEsrqmrHPPKykJDRO6K7pzcTm/JISKus2+1JdLgcckidbw+HyWF6t/bXV
	oTdRii2rNP1MA4Pvx90GORpKxMWIxAuX8FtH/aVkbAlIjspnEW+R66jj8S+bUGYqqZX
	Nsfu1wHn6l8w5yS7/Kg3XlEjtHxzer9MhzC1FiaE=
Content-Type: multipart/mixed; boundary="===============1457862461695338526=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xwayland: upgrading to 22.1.6 SUCCEEDED
Message-ID: <01010185177d1d30-19ef5b1c-dc9e-4b48-ad23-dd30ee29c642-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174711

--===============1457862461695338526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xwayland* to *22.1.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-22.1.5-22.1.6.patch
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
--===============1457862461695338526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xwayland: PV changed from "22.1.5" to "22.1.6"
packages/core2-32-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-22.1.5.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-22.1.6.tar.xz"
packages/core2-32-poky-linux/xwayland: PKGV changed from 22.1.5 [default] to 22.1.6 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PV changed from "22.1.5" to "22.1.6"
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 10281436 to 10281360 (-0%)
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGV changed from 22.1.5 [default] to 22.1.6 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dev: PV changed from "22.1.5" to "22.1.6"
packages/core2-32-poky-linux/xwayland/xwayland-dev: PKGV changed from 22.1.5 [default] to 22.1.6 [default]
packages/core2-32-poky-linux/xwayland/xwayland-doc: PV changed from "22.1.5" to "22.1.6"
packages/core2-32-poky-linux/xwayland/xwayland-doc: PKGV changed from 22.1.5 [default] to 22.1.6 [default]
packages/core2-32-poky-linux/xwayland/xwayland-locale: PV changed from "22.1.5" to "22.1.6"
packages/core2-32-poky-linux/xwayland/xwayland-locale: PKGV changed from 22.1.5 [default] to 22.1.6 [default]
packages/core2-32-poky-linux/xwayland/xwayland-src: PV changed from "22.1.5" to "22.1.6"
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8603294 to 8603731 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGV changed from 22.1.5 [default] to 22.1.6 [default]
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PV changed from "22.1.5" to "22.1.6"
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 22.1.5 [default] to 22.1.6 [default]
packages/core2-32-poky-linux/xwayland/xwayland: PV changed from "22.1.5" to "22.1.6"
packages/core2-32-poky-linux/xwayland/xwayland: PKGV changed from 22.1.5 [default] to 22.1.6 [default]

--===============1457862461695338526==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-22.1.5-22.1.6.patch"

RnJvbSAyMWIyYTkyZmVjNGIzOTFmNjU1MjVkMGRiMTY5MTY4Y2VhMDQ4ZmFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTc6MTE6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
d2F5bGFuZDogdXBncmFkZSAyMi4xLjUgLT4gMjIuMS42CgotLS0KIC4uLi94d2F5bGFuZC97eHdh
eWxhbmRfMjIuMS41LmJiID0+IHh3YXlsYW5kXzIyLjEuNi5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC97eHdheWxhbmRfMjIuMS41LmJiID0+IHh3YXlsYW5k
XzIyLjEuNi5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdh
eWxhbmQveHdheWxhbmRfMjIuMS41LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5k
L3h3YXlsYW5kXzIyLjEuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjIuMS41LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQveHdheWxhbmRfMjIuMS42LmJiCmluZGV4IDUx
ZDg0N2EwOTMuLjY4YWNiZDU5OTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
d2F5bGFuZC94d2F5bGFuZF8yMi4xLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3
YXlsYW5kL3h3YXlsYW5kXzIyLjEuNi5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIk1J
VCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTVkZjg3OTUwYWY1MWFj
MmM1ODIyMDk0NTUzZWExODgwIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lngub3JnL2FyY2hp
dmUvaW5kaXZpZHVhbC94c2VydmVyL3h3YXlsYW5kLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJlMzE3YWMxZjExOWY4MzIxNjU0OTIxNzYxNDIwOTAxZTRhYmQ5NTU4NWE4Yzc2
M2NlMjZhZjNiMDQ1YWMxNjcyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjllNDI0M2YwM2QwMGZk
MTI0MzVhZWUzOWRiNGNlMTA3MWZjNDc4NmZmYzUyNTQ3ZThhMDdhNjVhYjU1YjBlN2MiCiAKIFVQ
U1RSRUFNX0NIRUNLX1JFR0VYID0gInh3YXlsYW5kLSg/UDxwdmVyPlxkKyhcLig/ITkwXGQpXGQr
KSspXC50YXIiCiAKLS0gCjIuMzcuMwoK

--===============1457862461695338526==--

