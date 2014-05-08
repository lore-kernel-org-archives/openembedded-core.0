Return-Path: <martin.jansa@gmail.com>
Received: from mail-pa0-f41.google.com (unknown [209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id B1A1265F09
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 10:56:27 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id lj1so2706927pab.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 03:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IlqCHZdXHlr4WMVP4T8VkVoXFnT3fuQfKRFk2XFDw8w=;
	b=pFdzpB8dCGAZ7KydkP7eLn2QNSxz24QivPfuEmH7PRRVzi+OarVCXUQiEvY3+QzGeE
	JceNcXhX5dDV3So/RQAgpbRW+u29ZD6wiM0BolyIPtHYDWB+e0YPk/SA0WXI+3tdt6SD
	2PtpEfaHYi4NX0v624GY2N36V4b3yRIymc5oAHgqyvdQwst8+Vmseyct2OtP/ZCMFuG9
	NUplSwJDvKCE7SeVS0pLfaBlVS37gJUZDYjH38xtBcZ6O3EQSMjSNbx2dWlmcxQPytBl
	pDfTrhWJnwUtW4KDcKpHYyH+wBTp1tStJQ6deGAbkKw2yXV/CC/fWJNMgPGQ406AwfY5
	tSiw==
X-Received: by 10.66.65.169 with SMTP id y9mr6041895pas.145.1399546219086;
	Thu, 08 May 2014 03:50:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	qp12sm2961616pab.47.2014.05.08.03.50.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 May 2014 03:50:18 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 May 2014 12:50:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Petter =?iso-8859-1?Q?Mab=E4cker?= <petter@technux.se>
Message-ID: <20140508105039.GO30955@jama>
References: <cover.1399497346.git.petter@technux.se>
	<f9d97da2b459cde8ed023d1f130b1af580eb436e.1399497346.git.petter@technux.se>
MIME-Version: 1.0
In-Reply-To: <f9d97da2b459cde8ed023d1f130b1af580eb436e.1399497346.git.petter@technux.se>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 08/13] linuxdoc-tools: remove usage of FILESPATH
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
X-List-Received-Date: Thu, 08 May 2014 10:56:27 -0000
X-Groupsio-MsgNum: 52972
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IpgPcFyQO6wM49Um"
Content-Disposition: inline

--IpgPcFyQO6wM49Um
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 11:19:54PM +0200, Petter Mab=E4cker wrote:
> Fixes [YOCTO #4497]
>=20
> Usage of FILESPATH is discouraged, since it can make recipes harder to
> bbappend. Instead FILESEXTRAPATHS should be used to extend the path.
>=20
> Signed-off-by: Petter Mab=E4cker <petter@technux.se>
> ---
>  .../linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0=
=2E9.69.bb b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9=
=2E69.bb
> index fce4178..4f908c3 100644
> --- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
> +++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
> @@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D077ef64ec3ac25=
7fb0d786531cf26931"
> =20
>  DEPENDS =3D "groff-native openjade-native"
> =20
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/linuxdoc-tools-native:"

Please use

git mv meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native meta/reci=
pes-devtools/linuxdoc-tools/linuxdoc-tools

instead

> =20
>  SRC_URI =3D "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/linuxdoc-tools_${PV}=
=2Eorig.tar.gz \
>             file://disable_sgml2rtf.patch \
> @@ -15,8 +16,6 @@ SRC_URI =3D "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/lin=
uxdoc-tools_${PV}.orig.tar.
>  SRC_URI[md5sum] =3D "1d13d500918a7a145b0edc2f16f61dd1"
>  SRC_URI[sha256sum] =3D "7103facee18a2ea97186ca459d743d22f7f89ad4b5cd1dfd=
1c34f83d6bfd4101"
> =20
> -FILESPATH =3D "${FILE_DIRNAME}/linuxdoc-tools-native/"
> -
>  inherit autotools-brokensep native
> =20
>  do_configure () {
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

--IpgPcFyQO6wM49Um
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNrYX8ACgkQN1Ujt2V2gBwHTACfRpre0CaSt4KSzXpGgKi85G3J
wf4AoKsZScKjhif8VSngKQsDKMn6Oowi
=JMPt
-----END PGP SIGNATURE-----

--IpgPcFyQO6wM49Um--
