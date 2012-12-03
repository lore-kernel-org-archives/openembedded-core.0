Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfRSf-0002j2-JB
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 09:33:10 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1016770eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 00:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=C6JqagzoSZHy7M+a2jkwkjK7ruNVyqD1sZ4JW6P03F0=;
	b=QcDubv7dMgacZeQk83u1Zd1eimMSxa7VWbiu/elnMX8K+BeYol1QtJWwQEfQ17SyBo
	6gT1fs0TMQJ04KZ8zCSOE4XiZ/OImG/XtbfNXC1SHfXHrzXfCMcLoJQNaMqzZsKyju09
	4H6YTPJsYgBAJlxJIWUqhCSggwdAtB3k95lqAG8NvLpIAFZRAI81QFSaAWyT8F72y5FU
	6HAAMl8J8TO62h06X+SxcjnSdL4JNKGXkfNcxdQblV0l2++9spkopOt+iamquKIxNLVs
	2f3XN70bpVaocvDEO3FIL901FHMNGTPssrKv7szYGYtCQB9m4C28gqnM68OG3FDY8GsM
	5rfg==
Received: by 10.14.178.196 with SMTP id f44mr33831367eem.14.1354522728775;
	Mon, 03 Dec 2012 00:18:48 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm29860821eeg.4.2012.12.03.00.18.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 00:18:47 -0800 (PST)
Date: Mon, 3 Dec 2012 09:18:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Qi.Chen@windriver.com
Message-ID: <20121203081842.GA3354@jama.jama.net>
References: <cover.1354265260.git.Qi.Chen@windriver.com>
	<df75410d0032ada41e657f6bd01a5d185281d541.1354265260.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <df75410d0032ada41e657f6bd01a5d185281d541.1354265260.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] qt4-native: make qt4-native work with long building path
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
X-List-Received-Date: Mon, 03 Dec 2012 08:33:10 -0000
X-Groupsio-MsgNum: 32076
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 03, 2012 at 09:55:23AM +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> If the TMPDIR has more than 256 chars, building qt4-native fails.
> This violates the 410 length limit of TMPDIR.
>=20
> This patch makes building qt4-native succeed with a long building
> path (410 for example) by extending its static arrays' sizes by
> 256 chars.
>=20
> [YOCTO #2766]
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...e-qt4-native-work-with-long-building-path.patch |   82 ++++++++++++++=
++++++
>  meta/recipes-qt/qt4/qt4-native.inc                 |    3 +-
>  2 files changed, 84 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-wo=
rk-with-long-building-path.patch
>=20
> diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-with=
-long-building-path.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-nat=
ive-work-with-long-building-path.patch
> new file mode 100644
> index 0000000..74f4e1a
> --- /dev/null
> +++ b/meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-with-long-b=
uilding-path.patch
> @@ -0,0 +1,83 @@
> +Upstream-Status: Pending

^ still bad Upstream-Status value, should be "Submitted"

Cheers,

> +
> +Make qt4-native work with long building path.
> +Reference: https://bugreports.qt-project.org/browse/QTBUG-28292
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +
> +Index: configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- a/configure
> ++++ b/configure
> +@@ -4764,8 +4764,8 @@ DEMOS_PATH_STR=3D`"$relpath/config.tests/unix/pads=
tring" 268 "qt_demopath=3D$QT_INST
> + TODAY=3D`date +%Y-%m-%d`
> + cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
> + /* License Info */
> +-static const char qt_configure_licensee_str          [256 + 12] =3D "$L=
ICENSE_USER_STR";
> +-static const char qt_configure_licensed_products_str [256 + 12] =3D "$L=
ICENSE_PRODUCTS_STR";
> ++static const char qt_configure_licensee_str          [512 + 12] =3D "$L=
ICENSE_USER_STR";
> ++static const char qt_configure_licensed_products_str [512 + 12] =3D "$L=
ICENSE_PRODUCTS_STR";
> +=20
> + /* Installation date */
> + static const char qt_configure_installation          [12+11]    =3D "qt=
_instdate=3D$TODAY";
> +@@ -4790,36 +4790,36 @@ if [ ! -z "$QT_HOST_PREFIX" ]; then
> +=20
> + #if defined(QT_BOOTSTRAPPED) || defined(QT_BUILD_QMAKE)
> + /* Installation Info */
> +-static const char qt_configure_prefix_path_str       [256 + 12] =3D "$H=
OSTPREFIX_PATH_STR";
> +-static const char qt_configure_documentation_path_str[256 + 12] =3D "$H=
OSTDOCUMENTATION_PATH_STR";
> +-static const char qt_configure_headers_path_str      [256 + 12] =3D "$H=
OSTHEADERS_PATH_STR";
> +-static const char qt_configure_libraries_path_str    [256 + 12] =3D "$H=
OSTLIBRARIES_PATH_STR";
> +-static const char qt_configure_binaries_path_str     [256 + 12] =3D "$H=
OSTBINARIES_PATH_STR";
> +-static const char qt_configure_plugins_path_str      [256 + 12] =3D "$H=
OSTPLUGINS_PATH_STR";
> +-static const char qt_configure_imports_path_str      [256 + 12] =3D "$H=
OSTIMPORTS_PATH_STR";
> +-static const char qt_configure_data_path_str         [256 + 12] =3D "$H=
OSTDATA_PATH_STR";
> +-static const char qt_configure_translations_path_str [256 + 12] =3D "$H=
OSTTRANSLATIONS_PATH_STR";
> +-static const char qt_configure_settings_path_str     [256 + 12] =3D "$H=
OSTSETTINGS_PATH_STR";
> +-static const char qt_configure_examples_path_str     [256 + 12] =3D "$H=
OSTEXAMPLES_PATH_STR";
> +-static const char qt_configure_demos_path_str        [256 + 12] =3D "$H=
OSTDEMOS_PATH_STR";
> ++static const char qt_configure_prefix_path_str       [512 + 12] =3D "$H=
OSTPREFIX_PATH_STR";
> ++static const char qt_configure_documentation_path_str[512 + 12] =3D "$H=
OSTDOCUMENTATION_PATH_STR";
> ++static const char qt_configure_headers_path_str      [512 + 12] =3D "$H=
OSTHEADERS_PATH_STR";
> ++static const char qt_configure_libraries_path_str    [512 + 12] =3D "$H=
OSTLIBRARIES_PATH_STR";
> ++static const char qt_configure_binaries_path_str     [512 + 12] =3D "$H=
OSTBINARIES_PATH_STR";
> ++static const char qt_configure_plugins_path_str      [512 + 12] =3D "$H=
OSTPLUGINS_PATH_STR";
> ++static const char qt_configure_imports_path_str      [512 + 12] =3D "$H=
OSTIMPORTS_PATH_STR";
> ++static const char qt_configure_data_path_str         [512 + 12] =3D "$H=
OSTDATA_PATH_STR";
> ++static const char qt_configure_translations_path_str [512 + 12] =3D "$H=
OSTTRANSLATIONS_PATH_STR";
> ++static const char qt_configure_settings_path_str     [512 + 12] =3D "$H=
OSTSETTINGS_PATH_STR";
> ++static const char qt_configure_examples_path_str     [512 + 12] =3D "$H=
OSTEXAMPLES_PATH_STR";
> ++static const char qt_configure_demos_path_str        [512 + 12] =3D "$H=
OSTDEMOS_PATH_STR";
> + #else // QT_BOOTSTRAPPED
> + EOF
> + fi
> +=20
> + cat >> "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
> + /* Installation Info */
> +-static const char qt_configure_prefix_path_str       [256 + 12] =3D "$P=
REFIX_PATH_STR";
> +-static const char qt_configure_documentation_path_str[256 + 12] =3D "$D=
OCUMENTATION_PATH_STR";
> +-static const char qt_configure_headers_path_str      [256 + 12] =3D "$H=
EADERS_PATH_STR";
> +-static const char qt_configure_libraries_path_str    [256 + 12] =3D "$L=
IBRARIES_PATH_STR";
> +-static const char qt_configure_binaries_path_str     [256 + 12] =3D "$B=
INARIES_PATH_STR";
> +-static const char qt_configure_plugins_path_str      [256 + 12] =3D "$P=
LUGINS_PATH_STR";
> +-static const char qt_configure_imports_path_str      [256 + 12] =3D "$I=
MPORTS_PATH_STR";
> +-static const char qt_configure_data_path_str         [256 + 12] =3D "$D=
ATA_PATH_STR";
> +-static const char qt_configure_translations_path_str [256 + 12] =3D "$T=
RANSLATIONS_PATH_STR";
> +-static const char qt_configure_settings_path_str     [256 + 12] =3D "$S=
ETTINGS_PATH_STR";
> +-static const char qt_configure_examples_path_str     [256 + 12] =3D "$E=
XAMPLES_PATH_STR";
> +-static const char qt_configure_demos_path_str        [256 + 12] =3D "$D=
EMOS_PATH_STR";
> ++static const char qt_configure_prefix_path_str       [512 + 12] =3D "$P=
REFIX_PATH_STR";
> ++static const char qt_configure_documentation_path_str[512 + 12] =3D "$D=
OCUMENTATION_PATH_STR";
> ++static const char qt_configure_headers_path_str      [512 + 12] =3D "$H=
EADERS_PATH_STR";
> ++static const char qt_configure_libraries_path_str    [512 + 12] =3D "$L=
IBRARIES_PATH_STR";
> ++static const char qt_configure_binaries_path_str     [512 + 12] =3D "$B=
INARIES_PATH_STR";
> ++static const char qt_configure_plugins_path_str      [512 + 12] =3D "$P=
LUGINS_PATH_STR";
> ++static const char qt_configure_imports_path_str      [512 + 12] =3D "$I=
MPORTS_PATH_STR";
> ++static const char qt_configure_data_path_str         [512 + 12] =3D "$D=
ATA_PATH_STR";
> ++static const char qt_configure_translations_path_str [512 + 12] =3D "$T=
RANSLATIONS_PATH_STR";
> ++static const char qt_configure_settings_path_str     [512 + 12] =3D "$S=
ETTINGS_PATH_STR";
> ++static const char qt_configure_examples_path_str     [512 + 12] =3D "$E=
XAMPLES_PATH_STR";
> ++static const char qt_configure_demos_path_str        [512 + 12] =3D "$D=
EMOS_PATH_STR";
> + EOF
> +=20
> + if [ ! -z "$QT_HOST_PREFIX" ]; then
> diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4=
-native.inc
> index ad20723..0dab364 100644
> --- a/meta/recipes-qt/qt4/qt4-native.inc
> +++ b/meta/recipes-qt/qt4/qt4-native.inc
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL;md5=3Dfbc093901=
857fcd118f065f900982c24 \
>                      file://LICENSE.GPL3;md5=3Dbabc5b6b77441da277f5c06b2e=
547720 \
>                      file://LGPL_EXCEPTION.txt;md5=3D411080a56ff917a5a1aa=
08c98acae354"
> =20
> -INC_PR =3D "r18"
> +INC_PR =3D "r19"
> =20
>  inherit native
> =20
> @@ -17,6 +17,7 @@ SRC_URI =3D "http://releases.qt-project.org/qt4/source/=
qt-everywhere-opensource-sr
>             file://0001-qlibraryinfo-allow-to-set-qt.conf-from-the-outsid=
e-u.patch \
>             file://0002-qkbdtty_qws-fix-build-with-old-kernel-headers.pat=
ch \
>             file://0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch \
> +           file://0001-make-qt4-native-work-with-long-building-path.patc=
h \
>             file://g++.conf \
>             file://linux.conf \
>  	"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC8YGIACgkQN1Ujt2V2gBz8zQCfb8AwDt2LxVMUYz+npXPnp+mN
pfUAnijQBr2c7BzH085CKDsKFZy8TEIz
=1f/Z
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
