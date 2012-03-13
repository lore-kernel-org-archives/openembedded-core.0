Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S7UR0-0001Je-Td
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 17:18:54 +0100
Received: by eaae1 with SMTP id e1so343255eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 09:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/zwBRYFAfDlkPgzCrN+iAfS74jMVvdGupCdAZXBgMTo=;
	b=xTn2rHpCpYsx6HPGBZ5Vtsv2DJTQ64S3ihDfEXgcuvhF3QdhrTxcGBWElGOTXC6cPD
	YDrwYaSPc3ZQmBfca4WxTAoHbJL95B1KxLbnkOmigkYJwmf4inhCTXfyKdCoCDms2Zmx
	OKx2wgcT0bNEFeVNOrHM1b8MGYlH9Tgh7GoJMjOHxaGkywa5CKSgZOXo83c89NIuL7Ib
	yOhUOuqWaY8sUQkBk7VAtO09F3kGiF3klVkyJl9i/Mo2l7f2h114stUXA/Z1pHVvMVDl
	drqE5rcsYiKfccVf3vFXrMS1Tm3JuK2821MiYL6KiErzfNa2+UA9ZhlLFDlDNvSZ4jIJ
	u04Q==
Received: by 10.213.17.14 with SMTP id q14mr1271078eba.273.1331655001399;
	Tue, 13 Mar 2012 09:10:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s48sm3445367eem.0.2012.03.13.09.09.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Mar 2012 09:10:00 -0700 (PDT)
Date: Tue, 13 Mar 2012 17:09:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120313160956.GE3861@jama.jama.net>
References: <1331651240.17122.4.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1331651240.17122.4.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] libxlst: Fix unpackaged directory warning
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
X-List-Received-Date: Tue, 13 Mar 2012 16:18:55 -0000
X-Groupsio-MsgNum: 18713
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qp4W5+cUSnZs0RIF"
Content-Disposition: inline

--qp4W5+cUSnZs0RIF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 13, 2012 at 03:07:20PM +0000, Richard Purdie wrote:
> Fixes the warning:

Typo in subject
-libxlst:
+libxslt:

>=20
> WARNING: For recipe libxslt, the following files/directories were install=
ed but not shipped in any package:
> WARNING:   /usr/lib/libxslt-plugins
>=20
> It makes sense for the package to own the plugins directory.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-support/libxslt/libxslt_1.1.26.bb b/meta/recipe=
s-support/libxslt/libxslt_1.1.26.bb
> index f3e806d..8986e20 100644
> --- a/meta/recipes-support/libxslt/libxslt_1.1.26.bb
> +++ b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D0cd9a07afbeb=
24026c9b03aecfeba458"
> =20
>  SECTION =3D "libs"
>  DEPENDS =3D "libxml2"
> -PR =3D "r6"
> +PR =3D "r7"
> =20
>  SRC_URI =3D "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
>             file://pkgconfig_fix.patch"
> @@ -24,6 +24,7 @@ RPROVIDES_${PN}-bin +=3D "${PN}-utils"
>  RCONFLICTS_${PN}-bin +=3D "${PN}-utils"
>  RREPLACES_${PN}-bin +=3D "${PN}-utils"
> =20
> +FILES_${PN} +=3D "${libdir}/libxslt-plugins"
>  FILES_${PN}-dev +=3D "${libdir}/xsltConf.sh"
> =20
>  BBCLASSEXTEND =3D "native"
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qp4W5+cUSnZs0RIF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9fcVMACgkQN1Ujt2V2gBxtgQCfaCaqeZBKg0VQAsSExGt/w/N2
gjUAoJmdZNhiTZmT9UHBuRygXSH2tPnO
=fAJX
-----END PGP SIGNATURE-----

--qp4W5+cUSnZs0RIF--
