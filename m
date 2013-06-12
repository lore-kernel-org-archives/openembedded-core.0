Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 92ABF6AAA4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 17:22:22 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c13so4578732eek.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 10:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tEg7qHoUk3GW01JCYDQnxIneaw3oWI0aAxv2dlTTsy8=;
	b=mCG95bi2T2qJ0lGO8ym/WR010pDmtZIlrWS0HLtsUW8RHL9lVn3jx8LKvizkwQQE7y
	BGwR+oKyto8eNtrzfbfPUklmwbVkcimpCEBvOamK2r/kqWLQmETevlWb1QpJvbOLbI1N
	RgiOegZTjpQOC3OX5zyny2NFlJRdOtuc8fQ0YUWt/Figg/sA4nAU8g8gwc+ajyVwB9yX
	dYRDlVloyT2GDSnfE5mrAr2Elm8UrjmqagNE9o/ATB8ZnD+V7eD4Gi0hFdL8lYf8aBLp
	TSPgjp1aSCEePy7u1LVdChn66u+9P9PHrHPwQYV8VlBfdu5Ve/Ayyiz4pwapGDXz/6pg
	5upw==
X-Received: by 10.15.42.72 with SMTP id t48mr22562609eev.105.1371057743251;
	Wed, 12 Jun 2013 10:22:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	z52sm38260695eea.1.2013.06.12.10.22.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 10:22:22 -0700 (PDT)
Date: Wed, 12 Jun 2013 19:22:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130612172247.GT3233@jama>
References: <1368952056-26629-1-git-send-email-Martin.Jansa@gmail.com>
	<1368955997-22347-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1368955997-22347-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCHv2] pixman: temporary disable thumb
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
X-List-Received-Date: Wed, 12 Jun 2013 17:22:23 -0000
X-Groupsio-MsgNum: 40544
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h1wVxq8aeHrvhZJz"
Content-Disposition: inline

--h1wVxq8aeHrvhZJz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 19, 2013 at 11:33:17AM +0200, Martin Jansa wrote:
> * building with thumb triggers ICE with gcc-4.8
>   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D57329

This patch is superseded by
http://patchwork.openembedded.org/patch/51567/
which fixes this issue.

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/xorg-lib/pixman_0.29.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.29.4.bb b/meta/recip=
es-graphics/xorg-lib/pixman_0.29.4.bb
> index b1bd557..7cc5a74 100644
> --- a/meta/recipes-graphics/xorg-lib/pixman_0.29.4.bb
> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.29.4.bb
> @@ -23,6 +23,8 @@ NEON =3D " --disable-arm-neon "
>  NEON_armv7a =3D " "
>  NEON_armv7a-vfp-neon =3D " "
> =20
> +ARM_INSTRUCTION_SET =3D "arm"
> +
>  EXTRA_OECONF =3D "--disable-gtk ${IWMMXT} ${LOONGSON_MMI} ${NEON}"
>  EXTRA_OECONF_class-native =3D "--disable-gtk"
> =20
> --=20
> 1.8.2.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--h1wVxq8aeHrvhZJz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlG4rmcACgkQN1Ujt2V2gBw8pACgkkccx1nkQMgxIxp5V972k7/W
8xYAoJBVvxzAqHPVXNReXZ5yjGFrJz7f
=LlYx
-----END PGP SIGNATURE-----

--h1wVxq8aeHrvhZJz--
