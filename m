Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwZfi-0007dx-Ov
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 16:13:10 +0200
Received: by wgbdr1 with SMTP id dr1so6181775wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 07:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GDjP7tl92SxGr0uxKzel0qEEEJOQDkYRdD6277GYyiU=;
	b=sXz6pPnA+rAlc2kc0cJveAjfUXAK4rMDGxwMXJxCjBYIAYVDK6k3FB6aKnm+6e/R6C
	nLg/w1BBxFxdhgaCMEvPH1zxakOw/6TRv0gnOOfoIYzdGaWdSHFzczjjQDNRqWVAt/eb
	TNX96S2Ljd0GCpdeTpX0GsNIPyqqWGYe0NTEuGhdapC2XoAPcNHicAEGxgACNLJYekzq
	HahmLNRlHA0wegn3iODFuS8VLXbhslo8nMqSm9KVKKmg9kPu3mVXKKd/osmlqlVT/XSv
	wlDxcnqs3A40MBlvWLUY6DLm/6PZc/pHw0hNw+X6dPw+BS3P7dzxAzXeQV6YQynyG4md
	1Iyg==
Received: by 10.180.14.8 with SMTP id l8mr16850315wic.6.1343829692201;
	Wed, 01 Aug 2012 07:01:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm12459044wiz.4.2012.08.01.07.01.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 07:01:31 -0700 (PDT)
Date: Wed, 1 Aug 2012 16:01:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120801140128.GI16306@jama.jama.net>
References: <1343829298-29238-1-git-send-email-radu.moisan@intel.com>
MIME-Version: 1.0
In-Reply-To: <1343829298-29238-1-git-send-email-radu.moisan@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2] liburcu: Upgrade to upstream 0.7.3
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
X-List-Received-Date: Wed, 01 Aug 2012 14:13:10 -0000
X-Groupsio-MsgNum: 26645
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7IgncvKP0CVPV/ZZ"
Content-Disposition: inline

--7IgncvKP0CVPV/ZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2012 at 04:54:58PM +0300, Radu Moisan wrote:
> LICENSE file has the date changed otherwise just a regular
> package update.

And does this resolve Saul's review comments?

>=20
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  .../liburcu/{liburcu_0.6.7.bb =3D> liburcu_0.7.3.bb} |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/liburcu/{liburcu_0.6.7.bb =3D> liburcu_0.7.3=
=2Ebb} (77%)
>=20
> diff --git a/meta/recipes-support/liburcu/liburcu_0.6.7.bb b/meta/recipes=
-support/liburcu/liburcu_0.7.3.bb
> similarity index 77%
> rename from meta/recipes-support/liburcu/liburcu_0.6.7.bb
> rename to meta/recipes-support/liburcu/liburcu_0.7.3.bb
> index be73856..86f29be 100644
> --- a/meta/recipes-support/liburcu/liburcu_0.6.7.bb
> +++ b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://lttng.org/urcu"
>  BUGTRACKER =3D "http://lttng.org/project/issues"
> =20
>  LICENSE =3D "LGPLv2.1+ & MIT-style"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db472dc110d38774921e1d5ccb0065=
fff \
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D95dfea59eeaa41a4057faa07a58f5=
f89 \
>                      file://urcu.h;beginline=3D4;endline=3D32;md5=3D4de0d=
68d3a997643715036d2209ae1d9 \
>                      file://urcu/uatomic/x86.h;beginline=3D4;endline=3D21=
;md5=3D220552f72c55b102f2ee35929734ef42"
> =20
> @@ -11,8 +11,8 @@ PR =3D "r0"
> =20
>  SRC_URI =3D "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
> =20
> -SRC_URI[md5sum] =3D "2705dadd65beda8e8960472c082e44b3"
> -SRC_URI[sha256sum] =3D "b0b09aead6fbcb4d5efb4270e12f84ffd115b99b55b2c745=
e052b2d87a47e75f"
> +SRC_URI[md5sum] =3D "c40b726f13bff80982c1ffa1bc2db31d"
> +SRC_URI[sha256sum] =3D "63f540a5d3c947fa3739711099fb87a66036d3c9560f26da=
763e500da296a1af"
> =20
>  S =3D "${WORKDIR}/userspace-rcu-${PV}"
>  CFLAGS_append_libc-uclibc =3D " -D_GNU_SOURCE"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7IgncvKP0CVPV/ZZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAZNrgACgkQN1Ujt2V2gByDzwCgi7krirZvjTlWieCqB3cBt6/7
IBcAn2hiLoup3NpQxQ8iSGbmIwyDwkDm
=4YLK
-----END PGP SIGNATURE-----

--7IgncvKP0CVPV/ZZ--
