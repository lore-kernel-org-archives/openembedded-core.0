Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SIfps-00006L-FH
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 14:42:44 +0200
Received: by wera1 with SMTP id a1so1918617wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 05:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pGcJPIQN0a24M3j/HKPfHTpm1EP7IXjKdnVkQeMInFE=;
	b=dQEEJmLy2BA8vTocNoGZ3b77lyDy7Weqc6N8t0L7e/tWRnl+dPTM2Se6+KrmvzqdMv
	EVdyJPzHKWjHGvU1uU0r1lUw9viH08+zyiOtVkVwu1w6hlwR1S/k7SKVA6xt6vZPTthI
	Hkq0EqdFIS8wuM3hJvoBDfeXrbbQhntg4RULnuEenna+VEi1Pma3XxTZrjrMZSn96sza
	TpexG4K0hazSs7bo+8rzi3NQi/dn8uabDZzn6PUMNjwbSgkA98CVMB3/CQi6P8NtKL1w
	j05GIwKaVsj5IY6RA/XQr9TmXTC8f/39hy8bdOTuQQ2LG/cH6yweR1K/7oh4yjnujFaM
	AwHw==
Received: by 10.180.107.104 with SMTP id hb8mr4293966wib.8.1334320403424;
	Fri, 13 Apr 2012 05:33:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ea6sm4484162wib.5.2012.04.13.05.33.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Apr 2012 05:33:22 -0700 (PDT)
Date: Fri, 13 Apr 2012 14:33:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120413123322.GE3651@jama.jama.net>
References: <cover.1334313002.git.andrei@gherzan.ro>
	<f00043fa865b36ddb4f6ac18aa917f812d1f4884.1334313002.git.andrei@gherzan.ro>
MIME-Version: 1.0
In-Reply-To: <f00043fa865b36ddb4f6ac18aa917f812d1f4884.1334313002.git.andrei@gherzan.ro>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [V5 2/2] PR bump packages with gdbm in DEPENDS
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
X-List-Received-Date: Fri, 13 Apr 2012 12:42:44 -0000
X-Groupsio-MsgNum: 20703
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7CZp05NP8/gJM8Cl"
Content-Disposition: inline

--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 13, 2012 at 01:34:19PM +0300, Andrei Gherzan wrote:
> This is done because of this change in gdbm:
> "gdbm: Package compat libs in gdbm-compat"
>=20
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

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
> index d1d0d83..0a1708a 100644
> --- a/meta/recipes-devtools/python/python_2.7.2.bb
> +++ b/meta/recipes-devtools/python/python_2.7.2.bb
> @@ -1,6 +1,6 @@
>  require python.inc
>  DEPENDS =3D "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
> -PR =3D "${INC_PR}.10"
> +PR =3D "${INC_PR}.11"
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

--7CZp05NP8/gJM8Cl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+IHRIACgkQN1Ujt2V2gBy5ZACgliYHfzWPYaJsF/1DcfpG+YWu
s4EAn12s4jAZ5QIcjXSuwSGEJeQhBm60
=a7/g
-----END PGP SIGNATURE-----

--7CZp05NP8/gJM8Cl--
