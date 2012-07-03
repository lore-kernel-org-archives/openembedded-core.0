Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sm7am-0003U9-Lz
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 20:12:52 +0200
Received: by weyr6 with SMTP id r6so1134349wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2012 11:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PfROe1seYaOVMOiIUG9dglgABWY4FQwnt5t/IBxvvE8=;
	b=aAnFeZgW+ozPPy08H5ukA2PlCxkoO1qirqwCm4uZvz/4FWjPonVV5VokCFLBemRHpU
	g1Mwx9SbKcAIwJO3ZNQ6bNS36rnED6W6hsX+BD21Oc5gZKcizZpBHEWTdpJUOx8P5srZ
	xvdSs8avYBCKG/sOEbTtCO2qsU+Wlc6x72VkBp3xrBUu4eZP2IOEIaZyXuVDpj26Kv4I
	GVumQgbYgt6g6Z/ikwPEdXjl+k7l5XmtwcwRCfxKO1twILlMOdg8uh/EaB0BiHSmleeS
	uhKXelnZMbG4/v52p8r7n025Wz7vJT7s2ox+0NeNrhmpLHRhV6YSzSomGusiBkMpoQMu
	nRaA==
Received: by 10.180.86.226 with SMTP id s2mr33754460wiz.9.1341338510731;
	Tue, 03 Jul 2012 11:01:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q6sm32585754wiy.0.2012.07.03.11.01.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jul 2012 11:01:49 -0700 (PDT)
Date: Tue, 3 Jul 2012 20:01:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120703180150.GF3771@jama.jama.net>
References: <1341260636.23146.266.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1341260636.23146.266.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] subversion-native: Enable subversion-native 1.7 and remove it from ASSUME_PROVIDED
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
X-List-Received-Date: Tue, 03 Jul 2012 18:12:52 -0000
X-Groupsio-MsgNum: 24588
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nYySOmuH/HDX6pKp"
Content-Disposition: inline

--nYySOmuH/HDX6pKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 02, 2012 at 09:23:56PM +0100, Richard Purdie wrote:
> This enables a switch to subversion 1.7 now bitbake is able to cope with
> upgrading existing working copies. The impact of this change should be
> minimal since we don't have many subversion recipes now.

One less change I had to keep in shr branch for quite some time

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9377ee6..36caff0 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -157,7 +157,6 @@ ASSUME_PROVIDED =3D "\
>      patch-native \
>      perl-native-runtime \
>      python-native-runtime \
> -    subversion-native \
>      tar-native \
>      virtual/libintl-native \
>      "
> diff --git a/meta/recipes-devtools/subversion/subversion_1.7.2.bb b/meta/=
recipes-devtools/subversion/subversion_1.7.2.bb
> index a8d4f22..d4d56d0 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.7.2.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
> @@ -9,10 +9,6 @@ BBCLASSEXTEND =3D "native"
> =20
>  PR =3D "r1"
> =20
> -# negative, because of new checkout format in 1.7.0=20
> -# and distro PREMIRRORs need to be in sync with users
> -DEFAULT_PREFERENCE =3D "-1"
> -
>  SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>             file://libtool2.patch \
>  "
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nYySOmuH/HDX6pKp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/zM44ACgkQN1Ujt2V2gByldgCfWl8+nb/tZ5pxFQRZJRBB5JL/
ErQAn0uWp3lnOlM9zWgtrOdekNrVaawz
=0AOT
-----END PGP SIGNATURE-----

--nYySOmuH/HDX6pKp--
