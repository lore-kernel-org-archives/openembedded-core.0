Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0869FC6FA98
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.10629.1663251514909954098
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BKxo6WnV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101834184024e-cb856f14-8a3c-4668-aa96-73055506adb0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ORxGUdo3NqZAB+YMuSpKjLmx5/9TYW+lUN2W2KkyV/Q=;
	b=BKxo6WnV9O2Lt7m5jox2qpYanazF9vLnXk8739aRSI/qp5v+HIIn/FGNhCpZYqL0
	6IwUxIsi+DddlwdGdChv2vQAzrnaRyB7k5xKPDviJTYks1096m9iH/HjNkIyrQp6+/m
	0Z/r8DJ7ZnUDmptMU601jnVZRFAxJi00C2zCdtME=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251514;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ORxGUdo3NqZAB+YMuSpKjLmx5/9TYW+lUN2W2KkyV/Q=;
	b=kYybxzlywstj1IbD0HWkPEp5AawrAopnQNhYRIR725kZfhrfTwwYHGNGqx+JVBwF
	kJK8+9f2sgqBVZHJERn+b/bD8nK4X2CQRqOIx5jcOVyy6r1LKwo59mVwAtAV8v35sge
	xhC0EZxUdgOqgmBRFL1q4bKIf1srW98/Ypr4p6S0=
Content-Type: multipart/mixed; boundary="===============4198837052188157856=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ffmpeg: upgrading to 5.1.1 SUCCEEDED
Message-ID: 
 <010101834184024e-cb856f14-8a3c-4668-aa96-73055506adb0-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:33 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170754

--===============4198837052188157856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ffmpeg* to *5.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ffmpeg-upgrade-5.1-5.1.1.patch
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
--===============4198837052188157856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PKGSIZE changed from 75422612 to 75428864 (+0%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dev: PKGSIZE changed from 1152733 to 1152735 (+0%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dev: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dev: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-doc: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-doc: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-locale: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-locale: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PKGSIZE changed from 43658690 to 43661694 (+0%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-staticdev: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-staticdev: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg: PKGSIZE changed from 753236 to 757332 (+1%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg: SRC_URI changed from "https://www.ffmpeg.org/releases/ffmpeg-5.1.tar.xz" to "https://www.ffmpeg.org/releases/ffmpeg-5.1.1.tar.xz"
packages/core2-32-poky-linux/ffmpeg: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavcodec: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/libavcodec: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavdevice: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/libavdevice: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavfilter: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/libavfilter: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavformat: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/libavformat: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavutil: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/libavutil: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/libpostproc: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/libpostproc: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/libswresample: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/libswresample: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/libswscale: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/libswscale: PKGV changed from 5.1 [default] to 5.1.1 [default]

--===============4198837052188157856==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ffmpeg-upgrade-5.1-5.1.1.patch"

RnJvbSAzOGZiOWE1MzI2NGFjM2U5ODEwYjY5ZWVmY2M3N2Y5YWQyYzVmM2ZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTI6NDk6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
Zm1wZWc6IHVwZ3JhZGUgNS4xIC0+IDUuMS4xCgotLS0KIC4uLi9mZm1wZWcve2ZmbXBlZ181LjEu
YmIgPT4gZmZtcGVnXzUuMS4xLmJifSAgICAgICAgICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2ZmbXBlZy97ZmZtcGVnXzUuMS5iYiA9PiBmZm1wZWdfNS4xLjEuYmJ9ICg5
OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZtcGVnL2ZmbXBlZ181
LjEuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1wZWcvZmZtcGVnXzUuMS4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Zm
bXBlZy9mZm1wZWdfNS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1w
ZWcvZmZtcGVnXzUuMS4xLmJiCmluZGV4IGJiNTA3YjQ5NzQuLjIzMDZmZTRhNDIgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1wZWdfNS4xLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1wZWdfNS4xLjEuYmIKQEAgLTIzLDcgKzIz
LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORy5HUEx2MjttZDU9YjIzNGVl
NGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
Q09QWUlORy5MR1BMdjM7bWQ1PWU2YTYwMGZkNWUxZDljYmRlMmQ5ODM2ODAyMzNhZDAyIgogCiBT
UkNfVVJJID0gImh0dHBzOi8vd3d3LmZmbXBlZy5vcmcvcmVsZWFzZXMvJHtCUH0udGFyLnh6Igot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjU1ZWI2YWFiNWVlMjM1NTUwZmE1NGEzM2VhZjhiZjFiNGVj
NjZjMDE0NTMxODJiMTJmNmE5OTNkNzU2OThiMDMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTVi
ZjNmZjhjNDk2NTExZTcxZTk1OGZiMjQ5ZTY2M2M4YzljM2RlNTgzYzViZWJjMGY1YTk3NDVhYmJj
MDQzNSIKIAogIyBCdWlsZCBmYWlscyB3aGVuIHRodW1iIGlzIGVuYWJsZWQ6IGh0dHBzOi8vYnVn
emlsbGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9NzcxNwogQVJNX0lOU1RSVUNU
SU9OX1NFVDphcm12NCA9ICJhcm0iCi0tIAoyLjMxLjEKCg==

--===============4198837052188157856==--

