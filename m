Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A561C433F5
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 09:38:42 +0000 (UTC)
Subject: Re: [dunfell 4/4] libdrm: add libdrm-{nouveau,radeon,intel} to
 RPROVIDES
To: openembedded-core@lists.openembedded.org
From: "Minjae Kim" <flowergom@gmail.com>
X-Originating-Location: Berlin, Land Berlin, DE (84.170.250.46)
X-Originating-Platform: Mac Chrome 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 26 May 2022 02:38:35 -0700
References: 
 <761f050783a445a6b900024a4e10a3c414bd504b.1653489126.git.steve@sakoman.com>
In-Reply-To: 
 <761f050783a445a6b900024a4e10a3c414bd504b.1653489126.git.steve@sakoman.com>
Message-ID: <22707.1653557915524636428@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="vAc8TibtRbk5sD31Jvoa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 09:38:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166180

--vAc8TibtRbk5sD31Jvoa
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

To these packages(=C2=A0${PN}-nouveau=C2=A0${PN}-intel=C2=A0${PN}-radeon)=
=C2=A0use as rdepends,=C2=A0these packages will not be installed when just =
libdrm add.
So I would like to use these packages directly, I added it as RPROVIDES.
In case of installing packages using DNF from binary feed on the target ima=
ge,
this change can install packages specified by RDEPENDS at the same time.

--vAc8TibtRbk5sD31Jvoa
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>To these packages(&nbsp;${PN}-nouveau&nbsp;${PN}-intel&nbsp;${PN}-radeon=
)&nbsp;use as rdepends,&nbsp;these packages will not be installed when just=
 libdrm add.<br />So I would like to use these packages directly, I added i=
t as RPROVIDES. <br />In case of installing packages using DNF from binary =
feed on the target image, <br />this change can install packages specified =
by RDEPENDS at the same time.</p>

--vAc8TibtRbk5sD31Jvoa--

