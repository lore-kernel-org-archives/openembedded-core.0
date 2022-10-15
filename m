Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F09CC67871
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:21 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.24549.1665871396704497760
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GSvYpOsm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010183ddac3d8f-7a2dc8d5-1599-4916-96c4-6afaaf25b204-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=X5STwm5vYEKMSYFVdOrlgmKybFcLL2IomJ9llyrQOGE=;
	b=GSvYpOsmooEoZ4KnTg8SkSy91dvOanDl69eJOJhOa5ZwmpUOXqIW/BHHgiFGB875
	d+52JjU6Nu6HxDejdFDfnaINweaJFlpblmDFavl7ca9uwW5sMG7ojqot1+3aWPAOTB8
	KnEcTnqjFvtBbC4QNUJ+ndkFPeamvldpNDPkH4Ao=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=X5STwm5vYEKMSYFVdOrlgmKybFcLL2IomJ9llyrQOGE=;
	b=fM+KRd0PReuzGN+MGFxKAo5zs42IwvOKgBC6hnMvu2YVu6XFpxQNSYLY9ztDbNap
	q/bmpxMsaRN7pyhMVcFbwdI1gvlNkQzADYIK/DU0fukcJ/o1nOSoGCg3voGIzV6WDAt
	AkPwTRFQ1rRlUsg3BdLdFezYkNfFUQpbcu3j3/Lc=
Content-Type: multipart/mixed; boundary="===============6120064172986130650=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ffmpeg: upgrading to 5.1.2 SUCCEEDED
Message-ID: <01010183ddac3d8f-7a2dc8d5-1599-4916-96c4-6afaaf25b204-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171852

--===============6120064172986130650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ffmpeg* to *5.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ffmpeg-upgrade-5.1.1-5.1.2.patch
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
--===============6120064172986130650==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ffmpeg-upgrade-5.1.1-5.1.2.patch"

RnJvbSBhNDdmZGMwZmE1MmI0MTUzMTRhNDNmNWQ5YzdiODY1YzRmYThkYTg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTc6NDI6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
Zm1wZWc6IHVwZ3JhZGUgNS4xLjEgLT4gNS4xLjIKCi0tLQogLi4uL2ZmbXBlZy97ZmZtcGVnXzUu
MS4xLmJiID0+IGZmbXBlZ181LjEuMi5iYn0gICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZmZtcGVnL3tmZm1wZWdfNS4xLjEuYmIgPT4gZmZtcGVnXzUuMS4yLmJi
fSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1w
ZWdfNS4xLjEuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1wZWcvZmZtcGVnXzUuMS4y
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2ZmbXBlZy9mZm1wZWdfNS4xLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL2ZmbXBlZy9mZm1wZWdfNS4xLjIuYmIKaW5kZXggMjMwNmZlNGE0Mi4uYTBjOThkNGFlMCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZtcGVnL2ZmbXBlZ181LjEuMS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1wZWcvZmZtcGVnXzUuMS4yLmJiCkBA
IC0yMyw3ICsyMyw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkcuR1BMdjI7
bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIFwKICAgICAgICAgICAgICAgICAg
ICAgZmlsZTovL0NPUFlJTkcuTEdQTHYzO21kNT1lNmE2MDBmZDVlMWQ5Y2JkZTJkOTgzNjgwMjMz
YWQwMiIKIAogU1JDX1VSSSA9ICJodHRwczovL3d3dy5mZm1wZWcub3JnL3JlbGVhc2VzLyR7QlB9
LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5NWJmM2ZmOGM0OTY1MTFlNzFlOTU4ZmIy
NDllNjYzYzhjOWMzZGU1ODNjNWJlYmMwZjVhOTc0NWFiYmMwNDM1IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjYxOWU3MDZkNjYyYzg0MjA4NTk4MzJkZGMyNTljZDRkNDA5NmE0OGEyY2UxZWVmZDA1
MmRiOWU0NDBlZWYzZGMiCiAKICMgQnVpbGQgZmFpbHMgd2hlbiB0aHVtYiBpcyBlbmFibGVkOiBo
dHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvc2hvd19idWcuY2dpP2lkPTc3MTcKIEFS
TV9JTlNUUlVDVElPTl9TRVQ6YXJtdjQgPSAiYXJtIgotLSAKMi4zMS4xCgo=

--===============6120064172986130650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PKGSIZE changed from 75428864 to 75435348 (+0%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dev: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dev: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-doc: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-doc: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-locale: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-locale: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PKGSIZE changed from 43661694 to 43665918 (+0%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg-staticdev: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-staticdev: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/ffmpeg: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg: SRC_URI changed from "https://www.ffmpeg.org/releases/ffmpeg-5.1.1.tar.xz" to "https://www.ffmpeg.org/releases/ffmpeg-5.1.2.tar.xz"
packages/core2-32-poky-linux/ffmpeg/libavcodec: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/libavcodec: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/libavdevice: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/libavdevice: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/libavfilter: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/libavfilter: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/libavformat: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/libavformat: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/libavutil: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/libavutil: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/libpostproc: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/libpostproc: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/libswresample: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/libswresample: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/libswscale: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/libswscale: PV changed from "5.1.1" to "5.1.2"

--===============6120064172986130650==--

