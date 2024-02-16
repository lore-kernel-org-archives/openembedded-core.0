Return-Path: <heiko.thole@entwicklung.eq-3.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11D3C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 14:06:50 +0000 (UTC)
Subject: archiver: Some packages are not included in tmp/deploy/sources
To: openembedded-core@lists.openembedded.org
From: "Heiko" <heiko.thole@entwicklung.eq-3.de>
X-Originating-Location: Aurich, Lower Saxony, DE (217.7.137.154)
X-Originating-Platform: Windows Chrome 121
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 16 Feb 2024 06:06:44 -0800
Message-ID: <ZhL3.1708092404474012978.UWN3@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="cVrnPPZ0uZQUnxwm9zQt"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 14:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195773

--cVrnPPZ0uZQUnxwm9zQt
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I use the archiver-class.
In local.conf I added the following:
INHERIT +=3D "archiver"
ARCHIVER_MODE[src] =3D "original"

But in the tmp/deploy/sources folder, some packages are not included. E.g. =
openssl.
But openssl is part of my image and it is included in the license.manifest =
file.

Does anyone know why this is the case?

--cVrnPPZ0uZQUnxwm9zQt
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />I use the archiver-class.<br />In local.conf I added the fol=
lowing:<br />
<div><span style=3D"font-family: courier_newregular, courier;">&nbsp; INHER=
IT +=3D "archiver"</span></div>
<div><span style=3D"font-family: courier_newregular, courier;">&nbsp; ARCHI=
VER_MODE[src] =3D "original"</span><br /><br />But in the tmp/deploy/source=
s folder, some packages are not included. E.g. openssl.<br />But openssl is=
 part of my image and it is included in the license.manifest file.<br /><br=
 />Does anyone know why this is the case?</div>

--cVrnPPZ0uZQUnxwm9zQt--

