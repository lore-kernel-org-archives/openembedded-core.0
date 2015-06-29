Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id C69CE75C67
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 19:32:42 +0000 (UTC)
Received: by wibdq8 with SMTP id dq8so81268526wib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 12:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wc/TsAS9ZvxS1CG72eeDUjvDbUQAZcqlYTehJoh367s=;
	b=pzwmEQU6QBdZ6l5zDGLk1UVG+GprCZOrJgT9aU7JzykMp0F0zyS7KkT67Z7pOp64cS
	o2Vdpxz8tHtN243EXrBiWKmxOXVJNV0s/yjniCwuIgWatpyoihKqZNIt8P3u+ICu1khf
	UYXM90Llyqul/QmYxP8fTqSNQOkV2qJbtiGx1kuulEG/BXl0V+PDSBBsXHqqB/Hp/79r
	58v0ofxnx9xSbqFnCmF1MciUZ3/+BoeDycJswRJBcCVFwZt44ADJDEWwGhBS7G4rCASp
	g3FA8+oTk/34aA7Me6Wp0RhGqBa+kNkUxKDG8lhLHqx3gtlySVgiE5aLN39cpbzB7H7k
	bBTg==
X-Received: by 10.180.88.8 with SMTP id bc8mr25485876wib.19.1435606363574;
	Mon, 29 Jun 2015 12:32:43 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id u7sm13562527wif.3.2015.06.29.12.32.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jun 2015 12:32:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 29 Jun 2015 21:32:48 +0200
To: Drew Moseley <drew_moseley@mentor.com>
Message-ID: <20150629193248.GG2393@jama>
References: <1435602230-12093-1-git-send-email-drew_moseley@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1435602230-12093-1-git-send-email-drew_moseley@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: Add blank r600 PACKAGECONFIG
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
X-List-Received-Date: Mon, 29 Jun 2015 19:32:47 -0000
X-Groupsio-MsgNum: 67315
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="I3tAPq1Rm2pUxvsp"
Content-Disposition: inline

--I3tAPq1Rm2pUxvsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2015 at 02:23:50PM -0400, Drew Moseley wrote:
> Fixes warnings such as:
>     WARNING: mesa: invalid PACKAGECONFIG: r600
> when building with the r600 configuration.

Shouldn't you fix your PACKAGECONFIG value instead (wherever it's set to
include r600)?

>=20
> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 97ed02f..09e80e8 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -53,6 +53,7 @@ PACKAGECONFIG[openvg] =3D "--enable-openvg, --disable-o=
penvg"
> =20
>  GALLIUMDRIVERS =3D "swrast"
>  GALLIUMDRIVERS_LLVM33 =3D "${@bb.utils.contains('PACKAGECONFIG', 'r600',=
 'radeonsi,r600', '', d)}"
> +PACKAGECONFIG[r600] =3D ""
>  GALLIUMDRIVERS_LLVM33_ENABLED =3D "${@base_version_less_or_equal('MESA_L=
LVM_RELEASE', '3.2', False, len('${GALLIUMDRIVERS_LLVM33}') > 0, d)}"
>  GALLIUMDRIVERS_LLVM =3D "r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}'=
 if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
>  GALLIUMDRIVERS_append_x86 =3D "${@bb.utils.contains('PACKAGECONFIG', 'ga=
llium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--I3tAPq1Rm2pUxvsp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWRnWAACgkQN1Ujt2V2gBymLQCfSE+oOUMivbifx4QZhOK7hO8H
WmoAoLN0arR2B2JCAfeOEd3WtLwfccB5
=KI3u
-----END PGP SIGNATURE-----

--I3tAPq1Rm2pUxvsp--
