Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S34qb-0004jU-Gd
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 13:11:01 +0100
Received: by eekc1 with SMTP id c1so128253eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 04:02:32 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.12.211 as permitted sender) client-ip=10.213.12.211; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.12.211 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.12.211])
	by 10.213.12.211 with SMTP id y19mr182999eby.130.1330603351994
	(num_hops = 1); Thu, 01 Mar 2012 04:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aCUQ478tBoVYkdE6AoOGP2OHTBcM4ouNBIqHXV0ecsk=;
	b=XucN6MCiyNHBks+k4zNUlCo0W7N/IyPxKFQk9EHPTodeZbOphPpCd1SbN8VSahpzmk
	TCJewJmKdfBQvrdqy8TLMmOiWsfXlrIdsZS/QEXv9S+NjXSLrcnHBqyH1cSDkFNdIu26
	xycBvu6Y2rc0IJ5qPwgLnoeqAn43JrQw8tVds=
Received: by 10.213.12.211 with SMTP id y19mr136532eby.130.1330603351850;
	Thu, 01 Mar 2012 04:02:31 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v51sm6610921eef.2.2012.03.01.04.02.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 04:02:31 -0800 (PST)
Date: Thu, 1 Mar 2012 13:02:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120301120229.GI3831@jama.jama.net>
References: <cover.1330587785.git.sgw@linux.intel.com>
	<8166980a5f0696c1f88bce1fb9bdcff7089690b8.1330587785.git.sgw@linux.intel.com>
	<C2C41049-7169-4851-B07A-9CDDD5A5ED45@dominion.thruhere.net>
	<1330602916.31767.3.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1330602916.31767.3.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] libx11-trim/diet: Add RPROVIDES for libx11-dev
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2012 12:11:01 -0000
X-Groupsio-MsgNum: 18253
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RwxaKO075aXzzOz0"
Content-Disposition: inline

--RwxaKO075aXzzOz0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 01, 2012 at 11:55:16AM +0000, Richard Purdie wrote:
> We have things that depend on libx11-dev, this patch ensures the -trim
> and -diet versions provide it. This resolves some multiple providers
> warnings.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

It's probably fine now as only libx11_1.4.4.bb has
BBCLASSEXTENDS =3D "nativesdk native"
but can we use RPROVIDES_${BPN}-dev =3D "libx11-dev"
?

Cheers,

> ---
>=20
> Koen/Saul: This is how I think we should be fixing the libx11 issues...
>=20
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb b/meta/r=
ecipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
> index 6106986..4bab148 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
> @@ -14,6 +14,7 @@ SRC_URI +=3D "file://x11_disable_makekeys.patch \
>              file://fix-utf8-wrong-define.patch \
>             "
> =20
> +RPROVIDES_${PN}-dev =3D "libx11-dev"
> =20
>  SRC_URI[md5sum] =3D "ed7c382cbf8c13425b6a66bcac0ca5d9"
>  SRC_URI[sha256sum] =3D "7fe62180f08ef5f0a0062fb444591e349cae2ab5af6ad834=
599f5c654e6c840d"
> diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb b/meta/r=
ecipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
> index 3fd5d82..b2c753d 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb
> @@ -5,7 +5,7 @@ DESCRIPTION +=3D " Support for XCMS is disabled in this v=
ersion."
>  LICENSE =3D "MIT & MIT-style & BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D172255dee66bb0151435b2d5d709f=
cf7"
> =20
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  DEPENDS +=3D "libxcb xproto xextproto xtrans libxau kbproto inputproto x=
f86bigfontproto xproto-native"
> =20
> @@ -13,6 +13,7 @@ SRC_URI +=3D "file://x11_disable_makekeys.patch \
>              file://keysymdef_include.patch \
>              file://makekeys_crosscompile.patch"
> =20
> +RPROVIDES_${PN}-dev =3D "libx11-dev"
> =20
>  SRC_URI[md5sum] =3D "ed7c382cbf8c13425b6a66bcac0ca5d9"
>  SRC_URI[sha256sum] =3D "7fe62180f08ef5f0a0062fb444591e349cae2ab5af6ad834=
599f5c654e6c840d"
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RwxaKO075aXzzOz0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9PZVUACgkQN1Ujt2V2gByCwQCfXkYeE4WbcGAM+Qb737HzkRh2
jgcAn0tM3uj0bnNBtHqFA30SlivL+9xu
=KNM8
-----END PGP SIGNATURE-----

--RwxaKO075aXzzOz0--
