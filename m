Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SoKMS-00024Z-UU; Mon, 09 Jul 2012 22:15:13 +0200
Received: by wgbdr1 with SMTP id dr1so10781827wgb.24
	for <multiple recipients>; Mon, 09 Jul 2012 13:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=keyNbFaDHDbD1R4JgS2ytefFqXbbfQDf7HdO5fOjCps=;
	b=v7KOBbc1xWwuI3eiUdj4JeDyTYfkDf9u56xl6OyUfMYfz5lU7SOhecEVKw+zfWhe0d
	QcanJgvVVYQglJ8y/rNilOE6kGuy1dP1xEAZ++F1wNgcpEXMX1vKCfL//qrZuE1RFwPW
	gcl6gYEocBb3cToBArExfiwxgmCfd7GrqbWBzA2Z58P4mFJWPvUPDMNib1lhgMyRrSDJ
	1XcTTu2mqLQrB9ZWAOYiShs2LF4UPUVIS5GYMaDlmrO4q9l6Q1WhjIk/NJwls8SSjskP
	1nBIoVezhgQ5V3jYlJS9aUgklBla2GHwuIA2fu9FyssvdnzFQn6dro5iMB/pCeTHVsdm
	5UzQ==
Received: by 10.180.86.106 with SMTP id o10mr32103493wiz.22.1341864242045;
	Mon, 09 Jul 2012 13:04:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm15651316wib.6.2012.07.09.13.04.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jul 2012 13:04:00 -0700 (PDT)
Date: Mon, 9 Jul 2012 22:03:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120709200357.GG6308@jama.jama.net>
References: <20120709160054.C9FA610219@opal>
MIME-Version: 1.0
In-Reply-To: <20120709160054.C9FA610219@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : connman: ship the empty plugins directory in the connman package
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
X-List-Received-Date: Mon, 09 Jul 2012 20:15:13 -0000
X-Groupsio-MsgNum: 25005
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MiFvc8Vo6wRSORdP"
Content-Disposition: inline

--MiFvc8Vo6wRSORdP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 09, 2012 at 04:00:54PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 8a307af8253a5fdff51515fe01ef7b527fdad89f
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D8a307af8253a5fdff51515fe01ef7b527fdad89f
>=20
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Fri Jul  6 12:05:42 2012 +0100
>=20
> connman: ship the empty plugins directory in the connman package
>=20
> Otherwise we get a QA warning that /usr/lib/connman/packages isn't shippe=
d.

both patches from Ross in this batch are missing SOB lines.

Ross: please make sure you add them in future patches
sgw: maybe you're using different flow then RP for merging patches, but
your SOB should be there too IMHO.

Cheers,

>=20
> ---
>=20
>  meta/recipes-connectivity/connman/connman.inc |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes=
-connectivity/connman/connman.inc
> index 73e7818..12378e9 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -20,7 +20,7 @@ DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls \
>              ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
>              "
> =20
> -INC_PR =3D "r10"
> +INC_PR =3D "r11"
> =20
>  TIST =3D "--enable-tist"
>  TIST_powerpc =3D ""
> @@ -99,7 +99,7 @@ python populate_packages_prepend() {
>  	hook =3D lambda file,pkg,b,c,d:packages.append((file,pkg))
>  	plugin_dir =3D d.expand('${libdir}/connman/plugins/')
>  	plugin_name =3D d.expand('${PN}-plugin-%s')
> -	do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, '${PN} plugi=
n for %s', extra_depends=3D'', hook=3Dhook )
> +	do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, '${PN} plugi=
n for %s', extra_depends=3D'', hook=3Dhook, prepend=3DTrue )
>  	for (file, package) in packages:
>  		plugintype =3D package.split( '-' )[-1]
>  		if plugintype in depmap:
> @@ -116,6 +116,7 @@ FILES_${PN}-tests =3D "${bindir}/*-test ${libdir}/${B=
PN}/test/*"
>  RDEPENDS_${PN}-tests =3D "python-dbus"
> =20
>  FILES_${PN} =3D "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*=
=2Eso.* \
> +            ${libdir}/connman/plugins \
>              ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>              ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${da=
tadir}/${PN} \
>              ${datadir}/dbus-1/system-services/*"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MiFvc8Vo6wRSORdP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/7OS0ACgkQN1Ujt2V2gByBrgCgkgzaP/Torp6h+hRyhjgFEhnD
dAoAoLrAjPqO0CBEX9SknwSukSmII6RT
=4vFk
-----END PGP SIGNATURE-----

--MiFvc8Vo6wRSORdP--
