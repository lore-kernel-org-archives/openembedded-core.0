Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E311EC433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 02:33:37 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.14653.1640140416477093902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 18:33:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=eQEkzPR8;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1640140416;
  x=1671676416;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3bDkLGXdMtM5b06qwpJNwqCf3gejXeUCCDTq5bwZjMM=;
  b=eQEkzPR8BbahEZAvVGHxGOFzegutVaJYI8IPliKH9ur8Ko5O8uyEdAx9
   LwnfUTO0LQHNEqy0qxH58/E9ZSx72qqSFzF3Op96WeZ6VxXO+7zD8AnpV
   1hukL/fWg1t3AaLeT56xzVPa7+BtGFoUGSt6gJRKQpyjqP/iPsG2kFrSv
   gV1sfidxPQ4UiByEIKnomwuAVh36mkBTt4kqzjAdXsCQuX0/r8eac8pP6
   N3K8+1Vlo1blkh0KRygdlgJzyRdPoUbG01Cm5/JdZ/q6zgCoPTaPr6lXq
   9s4TsaANzlAwJoqzCugpUdJIZEhrZ+VLvgVoclxSktFc7o1//zLNkOFnV
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 22/26] cantarell-fonts: update 0.301 -> 0.303.1
Thread-Topic: [OE-core] [PATCH 22/26] cantarell-fonts: update 0.301 -> 0.303.1
Thread-Index: AQHX8gVWMMGnrdQiNkm9oUGTY/gjHqw9zZZQgAAGesA=
Date: Wed, 22 Dec 2021 02:33:33 +0000
Message-ID: <21fe37c7ef334dfcbdd9c4888bd109df@axis.com>
References: <20211215224034.1814148-1-alex@linutronix.de>
 <20211215224034.1814148-22-alex@linutronix.de>
 <16C2F1D2002A5FB3.15364@lists.openembedded.org>
In-Reply-To: <16C2F1D2002A5FB3.15364@lists.openembedded.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 02:33:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159937

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 22 december 2021 03:12
> To: Alexander Kanavin <alex.kanavin@gmail.com>; openembedded-core@lists.o=
penembedded.org
> Cc: Alexander Kanavin <alex@linutronix.de>
> Subject: Re: [OE-core] [PATCH 22/26] cantarell-fonts: update 0.301 -> 0.3=
03.1
>=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Alexander Kanavin
> > Sent: den 15 december 2021 23:41
> > To: openembedded-core@lists.openembedded.org
> > Cc: Alexander Kanavin <alex@linutronix.de>
> > Subject: [OE-core] [PATCH 22/26] cantarell-fonts: update 0.301 -> 0.303=
.1
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  ...antarell-fonts_0.301.bb =3D> cantarell-fonts_0.303.1.bb} | 8 +-----=
--
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> >  rename meta/recipes-graphics/cantarell-fonts/{cantarell-fonts_0.301.bb=
 =3D> cantarell-fonts_0.303.1.bb} (73%)
> >
> > diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.30=
1.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb
> > similarity index 73%
> > rename from meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301=
.bb
> > rename to meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1=
.bb
> > index 8e39ef025f..a92f9cb729 100644
> > --- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.301.bb
> > +++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb
> > @@ -11,17 +11,11 @@ LICENSE =3D "OFL-1.1 & Apache-2.0"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb1ef92b6909969a472a6ea3c4e=
99cb7"
> >
> >  inherit gnomebase meson allarch fontcache pkgconfig
> > -SRC_URI[archive.sha256sum] =3D "3d35db0ac03f9e6b0d5a53577591b714238985=
f4cfc31a0aa17f26cd74675e83"
> > +SRC_URI[archive.sha256sum] =3D "f9463a0659c63e57e381fdd753cf1929225395=
c5b49135989424761830530411"
> >
> >  # remove at next version upgrade or when output changes
> > -PR =3D "r1"
> >  HASHEQUIV_HASH_VERSION .=3D ".2"
>=20
> Shouldn't all three lines above be removed now that the version changes?

Never mind. I just saw that RP had fixed it before integrating the change.

> >
> >  EXTRA_OEMESON +=3D "-Duseprebuilt=3Dtrue -Dbuildappstream=3Dfalse"
> >
> >  FILES:${PN} =3D "${datadir}/fonts ${datadir}/fontconfig"
> > -
> > -# This isn't a GNOME-style version do gnome_verdir fails. Just return =
the
> > -# version as that is how the directory is structured.
> > -def gnome_verdir(v):
> > -    return v
> > --
> > 2.20.1
>=20
> //Peter

//Peter


