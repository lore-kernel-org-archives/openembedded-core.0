Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id C717B6A549
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 12:43:56 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id b57so4449150eek.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 05:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=X9+VC3VPHvvVSrWSOvzuNtrYMNdcUHhLJtk1BFj4DIs=;
	b=1DqjmMdciSunS3h2xkD3MreyCKRa39FJGVRQp3eZPGpL1JkGXAunYVo6T+RA237M1Q
	Gav45NB5av1cshTrSJD+p4ZaBVr6aMFpvtHXhGfH9XOv23fvbqzMhsVTd7bNMyaDIF1i
	OIrgwTPLYwsdsx0rKxxPEF3CL82VCVpd8ZLs7lnVpZvJevO0FSdZnR3JLXPSHohloCuc
	qmSoUQMe0k9BZ89c3EXz6+VAc6E7SdB0y+8j1C5a/GSrgLIm0ns9qPn5gjZKbEKQeHCc
	X4uzDJEioenooWgcwRtGRE0jnCC6KSmrMyC1Vyi0fXAE6dnn80PQDHmRmkhzLhqzSNsY
	rObg==
X-Received: by 10.14.99.71 with SMTP id w47mr32707651eef.140.1374583437076;
	Tue, 23 Jul 2013 05:43:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm58368176eeh.15.2013.07.23.05.43.55 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 23 Jul 2013 05:43:56 -0700 (PDT)
Date: Tue, 23 Jul 2013 14:44:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
Message-ID: <20130723124418.GL9527@jama>
References: <1374577279-21342-1-git-send-email-alexandru.damian@intel.com>
MIME-Version: 1.0
In-Reply-To: <1374577279-21342-1-git-send-email-alexandru.damian@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] weston: add harfbuzz dependency
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
X-List-Received-Date: Tue, 23 Jul 2013 12:43:57 -0000
X-Groupsio-MsgNum: 42311
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CgTrtGVSVGoxAIFj"
Content-Disposition: inline

--CgTrtGVSVGoxAIFj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2013 at 12:01:19PM +0100, Alex DAMIAN wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>=20
> Weston 1.1.0 has a build time dependency on libharfbuzz,
> so we add it.

I don't see that dependency in weston/master repo, are you sure it isn't
pulled by cairo/pango?

>=20
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>  meta/recipes-graphics/wayland/weston_1.1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/wayland/weston_1.1.0.bb b/meta/recipes=
-graphics/wayland/weston_1.1.0.bb
> index 7327b98..e324134 100644
> --- a/meta/recipes-graphics/wayland/weston_1.1.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_1.1.0.bb
> @@ -18,7 +18,7 @@ SRC_URI[sha256sum] =3D "e7715d2c731f77a729c994a599ffdae=
bac1307b2dd9336136706869fa5
>  inherit autotools pkgconfig useradd
> =20
>  DEPENDS =3D "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
> -DEPENDS +=3D "wayland mesa virtual/egl"
> +DEPENDS +=3D "wayland mesa virtual/egl harfbuzz"
> =20
>  EXTRA_OECONF =3D "--disable-android-compositor \
>                  --enable-setuid-install \
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CgTrtGVSVGoxAIFj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHueqIACgkQN1Ujt2V2gBw0JQCffSKTYRhPhHQLve2F5lbkXY/M
GvMAn00meenC7mP09J5ZRZPoz4Z2Fmxb
=EJxU
-----END PGP SIGNATURE-----

--CgTrtGVSVGoxAIFj--
