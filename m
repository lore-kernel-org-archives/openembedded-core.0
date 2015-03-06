Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5E16D6017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 12:17:55 +0000 (UTC)
Received: by wiwl15 with SMTP id l15so2997022wiw.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2015 04:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9tJ+N6kx7hgl4zwBdQ5f4JxKWYBf1GtxA+OT8c/dAqo=;
	b=uhgUJRiL8FgRhsEFb5R6c3Evqeykzdsbg8VZuz5KZVszxhVRS0eeJi5iIqtj0OpLXS
	sZ0hD2UQcKQL+P1uRKDHa3JX78c/r6gPVB4g++5JKGWX4XCb4uJg0eSld8Ul2tUDpmMC
	PPjS64O4jOO+qczdMk7eiPjYPoYz7iNhCJZADMMDOcWXWhbOMLCoiTRpRYDgDp1hzJtv
	T1nRWsYm9ygTlj02x7LEWpILmcJnEIBOPW4x3NhHguuQpvQygzcBF/obWXKsj5+qbnvA
	lCJEYhR4Uux6tDhQZvX72X1iavQWoqeHb8c80aU2avWoF1uXhq+UJYLracBy2GwhwUUz
	+Y4g==
X-Received: by 10.194.19.10 with SMTP id a10mr29024277wje.153.1425644276622;
	Fri, 06 Mar 2015 04:17:56 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	yr10sm11890702wjc.0.2015.03.06.04.17.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Mar 2015 04:17:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 Mar 2015 13:18:01 +0100
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150306121801.GE2337@jama>
References: <cover.1425634271.git.liezhi.yang@windriver.com>
	<008e0da7a6c62109e58ea1418062b988cc68d8ef.1425634271.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <008e0da7a6c62109e58ea1418062b988cc68d8ef.1425634271.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] xinetd: fixe HOMEPAGE and SRC_URI
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
X-List-Received-Date: Fri, 06 Mar 2015 12:17:56 -0000
X-Groupsio-MsgNum: 63049
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xa9f45Qb6lv8AimG"
Content-Disposition: inline

--xa9f45Qb6lv8AimG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2015 at 01:32:33AM -0800, Robert Yang wrote:
> The www.xinetd.org is not available, use github to instead of it.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-extended/xinetd/xinetd_2.3.15.bb |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes=
-extended/xinetd/xinetd_2.3.15.bb
> index 288186e..98c4aeb 100644
> --- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
> +++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
> @@ -1,5 +1,5 @@
>  SUMMARY =3D "Socket-based service activation daemon"
> -HOMEPAGE =3D "http://www.xinetd.org"
> +HOMEPAGE =3D "https://github.com/xinetd-org/xinetd"
> =20
>  # xinetd is a BSD-like license
>  # Apple and Gentoo say BSD here.
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D8ad861519854=
2444f84d28a6cf226dd8"
>  DEPENDS =3D ""
>  PR =3D "r2"
> =20
> -SRC_URI =3D "http://www.xinetd.org/xinetd-${PV}.tar.gz \
> +SRC_URI =3D "https://github.com/xinetd-org/xinetd/archive/xinetd-2-3-15.=
tar.gz \
>        file://xinetd.init \
>        file://xinetd.conf \
>        file://xinetd.default \
> @@ -20,8 +20,8 @@ SRC_URI =3D "http://www.xinetd.org/xinetd-${PV}.tar.gz \
>        file://xinetd.service \
>        "
> =20
> -SRC_URI[md5sum] =3D "77358478fd58efa6366accae99b8b04c"
> -SRC_URI[sha256sum] =3D "bf4e060411c75605e4dcbdf2ac57c6bd9e1904470a2f91e0=
1ba31b50a80a5be3"
> +SRC_URI[md5sum] =3D "dbd435d2bc822ea4566dd18632c09379"
> +SRC_URI[sha256sum] =3D "620b25f4ab4d72fdf32b13797156ea40df2049f1c07e6401=
77e5fec544e9a94c"

Did you compare the archives?
Explain the difference in commit message.

>  inherit autotools update-rc.d systemd
> =20
> @@ -35,6 +35,8 @@ EXTRA_OECONF=3D"--disable-nls"
>  PACKAGECONFIG ??=3D "tcp-wrappers"
>  PACKAGECONFIG[tcp-wrappers] =3D "--with-libwrap,,tcp-wrappers"
> =20
> +S =3D "${WORKDIR}/${BPN}-${BPN}-2-3-15"
> +
>  do_configure() {
>  	# Looks like configure.in is broken, so we are skipping
>  	# rebuilding configure and are just using the shipped one
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xa9f45Qb6lv8AimG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT5mvkACgkQN1Ujt2V2gBwZUwCgi3Ltf6Gfv0fkr38MAhge3h2x
/zQAniXMAe0k1f6zbNEUFueMJM0MT738
=O4Jp
-----END PGP SIGNATURE-----

--xa9f45Qb6lv8AimG--
