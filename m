Return-Path: <adithya.balakumar@toshiba-tsip.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A95C47422
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 05:31:48 +0000 (UTC)
Subject: Ability to set a Disk GUID for wic image 
To: openembedded-core@lists.openembedded.org
From: adithya.balakumar@toshiba-tsip.com
X-Originating-Location: US (155.190.5.21)
X-Originating-Platform: Windows Chrome 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 16 Jan 2024 21:31:41 -0800
Message-ID: <UEyN.1705469501630855830.HTjN@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="GYpMps9kGrgNQjgo1AAO"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 05:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193889

--GYpMps9kGrgNQjgo1AAO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I am trying to generate reproducible wic images. I see that the Disk GUID i=
s changing between builds. On seeing the wic imager source file (direct.py)=
, i noticed that the disk identifier is set based on the "SOURCE_DATE_EPOCH=
" environment variable (https://github.com/openembedded/openembedded-core/b=
lob/f46a211108854b4dabac0336cdcb2cf7b003d7cd/scripts/lib/wic/plugins/imager=
/direct.py#L316). However i don't see a disk GUID being set for the disk.

I don't see a way to set a disk GUID using a .wks file either. Would like t=
o know if i am missing something.

--GYpMps9kGrgNQjgo1AAO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>I am trying to generate reproducible wic images. I see that the Disk GUI=
D is changing between builds. On seeing the wic imager source file (direct.=
py), i noticed that the disk identifier is set based on the "SOURCE_DATE_EP=
OCH" environment variable (https://github.com/openembedded/openembedded-cor=
e/blob/f46a211108854b4dabac0336cdcb2cf7b003d7cd/scripts/lib/wic/plugins/ima=
ger/direct.py#L316). However i don't see a disk GUID being set for the disk=
.&nbsp;</p>
<p>I don't see a way to set a disk GUID using a .wks file either. Would lik=
e to know if i am missing something.</p>

--GYpMps9kGrgNQjgo1AAO--

