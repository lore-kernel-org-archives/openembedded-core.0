Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5C7C6FA86
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:55 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.12573.1662040787715759526
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GqXzMRH2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010182f959c847-9261ad13-df14-43f9-9d79-93839635061f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=60kDT1zN5O2+FIrUvbj4E4l4QaGHUezvOvKZPl2XMtE=;
	b=GqXzMRH2IRxlEtdu8T6vAdEBiDbiUYoDPqPzKrvXa37Uaj8pWpDJEtF70QajA1IL
	vTV/L39P5NCclWsgGvs+r0olkef2k0hfcdj1JdiRciaykfIamPSxrRTpsUUhigHlZdd
	pV4yYMOvT9FLb54yvBVWW8IYp5Ufx8Y1t/hCd7e0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=60kDT1zN5O2+FIrUvbj4E4l4QaGHUezvOvKZPl2XMtE=;
	b=VWlIs2/XJsEscoUa+2MW1n+kcovfCajR6RlKivqby44gyujGRupvBait7r5E3mdf
	Yme8KFE2Uojqv+CsYBW+c5nn0Yr2J3qjRs3PRA8AjXuMjoioZkRYfjQtLifN6jg6kwQ
	kRG+gCoeiY/5diqMcrNt9Olmz5kGO5OdoVLQVjOg=
Content-Type: multipart/mixed; boundary="===============8843657573277478416=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ffmpeg: upgrading to 5.1.1 SUCCEEDED
Message-ID: 
 <01010182f959c847-9261ad13-df14-43f9-9d79-93839635061f-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170209

--===============8843657573277478416==
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
--===============8843657573277478416==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ffmpeg-upgrade-5.1-5.1.1.patch"

RnJvbSBiYTgyNmRlZjY2MmU3MTA2MmJjNzQ4ZGIzYTE5MWRjZmEzMjBmMmExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAxMjoxMzoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZm
bXBlZzogdXBncmFkZSA1LjEgLT4gNS4xLjEKCi0tLQogLi4uL2ZmbXBlZy97ZmZtcGVnXzUuMS5i
YiA9PiBmZm1wZWdfNS4xLjEuYmJ9ICAgICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvZmZtcGVnL3tmZm1wZWdfNS4xLmJiID0+IGZmbXBlZ181LjEuMS5iYn0gKDk4
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1wZWcvZmZtcGVnXzUu
MS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1wZWdfNS4xLjEuYmIKc2lt
aWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZt
cGVnL2ZmbXBlZ181LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBl
Zy9mZm1wZWdfNS4xLjEuYmIKaW5kZXggYmI1MDdiNDk3NC4uMjMwNmZlNGE0MiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZtcGVnL2ZmbXBlZ181LjEuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZtcGVnL2ZmbXBlZ181LjEuMS5iYgpAQCAtMjMsNyArMjMs
NyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HLkdQTHYyO21kNT1iMjM0ZWU0
ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9D
T1BZSU5HLkxHUEx2MzttZDU9ZTZhNjAwZmQ1ZTFkOWNiZGUyZDk4MzY4MDIzM2FkMDIiCiAKIFNS
Q19VUkkgPSAiaHR0cHM6Ly93d3cuZmZtcGVnLm9yZy9yZWxlYXNlcy8ke0JQfS50YXIueHoiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNTVlYjZhYWI1ZWUyMzU1NTBmYTU0YTMzZWFmOGJmMWI0ZWM2
NmMwMTQ1MzE4MmIxMmY2YTk5M2Q3NTY5OGIwMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5NWJm
M2ZmOGM0OTY1MTFlNzFlOTU4ZmIyNDllNjYzYzhjOWMzZGU1ODNjNWJlYmMwZjVhOTc0NWFiYmMw
NDM1IgogCiAjIEJ1aWxkIGZhaWxzIHdoZW4gdGh1bWIgaXMgZW5hYmxlZDogaHR0cHM6Ly9idWd6
aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD03NzE3CiBBUk1fSU5TVFJVQ1RJ
T05fU0VUOmFybXY0ID0gImFybSIKLS0gCjIuMzEuMQoK

--===============8843657573277478416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PKGSIZE changed from 75422612 to 75428864 (+0%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dev: PKGSIZE changed from 1152733 to 1152735 (+0%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dev: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dev: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-doc: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-doc: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-locale: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-locale: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PKGSIZE changed from 43658690 to 43661694 (+0%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-staticdev: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-staticdev: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/ffmpeg: PKGSIZE changed from 753236 to 757332 (+1%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg: SRC_URI changed from "https://www.ffmpeg.org/releases/ffmpeg-5.1.tar.xz" to "https://www.ffmpeg.org/releases/ffmpeg-5.1.1.tar.xz"
packages/core2-32-poky-linux/ffmpeg/libavcodec: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavcodec: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/libavdevice: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavdevice: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/libavfilter: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavfilter: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/libavformat: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavformat: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/libavutil: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/libavutil: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/libpostproc: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/libpostproc: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/libswresample: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/libswresample: PV changed from "5.1" to "5.1.1"
packages/core2-32-poky-linux/ffmpeg/libswscale: PKGV changed from 5.1 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/ffmpeg/libswscale: PV changed from "5.1" to "5.1.1"

--===============8843657573277478416==--

