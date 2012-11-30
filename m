Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TeLuU-0000dD-Bn
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 09:25:37 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so79133eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 00:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FHOZG6n+4UcmFQxl7iqh7FZACUd7u0J8lXPaG+9mk/0=;
	b=zgo05m/7wjHkffM61c9X2kJ2ujQSjz06AbRw8dT+tzzVCHgRU6Ywmjs2HCaBmcg9oV
	M9qbCHnoRNAxP/dBrDxEJdF/zWI6NxgC1lH89AwCEtjDT68jQy18QAe3yJD4+eU9VVUA
	wJNiQ48v4WZKddWIvPKdF61XA960qdRFSu2ECL54IVL7I/obgOSDNFB3IWMPgoVkbtJl
	lObl188CoMmjg1yvBjt1FUt+N4kOS0XIlKGL5oNuY7ynYc8ZqCHTMwOC8UsW8CeU5lRJ
	RbNR8HllX5Rf8JI0ttzAIx8K6UfBK2MOYBz61I7mWcs3vv0TKvzgD4n2FJZuVJ3wuKBf
	+zHQ==
Received: by 10.14.178.196 with SMTP id f44mr1945984eem.14.1354263065767;
	Fri, 30 Nov 2012 00:11:05 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z8sm8981229eeo.11.2012.11.30.00.11.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 00:11:04 -0800 (PST)
Date: Fri, 30 Nov 2012 09:11:02 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Message-ID: <20121130081102.GC3436@jama.jama.net>
References: <cover.1354084523.git.Qi.Chen@windriver.com>
	<fe9165f254427054e95569b22c840e3f3443a8be.1354084523.git.Qi.Chen@windriver.com>
	<20121130074602.GA3436@jama.jama.net>
	<50B867BC.10801@windriver.com>
MIME-Version: 1.0
In-Reply-To: <50B867BC.10801@windriver.com>
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
X-List-Received-Date: Fri, 30 Nov 2012 08:25:38 -0000
X-Groupsio-MsgNum: 31992
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Uq4LBwYP4y1W6pO"
Content-Disposition: inline

--/Uq4LBwYP4y1W6pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 30, 2012 at 04:01:00PM +0800, ChenQi wrote:
> On 11/30/2012 03:46 PM, Martin Jansa wrote:
> > On Fri, Nov 30, 2012 at 11:08:43AM +0800, Qi.Chen@windriver.com wrote:
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
> >> @@ -0,0 +1,82 @@
> >> +Upstream-Status: Pending
> > Why not submit this upstream? And isn't the same problem in target
> > recipes?
> I've tried and are now waiting for their reply.

OK, so it's Submitted now, right?

> There's no such problem in target recipe.
>=20
> >> +Make qt4-native work with long building path.
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
> >> index ad20723..42e2801 100644
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
> >> +	   file://0001-make-qt4-native-work-with-long-building-path.patch \
> > Please don't mix tabs and spaces for indentation.
>=20
> I didn't fix indentation. I'm also curious about why it appears this=20
> way. On my computer, it's ok.

Lines above are using only spaces, your line has tab followed by 3
spaces.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/Uq4LBwYP4y1W6pO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC4ahYACgkQN1Ujt2V2gBwqtQCgicEQ/oZXp39XeBf11MmbCPvR
/EsAn006svEi5wJjDjSUc72rOa/0dm/s
=610Q
-----END PGP SIGNATURE-----

--/Uq4LBwYP4y1W6pO--
