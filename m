Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web12.768.1588028983633866922
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 16:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EEi/s5Ov;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: bartlomiej.burdukiewicz@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id f8so15314225lfe.12
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 16:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version;
        bh=U/emtkkAKQ+zUDymGbez//BGO32IVremUYDU//9SO1M=;
        b=EEi/s5OvJ6jL2aNtW6VX6W7X3LkmYCQkkDifFt0ISJNbDoEWaZUWG8VO4HVRB7QXL1
         DRu+/REtJoW15nyx0T6GEwkXetLTrRcpzEbsyQw+FJ/XaQAaejwKZCv5laBEbwtgJK51
         pJLGH7fV4lQu8XKThtT+l7BryUsRQB1KNjoxu2kmsz8zVYmNuSYfVbjXg7F3wraYC0hI
         /5cTVJqpeArXZrvI46WnBtZ+KvkVCTfD38/8jT9jPQFrq5KqrBtjQINBGsfronGWX5rC
         0z+6ulKzv4o4cpkkB2RiG/DRFnaTHDh3bBQB+yb9S5GMOy/Pflni8uxfB5REoLyoXeUQ
         zqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version;
        bh=U/emtkkAKQ+zUDymGbez//BGO32IVremUYDU//9SO1M=;
        b=UXSwgpg3M2ZCsyJwhSwEwGiqLKxetj7npaEAqvhV18CrvcMjXrJXWtBXWu3OXrMduH
         VZ7hrTdWPqmP9eWG4rv3i1RVZkOt3KpCHS3FtX96EuSYUluSslIeY6yAXy9+4ajtvaZ4
         FveeYQ4aK+HrZuxnveRRDuGCvQl8VyIqtAhMIPT42rNYnXWr/MMovS6hKRecdtiTBxQz
         ON3L1jF3S8IU9usNnpztKtf/JQhMP0a8gBklOkCdE1ady1rDoFVwt+K7XWWpFMKofu77
         r+Tr6tAtywXNaTDr5/aHZbaX9QrB9hAKpJs5ymoVXH7OzaKBf+LOokQbe8D2ZggQ0Kdf
         SreA==
X-Gm-Message-State: AGi0PuYptvndmhN1IB/XgPxHKq4umrcsIqFhGtwXzGKG9ZgMrxulu2it
	cyKrlA5R3ZvITPon+W4G5W7WaTn/mEI=
X-Google-Smtp-Source: APiQypKEA14XQ0P2hUHQ5vI13TpaemY7Pjhnr3LJMZMG7ikp7AypQCMIyFufNycaWd1zCwttQkl/1A==
X-Received: by 2002:ac2:53a6:: with SMTP id j6mr16939431lfh.153.1588028981270;
        Mon, 27 Apr 2020 16:09:41 -0700 (PDT)
Return-Path: <bartlomiej.burdukiewicz@gmail.com>
Received: from navi.localnet (dynamic-78-8-50-212.ssp.dialog.net.pl. [78.8.50.212])
        by smtp.gmail.com with ESMTPSA id a19sm12316203lff.11.2020.04.27.16.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 16:09:39 -0700 (PDT)
From: =?UTF-8?B?QmFydMWCb21pZWogQnVyZHVraWV3aWN6?= <bartlomiej.burdukiewicz@gmail.com>
To: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Cc: Anuj Mittal <anuj.mittal@intel.com>
Subject: Re: [OE-core] [meta-oe][PATCH] libva: Removed virtual/mesa dependency
Date: Tue, 28 Apr 2020 01:09:33 +0200
Message-ID: <2255490.NgBsaNRSFp@navi>
In-Reply-To: <e5e73ac7edc8c2695ca5dd0d31e9d800480a4e8c.camel@intel.com>
References: <7de2a86b-e32c-35ae-716d-505845a837b2@gmail.com> <28192.1587843536617759309@lists.openembedded.org> <e5e73ac7edc8c2695ca5dd0d31e9d800480a4e8c.camel@intel.com>
MIME-Version: 1.0
X-Groupsio-MsgNum: 137542
Content-Type: multipart/signed; boundary="nextPart2803879.BEx9A2HvPv"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2803879.BEx9A2HvPv
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Sun, 26 Apr 2020 06:23:57 CEST Anuj Mittal wrote:
> On Sat, 2020-04-25 at 12:38 -0700, Bart=C5=82omiej Burdukiewicz wrote:
>=20
> > On Sat, Apr 25, 2020 at 06:46 AM, Khem Raj wrote:
> >=20
> >=20
> > > On 4/24/20 8:01 AM, Bart=C5=82omiej Burdukiewicz wrote: > Mesa can be
> > > compiled with libva support, in order to avoid recursive >
> > > dependency between mesa and libva, virtual/mesa must be removed >
> > > from libva recipe. > > Signed-off-by: Bart=C5=82omiej Burdukiewicz
> > > bartlomiej.burdukiewicz@gmail.com > --- > meta/recipes-
> > > graphics/libva/libva_2.6.1.bb | 2 +- > 1 file changed, 1
> > > insertion(+), 1 deletion(-) > > diff --git a/meta/recipes-
> > > graphics/libva/libva_2.6.1.bb b/meta/recipes-
> > > graphics/libva/libva_2.6.1.bb > index 92cea83bc1..c1a441a18b 100644
> > >=20
> > > > --- a/meta/recipes-graphics/libva/libva_2.6.1.bb > +++
> > >=20
> > > b/meta/recipes-graphics/libva/libva_2.6.1.bb > @@ -23,7 +23,7 @@
> > > SRC_URI[sha256sum] =3D
> > > "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e4862940 > >
> > > UPSTREAM_CHECK_URI =3D "https://github.com/intel/libva/releases" > >
> > > -DEPENDS =3D "libdrm virtual/mesa" > +DEPENDS =3D "libdrm"
> > >=20
> > > I am not sure how it will work with non-mesa graphics stacks. Or is
> > > it non-issue ?
> > >=20
> >=20
> >=20
> > It looks like libva is designed to work without mesa (or other
> > graphical stacks), since it's using libdrm to dispatch kernel calls.=20
> > https://en.wikipedia.org/wiki/Direct_Rendering_Manager#/media/File:DRM_=
arc
> > hitecture.svg
=20
> > There is also ebuild in Gentoo for libva do not depend on mesa (
> > https://data.gpo.zugaina.org/gentoo/x11-libs/libva/libva-2.6.1.ebuild
> > ) or other graphical stacks (like nvidia-drivers or etc.).
>=20
>=20
> I see a DEPEND on opengl there which is what glx backend in libva
> expects:
>=20
> https://github.com/intel/libva/blob/master/meson.build#L95
>=20
> Just removing the dependency will force glx backend to not be built. Is
> there software out there that expects libva-glx to be present?
>=20
> Thanks,
>=20
> Anuj

Sorry I was incorrect on Gentoo ebuild it's pulling virtual/opengl which is=
=20
mesa (this is also for building libva-glx). I check what is pulling libva g=
lx=20
for Gentoo:

https://pastebin.com/bzppfKSz

=46or short:=20

xine-lib - which is outdated,
qmplay2 - https://github.com/zaps166/QMPlay2#va-api--opengl-information
kodi - libva (with glx) is required for every display backed (wayland/gbm/X=
11)=20
which is strange to me, this is probably lazy approach. I was able to run=20
libva with kodi in gbm context without glx, not sure about X11 sessions.
mythtv - https://www.mythtv.org/wiki/VAAPI unclear

Other media player don't have strong requirements for GLX.

I'm now totally unsure. Probably adding PACKAGECONFIG with glx flag (disabl=
ed=20
by default) will be better approach with conditional virtual/mesa dependenc=
y.=20
This will fix recursive dependency problem for common cases. There is also =
ton=20
of articles that GLX is deprecated, so softly going away should be a proper=
=20
way.

Or just those bbappends should stay where they are. Another thing is that=20
meta-intel layer introduced libva-intel package which also need separate=20
bbappend to remove virtual/mesa, this made me to post that patch in first=20
place.

--nextPart2803879.BEx9A2HvPv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEhZwkVUCmwRFjZfunQ+DhhJwr0RgFAl6nZi0ACgkQQ+DhhJwr
0RifbAf/bSp4De2OW51r6XdWopo7KgGz7EVHDJgCmYiROme5Urj1ahzhPI60AYi0
60oUMqq8W1Xye1wlHddcoQWC8NJUJCwHpbdXbZYlvapbvwJPmadPBHnodVq76PGq
8reF2Vkl1IBca01r7198USgqkymWoSZNByCegvAR/RyP1KftIx60kljmJFfYSFuY
h9j/35pLGFDUXWAslrblETBaFfZ3nDSxGC0dEbxff3r5Jd8WbixFgIbNY2j3JUyZ
kP+ZmRURNmGXVImYxsDB+c8Kzo2fIDAFNc8afVdYjl9rOlZGFPFcfUp2e3jpsR01
YNmNzMG2/y8/hFOrV37b5sl82bbx2w==
=hup4
-----END PGP SIGNATURE-----

--nextPart2803879.BEx9A2HvPv--
