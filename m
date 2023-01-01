Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4D0C678DB
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:18 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.20681.1672605968860796498
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YRuy8+a4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101856f15a700-ac550bd5-0412-4ea1-9587-76c8f58d47e7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605968;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=dsxti629kwqVeaG1lRhFTXCN+xTyo43wR+13QGty7EU=;
	b=YRuy8+a4BZHF01WLj4Vo5R+6/SPb3ojY2Q/4SOOpqFe4tpL2Nr0VoLxl5z694XDM
	GfEefN8ce1KQBKa0eYkdckUq1wJEbE0/GSGD37rrZQv0zx3g3JI/E7vt+qk7ypZAYOF
	cPJggQc+RYXjL4zvcjDUasVQv7QQOdFRl8xPLTN8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605968;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=dsxti629kwqVeaG1lRhFTXCN+xTyo43wR+13QGty7EU=;
	b=OGkmBAMxP7rPb6YewgbEm8EUZenbQybOvMOSdKzV126ykXjDrnS9wm5aqBpuY6sC
	9WezKBTNC30y2n1w4kTyf2PVRY4qNpuYW6uCepAb3RBVEoevXbCvzaWd2DfXDuJwMbK
	gdEghXw2m1IR8tknQ8q6YEWt72cqANc1cQwHRr8g=
Content-Type: multipart/mixed; boundary="===============2075378360704409991=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xwayland: upgrading to 22.1.7 SUCCEEDED
Message-ID: <010101856f15a700-ac550bd5-0412-4ea1-9587-76c8f58d47e7-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175287

--===============2075378360704409991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xwayland* to *22.1.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xwayland-upgrade-22.1.5-22.1.7.patch
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
--===============2075378360704409991==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xwayland-upgrade-22.1.5-22.1.7.patch"

RnJvbSBhYjRiNjY2ZWY0NzY2ZmNlMzM5OTA5MmZhYTViZjQ2YTgyYWMxMDRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxNToxMjozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHh3
YXlsYW5kOiB1cGdyYWRlIDIyLjEuNSAtPiAyMi4xLjcKCi0tLQogLi4uL3h3YXlsYW5kL3t4d2F5
bGFuZF8yMi4xLjUuYmIgPT4geHdheWxhbmRfMjIuMS43LmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3h3YXlsYW5kL3t4d2F5bGFuZF8yMi4xLjUuYmIgPT4geHdheWxhbmRf
MjIuMS43LmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94d2F5
bGFuZC94d2F5bGFuZF8yMi4xLjUuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdheWxhbmQv
eHdheWxhbmRfMjIuMS43LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yMi4xLjUuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy94d2F5bGFuZC94d2F5bGFuZF8yMi4xLjcuYmIKaW5kZXggNTFk
ODQ3YTA5My4uZGQzMmJkMDExMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3h3
YXlsYW5kL3h3YXlsYW5kXzIyLjEuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveHdh
eWxhbmQveHdheWxhbmRfMjIuMS43LmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ0VOU0UgPSAiTUlU
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NWRmODc5NTBhZjUxYWMy
YzU4MjIwOTQ1NTNlYTE4ODAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cueC5vcmcvYXJjaGl2
ZS9pbmRpdmlkdWFsL3hzZXJ2ZXIveHdheWxhbmQtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImUzMTdhYzFmMTE5ZjgzMjE2NTQ5MjE3NjE0MjA5MDFlNGFiZDk1NTg1YThjNzYz
Y2UyNmFmM2IwNDVhYzE2NzIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDUzYWZhYzZjNzE5NTNm
NWNmNjZkMDNkMjg5ZGFjZDg5NjFkYTViZDMwOWMxZGZmMTI1ZDU5NTVkOWRiNWY3NiIKIAogVVBT
VFJFQU1fQ0hFQ0tfUkVHRVggPSAieHdheWxhbmQtKD9QPHB2ZXI+XGQrKFwuKD8hOTBcZClcZCsp
KylcLnRhciIKIAotLSAKMi4zNy4zCgo=

--===============2075378360704409991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xwayland: PV changed from "22.1.5" to "22.1.7"
packages/core2-32-poky-linux/xwayland: PKGV changed from 22.1.5 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/xwayland: SRC_URI changed from "https://www.x.org/archive/individual/xserver/xwayland-22.1.5.tar.xz" to "https://www.x.org/archive/individual/xserver/xwayland-22.1.7.tar.xz"
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PV changed from "22.1.5" to "22.1.7"
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGSIZE changed from 10281436 to 10281356 (-0%)
packages/core2-32-poky-linux/xwayland/xwayland-dbg: PKGV changed from 22.1.5 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/xwayland/xwayland-dev: PV changed from "22.1.5" to "22.1.7"
packages/core2-32-poky-linux/xwayland/xwayland-dev: PKGV changed from 22.1.5 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/xwayland/xwayland-doc: PV changed from "22.1.5" to "22.1.7"
packages/core2-32-poky-linux/xwayland/xwayland-doc: PKGV changed from 22.1.5 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/xwayland/xwayland-locale: PV changed from "22.1.5" to "22.1.7"
packages/core2-32-poky-linux/xwayland/xwayland-locale: PKGV changed from 22.1.5 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/xwayland/xwayland-src: PV changed from "22.1.5" to "22.1.7"
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGSIZE changed from 8603294 to 8603730 (+0%)
packages/core2-32-poky-linux/xwayland/xwayland-src: PKGV changed from 22.1.5 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PV changed from "22.1.5" to "22.1.7"
packages/core2-32-poky-linux/xwayland/xwayland-staticdev: PKGV changed from 22.1.5 [default] to 22.1.7 [default]
packages/core2-32-poky-linux/xwayland/xwayland: PV changed from "22.1.5" to "22.1.7"
packages/core2-32-poky-linux/xwayland/xwayland: PKGV changed from 22.1.5 [default] to 22.1.7 [default]

--===============2075378360704409991==--

