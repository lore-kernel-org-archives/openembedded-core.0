Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SIbcQ-00035v-W8
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 10:12:35 +0200
Received: by wgbdr12 with SMTP id dr12so2308757wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 01:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=M4gIocFDoUmt6E9rmsDpMH5MGKJ5D/jFrUFXaq/KF/Q=;
	b=zLfawGWCaWYmyat8nyaP3Fd+X++qaZSVFAkmhmtfPNF3cAQkw67K8B83t7x+J0e/NS
	J3ChjYCoq12KRSDkPLp/Tju8DYFSPTn3k3y0lqCmmdJgQk5po9mhk/9h2ZIwEHhfy7bt
	qxxKDkmD3K6HM/tlx9524ZPfP7xYR4RsYNyz7Y45VDPtZ+/L1qIdCpqacXijKLUc+ito
	PkMf6qBMwUc7DjNS7YBcvXbUaBaW/jMSsWIH42UUWUkadgRHhUA/HNBMIiz47tC6kp03
	Ooubm1QGrxoN8GTzAdgMaYC56ravZRI45/z51++XsRlVqJYVpjqvtAXB+W4J3k7FvE8c
	iNIA==
Received: by 10.180.85.70 with SMTP id f6mr2412731wiz.5.1334304194139;
	Fri, 13 Apr 2012 01:03:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b3sm3037079wib.4.2012.04.13.01.03.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Apr 2012 01:03:12 -0700 (PDT)
Date: Fri, 13 Apr 2012 10:03:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120413080312.GB3651@jama.jama.net>
References: <cover.1334159446.git.andrei@gherzan.ro>
	<a9b864635df3ef1e7c3ceeeb05adc491d4e5b97b.1334159446.git.andrei@gherzan.ro>
MIME-Version: 1.0
In-Reply-To: <a9b864635df3ef1e7c3ceeeb05adc491d4e5b97b.1334159446.git.andrei@gherzan.ro>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [V4 2/2] PR bump packages with gdbm in DEPENDS
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
X-List-Received-Date: Fri, 13 Apr 2012 08:12:35 -0000
X-Groupsio-MsgNum: 20684
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline

--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 11, 2012 at 06:54:14PM +0300, Andrei Gherzan wrote:
> This is done because of this change in gdbm:
> "gdbm: Package compat libs in gdbm-compat"
>=20
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  meta/recipes-devtools/perl/perl_5.14.2.bb          |    2 +-
>  meta/recipes-devtools/python/python_2.7.2.bb       |    2 +-
>  .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
>  meta/recipes-support/apr/apr-util_1.4.1.bb         |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-dev=
tools/perl/perl_5.14.2.bb
> index 92ca9b8..8f3ad25 100644
> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://Copying;md5=3D2b4c6ffbcfcbde=
e469f02565f253d81a \
>  # We need gnugrep (for -I)
>  DEPENDS =3D "virtual/db grep-native"
>  DEPENDS +=3D "gdbm zlib"
> -PR =3D "r4"
> +PR =3D "r5"
> =20
>  # 5.10.1 has Module::Build built-in
>  PROVIDES +=3D "libmodule-build-perl"
> diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-=
devtools/python/python_2.7.2.bb
> index a3a2c96..00a5558 100644
> --- a/meta/recipes-devtools/python/python_2.7.2.bb
> +++ b/meta/recipes-devtools/python/python_2.7.2.bb
> @@ -1,6 +1,6 @@
>  require python.inc
>  DEPENDS =3D "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
> -PR =3D "${INC_PR}.14"
> +PR =3D "${INC_PR}.15"

This does not apply

current PR is:
PR =3D "${INC_PR}.10"
http://git.openembedded.org/openembedded-core/log/meta/recipes-devtools/pyt=
hon/python_2.7.2.bb

so no idea where you got 'PR =3D "${INC_PR}.14"'

Cheers,

> =20
>  DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
>  DISTRO_SRC_URI_linuxstdbase =3D ""
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb b/meta/=
recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
> index e98a591..fd61149 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
> @@ -1,6 +1,6 @@
>  require pulseaudio.inc
> =20
> -PR =3D "r7"
> +PR =3D "r8"
> =20
>  DEPENDS +=3D "libjson gdbm speex libxml-parser-perl-native"
> =20
> diff --git a/meta/recipes-support/apr/apr-util_1.4.1.bb b/meta/recipes-su=
pport/apr/apr-util_1.4.1.bb
> index 029cf7e..deb608f 100644
> --- a/meta/recipes-support/apr/apr-util_1.4.1.bb
> +++ b/meta/recipes-support/apr/apr-util_1.4.1.bb
> @@ -9,7 +9,7 @@ LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D519e0a18e03f7c023070568c14b07=
7bb \
>                      file://include/apu_version.h;endline=3D17;md5=3D8066=
85a84e71f10c80144c48eb35df42"
> =20
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
>             file://configfix.patch \
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+H3cAACgkQN1Ujt2V2gBwYEwCfcrhWpcnE/0XATAsjsM+700CQ
b9kAn1n5JP8HhEN0a5NTH5Qn1N3eFQr4
=V7Cn
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
