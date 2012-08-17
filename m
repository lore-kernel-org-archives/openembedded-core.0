Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T2MUt-00060r-2p
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:21:55 +0200
Received: by wgbdr1 with SMTP id dr1so2986365wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 06:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=d5YbXrjyPzetVuhKuWGEw3udY7gcZelJdW5ZESCDLKE=;
	b=ElyHCcrBQ9KDy4H9aFodjWS3cMjdzGRRtd6E82PzwNo6Hw8Dfu/3bBZbuT4ySikABF
	EpS7JPL9kNYa86JWWgtxUFu6HT+/geC4rYGHr2Tvuy5KvM7u1kWZF0Pp+JQFIJ/CO863
	oB0EYbthQTAy1bKFL4LP34qQsV1Ja0IFyU2nZHCNR61adk43Wvf6DvABer6HbvVtdaIv
	1LJfVZBFyNZItcKXFP3xX3/yDo0Epp5/Szrzp5DV1EmiIrgnXibAbMfpkC89T9fcO1me
	lQj03I6f/AZFG2+tcvkMMtKVc5L/wxXt6tQKgULbsFXGL07gQl8OdTsdqSNR5BtORoGS
	hr/Q==
Received: by 10.180.95.193 with SMTP id dm1mr4885619wib.10.1345208996580;
	Fri, 17 Aug 2012 06:09:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j6sm14487410wiy.4.2012.08.17.06.09.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 06:09:55 -0700 (PDT)
Date: Fri, 17 Aug 2012 15:09:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120817130953.GN3625@jama.jama.net>
References: <cover.1345208249.git.andrei.gherzan@windriver.com>
	<f3b626bf0865fc3fbccb898723f162f900aa244f.1345208249.git.andrei.gherzan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <f3b626bf0865fc3fbccb898723f162f900aa244f.1345208249.git.andrei.gherzan@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH 1/2] python-dbus: Native dbus python module needed for dbus tests
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
X-List-Received-Date: Fri, 17 Aug 2012 13:21:55 -0000
X-Groupsio-MsgNum: 27726
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GOzekVbrLdOLv44p"
Content-Disposition: inline

--GOzekVbrLdOLv44p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2012 at 04:05:00PM +0300, Andrei Gherzan wrote:
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> ---
>  meta/recipes-devtools/python/python-dbus_1.1.1.bb |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python-dbus_1.1.1.bb b/meta/rec=
ipes-devtools/python/python-dbus_1.1.1.bb
> index 51d5bc2..35149a0 100644
> --- a/meta/recipes-devtools/python/python-dbus_1.1.1.bb
> +++ b/meta/recipes-devtools/python/python-dbus_1.1.1.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://www.freedesktop.org/Software/dbus"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df5612614133e9a2f2dad527d97554=
670"
>  DEPENDS =3D "expat dbus dbus-glib virtual/libintl python-pyrex-native"
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  SRC_URI =3D "http://dbus.freedesktop.org/releases/dbus-python/dbus-pytho=
n-${PV}.tar.gz"
> =20
> @@ -23,3 +23,6 @@ export STAGING_INCDIR
>  RDEPENDS_${PN} =3D "python-io python-logging python-stringold python-thr=
eading python-xml"
> =20
>  FILES_${PN}-dev +=3D "${libdir}/pkgconfig"
> +
> +RDEPENDS_${PN}_virtclass-native =3D "python"

Does RDEPENDS_${PN} work for native recipes? I thought that R* vars are
for runtime packages and native builds doesn't provide them imho.

And if they do, why not explicitly ask for python-native, because target py=
thon wont help I guess.

> +BBCLASSEXTEND =3D "native"
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

--GOzekVbrLdOLv44p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAuQqEACgkQN1Ujt2V2gBzx6QCfSn0UkqciMdC1du2ZybZcKA3d
t3oAn2tARjbh/w+bP0Dlml28eYPvFIP9
=vubt
-----END PGP SIGNATURE-----

--GOzekVbrLdOLv44p--
