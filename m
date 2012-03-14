Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S7jwj-0005Jq-7y
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 09:52:37 +0100
Received: by wibhj13 with SMTP id hj13so1865895wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 01:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tNF9IpW83LhK+uF5PsKHpdMmVfWznwHSDwkDx/h5BXQ=;
	b=0kyD7obalKCB1jLz3D/qv58KM5BtWDZFZI6PdlY7qtm7EsvCMAV7/+a4Y0Le77F46t
	q4qEgS2Anc9G1QPIyqiQFRzo+qI4P0cmnCEPdPAZilshjYTHI5/BU/X96aKEaAEQRrtk
	Q7FcP1/XPJ2TFdWVZWv1tM6cRRoE50s0bKwtSttqEvoVkl8jOF+SlCfZJw4hkc2dceLB
	jkgi05giAyXOuPCGvdQJexnJcfcBQ6Mir5BBy4kMD7NR/MlnAC/UVSDkkzndp/JORQ/L
	DB1jM0YhnxrChnBMGtkfJNznI3FaqoCkjUVKo8PHKbJAZBL2csFtLokjCujpSXvwTxse
	zM+Q==
Received: by 10.216.134.205 with SMTP id s55mr1001850wei.100.1331714632234;
	Wed, 14 Mar 2012 01:43:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j3sm13965908wiw.1.2012.03.14.01.43.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Mar 2012 01:43:51 -0700 (PDT)
Date: Wed, 14 Mar 2012 09:43:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120314084349.GE3919@jama.jama.net>
References: <cover.1331713807.git.sgw@linux.intel.com>
	<81cd435ddb8a75dd1d8a0d559467bcb95621aaa7.1331713807.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <81cd435ddb8a75dd1d8a0d559467bcb95621aaa7.1331713807.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 07/14] python: package static libraries correctly in -staticdev
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
X-List-Received-Date: Wed, 14 Mar 2012 08:52:37 -0000
X-Groupsio-MsgNum: 18785
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7LkOrbQMr4cezO2T"
Content-Disposition: inline

--7LkOrbQMr4cezO2T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 14, 2012 at 01:33:18AM -0700, Saul Wold wrote:
> WARNING: QA Issue: non -staticdev package contains static .a library: pyt=
hon-distutils path '/work/i586-poky-linux/python-2.7.2-r1.7/packages-split/=
python-distutils/usr/lib/python2.7/config/libpython2.7.a'
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../python/python-2.7-manifest.inc                 |    6 +++++-
>  meta/recipes-devtools/python/python_2.7.2.bb       |    2 +-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/=
recipes-devtools/python/python-2.7-manifest.inc
> index e4017ba..5f8b7cf 100644
> --- a/meta/recipes-devtools/python/python-2.7-manifest.inc
> +++ b/meta/recipes-devtools/python/python-2.7-manifest.inc

Please change this in scripts/contrib/python/generate-manifest-2.7.py=20
and regenerate python-2.7-manifest.inc with that

python-2.7-manifest.inc:
# WARNING: This file is AUTO GENERATED: Manual edits will be lost next time=
 I regenerate the file.
# Generator: 'scripts/contrib/python/generate-manifest-2.7.py' Version 2011=
0222.2 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
# Visit the Python for Embedded Systems Site =3D> http://www.Vanille.de/pro=
jects/python.spy

> @@ -7,7 +7,7 @@
> =20
>  PROVIDES+=3D"${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compi=
le ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${P=
N}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${=
PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}=
-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json $=
{PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN=
}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickl=
e ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readl=
ine ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 =
${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-ter=
minal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unitt=
est ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
> =20
> -PACKAGES=3D"${PN}-dbg ${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${=
PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-c=
types ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-d=
ifflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fc=
ntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${P=
N}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-=
mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${=
PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${=
PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}=
-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog =
${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${=
PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-module=
s"
> +PACKAGES=3D"${PN}-dbg ${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${=
PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-c=
types ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-d=
ifflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-elemen=
ttree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idl=
e ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${=
PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-=
netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profi=
le ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${P=
N}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN=
}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-=
threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlr=
pc ${PN}-zlib ${PN}-modules"
> =20
>  DESCRIPTION_${PN}-2to3=3D"Python Automated Python 2 to 3 code translatio=
n"
>  RDEPENDS_${PN}-2to3=3D"${PN}-core"
> @@ -78,6 +78,10 @@ DESCRIPTION_${PN}-distutils=3D"Python Distribution Uti=
lities"
>  RDEPENDS_${PN}-distutils=3D"${PN}-core"
>  FILES_${PN}-distutils=3D"${libdir}/python2.7/config ${libdir}/python2.7/=
distutils "
> =20
> +DESCRIPTION_${PN}-distutils-staticdev=3D"Python Distribution Utilities (=
Static Libraries)"
> +RDEPENDS_${PN}-distutils-staticdev=3D"${PN}-distutils"
> +FILES_${PN}-distutils-staticdev=3D"${libdir}/python2.7/config/lib*.a"
> +
>  DESCRIPTION_${PN}-doctest=3D"Python framework for running examples in do=
cstrings."
>  RDEPENDS_${PN}-doctest=3D"${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-=
unittest ${PN}-debugger ${PN}-difflib"
>  FILES_${PN}-doctest=3D"${libdir}/python2.7/doctest.* "
> diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-=
devtools/python/python_2.7.2.bb
> index b14b82e..d2100be 100644
> --- a/meta/recipes-devtools/python/python_2.7.2.bb
> +++ b/meta/recipes-devtools/python/python_2.7.2.bb
> @@ -1,7 +1,7 @@
>  require python.inc
>  DEPENDS =3D "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
>  DEPENDS_sharprom =3D "python-native db readline zlib gdbm openssl"
> -PR =3D "${INC_PR}.7"
> +PR =3D "${INC_PR}.8"
> =20
>  DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
>  DISTRO_SRC_URI_linuxstdbase =3D ""
> --=20
> 1.7.7.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7LkOrbQMr4cezO2T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9gWkUACgkQN1Ujt2V2gBxiCwCgka6FWqhhc5hjXlgXlsW6Ubka
ujAAn30EM+9c3YV55GxzX1xX/8DZJOi6
=EcFW
-----END PGP SIGNATURE-----

--7LkOrbQMr4cezO2T--
