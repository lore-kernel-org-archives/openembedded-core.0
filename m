Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 23751771C0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 03:17:16 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id o185so47104849pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 19:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ECyHIr5lTODuAj/iSTi5bxLVxoyVAvnffVFGR39Onu0=;
	b=illd+ruyKaxKbVVFWRCu+F7LUIv2BaQbIfv5j4QRRFIpeA5R3QRUWKy7dX2wyryNOD
	+3t6o9aUxOucRAYXBKcIoah93fJHviQ53wriRiO5FOxOYxwqszZoYyvp1cbu+C9J4Fbl
	keTxUfGsF/7Esnz+D8hT/Acxxt6/MGHwhcuDhv+vMmbQNqwsVhN0hjAlJgoAKy6TttcG
	3924qZOY3Hh+Hy7TwfNxtbpoFLuK5a0guTc35hbqS4qiGJxGk84+7I8eZAlSAr78PWMU
	ERu0iArU97fI8pElRuNQEiClXCbliMEbbDk7imYQavw2jocZh7LlAtbrpVO+NeFsho6q
	+rSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=ECyHIr5lTODuAj/iSTi5bxLVxoyVAvnffVFGR39Onu0=;
	b=KDCS5jALGwEdEVqVSAWXMAD0aHjCcC6Vw67+m3IFRXwYwaqlaZVHx0+PVFzkG/Peck
	yTpe+EcTYpkM6pKp7orIk4VPUacEq6HzY4sqn2m5ffZkSIoDklp2Uz+0bsNekPLjR1cK
	gA4u4/rYDKapOCPyRAfzw0TesNOyY396FNtMCWwCgaa57hTbBci/tCjyzbfbE1YHhii2
	EWYxqcESKlsetYh/Eu5qOVUFXdqUVF50geH6Rpl0N8tDzRQUj1Dg5A0B2RaQ3vd7y4L4
	I97Mel6XGkfAu12195z8SJ7BaelUB6EqgTlTgJbwgDNqB3CcrXQTrqnK/cz7Sv/vYYcs
	ks5Q==
X-Gm-Message-State: AG10YOTxVcI8dlf6Msu40A7VnHMAXv1O676hAZWKehqw8wtZzhJPoGMpKzbDcFb0u0kjXw==
X-Received: by 10.98.19.215 with SMTP id 84mr17669030pft.22.1454123837321;
	Fri, 29 Jan 2016 19:17:17 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:b96b:d84e:1097:74b1?
	([2601:646:8802:5d5c:b96b:d84e:1097:74b1])
	by smtp.gmail.com with ESMTPSA id
	e14sm26548907pap.24.2016.01.29.19.17.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jan 2016 19:17:16 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1454105329-11302-3-git-send-email-armccurdy@gmail.com>
Date: Fri, 29 Jan 2016 19:17:12 -0800
Message-Id: <483C390A-09EF-401B-B772-B10BA4E1A115@gmail.com>
References: <1454105329-11302-1-git-send-email-armccurdy@gmail.com>
	<1454105329-11302-3-git-send-email-armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] pango.inc: misc dependency fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Jan 2016 03:17:17 -0000
X-Groupsio-MsgNum: 77115
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CF526C85-D117-44B7-AFF7-4115C7428B5C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CF526C85-D117-44B7-AFF7-4115C7428B5C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 29, 2016, at 2:08 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> - Add glib-2.0-native dependency for target
> - Add fontconfig-native and freetype-native dependencies for native
> - Drop unnecessary dependency on zlib for all
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta/recipes-graphics/pango/pango.inc | 10 ++++------
> 1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/pango/pango.inc =
b/meta/recipes-graphics/pango/pango.inc
> index 63c7d1e..ffa38d8 100644
> --- a/meta/recipes-graphics/pango/pango.inc
> +++ b/meta/recipes-graphics/pango/pango.inc
> @@ -9,14 +9,10 @@ BUGTRACKER =3D "http://bugzilla.gnome.org"
> SECTION =3D "libs"
> LICENSE =3D "LGPLv2.0+"
>=20
> -X11DEPENDS =3D "virtual/libx11 libxft"
> -DEPENDS =3D "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo =
harfbuzz"
> +DEPENDS =3D "glib-2.0 glib-2.0-native fontconfig freetype =
virtual/libiconv cairo harfbuzz"
>=20
> PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', =
'x11', '', d)}"
> -PACKAGECONFIG[x11] =3D "--with-xft,--without-xft,${X11DEPENDS}"
> -
> -BBCLASSEXTEND =3D "native"
> -DEPENDS_class-native =3D "glib-2.0-native cairo-native =
harfbuzz-native"
> +PACKAGECONFIG[x11] =3D "--with-xft,--without-xft,virtual/libx11 =
libxft=E2=80=9D
>=20

this is ok.


> inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even
>=20
> @@ -43,3 +39,5 @@ RDEPENDS_${PN}-ptest +=3D "liberation-fonts"
>=20
> RPROVIDES_${PN} +=3D "pango-modules pango-module-indic-lang \
>                     pango-module-basic-fc pango-module-arabic-lang"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_CF526C85-D117-44B7-AFF7-4115C7428B5C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlasKzwACgkQuwUzVZGdMxTqlQCdFdGC+YMvD7qCaH3pBta5lF+2
bVQAn3QOuERWgDTiCFIihIDQiXVpd5XH
=sQoY
-----END PGP SIGNATURE-----

--Apple-Mail=_CF526C85-D117-44B7-AFF7-4115C7428B5C--
