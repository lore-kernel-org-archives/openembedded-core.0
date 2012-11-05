Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TVQOm-0001KY-Px
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Nov 2012 18:23:44 +0100
Received: by mail-ee0-f47.google.com with SMTP id t10so3021831eei.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Nov 2012 09:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fPTGLw45BGFNgHk4C4HXzj15ilW4MAu8v/39dxVXto8=;
	b=G8lrEuocDd6zAjgl5zseqjbna32EOruql+1OkscwI+VMhWRwgeo9ZKyyu4PEOTPJw8
	iY/ej2KcLqJxhGmfMWyD+J+QLQXKqEDab1IXJRlk1aaBULBlCGUTznfY/qZxfIVlN+Hd
	YKLXBiGR8rFhzMsgH/RnotkQN0gNAnTdt99BL0YzG3RzKTLdsPU+gbYeLhw+TuCKyYiz
	o3aHKQ0rjArMNqBPkAFxR39S03P0H0XMsp8bq01bMcdles5L+uiL5YvwtJEs7FwISrs+
	ZjyNgOlnTfy5lvUntdfmcGjkLxjTUsljxo/LDv1keaBdcKuww3QZ/XlCBv62VEzCrqFX
	uXpg==
Received: by 10.14.173.137 with SMTP id v9mr38761530eel.41.1352135401018;
	Mon, 05 Nov 2012 09:10:01 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b44sm49368657eep.12.2012.11.05.09.09.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Nov 2012 09:09:59 -0800 (PST)
Date: Mon, 5 Nov 2012 18:09:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20121105170957.GG30165@jama.jama.net>
References: <1352111511-22618-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1352111511-22618-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4: add missing libglu dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Nov 2012 17:23:44 -0000
X-Groupsio-MsgNum: 31157
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ulDeV4rPMk/y39in"
Content-Disposition: inline

--ulDeV4rPMk/y39in
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 05, 2012 at 10:31:51AM +0000, Ross Burton wrote:
> Qt4 needs to explicitly depend on libglu now that it's been split out of =
the
> Mesa recipe.

I'll try to remove -lGLU from our linux.conf which seems to be only
reason why we depend on it.
=2E/linux.conf:QMAKE_LIBS_OPENGL     =3D -lGLU -lGL

Upstream has only -lGL in QMAKE_LIBS_OPENGL.

Cheers,

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-qt/qt4/qt4-x11-free.inc |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/q=
t4-x11-free.inc
> index 20ad30c..ef3ff81 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -3,11 +3,11 @@ require qt4.inc
>  DESCRIPTION =3D "Qt is a versatile cross-platform application framework =
-- this is the X11 version."
>  HOMEPAGE =3D "http://qt.nokia.com"
>  SECTION =3D "x11/libs"
> -DEPENDS +=3D "virtual/libgl virtual/libx11 fontconfig libxft libxext lib=
xrender libxrandr libxcursor"
> +DEPENDS +=3D "virtual/libgl libglu virtual/libx11 fontconfig libxft libx=
ext libxrender libxrandr libxcursor"
>  PROVIDES +=3D "qt4-x11"
>  QT4DEPENDS =3D ""
> =20
> -INC_PR =3D "r47"
> +INC_PR =3D "r48"
> =20
>  QT_GLFLAGS ?=3D "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl'=
, '-no-opengl', d)} "
>  QT_GLFLAGS_qemux86 =3D "-opengl"
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ulDeV4rPMk/y39in
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCX8uUACgkQN1Ujt2V2gBzKPQCeJuHtuZA03WVZzJ94jTUWwlI1
10EAmwZuxK32jYNoyBy8PXoya+fg8RM+
=9yoQ
-----END PGP SIGNATURE-----

--ulDeV4rPMk/y39in--
