Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A18EC47082
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web08.480.1664643227923656357
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FV98Rxa8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101839477e48c-ad0c7d45-1e94-41ba-b884-7b9a3e32bf17-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cfcqCHjEyFs1z9fNrMpsh7rGcerLOyRMQ0yS7todZx0=;
	b=FV98Rxa8z9LFtyRq6ZVaSMg80i3ll072lBu2O1LQ99SmHWniC7iUA8RaC83lJJuX
	GSxgOAZgwE+EV2OZtJDswNdVMqc7smdOhILlwUoBEN2b0fGV8QpMjfhzJf6+t9obg9l
	dh8KEYU8lboCJQeXyZtVISf2EL2zuibqfytROlCQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cfcqCHjEyFs1z9fNrMpsh7rGcerLOyRMQ0yS7todZx0=;
	b=FuCLQogdjomg4KFV76cE8jzxFCnSeAsGfaWlBaWaP39qDRf6uUaLdBY171SESot1
	gi1ZEY9OcpTtOLZYBiaEtdJu5Zq+FcxmJ2abX4/4ZR91ITKCysFg0q76WPwQZvy2BYV
	3NLPcHk5EpKoC5tel090X8ULhlXKirN6vEdMLsNE=
Content-Type: multipart/mixed; boundary="===============0973978847319172677=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ffmpeg: upgrading to 5.1.2 SUCCEEDED
Message-ID: 
 <010101839477e48c-ad0c7d45-1e94-41ba-b884-7b9a3e32bf17-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:48 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171308

--===============0973978847319172677==
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
--===============0973978847319172677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PKGSIZE changed from 75428864 to 75435348 (+0%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dbg: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dev: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-dev: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-doc: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-doc: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-locale: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-locale: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PKGSIZE changed from 43661694 to 43665918 (+0%)
packages/core2-32-poky-linux/ffmpeg/ffmpeg-src: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/ffmpeg-staticdev: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg-staticdev: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg/ffmpeg: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg/ffmpeg: PV changed from "5.1.1" to "5.1.2"
packages/core2-32-poky-linux/ffmpeg: SRC_URI changed from "https://www.ffmpeg.org/releases/ffmpeg-5.1.1.tar.xz" to "https://www.ffmpeg.org/releases/ffmpeg-5.1.2.tar.xz"
packages/core2-32-poky-linux/ffmpeg: PKGV changed from 5.1.1 [default] to 5.1.2 [default]
packages/core2-32-poky-linux/ffmpeg: PV changed from "5.1.1" to "5.1.2"
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

--===============0973978847319172677==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ffmpeg-upgrade-5.1.1-5.1.2.patch"

RnJvbSBhZGY0NjU5YmNmNDFlMTZjNmZiZGU0YzdhZmNmN2NiOTk4MzZhNGU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxNDoxMzo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZm
bXBlZzogdXBncmFkZSA1LjEuMSAtPiA1LjEuMgoKLS0tCiAuLi4vZmZtcGVnL3tmZm1wZWdfNS4x
LjEuYmIgPT4gZmZtcGVnXzUuMS4yLmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9mZm1wZWcve2ZmbXBlZ181LjEuMS5iYiA9PiBmZm1wZWdfNS4xLjIuYmJ9
ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZmZtcGVnL2ZmbXBl
Z181LjEuMS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1wZWdfNS4xLjIu
YmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZmZtcGVnL2ZmbXBlZ181LjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZmZtcGVnL2ZmbXBlZ181LjEuMi5iYgppbmRleCAyMzA2ZmU0YTQyLi5hMGM5OGQ0YWUwIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1wZWcvZmZtcGVnXzUuMS4xLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1wZWdfNS4xLjIuYmIKQEAg
LTIzLDcgKzIzLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORy5HUEx2Mjtt
ZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMgXAogICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vQ09QWUlORy5MR1BMdjM7bWQ1PWU2YTYwMGZkNWUxZDljYmRlMmQ5ODM2ODAyMzNh
ZDAyIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3LmZmbXBlZy5vcmcvcmVsZWFzZXMvJHtCUH0u
dGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk1YmYzZmY4YzQ5NjUxMWU3MWU5NThmYjI0
OWU2NjNjOGM5YzNkZTU4M2M1YmViYzBmNWE5NzQ1YWJiYzA0MzUiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNjE5ZTcwNmQ2NjJjODQyMDg1OTgzMmRkYzI1OWNkNGQ0MDk2YTQ4YTJjZTFlZWZkMDUy
ZGI5ZTQ0MGVlZjNkYyIKIAogIyBCdWlsZCBmYWlscyB3aGVuIHRodW1iIGlzIGVuYWJsZWQ6IGh0
dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9NzcxNwogQVJN
X0lOU1RSVUNUSU9OX1NFVDphcm12NCA9ICJhcm0iCi0tIAoyLjMxLjEKCg==

--===============0973978847319172677==--

