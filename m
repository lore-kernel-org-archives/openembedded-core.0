Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id C6BCE61A4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 09:24:16 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id un4so4006139pbc.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 02:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LsiPnReNZzRRaroqAYHGXpZNPLhFG4kMqBifQNgol5U=;
	b=P7qnbtK6Dm+ClJ1d1jqsos84AZei2T66r3w/mw2Ehkhbn6oP5D256yLpeNI1S2VCSo
	QWPklN4zXHjEbCv9R9zqHIPNXPq91mtsn72bU/b4u+xTala3abZPqq0Y2MfmJFfm+Ryp
	pVDunFsAIoAtZYAvJYy/DKWKvoYufo4czCVy5AMoHSq35LaetpBYDQR5O/BD9yjWhOdy
	+MEKsuLtaK50J3wXI+GjhZom+AxBZ+Y6MtV9bzhxtqCinz7fEFb6WJUzMC49+IqnLcD9
	Q8RTH4S1KhkHXetW9QOcVb6y0OJRw3tIbIGCxI8uK+hcb8B8CP7qZg/vAU6Fxfi860rc
	zSQQ==
X-Received: by 10.68.213.200 with SMTP id nu8mr16583051pbc.80.1369387457697;
	Fri, 24 May 2013 02:24:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	cq1sm15507328pbc.13.2013.05.24.02.24.15 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 24 May 2013 02:24:16 -0700 (PDT)
Date: Fri, 24 May 2013 11:24:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ionut Radu <ionutx.radu@intel.com>
Message-ID: <20130524092414.GR32431@jama>
References: <cover.1369386157.git.ionutx.radu@intel.com>
	<378bb703a42148959f40a19e2e0a64c13ecdb482.1369386157.git.ionutx.radu@intel.com>
MIME-Version: 1.0
In-Reply-To: <378bb703a42148959f40a19e2e0a64c13ecdb482.1369386157.git.ionutx.radu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/7] matchbox-keyboard: Update to 0.0+gitAUTOINCa+a17b1135daab9eb4cd3647c02e82687f96d93619
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
X-List-Received-Date: Fri, 24 May 2013 09:24:16 -0000
X-Groupsio-MsgNum: 39691
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rUztinBX/EQDJOOk"
Content-Disposition: inline

--rUztinBX/EQDJOOk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2013 at 12:18:09PM +0300, Ionut Radu wrote:
> Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
>=20
> matchbox-keyboard: png-fix.patch was backported. (The newest version
> contains 'png-fix.patch' changes).

do we need 0.0+gitAUTOINCa+ in subject? and where did it get 'a' after
AUTOINC?

>=20
> ---
>  .../matchbox-keyboard/matchbox-keyboard_git.bb          |   15 +++++++--=
------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb=
 b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
> index 6944a07..e6ffad7 100644
> --- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
> +++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
> @@ -4,21 +4,19 @@ BUGTRACKER =3D "http://bugzilla.openedhand.com/"
>  SECTION =3D "x11"
> =20
>  LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
> -                    file://src/matchbox-keyboard.h;endline=3D20;md5=3D4b=
a16ff913ad245dd6d95a6c67f72526 \
> -                    file://applet/applet.c;endline=3D20;md5=3De9201b3efa=
0a81a160b88d6feb5cf75b"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c \
> +                    file://src/matchbox-keyboard.h;endline=3D20;md5=3Dd1=
2cc878e2a99870458c83c61714d99e \
> +                    file://applet/applet.c;endline=3D20;md5=3D16d84e4d15=
72415c1295d37ca6d05dd4"
> =20
>  DEPENDS =3D "libfakekey expat libxft gtk+ matchbox-panel-2"
> =20
> -SRCREV =3D "b38f24036cff3be6c2fbcf9ca9881803e69003ac"
> +SRCREV =3D "a17b1135daab9eb4cd3647c02e82687f96d93619"
>  PV =3D "0.0+git${SRCPV}"
> -PR =3D "r4"
> =20
>  SRC_URI =3D "git://git.yoctoproject.org/${BPN};protocol=3Dgit \
>             file://configure_fix.patch;maxrev=3D1819 \
>             file://single-instance.patch \
> -           file://80matchboxkeyboard.shbg \
> -           file://png-fix.patch"
> +           file://80matchboxkeyboard.shbg"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> @@ -32,7 +30,8 @@ FILES_${PN} =3D "${bindir}/ \
>  	       ${sysconfdir} \
>  	       ${datadir}/applications \
>  	       ${datadir}/pixmaps \
> -	       ${datadir}/matchbox-keyboard"
> +	       ${datadir}/matchbox-keyboard \
> +           ${libdir}/libmatchbox-keyboard.so.*"

don't mix tabs and spaces on the same line, multiline variables should=20
use only spaces.

>  FILES_${PN}-dbg +=3D "${libdir}/gtk-2.0/*/immodules/.debug"
> =20
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rUztinBX/EQDJOOk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGfMb4ACgkQN1Ujt2V2gBxv2ACgpRYpWqg81b/no6sNMy9o9kwk
niQAoK2iY+AWaqz0/OZCpXyrM/GQ9bkM
=gOnG
-----END PGP SIGNATURE-----

--rUztinBX/EQDJOOk--
