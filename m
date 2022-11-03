Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9879AC4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 23:07:06 +0000 (UTC)
Subject: How to use linux-firmware to install single firmware package? #kirkstone
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: Fegyvernek, Jász-Nagykun-Szolnok, HU (178.48.208.198)
X-Originating-Platform: Windows Chrome 107
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 03 Nov 2022 16:07:04 -0700
Message-ID: <CGDd.1667516824130158087.aCkO@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="vDRYhkHZ8QHhQQYadRs7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 23:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172656

--vDRYhkHZ8QHhQQYadRs7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I would like to install linux-firmware-ath10k and linux-firmware-imx-sdma-i=
mx7d firmware package to my image recipe in kirkstone release but when i ap=
pend them to IMAGE_INSTALL somewhy each pack from linux-firmware recipe ins=
talls itself. It is extramly large in size about 500 MB, it is totaly not a=
ccaptable for me, it is too large.

I am using the following syntax to install them:

IMAGE_INSTALL:append =3D " linux-firmware-imx-sdma-imx7d linux-firmware-ath=
10k"

If i remove them, there are no any linux-firmware in my deployed image, it =
means somehow they trigger to install the full linux-firmware pack, how can=
 i use it to install only some single linux-firmware?

--vDRYhkHZ8QHhQQYadRs7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi,</p>
<p>&nbsp;</p>
<p>I would like to install linux-firmware-ath10k and linux-firmware-imx-sdm=
a-imx7d firmware package to my image recipe in kirkstone release but when i=
 append them to IMAGE_INSTALL somewhy each pack from linux-firmware recipe =
installs itself. It is extramly large in size about 500 MB, it is totaly no=
t accaptable for me, it is too large.</p>
<p>&nbsp;</p>
<p>I am using the following syntax to install them:</p>
<p>IMAGE_INSTALL:append =3D " linux-firmware-imx-sdma-imx7d linux-firmware-=
ath10k"</p>
<p>If i remove them, there are no any linux-firmware in my deployed image, =
it means somehow they trigger to install the full linux-firmware pack, how =
can i use it to install only some single linux-firmware?</p>
<p>&nbsp;</p>

--vDRYhkHZ8QHhQQYadRs7--

