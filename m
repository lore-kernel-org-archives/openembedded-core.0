Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfRiX-0003KM-1P
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 09:49:33 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1381492eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 00:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=f1F+wnOvXSADtj4uorfnn/R0e3ff9ynsQUR9GbG42wY=;
	b=oQMLRdsqPHX7v0PzgTcrTcdAGDM2DaHHkB4R5Sr/X0eLAHnJGoN5JNbLBDq7Yc98ki
	J4tyQJuGe0MEWRmJag5wQbvWuyT7wTjKnZATjx0sdT6RqDhe1duAaBv/UHuYNFn9rvJ1
	JvaWPNeXFNmHF32DqM+DjHDQj5zQy7C69zrwEvo5Qlw/Iv6ZMYuvbO2GAEBfAnB4uE4T
	mk2ZqdZ8D1AJbPKb4gmB1vY6WDZEYitSYgB+ddrndrpB40PExRayNwe2KKvAPJJdmcGz
	jahvS7tMWu0PADgnwd2cG4vMyg9BhA570h3EUlQojw7nuyCOrbCjzP0xQ9sJIfhFQ7/x
	vfbw==
Received: by 10.14.207.68 with SMTP id m44mr33654608eeo.40.1354523712341;
	Mon, 03 Dec 2012 00:35:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a44sm29926222eeo.7.2012.12.03.00.35.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 00:35:11 -0800 (PST)
Date: Mon, 3 Dec 2012 09:35:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Message-ID: <20121203083506.GB3354@jama.jama.net>
References: <cover.1354265260.git.Qi.Chen@windriver.com>
	<df75410d0032ada41e657f6bd01a5d185281d541.1354265260.git.Qi.Chen@windriver.com>
	<20121203081842.GA3354@jama.jama.net>
	<50BC628B.1030905@windriver.com>
MIME-Version: 1.0
In-Reply-To: <50BC628B.1030905@windriver.com>
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
X-List-Received-Date: Mon, 03 Dec 2012 08:49:33 -0000
X-Groupsio-MsgNum: 32078
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline

--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 03, 2012 at 04:27:55PM +0800, ChenQi wrote:
> On 12/03/2012 04:18 PM, Martin Jansa wrote:
> > On Mon, Dec 03, 2012 at 09:55:23AM +0800, Qi.Chen@windriver.com wrote:
> >> From: Chen Qi<Qi.Chen@windriver.com>
> >>
> >> If the TMPDIR has more than 256 chars, building qt4-native fails.
> >> This violates the 410 length limit of TMPDIR.
> >>
> >> This patch makes building qt4-native succeed with a long building
> >> path (410 for example) by extending its static arrays' sizes by
> >> 256 chars.
> >>
> >> [YOCTO #2766]
> >>
> >> Signed-off-by: Chen Qi<Qi.Chen@windriver.com>
> >> ---
> >>   ...e-qt4-native-work-with-long-building-path.patch |   82 ++++++++++=
++++++++++
> >>   meta/recipes-qt/qt4/qt4-native.inc                 |    3 +-
> >>   2 files changed, 84 insertions(+), 1 deletion(-)
> >>   create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-nativ=
e-work-with-long-building-path.patch
> >>
> >> diff --git a/meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-w=
ith-long-building-path.patch b/meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-=
native-work-with-long-building-path.patch
> >> new file mode 100644
> >> index 0000000..74f4e1a
> >> --- /dev/null
> >> +++ b/meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-with-lon=
g-building-path.patch
> >> @@ -0,0 +1,83 @@
> >> +Upstream-Status: Pending
> > ^ still bad Upstream-Status value, should be "Submitted"
> >
> > Cheers,
> I've changed it to "Submitted" and sent the patches again.
> Could you please have a look at it to see whether there are other problem=
s?
> (By the way, what's the difference between "Submitted" and "Pending"? If=
=20
> the patch hasn't been sent to upstream but will be, we call it "Pending"?)

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Head=
er_Recommendations

> Thanks,
> Chen Qi
>=20
> >> +
> >> +Make qt4-native work with long building path.
> >> +Reference: https://bugreports.qt-project.org/browse/QTBUG-28292
> >> +
> >> +Signed-off-by: Chen Qi<Qi.Chen@windriver.com>
> >> +
> >> +Index: configure
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +--- a/configure
> >> ++++ b/configure
> >> +@@ -4764,8 +4764,8 @@ DEMOS_PATH_STR=3D`"$relpath/config.tests/unix/p=
adstring" 268 "qt_demopath=3D$QT_INST
> >> + TODAY=3D`date +%Y-%m-%d`
> >> + cat>  "$outpath/src/corelib/global/qconfig.cpp.new"<<EOF
> >> + /* License Info */
> >> +-static const char qt_configure_licensee_str          [256 + 12] =3D =
"$LICENSE_USER_STR";
> >> +-static const char qt_configure_licensed_products_str [256 + 12] =3D =
"$LICENSE_PRODUCTS_STR";
> >> ++static const char qt_configure_licensee_str          [512 + 12] =3D =
"$LICENSE_USER_STR";
> >> ++static const char qt_configure_licensed_products_str [512 + 12] =3D =
"$LICENSE_PRODUCTS_STR";
> >> +
> >> + /* Installation date */
> >> + static const char qt_configure_installation          [12+11]    =3D =
"qt_instdate=3D$TODAY";
> >> +@@ -4790,36 +4790,36 @@ if [ ! -z "$QT_HOST_PREFIX" ]; then
> >> +
> >> + #if defined(QT_BOOTSTRAPPED) || defined(QT_BUILD_QMAKE)
> >> + /* Installation Info */
> >> +-static const char qt_configure_prefix_path_str       [256 + 12] =3D =
"$HOSTPREFIX_PATH_STR";
> >> +-static const char qt_configure_documentation_path_str[256 + 12] =3D =
"$HOSTDOCUMENTATION_PATH_STR";
> >> +-static const char qt_configure_headers_path_str      [256 + 12] =3D =
"$HOSTHEADERS_PATH_STR";
> >> +-static const char qt_configure_libraries_path_str    [256 + 12] =3D =
"$HOSTLIBRARIES_PATH_STR";
> >> +-static const char qt_configure_binaries_path_str     [256 + 12] =3D =
"$HOSTBINARIES_PATH_STR";
> >> +-static const char qt_configure_plugins_path_str      [256 + 12] =3D =
"$HOSTPLUGINS_PATH_STR";
> >> +-static const char qt_configure_imports_path_str      [256 + 12] =3D =
"$HOSTIMPORTS_PATH_STR";
> >> +-static const char qt_configure_data_path_str         [256 + 12] =3D =
"$HOSTDATA_PATH_STR";
> >> +-static const char qt_configure_translations_path_str [256 + 12] =3D =
"$HOSTTRANSLATIONS_PATH_STR";
> >> +-static const char qt_configure_settings_path_str     [256 + 12] =3D =
"$HOSTSETTINGS_PATH_STR";
> >> +-static const char qt_configure_examples_path_str     [256 + 12] =3D =
"$HOSTEXAMPLES_PATH_STR";
> >> +-static const char qt_configure_demos_path_str        [256 + 12] =3D =
"$HOSTDEMOS_PATH_STR";
> >> ++static const char qt_configure_prefix_path_str       [512 + 12] =3D =
"$HOSTPREFIX_PATH_STR";
> >> ++static const char qt_configure_documentation_path_str[512 + 12] =3D =
"$HOSTDOCUMENTATION_PATH_STR";
> >> ++static const char qt_configure_headers_path_str      [512 + 12] =3D =
"$HOSTHEADERS_PATH_STR";
> >> ++static const char qt_configure_libraries_path_str    [512 + 12] =3D =
"$HOSTLIBRARIES_PATH_STR";
> >> ++static const char qt_configure_binaries_path_str     [512 + 12] =3D =
"$HOSTBINARIES_PATH_STR";
> >> ++static const char qt_configure_plugins_path_str      [512 + 12] =3D =
"$HOSTPLUGINS_PATH_STR";
> >> ++static const char qt_configure_imports_path_str      [512 + 12] =3D =
"$HOSTIMPORTS_PATH_STR";
> >> ++static const char qt_configure_data_path_str         [512 + 12] =3D =
"$HOSTDATA_PATH_STR";
> >> ++static const char qt_configure_translations_path_str [512 + 12] =3D =
"$HOSTTRANSLATIONS_PATH_STR";
> >> ++static const char qt_configure_settings_path_str     [512 + 12] =3D =
"$HOSTSETTINGS_PATH_STR";
> >> ++static const char qt_configure_examples_path_str     [512 + 12] =3D =
"$HOSTEXAMPLES_PATH_STR";
> >> ++static const char qt_configure_demos_path_str        [512 + 12] =3D =
"$HOSTDEMOS_PATH_STR";
> >> + #else // QT_BOOTSTRAPPED
> >> + EOF
> >> + fi
> >> +
> >> + cat>>  "$outpath/src/corelib/global/qconfig.cpp.new"<<EOF
> >> + /* Installation Info */
> >> +-static const char qt_configure_prefix_path_str       [256 + 12] =3D =
"$PREFIX_PATH_STR";
> >> +-static const char qt_configure_documentation_path_str[256 + 12] =3D =
"$DOCUMENTATION_PATH_STR";
> >> +-static const char qt_configure_headers_path_str      [256 + 12] =3D =
"$HEADERS_PATH_STR";
> >> +-static const char qt_configure_libraries_path_str    [256 + 12] =3D =
"$LIBRARIES_PATH_STR";
> >> +-static const char qt_configure_binaries_path_str     [256 + 12] =3D =
"$BINARIES_PATH_STR";
> >> +-static const char qt_configure_plugins_path_str      [256 + 12] =3D =
"$PLUGINS_PATH_STR";
> >> +-static const char qt_configure_imports_path_str      [256 + 12] =3D =
"$IMPORTS_PATH_STR";
> >> +-static const char qt_configure_data_path_str         [256 + 12] =3D =
"$DATA_PATH_STR";
> >> +-static const char qt_configure_translations_path_str [256 + 12] =3D =
"$TRANSLATIONS_PATH_STR";
> >> +-static const char qt_configure_settings_path_str     [256 + 12] =3D =
"$SETTINGS_PATH_STR";
> >> +-static const char qt_configure_examples_path_str     [256 + 12] =3D =
"$EXAMPLES_PATH_STR";
> >> +-static const char qt_configure_demos_path_str        [256 + 12] =3D =
"$DEMOS_PATH_STR";
> >> ++static const char qt_configure_prefix_path_str       [512 + 12] =3D =
"$PREFIX_PATH_STR";
> >> ++static const char qt_configure_documentation_path_str[512 + 12] =3D =
"$DOCUMENTATION_PATH_STR";
> >> ++static const char qt_configure_headers_path_str      [512 + 12] =3D =
"$HEADERS_PATH_STR";
> >> ++static const char qt_configure_libraries_path_str    [512 + 12] =3D =
"$LIBRARIES_PATH_STR";
> >> ++static const char qt_configure_binaries_path_str     [512 + 12] =3D =
"$BINARIES_PATH_STR";
> >> ++static const char qt_configure_plugins_path_str      [512 + 12] =3D =
"$PLUGINS_PATH_STR";
> >> ++static const char qt_configure_imports_path_str      [512 + 12] =3D =
"$IMPORTS_PATH_STR";
> >> ++static const char qt_configure_data_path_str         [512 + 12] =3D =
"$DATA_PATH_STR";
> >> ++static const char qt_configure_translations_path_str [512 + 12] =3D =
"$TRANSLATIONS_PATH_STR";
> >> ++static const char qt_configure_settings_path_str     [512 + 12] =3D =
"$SETTINGS_PATH_STR";
> >> ++static const char qt_configure_examples_path_str     [512 + 12] =3D =
"$EXAMPLES_PATH_STR";
> >> ++static const char qt_configure_demos_path_str        [512 + 12] =3D =
"$DEMOS_PATH_STR";
> >> + EOF
> >> +
> >> + if [ ! -z "$QT_HOST_PREFIX" ]; then
> >> diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/=
qt4-native.inc
> >> index ad20723..0dab364 100644
> >> --- a/meta/recipes-qt/qt4/qt4-native.inc
> >> +++ b/meta/recipes-qt/qt4/qt4-native.inc
> >> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL;md5=3Dfbc093=
901857fcd118f065f900982c24 \
> >>                       file://LICENSE.GPL3;md5=3Dbabc5b6b77441da277f5c0=
6b2e547720 \
> >>                       file://LGPL_EXCEPTION.txt;md5=3D411080a56ff917a5=
a1aa08c98acae354"
> >>
> >> -INC_PR =3D "r18"
> >> +INC_PR =3D "r19"
> >>
> >>   inherit native
> >>
> >> @@ -17,6 +17,7 @@ SRC_URI =3D "http://releases.qt-project.org/qt4/sour=
ce/qt-everywhere-opensource-sr
> >>              file://0001-qlibraryinfo-allow-to-set-qt.conf-from-the-ou=
tside-u.patch \
> >>              file://0002-qkbdtty_qws-fix-build-with-old-kernel-headers=
=2Epatch \
> >>              file://0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch \
> >> +           file://0001-make-qt4-native-work-with-long-building-path.p=
atch \
> >>              file://g++.conf \
> >>              file://linux.conf \
> >>   	"
> >> --=20
> >> 1.7.9.5
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC8ZDoACgkQN1Ujt2V2gByWWwCgjF4+TKL/67Rl7T4W4ZwtQvH/
bMEAoKOvhuuZFSk+IJdKvpZM1XYQ6YRo
=0dwa
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
