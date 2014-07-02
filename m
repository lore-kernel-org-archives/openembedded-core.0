Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4551A65F1B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 12:35:14 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id t60so11221285wes.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jul 2014 05:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DtAxjm9ggw/CY2g8OMNKIRhQ4aQl4Me8DcJ9CUOBHIA=;
	b=EyN9qQXwuRs7QQ/m34dGQClBHc4OtWoHEbQ1Cypqe7BowfKDZ/1OZJuc+lf6d6sGcS
	ZXLBZSVqSbmMPVw3ff/nBi8SsJKaNaTLzBz9itP42AxVdOdWhG67CG8EQg7d8yMA7tw0
	geiF04uQ78+pqEoJaifLVZFWqnphDQKTSqWZrEXJrUYpw7V5KAHFvW96fSdzgarosS8b
	23z9+r879L/mK7bNup3QEau/u+niEK2eHx7yhLSShIUtlMtH+cGhe1KFpWzr3sFYU22v
	yRTe9fD7D652oa6KkpPNXIA6KShDyk7zmykjhbtqP7vdqQjaaQENg92bzSBHG9DoZ1Vc
	QZXQ==
X-Received: by 10.194.24.36 with SMTP id r4mr59315448wjf.35.1404304515870;
	Wed, 02 Jul 2014 05:35:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ey16sm54783077wid.14.2014.07.02.05.35.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jul 2014 05:35:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Jul 2014 14:35:25 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20140702123525.GL2437@jama>
References: <1387199725-19052-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1387199725-19052-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] gtk+: Add PACKAGECONFIG for directfb
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
X-List-Received-Date: Wed, 02 Jul 2014 12:35:16 -0000
X-Groupsio-MsgNum: 54546
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RvYRPxT9kmUw5evD"
Content-Disposition: inline

--RvYRPxT9kmUw5evD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2013 at 02:15:25PM +0100, Martin Jansa wrote:
> * building without x11 doesn't work, because it sets default
>   gdkbackend to x11 and then requires cairo-xlib to be available
> * checking for CAIRO_BACKEND... no
>   configure: error: Package requirements (cairo-xlib >=3D 1.6) were not m=
et:
>=20
>   No package 'cairo-xlib' found

I've just noticed that this was merged into daisy branch, can we please
get it in master as well?

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-gnome/gtk+/gtk+.inc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/g=
tk+.inc
> index 73d624c..5bf0bfe 100644
> --- a/meta/recipes-gnome/gtk+/gtk+.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+.inc
> @@ -14,9 +14,13 @@ X11DEPENDS =3D "virtual/libx11 libxext libxcursor libx=
randr libxdamage libxrender
>  DEPENDS =3D "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native docbook-ut=
ils-native \
>   cairo gdk-pixbuf"
> =20
> -PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '=
', d)}"
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '=
', d)} \
> +           ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '=
', d)} \
> +"
> =20
>  PACKAGECONFIG[x11] =3D "--with-x=3Dyes --with-gdktarget=3Dx11,--with-x=
=3Dno,${X11DEPENDS}"
> +# without --with-gdktarget=3Ddirectfb it will check for cairo-xlib which=
 isn't available without X11 DISTRO_FEATURE
> +PACKAGECONFIG[directfb] =3D "--with-gdktarget=3Ddirectfb,,directfb"
> =20
>  inherit autotools gtk-doc pkgconfig update-alternatives gtk-immodules-ca=
che
> =20
> --=20
> 1.8.4.3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RvYRPxT9kmUw5evD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOz/I0ACgkQN1Ujt2V2gBwhUQCfZ133wAZSBj/mfiUyrM/+76GL
FgAAnAyd9ILovtCcI906ViBVf9sYOcV/
=HTIb
-----END PGP SIGNATURE-----

--RvYRPxT9kmUw5evD--
