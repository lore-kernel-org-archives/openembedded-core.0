Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UCskG-00011u-RC; Tue, 05 Mar 2013 15:21:33 +0100
Received: by mail-pb0-f45.google.com with SMTP id ro8so4486127pbb.32
	for <multiple recipients>; Tue, 05 Mar 2013 06:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=t+6ZaIZPbGV57S6Iyi/2ScP22dZGAiyg3h8FEEnTz+g=;
	b=CGGSn02/yA+Wd2GnrolA8zfVOaOaHXPyjoxhzM59UOdPng5QQysC/UnLHV/J+Gu5y9
	UsNq7qDXcBTT+pDPph53EPGqaIurVIHlPz+p5HPvDbJY9Mhz72NavVE5rWAQaXxVElF1
	hLxXsmWLRIxWRUbk/uTXY6MlVwe4gyHn8O1ZbSrqV3L0KowiF7NpV6sXNJBgrJeOpYCq
	zVmMeQhNEUGuS49czbnot+CYN+FHvcij/2qWgTIS8EfGBnDI3L/a6SW3iz4m0f5slFfr
	dm0kVMlvIbvViG0Nq7JtTgJLG7mUyeK2qpQj40iq/p255s41ucI5K7gije4yvO4oxE1q
	IS4w==
X-Received: by 10.68.134.233 with SMTP id pn9mr37790194pbb.90.1362492302267;
	Tue, 05 Mar 2013 06:05:02 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qf7sm26821642pbb.2.2013.03.05.06.04.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Mar 2013 06:05:00 -0800 (PST)
Date: Tue, 5 Mar 2013 15:04:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Bogdan Marinescu <bogdan.a.marinescu@intel.com>
Message-ID: <20130305140450.GA12023@jama.dyndns-home.com>
References: <20130305131419.87414503AE@opal>
MIME-Version: 1.0
In-Reply-To: <20130305131419.87414503AE@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bogdan Marinescu : gmp: updated to 5.1.0a
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
X-List-Received-Date: Tue, 05 Mar 2013 14:21:33 -0000
X-Groupsio-MsgNum: 36241
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline

--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2013 at 01:14:19PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 46a29592a781b20472e6d749ee8754ebe29f5a80
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D46a29592a781b20472e6d749ee8754ebe29f5a80
>=20
> Author: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> Date:   Thu Feb 28 16:57:35 2013 +0200
>=20
> gmp: updated to 5.1.0a
>=20
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  meta/recipes-support/gmp/gmp.inc      |    4 +++-
>  meta/recipes-support/gmp/gmp_5.1.0.bb |    6 ++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/=
gmp.inc
> index 823811f..709d8c4 100644
> --- a/meta/recipes-support/gmp/gmp.inc
> +++ b/meta/recipes-support/gmp/gmp.inc
> @@ -3,7 +3,9 @@ DESCRIPTION =3D "GNU multiprecision arithmetic library"
>  HOMEPAGE =3D "http://gmplib.org/"
>  LICENSE =3D "GPLv3 LGPLv3"
> =20
> -SRC_URI =3D "ftp://ftp.gmplib.org/pub/gmp-${PV}/gmp-${PV}.tar.bz2 \
> +REVISION =3D "a"
> +
> +SRC_URI =3D "ftp://ftp.gmplib.org/pub/gmp-${PV}/gmp-${PV}${REVISION}.tar=
=2Ebz2 \
>  	   file://configure.patch \
>  	   file://amd64.patch "
> =20
> diff --git a/meta/recipes-support/gmp/gmp_5.1.0.bb b/meta/recipes-support=
/gmp/gmp_5.1.0.bb
> index 6591ebe..73a4336 100644
> --- a/meta/recipes-support/gmp/gmp_5.1.0.bb
> +++ b/meta/recipes-support/gmp/gmp_5.1.0.bb
> @@ -3,13 +3,11 @@ LICENSE=3D"LGPLv3&GPLv3"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504 \
>  		    file://version.c;endline=3D18;md5=3Dd8c56b52b9092346b9f93b4da65ef7=
90"
> =20
> -PR =3D "r1"
> -

Why? You're not increasing PV, so this breaks upgrade as buildhistory
correctly reports:
NOTE: recipe gmp-5.1.0-r0: task do_package: Started
ERROR: Package version for package libgmpxx went backwards which would brea=
k package feeds from (0:5.1.0-r1.5 to 0:5.1.0-
r0.0)
ERROR: Package version for package gmp-dbg went backwards which would break=
 package feeds from (0:5.1.0-r1.5 to 0:5.1.0-r
0.0)
ERROR: Package version for package gmp-staticdev went backwards which would=
 break package feeds from (0:5.1.0-r1.5 to 0:5.1.0-r0.0)
ERROR: Package version for package gmp-dev went backwards which would break=
 package feeds from (0:5.1.0-r1.5 to 0:5.1.0-r0.0)
ERROR: Package version for package gmp-doc went backwards which would break=
 package feeds from (0:5.1.0-r1.5 to 0:5.1.0-r0.0)
ERROR: Package version for package gmp-locale went backwards which would br=
eak package feeds from (0:5.1.0-r1.5 to 0:5.1.0-r0.0)
ERROR: Package version for package gmp went backwards which would break pac=
kage feeds from (0:5.1.0-r1.5 to 0:5.1.0-r0.0)
NOTE: recipe gmp-5.1.0-r0: task do_package: Succeeded


>  SRC_URI_append =3D " file://use-includedir.patch \
>                     file://gmp_fix_for_x32.patch \
>                     file://187b7b1646ee.patch \
>                     file://obsolete_automake_macros.patch \
>                     "
> =20
> -SRC_URI[md5sum] =3D "362cf515aff8dc240958ce47418e4c78"
> -SRC_URI[sha256sum] =3D "dfd9aba98fe5caa54a715b4584c7d45eb0ee0c8be9a31811=
64ad2fad5eefc796"
> +SRC_URI[md5sum] =3D "cf6d7cb5915f29ce0fc41d042205c080"
> +SRC_URI[sha256sum] =3D "ed5239a62aeaba6cfc8d50ec36fb59215618f98c248d4bb0=
5ca9bccd990794dc"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE1+4IACgkQN1Ujt2V2gBwcmACglmQQp59426g/y0eC46RLBqru
3yIAoKxq5OqqpW2mbhc9fDp0tIzCGvMZ
=HI6P
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
