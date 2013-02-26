Received: from mail-pa0-f46.google.com ([209.85.220.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UATPc-0005LD-9e
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 23:54:24 +0100
Received: by mail-pa0-f46.google.com with SMTP id kp14so2828pab.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 14:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=IN4DJgcyRyW8b9ef4Ej3lmgquPMygWzU83JnGVBo7dU=;
	b=BMZLjUCbOWu6HsvcVl/1dO8UfSkk2Nu6HzCgJI61bmitaa8nzY+WnCiy6WbFcznMto
	8duv7oEii0ninL++Tm/FTRUwrlSdc76Fcs5dtPWYnGbHWxUOSfxwHYcMoNm763nfUo7h
	Kc/ng80TJZSC/d745sQ3RnMRidYUQJJGHwz37nD74r8c0zDoo6kWeQDjMn21qZD3MQSq
	AdRYbq7G7DXrTOuByzs08PlA6B+uqphTeAOdR8/gJk0LfhFmix9BUzhY49oxqP38+krq
	PJxe2g8XPes0GzydSwyCfjnAOTZNFHXlh/bjipRl/mtwaSQUHAHzI3VZ6BtwbPfYlJ0F
	lzPw==
X-Received: by 10.68.129.9 with SMTP id ns9mr50322pbb.16.1361918275853;
	Tue, 26 Feb 2013 14:37:55 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ub1sm2251736pbc.5.2013.02.26.14.37.51
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 14:37:54 -0800 (PST)
Date: Tue, 26 Feb 2013 23:37:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130226223742.GA3280@jama>
References: <1361882216-8152-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1361882216-8152-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xkeyboard-config: this is architecture-indepedent, so set PACKAGE_ARCH
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
X-List-Received-Date: Tue, 26 Feb 2013 22:54:27 -0000
X-Groupsio-MsgNum: 35913
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline

--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 26, 2013 at 12:36:56PM +0000, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb b/met=
a/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
> index 8ca2f6a..ee3e20c 100644
> --- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
> +++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
> @@ -19,6 +19,8 @@ SRC_URI[sha256sum] =3D "4e1cf5468d488aaf320ddfd439e03cb=
da0b213550fd734026d23138e4b
>  SECTION =3D "x11/libs"
>  DEPENDS =3D "intltool-native xkbcomp-native glib-2.0 virtual/gettext"
> =20
> +PACKAGE_ARCH =3D "all"

Why not inherit allarch?

> +
>  PR =3D "r0"
> =20
>  EXTRA_OECONF =3D "--with-xkb-rules-symlink=3Dxorg --disable-runtime-deps"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEtOTYACgkQN1Ujt2V2gBxhNACgrBq9wBkGfqIKTERzgCg8WBhm
pTUAniVQhMkiuxsQuc1jVRBWxW/+va96
=MWVW
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
