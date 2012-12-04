Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Tfoyr-0008Sg-Mg; Tue, 04 Dec 2012 10:39:57 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2070487eek.6
	for <multiple recipients>; Tue, 04 Dec 2012 01:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=s0dBwERnzoyUBwEiMz0VQtjtlCjxjXkt0UkssF61rl0=;
	b=U0qARxoxQJteQh3LSl1XTEHmF1ToKU2FrFpFvqQlbxl9c4LIUJ0Ce84WwKpGsruz5Y
	C2bS6iMl267044u9Vps5Yc3kVsK93OlNDKAZzCGk6TWlW5auuWZETVchl10SftHJW+sg
	3brpn+7zt4kIflDsCSKsTIrTDCudGOjf8AofQRJwh5vV0OBVLYjzXrx6PHnjFnbtU9fp
	eVVA+A9ZnlHScN11qwkBFJyE0UFq8FFfDfawsWoXUVGa5TuYgKq6LJ/VY5+52PsXv+tc
	tUUzQEoXXgvxv2fWglJBmMUXLa9QR3Zl+Eadg7ytpsvhONySCOpdRF18PDNjW0XLeed+
	TDAg==
Received: by 10.14.199.5 with SMTP id w5mr20800445een.31.1354613135351;
	Tue, 04 Dec 2012 01:25:35 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v46sm1526113eep.1.2012.12.04.01.25.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 01:25:34 -0800 (PST)
Date: Tue, 4 Dec 2012 10:25:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Zhenhua Luo <b19537@freescale.com>
Message-ID: <20121204092530.GA14870@jama.jama.net>
References: <20121203144922.E2C7010361@opal>
MIME-Version: 1.0
In-Reply-To: <20121203144922.E2C7010361@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Zhenhua Luo : libxml2: add --with-fexceptions in configure flags to support exception handling in C++ programs
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
X-List-Received-Date: Tue, 04 Dec 2012 09:39:57 -0000
X-Groupsio-MsgNum: 32137
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline

--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 03, 2012 at 02:49:22PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: ff5552a8432298c32aec2ace72656b0d7059dad3
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dff5552a8432298c32aec2ace72656b0d7059dad3
>=20
> Author: Zhenhua Luo <b19537@freescale.com>
> Date:   Fri Nov 30 08:31:57 2012 +0000
>=20
> libxml2: add --with-fexceptions in configure flags to support exception h=
andling in C++ programs
>=20
> Without this flag, the library has a problem with C++ programs using exce=
ption handling.
>=20
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-core/libxml/libxml2.inc |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/lib=
xml/libxml2.inc
> index 9ec507b..615c89e 100644
> --- a/meta/recipes-core/libxml/libxml2.inc
> +++ b/meta/recipes-core/libxml/libxml2.inc
> @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D "file://Copyright;md5=3Dbb90c4892631=
6d9af6e2d70ca7013ade \
>                      file://list.c;beginline=3D4;endline=3D13;md5=3Dcdbfa=
3dee51c099edb04e39f762ee907 \
>                      file://trio.c;beginline=3D5;endline=3D14;md5=3D6c025=
753c86d958722ec76e94cae932e"
> =20
> +INC_PR =3D "r1"
> +

This does not help at all.

opembedded-core/meta/recipes-core/libxml $ grep -R PR.=3D .
=2E/libxml2.inc:INC_PR =3D "r1"
=2E/libxml2_2.9.0.bb:PR =3D "r0"

Change PR in ./libxml2_2.9.0.bb to PR =3D "${INC_PR}.0" if you want to use
INC_PR.

Cheers,

>  DEPENDS_class-native =3D "python-native"
>  DEPENDS =3D+ "zlib"
> =20
> @@ -24,7 +26,7 @@ do_configure_prepend () {
>  	sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.in
>  }
> =20
> -EXTRA_OECONF =3D "--without-python --without-debug --without-legacy --wi=
thout-catalog --without-docbook --with-c14n --without-lzma"
> +EXTRA_OECONF =3D "--without-python --without-debug --without-legacy --wi=
thout-catalog --without-docbook --with-c14n --without-lzma --with-fexceptio=
ns"
>  EXTRA_OECONF_class-native =3D "--with-python=3D${STAGING_BINDIR}/python =
--without-legacy --with-catalog --without-docbook --with-c14n --without-lzm=
a"
>  EXTRA_OECONF_class-nativesdk =3D "--with-python=3D${STAGING_BINDIR}/pyth=
on --without-legacy --with-catalog --without-docbook --with-c14n --without-=
lzma"
>  EXTRA_OECONF_linuxstdbase =3D "--without-python --with-debug --with-lega=
cy --with-catalog --with-docbook --with-c14n --without-lzma"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC9wYoACgkQN1Ujt2V2gBzvUwCfQt1xml9BXr2ktT+3gCjwEB+Y
x8AAnRrNu31NTf8c86uEXyv4w6telCgJ
=3AgH
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
