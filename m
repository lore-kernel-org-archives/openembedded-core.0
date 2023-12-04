Return-Path: <andrey.popov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79D3C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 14:46:31 +0000 (UTC)
Subject: Re: [PATCH v3] image-live: Add support for building EFI-bootable ISO images for non-x86-based archs
To: openembedded-core@lists.openembedded.org
From: "Andrey Popov" <andrey.popov@yadro.com>
X-Originating-Location: Tula, Tula Oblast, RU (95.139.190.114)
X-Originating-Platform: Linux Chrome 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 04 Dec 2023 06:46:28 -0800
References: <CANNYZj_MaSkVc9SS5vJ4TBDZ7oMV-iXfqDi54U6cMyxuqEL-bQ@mail.gmail.com>
In-Reply-To: <CANNYZj_MaSkVc9SS5vJ4TBDZ7oMV-iXfqDi54U6cMyxuqEL-bQ@mail.gmail.com>
Message-ID: <358.1701701188844188611@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="oWhThHjaKK8XrUq2JEWG"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 14:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191742

--oWhThHjaKK8XrUq2JEWG
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello, Alex!

I have doubts that the entire isoparser class set could be inlined, that wo=
uld occupy around 1200 lines in total.
https://github.com/barneygale/isoparser/tree/master/isoparser
Three functions that are used to find the file using this class set are 32 =
lines long in total.

Best regards, Andrey.

--oWhThHjaKK8XrUq2JEWG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello, Alex!<br /><br />I have doubts that the entire isoparser class set c=
ould be inlined, that would occupy around 1200 lines in total.<br /><a href=
=3D"https://github.com/barneygale/isoparser/tree/master/isoparser" target=
=3D"_blank" rel=3D"noopener">https://github.com/barneygale/isoparser/tree/m=
aster/isoparser</a><br />Three functions that are used to find the file usi=
ng this class set are 32 lines long in total.<br /><br />Best regards, Andr=
ey.

--oWhThHjaKK8XrUq2JEWG--

