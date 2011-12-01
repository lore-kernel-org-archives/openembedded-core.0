Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW9Az-00046p-2F
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 17:07:57 +0100
Received: by bkbzv15 with SMTP id zv15so1858907bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 08:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EOF1rvQX6CBFs3+raVOvBvygqOTAFmNbKVa4sO/XtaM=;
	b=wGAjAf+QZ34p/TpAvDuWQ99x01SUH14PZ0N9Oh43X3ZUpFhAnyLj/11LaFjKPvJvNn
	D02fswYHxwmx5Ssz9KAKRXsWyACxZ7BsKV0lOuR87tZ4d5hgye7ADTFtarZ8IJg7AZTy
	pELW/ocM3zCnaW3/++H9pBnRdZca1CEeGje2E=
Received: by 10.204.148.75 with SMTP id o11mr8167909bkv.95.1322755263393;
	Thu, 01 Dec 2011 08:01:03 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d2sm12190888bky.11.2011.12.01.08.01.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 08:01:02 -0800 (PST)
Date: Thu, 1 Dec 2011 17:01:00 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111201160100.GD32202@jama.jama.net>
References: <1322754516-32720-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1322754516-32720-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH v2] zlib 1.2.5: install pkgconfig file, needed for e.g. modern webkit
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
X-List-Received-Date: Thu, 01 Dec 2011 16:07:57 -0000
X-Groupsio-MsgNum: 13455
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AbQceqfdZEv+FvjW"
Content-Disposition: inline

--AbQceqfdZEv+FvjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2011 at 04:48:36PM +0100, Koen Kooi wrote:
> Upstream has grown cmake support which would allow us to dump the OE auto=
tools hack, but the cmakefile doesn't install the .pc file either and break=
s with zlib-native
>=20
> Also remove unused site config file

^^ this is not true anymore..

>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-core/zlib/zlib_1.2.5.bb |   18 ++++++++++++++++--
>  1 files changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/zlib/zlib_1.2.5.bb b/meta/recipes-core/zli=
b/zlib_1.2.5.bb
> index bca400c..b5756d9 100644
> --- a/meta/recipes-core/zlib/zlib_1.2.5.bb
> +++ b/meta/recipes-core/zlib/zlib_1.2.5.bb
> @@ -7,12 +7,12 @@ LICENSE =3D "Zlib"
>  LIC_FILES_CHKSUM =3D "file://zlib.h;beginline=3D4;endline=3D23;md5=3D084=
e9c30e4e6272c3b057b13c6467f3d"
> =20
>  DEPENDS =3D "libtool-cross"
> -PR =3D "r1"
> +PR =3D "r3"
> =20
>  SRC_URI =3D "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
>             file://configure.ac \
>             file://Makefile.am \
> -	   file://fix.inverted.LFS.logic.patch"
> +           file://fix.inverted.LFS.logic.patch"
> =20
>  SRC_URI[md5sum] =3D "be1e89810e66150f5b0327984d8625a0"
>  SRC_URI[sha256sum] =3D "239aead2f22f16bfcfa6a6a5150dcbd6d6f2e4d1eaa8727b=
5769ea014120b307"
> @@ -24,4 +24,18 @@ do_configure_prepend () {
>  	cp ${WORKDIR}/Makefile.am ${S}/
>  }
> =20
> +do_install_append () {
> +	sed \
> +		-e 's:@prefix@:${prefix}:' \
> +		-e 's:@exec_prefix@:${exec_prefix}:' \
> +		-e 's:@libdir@:${libdir}:' \
> +		-e 's:@sharedlibdir@:${libdir}:' \
> +		-e 's:@includedir@:${includedir}:' \
> +		-e 's:@VERSION@:${PV}:' \
> +		zlib.pc.in > zlib.pc
> +
> +	install -d ${D}${libdir}/pkgconfig
> +	install -m 0644 zlib.pc ${D}${libdir}/pkgconfig/
> +}
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AbQceqfdZEv+FvjW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7XpLwACgkQN1Ujt2V2gBwUvACggLCOP9fWje45s+HJ8kdRVoO0
r9cAoLwKxoEDzwNZeNKycBaPqZRZGuh9
=rFH8
-----END PGP SIGNATURE-----

--AbQceqfdZEv+FvjW--
