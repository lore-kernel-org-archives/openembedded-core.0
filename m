Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB0D73D37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 18:40:14 +0000 (UTC)
Received: by widdi4 with SMTP id di4so63055956wid.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 11:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=K7324DqpSGa5AbLeCkuFmajVL0/JYWWs4wQTpUrQfsQ=;
	b=XUGxev1NLogaGjSAubK+O7HkGKV3RiSef+k3YiQA34hU/qrE05nd0sWx9hJNHWeS2B
	z84389GutQLqjvCk6qmTq+l5JxXS6lxye12z8AlAzDQYFukzUU2XCBGIN2bzeX5ROujk
	ww7LUXRsAOOFY2ReAdD1GWXp6L+ZKCQRIks2GXMz1NMfZpCOmnRCfSoVW+H1njRq8Oec
	j41d5u01cNEJtymCMCGsLf9l8a9icZ1FPcJ7Qi7YcvDgvyC3iOn14SxlmtZcqN0NTjle
	pvv5d82qTakKrAyzKBBau50PSmKFFgfLPeXFOgTgVz2qrwaZoD7J7svvLS2rAUZnnJo0
	RFVA==
X-Received: by 10.194.120.132 with SMTP id lc4mr31110037wjb.92.1428950414634; 
	Mon, 13 Apr 2015 11:40:14 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id k6sm13923682wia.6.2015.04.13.11.40.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 11:40:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 13 Apr 2015 20:40:18 +0200
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <20150413184018.GL2330@jama>
References: <cover.1425076707.git.alejandro.hernandez@linux.intel.com>
	<93d70e328d697eb20a6bcd5b86ec96c89e1019cc.1425076707.git.alejandro.hernandez@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <93d70e328d697eb20a6bcd5b86ec96c89e1019cc.1425076707.git.alejandro.hernandez@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] python3: Upgrade from 3.3.3 to 3.4.2
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
X-List-Received-Date: Mon, 13 Apr 2015 18:40:16 -0000
X-Groupsio-MsgNum: 64323
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xjamM5M9kpPM/bcu"
Content-Disposition: inline

--xjamM5M9kpPM/bcu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2015 at 06:30:52PM -0600, Alejandro Hernandez wrote:
> Modifies:
> python3-native_3.3.3.bb -> python3-native_3.4.2.bb: Updates checksums, ve=
rsion, patches
> and SRC_URIs to use xz format, LICENSE did not change, dates were updated=
, adds fix for
> ctypes/libffi needed for pip <- required since Python 3.4 (see PEP #453).
> python3_3.3.3.bb -> python3_3.4.2.bb: Updates checksums, version, patches=
 and SRC_URIs
> to use xz format, adds fix for ctypes/libffi, fixes oe_multilib_header() =
call,
> adds python3-core as RDEPENDS to python3-misc to avoid QA issue.
> generate-manifest-3.4.py - > generate-manifest-3.4.py: fixes reprlib,
> adds _sitebuiltins and _collections_abc <- formerly part of collections, =
separated since 3.4
> python-3.3-manifest.inc -> python-3.4-manifest.inc
>=20
> Rebases:
> 12-distutils-prefix-is-inside-staging-area.patch
> python-3.3-multilib.patch
> 04-default-is-optimized.patch
> avoid-ncursesw-include-path.patch
>=20
> Deletes (fixed upstream):
> fix-ast.h-dependency.patch
> python3-fix-build-error-with-Readline-6.3.patch
> 06-ctypes-libffi-fix-configure.patch
> remove_sqlite_rpath.patch

There is a lot of textrel QA warnings in 3.3.3 (you can see them e.g. in
http://lists.openembedded.org/pipermail/openembedded-core/2015-March/102948=
=2Ehtml
), is this upgrade fixing them?

> [YOCTO #6857]
>=20
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>  ...on-3.3-manifest.inc =3D> python-3.4-manifest.inc} | 126 +++++++------=
--
>  ...on3-native_3.3.3.bb =3D> python3-native_3.4.2.bb} |  17 +-
>  .../python/python3/04-default-is-optimized.patch   |  39 ++---
>  ...2-distutils-prefix-is-inside-staging-area.patch |  29 ++--
>  .../python3/avoid-ncursesw-include-path.patch      |  30 ++--
>  .../python/python3/python-3.3-multilib.patch       | 180 +++++++++++----=
------
>  .../python/{python3_3.3.3.bb =3D> python3_3.4.2.bb}  |  21 ++-
>  ...te-manifest-3.3.py =3D> generate-manifest-3.4.py} |   8 +-
>  8 files changed, 222 insertions(+), 228 deletions(-)
>  rename meta/recipes-devtools/python/{python-3.3-manifest.inc =3D> python=
-3.4-manifest.inc} (50%)
>  rename meta/recipes-devtools/python/{python3-native_3.3.3.bb =3D> python=
3-native_3.4.2.bb} (80%)
>  rename meta/recipes-devtools/python/{python3_3.3.3.bb =3D> python3_3.4.2=
=2Ebb} (93%)
>  rename scripts/contrib/python/{generate-manifest-3.3.py =3D> generate-ma=
nifest-3.4.py} (98%)
>=20
> diff --git a/meta/recipes-devtools/python/python-3.3-manifest.inc b/meta/=
recipes-devtools/python/python-3.4-manifest.inc
> similarity index 50%
> rename from meta/recipes-devtools/python/python-3.3-manifest.inc
> rename to meta/recipes-devtools/python/python-3.4-manifest.inc
> index 61119c6..fa61556 100644
> --- a/meta/recipes-devtools/python/python-3.3-manifest.inc
> +++ b/meta/recipes-devtools/python/python-3.4-manifest.inc
> @@ -1,6 +1,6 @@
> =20
>  # WARNING: This file is AUTO GENERATED: Manual edits will be lost next t=
ime I regenerate the file.
> -# Generator: '../../../scripts/contrib/python/generate-manifest-3.3.py' =
Version 20140131 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media=
=2Ede>
> +# Generator: './generate-manifest-3.4.py' Version 20140131 (C) 2002-2010=
 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
>  # Visit the Python for Embedded Systems Site =3D> http://www.Vanille.de/=
projects/python.spy
> =20
>  =20
> @@ -11,51 +11,51 @@ PACKAGES=3D"${PN}-dbg ${PN}-2to3 ${PN}-audio ${PN}-co=
decs ${PN}-compile ${PN}-comp
> =20
>  SUMMARY_${PN}-2to3=3D"Python automated Python 2 to 3 code translator"
>  RDEPENDS_${PN}-2to3=3D"${PN}-core"
> -FILES_${PN}-2to3=3D"${bindir}/2to3 ${libdir}/python3.3/lib2to3 "
> +FILES_${PN}-2to3=3D"${bindir}/2to3 ${libdir}/python3.4/lib2to3 "
> =20
>  SUMMARY_${PN}-audio=3D"Python Audio Handling"
>  RDEPENDS_${PN}-audio=3D"${PN}-core"
> -FILES_${PN}-audio=3D"${libdir}/python3.3/wave.* ${libdir}/python3.3/chun=
k.* ${libdir}/python3.3/sndhdr.* ${libdir}/python3.3/lib-dynload/ossaudiode=
v.*.so ${libdir}/python3.3/lib-dynload/audioop.*.so ${libdir}/python3.3/aud=
iodev.* ${libdir}/python3.3/sunaudio.* ${libdir}/python3.3/sunau.* ${libdir=
}/python3.3/toaiff.* "
> +FILES_${PN}-audio=3D"${libdir}/python3.4/wave.* ${libdir}/python3.4/chun=
k.* ${libdir}/python3.4/sndhdr.* ${libdir}/python3.4/lib-dynload/ossaudiode=
v.*.so ${libdir}/python3.4/lib-dynload/audioop.*.so ${libdir}/python3.4/aud=
iodev.* ${libdir}/python3.4/sunaudio.* ${libdir}/python3.4/sunau.* ${libdir=
}/python3.4/toaiff.* "
> =20
>  SUMMARY_${PN}-codecs=3D"Python codecs, encodings & i18n support"
>  RDEPENDS_${PN}-codecs=3D"${PN}-core ${PN}-lang"
> -FILES_${PN}-codecs=3D"${libdir}/python3.3/codecs.* ${libdir}/python3.3/e=
ncodings ${libdir}/python3.3/gettext.* ${libdir}/python3.3/locale.* ${libdi=
r}/python3.3/lib-dynload/_locale.*.so ${libdir}/python3.3/lib-dynload/_code=
cs* ${libdir}/python3.3/lib-dynload/_multibytecodec.*.so ${libdir}/python3.=
3/lib-dynload/unicodedata.*.so ${libdir}/python3.3/stringprep.* ${libdir}/p=
ython3.3/xdrlib.* "
> +FILES_${PN}-codecs=3D"${libdir}/python3.4/codecs.* ${libdir}/python3.4/e=
ncodings ${libdir}/python3.4/gettext.* ${libdir}/python3.4/locale.* ${libdi=
r}/python3.4/lib-dynload/_locale.*.so ${libdir}/python3.4/lib-dynload/_code=
cs* ${libdir}/python3.4/lib-dynload/_multibytecodec.*.so ${libdir}/python3.=
4/lib-dynload/unicodedata.*.so ${libdir}/python3.4/stringprep.* ${libdir}/p=
ython3.4/xdrlib.* "
> =20
>  SUMMARY_${PN}-compile=3D"Python bytecode compilation support"
>  RDEPENDS_${PN}-compile=3D"${PN}-core"
> -FILES_${PN}-compile=3D"${libdir}/python3.3/py_compile.* ${libdir}/python=
3.3/compileall.* "
> +FILES_${PN}-compile=3D"${libdir}/python3.4/py_compile.* ${libdir}/python=
3.4/compileall.* "
> =20
>  SUMMARY_${PN}-compression=3D"Python high-level compression support"
>  RDEPENDS_${PN}-compression=3D"${PN}-core ${PN}-codecs"
> -FILES_${PN}-compression=3D"${libdir}/python3.3/gzip.* ${libdir}/python3.=
3/zipfile.* ${libdir}/python3.3/tarfile.* ${libdir}/python3.3/lib-dynload/b=
z2.*.so "
> +FILES_${PN}-compression=3D"${libdir}/python3.4/gzip.* ${libdir}/python3.=
4/zipfile.* ${libdir}/python3.4/tarfile.* ${libdir}/python3.4/lib-dynload/b=
z2.*.so "
> =20
>  SUMMARY_${PN}-core=3D"Python interpreter and core modules"
>  RDEPENDS_${PN}-core=3D"${PN}-lang ${PN}-re ${PN}-reprlib ${PN}-codecs ${=
PN}-io ${PN}-math"
> -FILES_${PN}-core=3D"${libdir}/python3.3/__future__.* ${libdir}/python3.3=
/_abcoll.* ${libdir}/python3.3/abc.* ${libdir}/python3.3/copy.* ${libdir}/p=
ython3.3/copyreg.* ${libdir}/python3.3/ConfigParser.* ${libdir}/python3.3/g=
enericpath.* ${libdir}/python3.3/getopt.* ${libdir}/python3.3/linecache.* $=
{libdir}/python3.3/new.* ${libdir}/python3.3/os.* ${libdir}/python3.3/posix=
path.* ${libdir}/python3.3/struct.* ${libdir}/python3.3/warnings.* ${libdir=
}/python3.3/site.* ${libdir}/python3.3/stat.* ${libdir}/python3.3/UserDict.=
* ${libdir}/python3.3/UserList.* ${libdir}/python3.3/UserString.* ${libdir}=
/python3.3/lib-dynload/binascii.*.so ${libdir}/python3.3/lib-dynload/_struc=
t.*.so ${libdir}/python3.3/lib-dynload/time.*.so ${libdir}/python3.3/lib-dy=
nload/xreadlines.*.so ${libdir}/python3.3/types.* ${libdir}/python3.3/platf=
orm.* ${bindir}/python* ${libdir}/python3.3/_weakrefset.* ${libdir}/python3=
=2E3/sysconfig.* ${libdir}/python3.3/_sysconfigdata.* ${libdir}/python3.3/c=
onfig/Makefile ${incl
>  udedir}/python${PYTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJM=
IN}/collections ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
> +FILES_${PN}-core=3D"${libdir}/python3.4/__future__.* ${libdir}/python3.4=
/_abcoll.* ${libdir}/python3.4/abc.* ${libdir}/python3.4/copy.* ${libdir}/p=
ython3.4/copyreg.* ${libdir}/python3.4/ConfigParser.* ${libdir}/python3.4/g=
enericpath.* ${libdir}/python3.4/getopt.* ${libdir}/python3.4/linecache.* $=
{libdir}/python3.4/new.* ${libdir}/python3.4/os.* ${libdir}/python3.4/posix=
path.* ${libdir}/python3.4/struct.* ${libdir}/python3.4/warnings.* ${libdir=
}/python3.4/site.* ${libdir}/python3.4/stat.* ${libdir}/python3.4/UserDict.=
* ${libdir}/python3.4/UserList.* ${libdir}/python3.4/UserString.* ${libdir}=
/python3.4/lib-dynload/binascii.*.so ${libdir}/python3.4/lib-dynload/_struc=
t.*.so ${libdir}/python3.4/lib-dynload/time.*.so ${libdir}/python3.4/lib-dy=
nload/xreadlines.*.so ${libdir}/python3.4/types.* ${libdir}/python3.4/platf=
orm.* ${bindir}/python* ${libdir}/python3.4/_weakrefset.* ${libdir}/python3=
=2E4/sysconfig.* ${libdir}/python3.4/_sysconfigdata.* ${libdir}/python3.4/c=
onfig/Makefile ${incl
>  udedir}/python${PYTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJM=
IN}/collections ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* ${libdi=
r}/python${PYTHON_MAJMIN}/_sitebuiltins.* ${libdir}/python${PYTHON_MAJMIN}/=
sitecustomize.py "
> =20
>  SUMMARY_${PN}-crypt=3D"Python basic cryptographic and hashing support"
>  RDEPENDS_${PN}-crypt=3D"${PN}-core"
> -FILES_${PN}-crypt=3D"${libdir}/python3.3/hashlib.* ${libdir}/python3.3/m=
d5.* ${libdir}/python3.3/sha.* ${libdir}/python3.3/lib-dynload/crypt.*.so $=
{libdir}/python3.3/lib-dynload/_hashlib.*.so ${libdir}/python3.3/lib-dynloa=
d/_sha256.*.so ${libdir}/python3.3/lib-dynload/_sha512.*.so "
> +FILES_${PN}-crypt=3D"${libdir}/python3.4/hashlib.* ${libdir}/python3.4/m=
d5.* ${libdir}/python3.4/sha.* ${libdir}/python3.4/lib-dynload/crypt.*.so $=
{libdir}/python3.4/lib-dynload/_hashlib.*.so ${libdir}/python3.4/lib-dynloa=
d/_sha256.*.so ${libdir}/python3.4/lib-dynload/_sha512.*.so "
> =20
>  SUMMARY_${PN}-ctypes=3D"Python C types support"
>  RDEPENDS_${PN}-ctypes=3D"${PN}-core"
> -FILES_${PN}-ctypes=3D"${libdir}/python3.3/ctypes ${libdir}/python3.3/lib=
-dynload/_ctypes.*.so ${libdir}/python3.3/lib-dynload/_ctypes_test.*.so "
> +FILES_${PN}-ctypes=3D"${libdir}/python3.4/ctypes ${libdir}/python3.4/lib=
-dynload/_ctypes.*.so ${libdir}/python3.4/lib-dynload/_ctypes_test.*.so "
> =20
>  SUMMARY_${PN}-curses=3D"Python curses support"
>  RDEPENDS_${PN}-curses=3D"${PN}-core"
> -FILES_${PN}-curses=3D"${libdir}/python3.3/curses ${libdir}/python3.3/lib=
-dynload/_curses.*.so ${libdir}/python3.3/lib-dynload/_curses_panel.*.so "
> +FILES_${PN}-curses=3D"${libdir}/python3.4/curses ${libdir}/python3.4/lib=
-dynload/_curses.*.so ${libdir}/python3.4/lib-dynload/_curses_panel.*.so "
> =20
>  SUMMARY_${PN}-datetime=3D"Python calendar and time support"
>  RDEPENDS_${PN}-datetime=3D"${PN}-core ${PN}-codecs"
> -FILES_${PN}-datetime=3D"${libdir}/python3.3/_strptime.* ${libdir}/python=
3.3/calendar.* ${libdir}/python3.3/lib-dynload/datetime.*.so "
> +FILES_${PN}-datetime=3D"${libdir}/python3.4/_strptime.* ${libdir}/python=
3.4/calendar.* ${libdir}/python3.4/lib-dynload/datetime.*.so "
> =20
>  SUMMARY_${PN}-db=3D"Python file-based database support"
>  RDEPENDS_${PN}-db=3D"${PN}-core"
> -FILES_${PN}-db=3D"${libdir}/python3.3/anydbm.* ${libdir}/python3.3/dumbd=
bm.* ${libdir}/python3.3/whichdb.* ${libdir}/python3.3/dbm ${libdir}/python=
3.3/lib-dynload/_dbm.*.so "
> +FILES_${PN}-db=3D"${libdir}/python3.4/anydbm.* ${libdir}/python3.4/dumbd=
bm.* ${libdir}/python3.4/whichdb.* ${libdir}/python3.4/dbm ${libdir}/python=
3.4/lib-dynload/_dbm.*.so "
> =20
>  SUMMARY_${PN}-debugger=3D"Python debugger"
>  RDEPENDS_${PN}-debugger=3D"${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}=
-stringold ${PN}-shell ${PN}-pprint"
> -FILES_${PN}-debugger=3D"${libdir}/python3.3/bdb.* ${libdir}/python3.3/pd=
b.* "
> +FILES_${PN}-debugger=3D"${libdir}/python3.4/bdb.* ${libdir}/python3.4/pd=
b.* "
> =20
>  SUMMARY_${PN}-dev=3D"Python development package"
>  RDEPENDS_${PN}-dev=3D"${PN}-core"
> @@ -63,203 +63,203 @@ FILES_${PN}-dev=3D"${includedir} ${libdir}/lib*${SO=
LIBSDEV} ${libdir}/*.la ${libdi
> =20
>  SUMMARY_${PN}-difflib=3D"Python helpers for computing deltas between obj=
ects"
>  RDEPENDS_${PN}-difflib=3D"${PN}-lang ${PN}-re"
> -FILES_${PN}-difflib=3D"${libdir}/python3.3/difflib.* "
> +FILES_${PN}-difflib=3D"${libdir}/python3.4/difflib.* "
> =20
>  SUMMARY_${PN}-distutils=3D"Python Distribution Utilities"
>  RDEPENDS_${PN}-distutils=3D"${PN}-core"
> -FILES_${PN}-distutils=3D"${libdir}/python3.3/config ${libdir}/python3.3/=
distutils "
> +FILES_${PN}-distutils=3D"${libdir}/python3.4/config ${libdir}/python3.4/=
distutils "
> =20
>  SUMMARY_${PN}-distutils-staticdev=3D"Python distribution utilities (stat=
ic libraries)"
>  RDEPENDS_${PN}-distutils-staticdev=3D"${PN}-distutils"
> -FILES_${PN}-distutils-staticdev=3D"${libdir}/python3.3/config/lib*.a "
> +FILES_${PN}-distutils-staticdev=3D"${libdir}/python3.4/config/lib*.a "
> =20
>  SUMMARY_${PN}-doctest=3D"Python framework for running examples in docstr=
ings"
>  RDEPENDS_${PN}-doctest=3D"${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-=
unittest ${PN}-debugger ${PN}-difflib"
> -FILES_${PN}-doctest=3D"${libdir}/python3.3/doctest.* "
> +FILES_${PN}-doctest=3D"${libdir}/python3.4/doctest.* "
> =20
>  SUMMARY_${PN}-elementtree=3D"Python elementree"
>  RDEPENDS_${PN}-elementtree=3D"${PN}-core"
> -FILES_${PN}-elementtree=3D"${libdir}/python3.3/lib-dynload/_elementtree.=
*.so "
> +FILES_${PN}-elementtree=3D"${libdir}/python3.4/lib-dynload/_elementtree.=
*.so "
> =20
>  SUMMARY_${PN}-email=3D"Python email support"
>  RDEPENDS_${PN}-email=3D"${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-au=
dio ${PN}-image ${PN}-netclient"
> -FILES_${PN}-email=3D"${libdir}/python3.3/imaplib.* ${libdir}/python3.3/e=
mail "
> +FILES_${PN}-email=3D"${libdir}/python3.4/imaplib.* ${libdir}/python3.4/e=
mail "
> =20
>  SUMMARY_${PN}-fcntl=3D"Python's fcntl interface"
>  RDEPENDS_${PN}-fcntl=3D"${PN}-core"
> -FILES_${PN}-fcntl=3D"${libdir}/python3.3/lib-dynload/fcntl.*.so "
> +FILES_${PN}-fcntl=3D"${libdir}/python3.4/lib-dynload/fcntl.*.so "
> =20
>  SUMMARY_${PN}-gdbm=3D"Python GNU database support"
>  RDEPENDS_${PN}-gdbm=3D"${PN}-core"
> -FILES_${PN}-gdbm=3D"${libdir}/python3.3/lib-dynload/_gdbm.*.so "
> +FILES_${PN}-gdbm=3D"${libdir}/python3.4/lib-dynload/_gdbm.*.so "
> =20
>  SUMMARY_${PN}-html=3D"Python HTML processing support"
>  RDEPENDS_${PN}-html=3D"${PN}-core"
> -FILES_${PN}-html=3D"${libdir}/python3.3/formatter.* ${libdir}/python3.3/=
htmlentitydefs.* ${libdir}/python3.3/htmllib.* ${libdir}/python3.3/markupba=
se.* ${libdir}/python3.3/sgmllib.* ${libdir}/python3.3/HTMLParser.* "
> +FILES_${PN}-html=3D"${libdir}/python3.4/formatter.* ${libdir}/python3.4/=
htmlentitydefs.* ${libdir}/python3.4/htmllib.* ${libdir}/python3.4/markupba=
se.* ${libdir}/python3.4/sgmllib.* ${libdir}/python3.4/HTMLParser.* "
> =20
>  SUMMARY_${PN}-idle=3D"Python Integrated Development Environment"
>  RDEPENDS_${PN}-idle=3D"${PN}-core ${PN}-tkinter"
> -FILES_${PN}-idle=3D"${bindir}/idle ${libdir}/python3.3/idlelib "
> +FILES_${PN}-idle=3D"${bindir}/idle ${libdir}/python3.4/idlelib "
> =20
>  SUMMARY_${PN}-image=3D"Python graphical image handling"
>  RDEPENDS_${PN}-image=3D"${PN}-core"
> -FILES_${PN}-image=3D"${libdir}/python3.3/colorsys.* ${libdir}/python3.3/=
imghdr.* ${libdir}/python3.3/lib-dynload/imageop.*.so ${libdir}/python3.3/l=
ib-dynload/rgbimg.*.so "
> +FILES_${PN}-image=3D"${libdir}/python3.4/colorsys.* ${libdir}/python3.4/=
imghdr.* ${libdir}/python3.4/lib-dynload/imageop.*.so ${libdir}/python3.4/l=
ib-dynload/rgbimg.*.so "
> =20
>  SUMMARY_${PN}-importlib=3D"Python import implementation library"
>  RDEPENDS_${PN}-importlib=3D"${PN}-core"
> -FILES_${PN}-importlib=3D"${libdir}/python3.3/importlib "
> +FILES_${PN}-importlib=3D"${libdir}/python3.4/importlib "
> =20
>  SUMMARY_${PN}-io=3D"Python low-level I/O"
>  RDEPENDS_${PN}-io=3D"${PN}-core ${PN}-math"
> -FILES_${PN}-io=3D"${libdir}/python3.3/lib-dynload/_socket.*.so ${libdir}=
/python3.3/lib-dynload/_io.*.so ${libdir}/python3.3/lib-dynload/_ssl.*.so $=
{libdir}/python3.3/lib-dynload/select.*.so ${libdir}/python3.3/lib-dynload/=
termios.*.so ${libdir}/python3.3/lib-dynload/cStringIO.*.so ${libdir}/pytho=
n3.3/pipes.* ${libdir}/python3.3/socket.* ${libdir}/python3.3/ssl.* ${libdi=
r}/python3.3/tempfile.* ${libdir}/python3.3/StringIO.* ${libdir}/python3.3/=
io.* ${libdir}/python3.3/_pyio.* "
> +FILES_${PN}-io=3D"${libdir}/python3.4/lib-dynload/_socket.*.so ${libdir}=
/python3.4/lib-dynload/_io.*.so ${libdir}/python3.4/lib-dynload/_ssl.*.so $=
{libdir}/python3.4/lib-dynload/select.*.so ${libdir}/python3.4/lib-dynload/=
termios.*.so ${libdir}/python3.4/lib-dynload/cStringIO.*.so ${libdir}/pytho=
n3.4/pipes.* ${libdir}/python3.4/socket.* ${libdir}/python3.4/ssl.* ${libdi=
r}/python3.4/tempfile.* ${libdir}/python3.4/StringIO.* ${libdir}/python3.4/=
io.* ${libdir}/python3.4/_pyio.* "
> =20
>  SUMMARY_${PN}-json=3D"Python JSON support"
>  RDEPENDS_${PN}-json=3D"${PN}-core ${PN}-math ${PN}-re"
> -FILES_${PN}-json=3D"${libdir}/python3.3/json ${libdir}/python3.3/lib-dyn=
load/_json.*.so "
> +FILES_${PN}-json=3D"${libdir}/python3.4/json ${libdir}/python3.4/lib-dyn=
load/_json.*.so "
> =20
>  SUMMARY_${PN}-lang=3D"Python low-level language support"
>  RDEPENDS_${PN}-lang=3D"${PN}-core"
> -FILES_${PN}-lang=3D"${libdir}/python3.3/lib-dynload/_bisect.*.so ${libdi=
r}/python3.3/lib-dynload/_collections.*.so ${libdir}/python3.3/lib-dynload/=
_heapq.*.so ${libdir}/python3.3/lib-dynload/_weakref.*.so ${libdir}/python3=
=2E3/lib-dynload/_functools.*.so ${libdir}/python3.3/lib-dynload/array.*.so=
 ${libdir}/python3.3/lib-dynload/itertools.*.so ${libdir}/python3.3/lib-dyn=
load/operator.*.so ${libdir}/python3.3/lib-dynload/parser.*.so ${libdir}/py=
thon3.3/atexit.* ${libdir}/python3.3/bisect.* ${libdir}/python3.3/code.* ${=
libdir}/python3.3/codeop.* ${libdir}/python3.3/collections.* ${libdir}/pyth=
on3.3/dis.* ${libdir}/python3.3/functools.* ${libdir}/python3.3/heapq.* ${l=
ibdir}/python3.3/inspect.* ${libdir}/python3.3/keyword.* ${libdir}/python3.=
3/opcode.* ${libdir}/python3.3/symbol.* ${libdir}/python3.3/repr.* ${libdir=
}/python3.3/token.* ${libdir}/python3.3/tokenize.* ${libdir}/python3.3/trac=
eback.* ${libdir}/python3.3/weakref.* "
> +FILES_${PN}-lang=3D"${libdir}/python3.4/lib-dynload/_bisect.*.so ${libdi=
r}/python3.4/lib-dynload/_collections.*.so ${libdir}/python3.4/lib-dynload/=
_heapq.*.so ${libdir}/python3.4/lib-dynload/_weakref.*.so ${libdir}/python3=
=2E4/lib-dynload/_functools.*.so ${libdir}/python3.4/lib-dynload/array.*.so=
 ${libdir}/python3.4/lib-dynload/itertools.*.so ${libdir}/python3.4/lib-dyn=
load/operator.*.so ${libdir}/python3.4/lib-dynload/parser.*.so ${libdir}/py=
thon3.4/atexit.* ${libdir}/python3.4/bisect.* ${libdir}/python3.4/code.* ${=
libdir}/python3.4/codeop.* ${libdir}/python3.4/collections.* ${libdir}/pyth=
on3.4/_collections_abc.* ${libdir}/python3.4/dis.* ${libdir}/python3.4/func=
tools.* ${libdir}/python3.4/heapq.* ${libdir}/python3.4/inspect.* ${libdir}=
/python3.4/keyword.* ${libdir}/python3.4/opcode.* ${libdir}/python3.4/symbo=
l.* ${libdir}/python3.4/repr.* ${libdir}/python3.4/token.* ${libdir}/python=
3.4/tokenize.* ${libdir}/python3.4/traceback.* ${libdir}/python3.4/weakref.=
* "
> =20
>  SUMMARY_${PN}-logging=3D"Python logging support"
>  RDEPENDS_${PN}-logging=3D"${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${=
PN}-stringold"
> -FILES_${PN}-logging=3D"${libdir}/python3.3/logging "
> +FILES_${PN}-logging=3D"${libdir}/python3.4/logging "
> =20
>  SUMMARY_${PN}-mailbox=3D"Python mailbox format support"
>  RDEPENDS_${PN}-mailbox=3D"${PN}-core ${PN}-mime"
> -FILES_${PN}-mailbox=3D"${libdir}/python3.3/mailbox.* "
> +FILES_${PN}-mailbox=3D"${libdir}/python3.4/mailbox.* "
> =20
>  SUMMARY_${PN}-math=3D"Python math support"
>  RDEPENDS_${PN}-math=3D"${PN}-core"
> -FILES_${PN}-math=3D"${libdir}/python3.3/lib-dynload/cmath.*.so ${libdir}=
/python3.3/lib-dynload/math.*.so ${libdir}/python3.3/lib-dynload/_random.*.=
so ${libdir}/python3.3/random.* ${libdir}/python3.3/sets.* "
> +FILES_${PN}-math=3D"${libdir}/python3.4/lib-dynload/cmath.*.so ${libdir}=
/python3.4/lib-dynload/math.*.so ${libdir}/python3.4/lib-dynload/_random.*.=
so ${libdir}/python3.4/random.* ${libdir}/python3.4/sets.* "
> =20
>  SUMMARY_${PN}-mime=3D"Python MIME handling APIs"
>  RDEPENDS_${PN}-mime=3D"${PN}-core ${PN}-io"
> -FILES_${PN}-mime=3D"${libdir}/python3.3/mimetools.* ${libdir}/python3.3/=
uu.* ${libdir}/python3.3/quopri.* ${libdir}/python3.3/rfc822.* ${libdir}/py=
thon3.3/MimeWriter.* "
> +FILES_${PN}-mime=3D"${libdir}/python3.4/mimetools.* ${libdir}/python3.4/=
uu.* ${libdir}/python3.4/quopri.* ${libdir}/python3.4/rfc822.* ${libdir}/py=
thon3.4/MimeWriter.* "
> =20
>  SUMMARY_${PN}-mmap=3D"Python memory-mapped file support"
>  RDEPENDS_${PN}-mmap=3D"${PN}-core ${PN}-io"
> -FILES_${PN}-mmap=3D"${libdir}/python3.3/lib-dynload/mmap.*.so "
> +FILES_${PN}-mmap=3D"${libdir}/python3.4/lib-dynload/mmap.*.so "
> =20
>  SUMMARY_${PN}-multiprocessing=3D"Python multiprocessing support"
>  RDEPENDS_${PN}-multiprocessing=3D"${PN}-core ${PN}-io ${PN}-lang ${PN}-p=
ickle ${PN}-threading ${PN}-ctypes ${PN}-mmap"
> -FILES_${PN}-multiprocessing=3D"${libdir}/python3.3/lib-dynload/_multipro=
cessing.*.so ${libdir}/python3.3/multiprocessing "
> +FILES_${PN}-multiprocessing=3D"${libdir}/python3.4/lib-dynload/_multipro=
cessing.*.so ${libdir}/python3.4/multiprocessing "
> =20
>  SUMMARY_${PN}-netclient=3D"Python Internet Protocol clients"
>  RDEPENDS_${PN}-netclient=3D"${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-=
io ${PN}-lang ${PN}-logging ${PN}-mime"
> -FILES_${PN}-netclient=3D"${libdir}/python3.3/*Cookie*.* ${libdir}/python=
3.3/base64.* ${libdir}/python3.3/cookielib.* ${libdir}/python3.3/ftplib.* $=
{libdir}/python3.3/gopherlib.* ${libdir}/python3.3/hmac.* ${libdir}/python3=
=2E3/httplib.* ${libdir}/python3.3/mimetypes.* ${libdir}/python3.3/nntplib.=
* ${libdir}/python3.3/poplib.* ${libdir}/python3.3/smtplib.* ${libdir}/pyth=
on3.3/telnetlib.* ${libdir}/python3.3/urllib.* ${libdir}/python3.3/urllib2.=
* ${libdir}/python3.3/urlparse.* ${libdir}/python3.3/uuid.* ${libdir}/pytho=
n3.3/rfc822.* ${libdir}/python3.3/mimetools.* "
> +FILES_${PN}-netclient=3D"${libdir}/python3.4/*Cookie*.* ${libdir}/python=
3.4/base64.* ${libdir}/python3.4/cookielib.* ${libdir}/python3.4/ftplib.* $=
{libdir}/python3.4/gopherlib.* ${libdir}/python3.4/hmac.* ${libdir}/python3=
=2E4/httplib.* ${libdir}/python3.4/mimetypes.* ${libdir}/python3.4/nntplib.=
* ${libdir}/python3.4/poplib.* ${libdir}/python3.4/smtplib.* ${libdir}/pyth=
on3.4/telnetlib.* ${libdir}/python3.4/urllib.* ${libdir}/python3.4/urllib2.=
* ${libdir}/python3.4/urlparse.* ${libdir}/python3.4/uuid.* ${libdir}/pytho=
n3.4/rfc822.* ${libdir}/python3.4/mimetools.* "
> =20
>  SUMMARY_${PN}-netserver=3D"Python Internet Protocol servers"
>  RDEPENDS_${PN}-netserver=3D"${PN}-core ${PN}-netclient"
> -FILES_${PN}-netserver=3D"${libdir}/python3.3/cgi.* ${libdir}/python3.3/*=
HTTPServer.* ${libdir}/python3.3/SocketServer.* "
> +FILES_${PN}-netserver=3D"${libdir}/python3.4/cgi.* ${libdir}/python3.4/*=
HTTPServer.* ${libdir}/python3.4/SocketServer.* "
> =20
>  SUMMARY_${PN}-numbers=3D"Python number APIs"
>  RDEPENDS_${PN}-numbers=3D"${PN}-core ${PN}-lang ${PN}-re"
> -FILES_${PN}-numbers=3D"${libdir}/python3.3/decimal.* ${libdir}/python3.3=
/numbers.* "
> +FILES_${PN}-numbers=3D"${libdir}/python3.4/decimal.* ${libdir}/python3.4=
/numbers.* "
> =20
>  SUMMARY_${PN}-pickle=3D"Python serialisation/persistence support"
>  RDEPENDS_${PN}-pickle=3D"${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
> -FILES_${PN}-pickle=3D"${libdir}/python3.3/pickle.* ${libdir}/python3.3/s=
helve.* ${libdir}/python3.3/lib-dynload/cPickle.*.so ${libdir}/python3.3/pi=
ckletools.* "
> +FILES_${PN}-pickle=3D"${libdir}/python3.4/pickle.* ${libdir}/python3.4/s=
helve.* ${libdir}/python3.4/lib-dynload/cPickle.*.so ${libdir}/python3.4/pi=
ckletools.* "
> =20
>  SUMMARY_${PN}-pkgutil=3D"Python package extension utility support"
>  RDEPENDS_${PN}-pkgutil=3D"${PN}-core"
> -FILES_${PN}-pkgutil=3D"${libdir}/python3.3/pkgutil.* "
> +FILES_${PN}-pkgutil=3D"${libdir}/python3.4/pkgutil.* "
> =20
>  SUMMARY_${PN}-pprint=3D"Python pretty-print support"
>  RDEPENDS_${PN}-pprint=3D"${PN}-core ${PN}-io"
> -FILES_${PN}-pprint=3D"${libdir}/python3.3/pprint.* "
> +FILES_${PN}-pprint=3D"${libdir}/python3.4/pprint.* "
> =20
>  SUMMARY_${PN}-profile=3D"Python basic performance profiling support"
>  RDEPENDS_${PN}-profile=3D"${PN}-core ${PN}-textutils"
> -FILES_${PN}-profile=3D"${libdir}/python3.3/profile.* ${libdir}/python3.3=
/pstats.* ${libdir}/python3.3/cProfile.* ${libdir}/python3.3/lib-dynload/_l=
sprof.*.so "
> +FILES_${PN}-profile=3D"${libdir}/python3.4/profile.* ${libdir}/python3.4=
/pstats.* ${libdir}/python3.4/cProfile.* ${libdir}/python3.4/lib-dynload/_l=
sprof.*.so "
> =20
>  SUMMARY_${PN}-pydoc=3D"Python interactive help support"
>  RDEPENDS_${PN}-pydoc=3D"${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re"
> -FILES_${PN}-pydoc=3D"${bindir}/pydoc ${libdir}/python3.3/pydoc.* ${libdi=
r}/python3.3/pydoc_data "
> +FILES_${PN}-pydoc=3D"${bindir}/pydoc ${libdir}/python3.4/pydoc.* ${libdi=
r}/python3.4/pydoc_data "
> =20
>  SUMMARY_${PN}-re=3D"Python Regular Expression APIs"
>  RDEPENDS_${PN}-re=3D"${PN}-core"
> -FILES_${PN}-re=3D"${libdir}/python3.3/re.* ${libdir}/python3.3/sre.* ${l=
ibdir}/python3.3/sre_compile.* ${libdir}/python3.3/sre_constants* ${libdir}=
/python3.3/sre_parse.* "
> +FILES_${PN}-re=3D"${libdir}/python3.4/re.* ${libdir}/python3.4/sre.* ${l=
ibdir}/python3.4/sre_compile.* ${libdir}/python3.4/sre_constants* ${libdir}=
/python3.4/sre_parse.* "
> =20
>  SUMMARY_${PN}-readline=3D"Python readline support"
>  RDEPENDS_${PN}-readline=3D"${PN}-core"
> -FILES_${PN}-readline=3D"${libdir}/python3.3/lib-dynload/readline.*.so ${=
libdir}/python3.3/rlcompleter.* "
> +FILES_${PN}-readline=3D"${libdir}/python3.4/lib-dynload/readline.*.so ${=
libdir}/python3.4/rlcompleter.* "
> =20
>  SUMMARY_${PN}-reprlib=3D"Python alternate repr() implementation"
>  RDEPENDS_${PN}-reprlib=3D"${PN}-core"
> -FILES_${PN}-reprlib=3D"${libdir}/python3.3/reprlib.py "
> +FILES_${PN}-reprlib=3D"${libdir}/python3.4/reprlib.py "
> =20
>  SUMMARY_${PN}-resource=3D"Python resource control interface"
>  RDEPENDS_${PN}-resource=3D"${PN}-core"
> -FILES_${PN}-resource=3D"${libdir}/python3.3/lib-dynload/resource.*.so "
> +FILES_${PN}-resource=3D"${libdir}/python3.4/lib-dynload/resource.*.so "
> =20
>  SUMMARY_${PN}-robotparser=3D"Python robots.txt parser"
>  RDEPENDS_${PN}-robotparser=3D"${PN}-core ${PN}-netclient"
> -FILES_${PN}-robotparser=3D"${libdir}/python3.3/urllib/robotparser.* "
> +FILES_${PN}-robotparser=3D"${libdir}/python3.4/urllib/robotparser.* "
> =20
>  SUMMARY_${PN}-shell=3D"Python shell-like functionality"
>  RDEPENDS_${PN}-shell=3D"${PN}-core ${PN}-re"
> -FILES_${PN}-shell=3D"${libdir}/python3.3/cmd.* ${libdir}/python3.3/comma=
nds.* ${libdir}/python3.3/dircache.* ${libdir}/python3.3/fnmatch.* ${libdir=
}/python3.3/glob.* ${libdir}/python3.3/popen2.* ${libdir}/python3.3/shlex.*=
 ${libdir}/python3.3/shutil.* "
> +FILES_${PN}-shell=3D"${libdir}/python3.4/cmd.* ${libdir}/python3.4/comma=
nds.* ${libdir}/python3.4/dircache.* ${libdir}/python3.4/fnmatch.* ${libdir=
}/python3.4/glob.* ${libdir}/python3.4/popen2.* ${libdir}/python3.4/shlex.*=
 ${libdir}/python3.4/shutil.* "
> =20
>  SUMMARY_${PN}-smtpd=3D"Python Simple Mail Transport Daemon"
>  RDEPENDS_${PN}-smtpd=3D"${PN}-core ${PN}-netserver ${PN}-email ${PN}-mim=
e"
> -FILES_${PN}-smtpd=3D"${bindir}/smtpd.* ${libdir}/python3.3/smtpd.* "
> +FILES_${PN}-smtpd=3D"${bindir}/smtpd.* ${libdir}/python3.4/smtpd.* "
> =20
>  SUMMARY_${PN}-sqlite3=3D"Python Sqlite3 database support"
>  RDEPENDS_${PN}-sqlite3=3D"${PN}-core ${PN}-datetime ${PN}-lang ${PN}-cry=
pt ${PN}-io ${PN}-threading"
> -FILES_${PN}-sqlite3=3D"${libdir}/python3.3/lib-dynload/_sqlite3.*.so ${l=
ibdir}/python3.3/sqlite3/dbapi2.* ${libdir}/python3.3/sqlite3/__init__.* ${=
libdir}/python3.3/sqlite3/dump.* "
> +FILES_${PN}-sqlite3=3D"${libdir}/python3.4/lib-dynload/_sqlite3.*.so ${l=
ibdir}/python3.4/sqlite3/dbapi2.* ${libdir}/python3.4/sqlite3/__init__.* ${=
libdir}/python3.4/sqlite3/dump.* "
> =20
>  SUMMARY_${PN}-sqlite3-tests=3D"Python Sqlite3 database support tests"
>  RDEPENDS_${PN}-sqlite3-tests=3D"${PN}-core ${PN}-sqlite3"
> -FILES_${PN}-sqlite3-tests=3D"${libdir}/python3.3/sqlite3/test "
> +FILES_${PN}-sqlite3-tests=3D"${libdir}/python3.4/sqlite3/test "
> =20
>  SUMMARY_${PN}-stringold=3D"Python string APIs [deprecated]"
>  RDEPENDS_${PN}-stringold=3D"${PN}-core ${PN}-re"
> -FILES_${PN}-stringold=3D"${libdir}/python3.3/lib-dynload/strop.*.so ${li=
bdir}/python3.3/string.* ${libdir}/python3.3/stringold.* "
> +FILES_${PN}-stringold=3D"${libdir}/python3.4/lib-dynload/strop.*.so ${li=
bdir}/python3.4/string.* ${libdir}/python3.4/stringold.* "
> =20
>  SUMMARY_${PN}-subprocess=3D"Python subprocess support"
>  RDEPENDS_${PN}-subprocess=3D"${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${=
PN}-pickle"
> -FILES_${PN}-subprocess=3D"${libdir}/python3.3/subprocess.* "
> +FILES_${PN}-subprocess=3D"${libdir}/python3.4/subprocess.* "
> =20
>  SUMMARY_${PN}-syslog=3D"Python syslog interface"
>  RDEPENDS_${PN}-syslog=3D"${PN}-core"
> -FILES_${PN}-syslog=3D"${libdir}/python3.3/lib-dynload/syslog.*.so "
> +FILES_${PN}-syslog=3D"${libdir}/python3.4/lib-dynload/syslog.*.so "
> =20
>  SUMMARY_${PN}-terminal=3D"Python terminal controlling support"
>  RDEPENDS_${PN}-terminal=3D"${PN}-core ${PN}-io"
> -FILES_${PN}-terminal=3D"${libdir}/python3.3/pty.* ${libdir}/python3.3/tt=
y.* "
> +FILES_${PN}-terminal=3D"${libdir}/python3.4/pty.* ${libdir}/python3.4/tt=
y.* "
> =20
>  SUMMARY_${PN}-tests=3D"Python tests"
>  RDEPENDS_${PN}-tests=3D"${PN}-core"
> -FILES_${PN}-tests=3D"${libdir}/python3.3/test "
> +FILES_${PN}-tests=3D"${libdir}/python3.4/test "
> =20
>  SUMMARY_${PN}-textutils=3D"Python option parsing, text wrapping and CSV =
support"
>  RDEPENDS_${PN}-textutils=3D"${PN}-core ${PN}-io ${PN}-re ${PN}-stringold"
> -FILES_${PN}-textutils=3D"${libdir}/python3.3/lib-dynload/_csv.*.so ${lib=
dir}/python3.3/csv.* ${libdir}/python3.3/optparse.* ${libdir}/python3.3/tex=
twrap.* "
> +FILES_${PN}-textutils=3D"${libdir}/python3.4/lib-dynload/_csv.*.so ${lib=
dir}/python3.4/csv.* ${libdir}/python3.4/optparse.* ${libdir}/python3.4/tex=
twrap.* "
> =20
>  SUMMARY_${PN}-threading=3D"Python threading & synchronization support"
>  RDEPENDS_${PN}-threading=3D"${PN}-core ${PN}-lang"
> -FILES_${PN}-threading=3D"${libdir}/python3.3/_threading_local.* ${libdir=
}/python3.3/dummy_thread.* ${libdir}/python3.3/dummy_threading.* ${libdir}/=
python3.3/mutex.* ${libdir}/python3.3/threading.* ${libdir}/python3.3/Queue=
=2E* "
> +FILES_${PN}-threading=3D"${libdir}/python3.4/_threading_local.* ${libdir=
}/python3.4/dummy_thread.* ${libdir}/python3.4/dummy_threading.* ${libdir}/=
python3.4/mutex.* ${libdir}/python3.4/threading.* ${libdir}/python3.4/Queue=
=2E* "
> =20
>  SUMMARY_${PN}-tkinter=3D"Python Tcl/Tk bindings"
>  RDEPENDS_${PN}-tkinter=3D"${PN}-core"
> -FILES_${PN}-tkinter=3D"${libdir}/python3.3/lib-dynload/_tkinter.*.so ${l=
ibdir}/python3.3/lib-tk ${libdir}/python3.3/tkinter "
> +FILES_${PN}-tkinter=3D"${libdir}/python3.4/lib-dynload/_tkinter.*.so ${l=
ibdir}/python3.4/lib-tk ${libdir}/python3.4/tkinter "
> =20
>  SUMMARY_${PN}-unittest=3D"Python unit testing framework"
>  RDEPENDS_${PN}-unittest=3D"${PN}-core ${PN}-stringold ${PN}-lang ${PN}-i=
o ${PN}-difflib ${PN}-pprint ${PN}-shell"
> -FILES_${PN}-unittest=3D"${libdir}/python3.3/unittest/ "
> +FILES_${PN}-unittest=3D"${libdir}/python3.4/unittest/ "
> =20
>  SUMMARY_${PN}-unixadmin=3D"Python Unix administration support"
>  RDEPENDS_${PN}-unixadmin=3D"${PN}-core"
> -FILES_${PN}-unixadmin=3D"${libdir}/python3.3/lib-dynload/nis.*.so ${libd=
ir}/python3.3/lib-dynload/grp.*.so ${libdir}/python3.3/lib-dynload/pwd.*.so=
 ${libdir}/python3.3/getpass.* "
> +FILES_${PN}-unixadmin=3D"${libdir}/python3.4/lib-dynload/nis.*.so ${libd=
ir}/python3.4/lib-dynload/grp.*.so ${libdir}/python3.4/lib-dynload/pwd.*.so=
 ${libdir}/python3.4/getpass.* "
> =20
>  SUMMARY_${PN}-xml=3D"Python basic XML support"
>  RDEPENDS_${PN}-xml=3D"${PN}-core ${PN}-elementtree ${PN}-re"
> -FILES_${PN}-xml=3D"${libdir}/python3.3/lib-dynload/pyexpat.*.so ${libdir=
}/python3.3/xml ${libdir}/python3.3/xmllib.* "
> +FILES_${PN}-xml=3D"${libdir}/python3.4/lib-dynload/pyexpat.*.so ${libdir=
}/python3.4/xml ${libdir}/python3.4/xmllib.* "
> =20
>  SUMMARY_${PN}-xmlrpc=3D"Python XML-RPC support"
>  RDEPENDS_${PN}-xmlrpc=3D"${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang"
> -FILES_${PN}-xmlrpc=3D"${libdir}/python3.3/xmlrpclib.* ${libdir}/python3.=
3/SimpleXMLRPCServer.* ${libdir}/python3.3/DocXMLRPCServer.* ${libdir}/pyth=
on3.3/xmlrpc "
> +FILES_${PN}-xmlrpc=3D"${libdir}/python3.4/xmlrpclib.* ${libdir}/python3.=
4/SimpleXMLRPCServer.* ${libdir}/python3.4/DocXMLRPCServer.* ${libdir}/pyth=
on3.4/xmlrpc "
> =20
>  SUMMARY_${PN}-modules=3D"All Python modules"
>  RDEPENDS_${PN}-modules=3D"${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-comp=
ile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN=
}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doct=
est ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-i=
dle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-loggin=
g ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN=
}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-=
pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN=
}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sq=
lite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${=
PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN=
}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
> diff --git a/meta/recipes-devtools/python/python3-native_3.3.3.bb b/meta/=
recipes-devtools/python/python3-native_3.4.2.bb
> similarity index 80%
> rename from meta/recipes-devtools/python/python3-native_3.3.3.bb
> rename to meta/recipes-devtools/python/python3-native_3.4.2.bb
> index 73ce095..d98a278 100644
> --- a/meta/recipes-devtools/python/python3-native_3.3.3.bb
> +++ b/meta/recipes-devtools/python/python3-native_3.4.2.bb
> @@ -1,10 +1,10 @@
>  require recipes-devtools/python/python.inc
> =20
>  PR =3D "${INC_PR}.0"
> -PYTHON_MAJMIN =3D "3.3"
> +PYTHON_MAJMIN =3D "3.4"
>  DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
>  DISTRO_SRC_URI_linuxstdbase =3D ""
> -SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2=
 \
> +SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>  file://12-distutils-prefix-is-inside-staging-area.patch \
>  file://python-config.patch \
>  file://000-cross-compile.patch \
> @@ -18,22 +18,19 @@ file://150-fix-setupterm.patch \
>  file://python-3.3-multilib.patch \
>  file://03-fix-tkinter-detection.patch \
>  file://avoid_warning_about_tkinter.patch \
> -file://06-ctypes-libffi-fix-configure.patch \
>  file://shutil-follow-symlink-fix.patch \
>  file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
>  file://sysroot-include-headers.patch \
>  file://unixccompiler.patch \
> -file://fix-ast.h-dependency.patch \
>  file://makerace.patch \
>  ${DISTRO_SRC_URI} \
> -file://python3-fix-build-error-with-Readline-6.3.patch \
>  file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
>  file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
>  "
> -SRC_URI[md5sum] =3D "f3ebe34d4d8695bf889279b54673e10c"
> -SRC_URI[sha256sum] =3D "e526e9b612f623888364d30cc9f3dfc34dcef39065c713bd=
bcddf47df84d8dcb"
> +SRC_URI[md5sum] =3D "36fc7327c02c6f12fa24fc9ba78039e3"
> +SRC_URI[sha256sum] =3D "1c6d9682d145c056537e477bbfa060ce727f9edd38df1827=
e0f970dcf04b2def"
> =20
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4eaea08eaaf6875189b0c49f26fa2=
005"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D64fc2b30b67d0a8423c250e0386ed=
72f"
> =20
>  S =3D "${WORKDIR}/Python-${PV}"
> =20
> @@ -59,8 +56,8 @@ EXTRA_OEMAKE =3D '\
>  # No ctypes option for python 3
>  PYTHONLSBOPTS =3D ""
> =20
> -do_configure_prepend() {
> -	autoreconf --verbose --install --force --exclude=3Dautopoint Modules/_c=
types/libffi || bbnote "_ctypes failed to autoreconf"
> +do_configure_append() {
> +	autoreconf --verbose --install --force --exclude=3Dautopoint ../Python-=
${PV}/Modules/_ctypes/libffi
>  }
> =20
>  do_install() {
> diff --git a/meta/recipes-devtools/python/python3/04-default-is-optimized=
=2Epatch b/meta/recipes-devtools/python/python3/04-default-is-optimized.pat=
ch
> index d5afd40..3b8f264 100644
> --- a/meta/recipes-devtools/python/python3/04-default-is-optimized.patch
> +++ b/meta/recipes-devtools/python/python3/04-default-is-optimized.patch
> @@ -1,20 +1,21 @@
>  Upstream-Status: Inappropriate [embedded specific]
> =20
> -Updated original patch for python 2.7.3
> -
> -Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> -2012/05/01
> -
> -
>  # when compiling for an embedded system, we need every bit of
>  # performance we can get. default to optimized with the option
>  # of opt-out.
>  # Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> =20
> -Index: Python-3.2.3/Python/compile.c
> +
> +2012/05/01
> +Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> +
> +Rebased for 3.4.2 02/2015
> +Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> +
> +Index: Python-3.4.2/Python/compile.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.2.3.orig/Python/compile.c	2012-04-10 23:54:08.000000000 -07=
00
> -+++ Python-3.2.3/Python/compile.c	2012-09-19 15:58:46.649123998 -0700
> +--- Python-3.4.2.orig/Python/compile.c
> ++++ Python-3.4.2/Python/compile.c
>  @@ -30,7 +30,7 @@
>   #include "symtable.h"
>   #include "opcode.h"
> @@ -24,28 +25,28 @@ Index: Python-3.2.3/Python/compile.c
>  =20
>   #define DEFAULT_BLOCK_SIZE 16
>   #define DEFAULT_BLOCKS 8
> -Index: Python-3.2.3/Modules/main.c
> +Index: Python-3.4.2/Modules/main.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.2.3.orig/Modules/main.c	2012-04-10 23:54:07.000000000 -0700
> -+++ Python-3.2.3/Modules/main.c	2012-09-19 16:00:32.153124053 -0700
> -@@ -46,7 +46,7 @@
> +--- Python-3.4.2.orig/Modules/main.c
> ++++ Python-3.4.2/Modules/main.c
> +@@ -38,7 +38,7 @@ static wchar_t **orig_argv;
>   static int  orig_argc;
>  =20
>   /* command line options */
> --#define BASE_OPTS L"bBc:dEhiJm:OqRsStuvVW:xX:?"
> -+#define BASE_OPTS L"bBc:dEhiJm:NOqRsStuvVW:xX:?"
> +-#define BASE_OPTS L"bBc:dEhiIJm:OqRsStuvVW:xX:?"
> ++#define BASE_OPTS L"bBc:dEhiIJm:NOqRsStuvVW:xX:?"
>  =20
>   #define PROGRAM_OPTS BASE_OPTS
>  =20
> -@@ -71,6 +71,7 @@
> +@@ -64,6 +64,7 @@ static char *usage_2 =3D "\
>   -m mod : run library module as a script (terminates option list)\n\
>   -O     : optimize generated bytecode slightly; also PYTHONOPTIMIZE=3Dx\=
n\
>   -OO    : remove doc-strings in addition to the -O optimizations\n\
>  +-N     : do NOT optimize generated bytecode\n\
>   -q     : don't print version and copyright messages on interactive star=
tup\n\
> - -R     : use a pseudo-random salt to make hash() values of various type=
s be\n\
> -          unpredictable between separate invocations of the interpreter,=
 as\n\
> -@@ -407,8 +408,8 @@
> + -s     : don't add user site directory to sys.path; also PYTHONNOUSERSI=
TE\n\
> + -S     : don't imply 'import site' on initialization\n\
> +@@ -418,8 +419,8 @@ Py_Main(int argc, wchar_t **argv)
>  =20
>           /* case 'J': reserved for Jython */
>  =20
> diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-=
inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distuti=
ls-prefix-is-inside-staging-area.patch
> index c5846a5..bf02df2 100644
> --- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-=
staging-area.patch
> +++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-=
staging-area.patch
> @@ -1,15 +1,18 @@
>  Upstream-Status: Inappropriate [embedded specific]
> =20
> +02/2015 Rebased for Python 3.4.2
> +
>  # The proper prefix is inside our staging area.
>  # Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
>  # Signed-off-by: Phil Blundell <philb@gnu.org>
>  # Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +# Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.co=
m>
> =20
> -Index: Python-3.3.2/Lib/distutils/sysconfig.py
> +Index: Python-3.4.2/Lib/distutils/sysconfig.py
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.2.orig/Lib/distutils/sysconfig.py	2013-07-30 00:00:52.769=
749805 -0700
> -+++ Python-3.3.2/Lib/distutils/sysconfig.py	2013-07-30 00:16:22.54576724=
8 -0700
> -@@ -16,10 +16,11 @@
> +--- Python-3.4.2.orig/Lib/distutils/sysconfig.py
> ++++ Python-3.4.2/Lib/distutils/sysconfig.py
> +@@ -16,10 +16,11 @@ import sys
>   from .errors import DistutilsPlatformError
>  =20
>   # These are needed in a couple of spots, so just compute them once.
> @@ -25,7 +28,7 @@ Index: Python-3.3.2/Lib/distutils/sysconfig.py
>  =20
>   # Path to the base directory of the project. On Windows the binary may
>   # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
> -@@ -93,7 +94,9 @@
> +@@ -93,7 +94,9 @@ def get_python_inc(plat_specific=3D0, pref
>       If 'prefix' is supplied, use it instead of sys.base_prefix or
>       sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
>       """
> @@ -36,7 +39,7 @@ Index: Python-3.3.2/Lib/distutils/sysconfig.py
>           prefix =3D plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
>       if os.name =3D=3D "posix":
>           if python_build:
> -@@ -136,6 +139,12 @@
> +@@ -134,6 +137,12 @@ def get_python_lib(plat_specific=3D0, stan
>       If 'prefix' is supplied, use it instead of sys.base_prefix or
>       sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
>       """
> @@ -49,7 +52,7 @@ Index: Python-3.3.2/Lib/distutils/sysconfig.py
>       if prefix is None:
>           if standard_lib:
>               prefix =3D plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
> -@@ -144,7 +153,7 @@
> +@@ -142,7 +151,7 @@ def get_python_lib(plat_specific=3D0, stan
>  =20
>       if os.name =3D=3D "posix":
>           libpython =3D os.path.join(prefix,
> @@ -58,16 +61,16 @@ Index: Python-3.3.2/Lib/distutils/sysconfig.py
>           if standard_lib:
>               return libpython
>           else:
> -@@ -249,7 +258,7 @@
> +@@ -242,7 +251,7 @@ def get_config_h_filename():
>       else:
> -         # The name of the config.h file changed in 2.2
> -         config_h =3D 'pyconfig.h'
> --    return os.path.join(inc_dir, config_h)
> -+    return os.path.join(inc_dir, config_h).replace( os.getenv("BUILD_SY=
S"), os.getenv("HOST_SYS") )
> +         inc_dir =3D get_python_inc(plat_specific=3D1)
> +=20
> +-    return os.path.join(inc_dir, 'pyconfig.h')
> ++    return os.path.join(inc_dir, 'pyconfig.h'.replace( os.getenv("BUILD=
_SYS"), os.getenv("HOST_SYS") ))
>  =20
>  =20
>   def get_makefile_filename():
> -@@ -258,7 +267,7 @@
> +@@ -251,7 +260,7 @@ def get_makefile_filename():
>           return os.path.join(_sys_home or project_base, "Makefile")
>       lib_dir =3D get_python_lib(plat_specific=3D0, standard_lib=3D1)
>       config_file =3D 'config-{}{}'.format(get_python_version(), build_fl=
ags)
> diff --git a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-=
path.patch b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-pa=
th.patch
> index 054a131..f29ae53 100644
> --- a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.pa=
tch
> +++ b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.pa=
tch
> @@ -1,29 +1,21 @@
> +Upstream-Status: Pending
> +
>  We should make sure that sysroot is used by gcc instead of assuming
>  hardcoded locations for include paths
> =20
> -Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -:
> -Index: Python-3.3.3/configure.ac
> +
> +Index: Python-3.4.2/configure.ac
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.3.orig/configure.ac	2014-01-29 19:00:15.245312752 -0800
> -+++ Python-3.3.3/configure.ac	2014-01-29 23:27:22.938526262 -0800
> -@@ -1548,7 +1548,7 @@
> - # checks for header files
> - AC_HEADER_STDC
> - ac_save_cppflags=3D"$CPPFLAGS"
> --CPPFLAGS=3D"$CPPFLAGS -I/usr/include/ncursesw"
> -+CPPFLAGS=3D"$CPPFLAGS -I=3D/usr/include/ncursesw"
> - AC_CHECK_HEADERS(asm/types.h conio.h curses.h direct.h dlfcn.h errno.h \
> - fcntl.h grp.h \
> - ieeefp.h io.h langinfo.h libintl.h ncurses.h process.h pthread.h \
> -@@ -4308,7 +4308,7 @@
> - fi
> +--- Python-3.4.2.orig/configure.ac
> ++++ Python-3.4.2/configure.ac
> +@@ -4434,7 +4434,7 @@ fi
>  =20
> + # first curses header check
>   ac_save_cppflags=3D"$CPPFLAGS"
>  -CPPFLAGS=3D"$CPPFLAGS -I/usr/include/ncursesw"
>  +CPPFLAGS=3D"$CPPFLAGS -I=3D/usr/include/ncursesw"
> - # On HP/UX 11.0, mvwdelch is a block with a return statement
> - AC_MSG_CHECKING(whether mvwdelch is an expression)
> - AC_CACHE_VAL(ac_cv_mvwdelch_is_expression,
> +=20
> + AC_CHECK_HEADERS(curses.h ncurses.h)
> +=20
> diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.pat=
ch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
> index 7d66a0e..b3e9860 100644
> --- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
> +++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
> @@ -1,14 +1,17 @@
> +Upstream-Status: Pending
> +
>  get the sys.lib from python itself and do not use hardcoded value of 'li=
b'
> =20
> --Khem
> +02/2015 Rebased for 3.4.2
> =20
> -Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> =20
> -Index: Python-3.3.2/Include/pythonrun.h
> +Index: Python-3.4.2/Include/pythonrun.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.2.orig/Include/pythonrun.h	2013-05-15 09:32:54.000000000 =
-0700
> -+++ Python-3.3.2/Include/pythonrun.h	2013-07-27 16:19:54.099877246 -0700
> -@@ -181,6 +181,8 @@
> +--- Python-3.4.2.orig/Include/pythonrun.h
> ++++ Python-3.4.2/Include/pythonrun.h
> +@@ -220,6 +220,8 @@ int _Py_CheckPython3();
>   /* In their own files */
>   PyAPI_FUNC(const char *) Py_GetVersion(void);
>   PyAPI_FUNC(const char *) Py_GetPlatform(void);
> @@ -17,20 +20,20 @@ Index: Python-3.3.2/Include/pythonrun.h
>   PyAPI_FUNC(const char *) Py_GetCopyright(void);
>   PyAPI_FUNC(const char *) Py_GetCompiler(void);
>   PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
> -Index: Python-3.3.2/Lib/distutils/command/install.py
> +Index: Python-3.4.2/Lib/distutils/command/install.py
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.2.orig/Lib/distutils/command/install.py	2013-05-15 09:32:=
54.000000000 -0700
> -+++ Python-3.3.2/Lib/distutils/command/install.py	2013-07-27 16:19:54.09=
9877246 -0700
> -@@ -25,6 +25,8 @@
> -     from site import USER_SITE
> -     HAS_USER_SITE =3D True
> +--- Python-3.4.2.orig/Lib/distutils/command/install.py
> ++++ Python-3.4.2/Lib/distutils/command/install.py
> +@@ -19,6 +19,8 @@ from site import USER_BASE
> + from site import USER_SITE
> + HAS_USER_SITE =3D True
>  =20
>  +libname =3D sys.lib
>  +
> - if sys.version < "2.2":
> -     WINDOWS_SCHEME =3D {
> -         'purelib': '$base',
> -@@ -45,7 +47,7 @@
> + WINDOWS_SCHEME =3D {
> +     'purelib': '$base/Lib/site-packages',
> +     'platlib': '$base/Lib/site-packages',
> +@@ -30,7 +32,7 @@ WINDOWS_SCHEME =3D {
>   INSTALL_SCHEMES =3D {
>       'unix_prefix': {
>           'purelib': '$base/lib/python$py_version_short/site-packages',
> @@ -39,11 +42,11 @@ Index: Python-3.3.2/Lib/distutils/command/install.py
>           'headers': '$base/include/python$py_version_short$abiflags/$dis=
t_name',
>           'scripts': '$base/bin',
>           'data'   : '$base',
> -Index: Python-3.3.2/Lib/pydoc.py
> +Index: Python-3.4.2/Lib/pydoc.py
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.2.orig/Lib/pydoc.py	2013-05-15 09:32:55.000000000 -0700
> -+++ Python-3.3.2/Lib/pydoc.py	2013-07-27 16:19:54.103877246 -0700
> -@@ -372,7 +372,7 @@
> +--- Python-3.4.2.orig/Lib/pydoc.py
> ++++ Python-3.4.2/Lib/pydoc.py
> +@@ -394,7 +394,7 @@ class Doc:
>  =20
>           docloc =3D os.environ.get("PYTHONDOCS", self.PYTHONDOCS)
>  =20
> @@ -52,38 +55,11 @@ Index: Python-3.3.2/Lib/pydoc.py
>                                  "python%d.%d" %  sys.version_info[:2])
>           if (isinstance(object, type(os)) and
>               (object.__name__ in ('errno', 'exceptions', 'gc', 'imp',
> -Index: Python-3.3.2/Lib/site.py
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.2.orig/Lib/site.py	2013-05-15 09:32:55.000000000 -0700
> -+++ Python-3.3.2/Lib/site.py	2013-07-27 16:19:54.103877246 -0700
> -@@ -303,13 +303,19 @@
> -         if sys.platform in ('os2emx', 'riscos'):
> -             sitepackages.append(os.path.join(prefix, "Lib", "site-packa=
ges"))
> -         elif os.sep =3D=3D '/':
> --            sitepackages.append(os.path.join(prefix, "lib",
> -+            sitepackages.append(os.path.join(prefix, sys.lib,
> -                                         "python" + sys.version[:3],
> -                                         "site-packages"))
> --            sitepackages.append(os.path.join(prefix, "lib", "site-pytho=
n"))
> -+            if sys.lib !=3D "lib":
> -+                sitepackages.append(os.path.join(prefix, "lib",
> -+                                        "python" + sys.version[:3],
> -+                                        "site-packages"))
> -+            sitepackages.append(os.path.join(prefix, sys.lib, "site-pyt=
hon"))
> -+            if sys.lib !=3D "lib":
> -+                sitepackages.append(os.path.join(prefix, "lib", "site-p=
ython"))
> -         else:
> -             sitepackages.append(prefix)
> --            sitepackages.append(os.path.join(prefix, "lib", "site-packa=
ges"))
> -+            sitepackages.append(os.path.join(prefix, sys.lib, "site-pac=
kages"))
> -         if sys.platform =3D=3D "darwin":
> -             # for framework builds *only* we add the standard Apple
> -             # locations.
> -Index: Python-3.3.2/Lib/trace.py
> +Index: Python-3.4.2/Lib/trace.py
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.2.orig/Lib/trace.py	2013-05-15 09:32:56.000000000 -0700
> -+++ Python-3.3.2/Lib/trace.py	2013-07-27 16:19:54.103877246 -0700
> -@@ -751,10 +751,10 @@
> +--- Python-3.4.2.orig/Lib/trace.py
> ++++ Python-3.4.2/Lib/trace.py
> +@@ -751,10 +751,10 @@ def main(argv=3DNone):
>                   # should I also call expanduser? (after all, could use =
$HOME)
>  =20
>                   s =3D s.replace("$prefix",
> @@ -96,11 +72,11 @@ Index: Python-3.3.2/Lib/trace.py
>                                              "python" + sys.version[:3]))
>                   s =3D os.path.normpath(s)
>                   ignore_dirs.append(s)
> -Index: Python-3.3.2/Makefile.pre.in
> +Index: Python-3.4.2/Makefile.pre.in
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.2.orig/Makefile.pre.in	2013-07-27 16:19:16.000000000 -0700
> -+++ Python-3.3.2/Makefile.pre.in	2013-07-27 16:19:54.103877246 -0700
> -@@ -96,6 +96,8 @@
> +--- Python-3.4.2.orig/Makefile.pre.in
> ++++ Python-3.4.2/Makefile.pre.in
> +@@ -101,6 +101,8 @@ PY_CORE_CFLAGS=3D	$(PY_CFLAGS) $(PY_CFLAGS
>  =20
>   # Machine-dependent subdirectories
>   MACHDEP=3D	@MACHDEP@
> @@ -109,7 +85,7 @@ Index: Python-3.3.2/Makefile.pre.in
>  =20
>   # Multiarch directory (may be empty)
>   MULTIARCH=3D	@MULTIARCH@
> -@@ -115,7 +117,7 @@
> +@@ -120,7 +122,7 @@ LIBDIR=3D		@libdir@
>   MANDIR=3D		@mandir@
>   INCLUDEDIR=3D	@includedir@
>   CONFINCLUDEDIR=3D	$(exec_prefix)/include
> @@ -118,7 +94,7 @@ Index: Python-3.3.2/Makefile.pre.in
>   ABIFLAGS=3D	@ABIFLAGS@
>  =20
>   # Detailed destination directories
> -@@ -635,6 +637,7 @@
> +@@ -712,6 +714,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
>   		-DEXEC_PREFIX=3D'"$(exec_prefix)"' \
>   		-DVERSION=3D'"$(VERSION)"' \
>   		-DVPATH=3D'"$(VPATH)"' \
> @@ -126,7 +102,7 @@ Index: Python-3.3.2/Makefile.pre.in
>   		-o $@ $(srcdir)/Modules/getpath.c
>  =20
>   Modules/python.o: $(srcdir)/Modules/python.c
> -@@ -701,7 +704,7 @@
> +@@ -780,7 +783,7 @@ $(AST_C): $(AST_H) $(AST_ASDL) $(ASDLGEN
>   Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
>  =20
>   Python/getplatform.o: $(srcdir)/Python/getplatform.c
> @@ -135,11 +111,11 @@ Index: Python-3.3.2/Makefile.pre.in
>  =20
>   Python/importdl.o: $(srcdir)/Python/importdl.c
>   		$(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/impo=
rtdl.c
> -Index: Python-3.3.2/Modules/getpath.c
> +Index: Python-3.4.2/Modules/getpath.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.2.orig/Modules/getpath.c	2013-05-15 09:32:59.000000000 -0=
700
> -+++ Python-3.3.2/Modules/getpath.c	2013-07-27 16:19:54.107877246 -0700
> -@@ -121,9 +121,11 @@
> +--- Python-3.4.2.orig/Modules/getpath.c
> ++++ Python-3.4.2/Modules/getpath.c
> +@@ -117,9 +117,11 @@
>   #define EXEC_PREFIX PREFIX
>   #endif
>  =20
> @@ -153,20 +129,19 @@ Index: Python-3.3.2/Modules/getpath.c
>   #endif
>  =20
>   #ifndef LANDMARK
> -@@ -135,7 +137,7 @@
> +@@ -130,6 +132,7 @@ static wchar_t prefix[MAXPATHLEN+1];
> + static wchar_t exec_prefix[MAXPATHLEN+1];
>   static wchar_t progpath[MAXPATHLEN+1];
>   static wchar_t *module_search_path =3D NULL;
> - static int module_search_path_malloced =3D 0;
> --static wchar_t *lib_python =3D L"lib/python" VERSION;
>  +static wchar_t *lib_python =3D L"" LIB_PYTHON;
>  =20
>   static void
>   reduce(wchar_t *dir)
> -Index: Python-3.3.2/Python/getplatform.c
> +Index: Python-3.4.2/Python/getplatform.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.2.orig/Python/getplatform.c	2013-05-15 09:33:00.000000000=
 -0700
> -+++ Python-3.3.2/Python/getplatform.c	2013-07-27 16:19:54.107877246 -0700
> -@@ -10,3 +10,23 @@
> +--- Python-3.4.2.orig/Python/getplatform.c
> ++++ Python-3.4.2/Python/getplatform.c
> +@@ -10,3 +10,23 @@ Py_GetPlatform(void)
>   {
>   	return PLATFORM;
>   }
> @@ -190,11 +165,11 @@ Index: Python-3.3.2/Python/getplatform.c
>  +{
>  +	return LIB;
>  +}
> -Index: Python-3.3.2/Python/sysmodule.c
> +Index: Python-3.4.2/Python/sysmodule.c
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.2.orig/Python/sysmodule.c	2013-05-15 09:33:00.000000000 -=
0700
> -+++ Python-3.3.2/Python/sysmodule.c	2013-07-27 16:19:54.107877246 -0700
> -@@ -1612,6 +1612,10 @@
> +--- Python-3.4.2.orig/Python/sysmodule.c
> ++++ Python-3.4.2/Python/sysmodule.c
> +@@ -1697,6 +1697,10 @@ _PySys_Init(void)
>                           PyUnicode_FromString(Py_GetCopyright()));
>       SET_SYS_FROM_STRING("platform",
>                           PyUnicode_FromString(Py_GetPlatform()));
> @@ -205,11 +180,11 @@ Index: Python-3.3.2/Python/sysmodule.c
>       SET_SYS_FROM_STRING("executable",
>                           PyUnicode_FromWideChar(
>                                  Py_GetProgramFullPath(), -1));
> -Index: Python-3.3.2/setup.py
> +Index: Python-3.4.2/setup.py
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.2.orig/setup.py	2013-07-27 16:19:17.000000000 -0700
> -+++ Python-3.3.2/setup.py	2013-07-27 16:19:54.107877246 -0700
> -@@ -439,7 +439,7 @@
> +--- Python-3.4.2.orig/setup.py
> ++++ Python-3.4.2/setup.py
> +@@ -454,7 +454,7 @@ class PyBuildExt(build_ext):
>           # directories (i.e. '.' and 'Include') must be first.  See issue
>           # 10520.
>           if not cross_compiling:
> @@ -218,7 +193,7 @@ Index: Python-3.3.2/setup.py
>               add_dir_to_list(self.compiler.include_dirs, '/usr/local/inc=
lude')
>           # only change this for cross builds for 3.3, issues on Mageia
>           if cross_compiling:
> -@@ -497,8 +497,7 @@
> +@@ -512,8 +512,7 @@ class PyBuildExt(build_ext):
>           # be assumed that no additional -I,-L directives are needed.
>           if not cross_compiling:
>               lib_dirs =3D self.compiler.library_dirs + [
> @@ -228,7 +203,7 @@ Index: Python-3.3.2/setup.py
>                   ]
>               inc_dirs =3D self.compiler.include_dirs + ['/usr/include']
>           else:
> -@@ -675,11 +674,11 @@
> +@@ -696,11 +695,11 @@ class PyBuildExt(build_ext):
>               elif curses_library:
>                   readline_libs.append(curses_library)
>               elif self.compiler.find_library_file(lib_dirs +
> @@ -242,11 +217,11 @@ Index: Python-3.3.2/setup.py
>                                      extra_link_args=3Dreadline_extra_lin=
k_args,
>                                      libraries=3Dreadline_libs) )
>           else:
> -Index: Python-3.3.2/Lib/sysconfig.py
> +Index: Python-3.4.2/Lib/sysconfig.py
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.2.orig/Lib/sysconfig.py	2013-05-15 09:32:55.000000000 -07=
00
> -+++ Python-3.3.2/Lib/sysconfig.py	2013-07-27 16:19:54.111877246 -0700
> -@@ -21,10 +21,10 @@
> +--- Python-3.4.2.orig/Lib/sysconfig.py
> ++++ Python-3.4.2/Lib/sysconfig.py
> +@@ -20,10 +20,10 @@ __all__ =3D [
>  =20
>   _INSTALL_SCHEMES =3D {
>       'posix_prefix': {
> @@ -260,7 +235,7 @@ Index: Python-3.3.2/Lib/sysconfig.py
>           'include':
>               '{installed_base}/include/python{py_version_short}{abiflags=
}',
>           'platinclude':
> -@@ -33,10 +33,10 @@
> +@@ -32,10 +32,10 @@ _INSTALL_SCHEMES =3D {
>           'data': '{base}',
>           },
>       'posix_home': {
> @@ -274,7 +249,7 @@ Index: Python-3.3.2/Lib/sysconfig.py
>           'include': '{installed_base}/include/python',
>           'platinclude': '{installed_base}/include/python',
>           'scripts': '{base}/bin',
> -@@ -81,10 +81,10 @@
> +@@ -61,10 +61,10 @@ _INSTALL_SCHEMES =3D {
>           'data': '{userbase}',
>           },
>       'posix_user': {
> @@ -288,11 +263,11 @@ Index: Python-3.3.2/Lib/sysconfig.py
>           'include': '{userbase}/include/python{py_version_short}',
>           'scripts': '{userbase}/bin',
>           'data': '{userbase}',
> -Index: Python-3.3.2/configure.ac
> +Index: Python-3.4.2/configure.ac
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Python-3.3.2.orig/configure.ac	2013-05-15 09:33:00.000000000 -0700
> -+++ Python-3.3.2/configure.ac	2013-07-27 16:19:54.111877246 -0700
> -@@ -769,6 +769,41 @@
> +--- Python-3.4.2.orig/configure.ac
> ++++ Python-3.4.2/configure.ac
> +@@ -791,6 +791,41 @@ esac
>   MULTIARCH=3D$($CC --print-multiarch 2>/dev/null)
>   AC_SUBST(MULTIARCH)
>  =20
> @@ -334,3 +309,30 @@ Index: Python-3.3.2/configure.ac
>  =20
>   AC_SUBST(LIBRARY)
>   AC_MSG_CHECKING(LIBRARY)
> +Index: Python-3.4.2/Lib/site.py
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- Python-3.4.2.orig/Lib/site.py
> ++++ Python-3.4.2/Lib/site.py
> +@@ -304,13 +304,19 @@ def getsitepackages(prefixes=3DNone):
> +         seen.add(prefix)
> +=20
> +         if os.sep =3D=3D '/':
> +-            sitepackages.append(os.path.join(prefix, "lib",
> ++            sitepackages.append(os.path.join(prefix, sys.lib,
> +                                         "python" + sys.version[:3],
> +                                         "site-packages"))
> +-            sitepackages.append(os.path.join(prefix, "lib", "site-pytho=
n"))
> ++            if sys.lib !=3D "lib":
> ++                sitepackages.append(os.path.join(prefix, "lib",
> ++                                        "python" + sys.version[:3],
> ++                                        "site-packages"))
> ++            sitepackages.append(os.path.join(prefix, sys.lib, "site-pyt=
hon"))
> ++            if sys.lib !=3D "lib":
> ++                sitepackages.append(os.path.join(prefix, sys.lib, "site=
-python"))
> +         else:
> +             sitepackages.append(prefix)
> +-            sitepackages.append(os.path.join(prefix, "lib", "site-packa=
ges"))
> ++            sitepackages.append(os.path.join(prefix, sys.lib, "site-pac=
kages"))
> +         if sys.platform =3D=3D "darwin":
> +             # for framework builds *only* we add the standard Apple
> +             # locations.
> diff --git a/meta/recipes-devtools/python/python3_3.3.3.bb b/meta/recipes=
-devtools/python/python3_3.4.2.bb
> similarity index 93%
> rename from meta/recipes-devtools/python/python3_3.3.3.bb
> rename to meta/recipes-devtools/python/python3_3.4.2.bb
> index 6147408..8bd69ed 100644
> --- a/meta/recipes-devtools/python/python3_3.3.3.bb
> +++ b/meta/recipes-devtools/python/python3_3.4.2.bb
> @@ -2,11 +2,11 @@ require recipes-devtools/python/python.inc
> =20
>  DEPENDS =3D "python3-native libffi bzip2 db gdbm openssl readline sqlite=
3 zlib virtual/libintl xz"
>  PR =3D "${INC_PR}.0"
> -PYTHON_MAJMIN =3D "3.3"
> +PYTHON_MAJMIN =3D "3.4"
>  PYTHON_BINABI=3D "${PYTHON_MAJMIN}m"
>  DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
>  DISTRO_SRC_URI_linuxstdbase =3D ""
> -SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2=
 \
> +SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>  file://12-distutils-prefix-is-inside-staging-area.patch \
>  file://python-config.patch \
>  file://000-cross-compile.patch \
> @@ -18,18 +18,14 @@ file://110-enable-zlib.patch \
>  file://130-readline-setup.patch \
>  file://150-fix-setupterm.patch \
>  file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
> -file://fix-ast.h-dependency.patch \
>  file://makerace.patch \
>  ${DISTRO_SRC_URI} \
> -file://python3-fix-build-error-with-Readline-6.3.patch \
>  "
> =20
>  SRC_URI +=3D "\
>              file://03-fix-tkinter-detection.patch \
>              file://04-default-is-optimized.patch \
>              file://avoid_warning_about_tkinter.patch \
> -            file://06-ctypes-libffi-fix-configure.patch \
> -            file://remove_sqlite_rpath.patch \
>              file://cgi_py.patch \
>              file://host_include_contamination.patch \
>              file://python-3.3-multilib.patch \
> @@ -42,10 +38,10 @@ SRC_URI +=3D "\
>              file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
>              file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
>             "
> -SRC_URI[md5sum] =3D "f3ebe34d4d8695bf889279b54673e10c"
> -SRC_URI[sha256sum] =3D "e526e9b612f623888364d30cc9f3dfc34dcef39065c713bd=
bcddf47df84d8dcb"
> +SRC_URI[md5sum] =3D "36fc7327c02c6f12fa24fc9ba78039e3"
> +SRC_URI[sha256sum] =3D "1c6d9682d145c056537e477bbfa060ce727f9edd38df1827=
e0f970dcf04b2def"
> =20
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4eaea08eaaf6875189b0c49f26fa2=
005"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D64fc2b30b67d0a8423c250e0386ed=
72f"
> =20
>  S =3D "${WORKDIR}/Python-${PV}"
> =20
> @@ -75,9 +71,9 @@ export _PYTHON_PROJECT_SRC =3D "${S}"
>  # No ctypes option for python 3
>  PYTHONLSBOPTS =3D ""
> =20
> -do_configure_prepend() {
> +do_configure_append() {
>  	rm -f ${S}/Makefile.orig
> -	autoreconf -Wcross --verbose --install --force --exclude=3Dautopoint Mo=
dules/_ctypes/libffi || bbnote "_ctypes failed to autoreconf"
> +	autoreconf -Wcross --verbose --install --force --exclude=3Dautopoint ..=
/Python-${PV}/Modules/_ctypes/libffi
>  }
> =20
>  do_compile() {
> @@ -170,7 +166,7 @@ do_install() {
>  		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYT=
HON_MAJMIN}
>  	fi
> =20
> -	oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
> +	oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
>  }
> =20
>  do_install_append_class-nativesdk () {
> @@ -212,6 +208,7 @@ FILES_${PN}-dbg +=3D "${libdir}/python${PYTHON_MAJMIN=
}/lib-dynload/.debug"
> =20
>  # catch all the rest (unsorted)
>  PACKAGES +=3D "${PN}-misc"
> +RDEPENDS_${PN}-misc +=3D "${PN}-core"
>  FILES_${PN}-misc =3D "${libdir}/python${PYTHON_MAJMIN}"
> =20
>  # catch manpage
> diff --git a/scripts/contrib/python/generate-manifest-3.3.py b/scripts/co=
ntrib/python/generate-manifest-3.4.py
> similarity index 98%
> rename from scripts/contrib/python/generate-manifest-3.3.py
> rename to scripts/contrib/python/generate-manifest-3.4.py
> index 48cc84d..6371195 100755
> --- a/scripts/contrib/python/generate-manifest-3.3.py
> +++ b/scripts/contrib/python/generate-manifest-3.4.py
> @@ -17,7 +17,7 @@ import os
>  import sys
>  import time
> =20
> -VERSION =3D "3.3.3"
> +VERSION =3D "3.4.2"
> =20
>  __author__ =3D "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
>  __version__ =3D "20140131"
> @@ -177,6 +177,8 @@ if __name__ =3D=3D "__main__":
>      "_weakrefset.* sysconfig.* _sysconfigdata.* config/Makefile " +
>      "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h " +
>      "${libdir}/python${PYTHON_MAJMIN}/collections " +
> +    "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* " +
> +    "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* " +
>      "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py ")
> =20
>      m.addPackage( "${PN}-dev", "Python development package", "${PN}-core=
",
> @@ -280,7 +282,7 @@ if __name__ =3D=3D "__main__":
>      m.addPackage( "${PN}-lang", "Python low-level language support", "${=
PN}-core",
>      "lib-dynload/_bisect.*.so lib-dynload/_collections.*.so lib-dynload/=
_heapq.*.so lib-dynload/_weakref.*.so lib-dynload/_functools.*.so " +
>      "lib-dynload/array.*.so lib-dynload/itertools.*.so lib-dynload/opera=
tor.*.so lib-dynload/parser.*.so " +
> -    "atexit.* bisect.* code.* codeop.* collections.* dis.* functools.* h=
eapq.* inspect.* keyword.* opcode.* symbol.* repr.* token.* " +
> +    "atexit.* bisect.* code.* codeop.* collections.* _collections_abc.* =
dis.* functools.* heapq.* inspect.* keyword.* opcode.* symbol.* repr.* toke=
n.* " +
>      "tokenize.* traceback.* weakref.*" )
> =20
>      m.addPackage( "${PN}-logging", "Python logging support", "${PN}-core=
 ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
> @@ -330,7 +332,7 @@ if __name__ =3D=3D "__main__":
>      "lib-dynload/readline.*.so rlcompleter.*" )
> =20
>      m.addPackage( "${PN}-reprlib", "Python alternate repr() implementati=
on", "${PN}-core",
> -    "${libdir}/python3.3/reprlib.py" )
> +    "reprlib.py" )
> =20
>      m.addPackage( "${PN}-resource", "Python resource control interface",=
 "${PN}-core",
>      "lib-dynload/resource.*.so" )
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xjamM5M9kpPM/bcu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUsDZEACgkQN1Ujt2V2gBxqNACfcXhulSwh5K8WaypzyiOrgWYp
8UYAn31W/TQ1aaDa855mAxRW7NO0Wpwx
=gFbz
-----END PGP SIGNATURE-----

--xjamM5M9kpPM/bcu--
