Return-Path: <lukas.palme@swarco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D182C4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 10:06:49 +0000 (UTC)
Subject: Re: Pseudo Abort due to path mismatch #pseudo #kirkstone
To: openembedded-core@lists.openembedded.org
From: lukas.palme@swarco.com
X-Originating-Location: US (136.226.198.119)
X-Originating-Platform: Windows Firefox 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 25 Apr 2024 03:06:41 -0700
References: <CA+chaQf4UNbB_1XD4PHMGA2-P-xFXSFOCRTEBu1o+rSbBU7k=g@mail.gmail.com>
In-Reply-To: <CA+chaQf4UNbB_1XD4PHMGA2-P-xFXSFOCRTEBu1o+rSbBU7k=g@mail.gmail.com>
Message-ID: <3353.1714039601668736567@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="10zCHnaMPbE0BtP5YzUb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Apr 2024 10:06:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198699

--10zCHnaMPbE0BtP5YzUb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi

thanks you for the tips. I had to tell the fetcher to unpack into ${S} too:

>=20
> SRC_URI =3D "file://Makefile;subdir=3D${S} \
> file://mymodule_core.c;subdir=3D${S} \
> file://mymodule.h;subdir=3D${S} \
> file://mymodule_public.h;subdir=3D${S} \
> file://mymodule_remote_public.h;subdir=3D${S} \
> "
>=20
> S =3D "${WORKDIR}/checkout"

and it worked like a charm :)

--10zCHnaMPbE0BtP5YzUb
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi<br /><br />thanks you for the tips. I had to tell the fetcher to unpack =
into ${S} too:<br />
<blockquote>SRC_URI =3D "file://Makefile;subdir=3D${S} \<br />&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://mymodule_core.c;subd=
ir=3D${S} \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; file://mymodule.h;subdir=3D${S} \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; file://mymodule_public.h;subdir=3D${S} \<br />&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://mymodule=
_remote_public.h;subdir=3D${S} \<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; "<br /><br />S =3D "${WORKDIR}/checkout"</blockquote>
and it worked like a charm :)

--10zCHnaMPbE0BtP5YzUb--

