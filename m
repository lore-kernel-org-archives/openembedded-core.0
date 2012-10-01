Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TIpaM-0000oK-Ld
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 01:39:38 +0200
Received: by weyt44 with SMTP id t44so3260311wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Oct 2012 16:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=w0kfYNyGO0eecoeBzFZrXNansmN4T2vKanrqWVIOSc0=;
	b=w3p3uxeyKQ75PWk2CueyDm1odDmsUkmHPyPsFfuav8+KT+bYiMlNBvVYZjeUFMRFFX
	2s7nWnBb4j2dWO7u+3LkxAC6lSU+3EM7kR1lYPqiixELCeG1ihpednRms/466rCZIcf1
	eZ0LQKUQ9HzfDQcL7ZVDV6CKGE+du6XsLEZMyWmAekm5LNsTBOmXoD9ddsYzvUZIe4b/
	xFzBdo/oPHBGcSYUmqxYyshThnHX0DL1j3215L3l3JRCSUdGvP9Pp5hz9+iUUGSQYvAl
	+3L7n2YxEcmlBZaAcs1/0yp7GtL4gTltmivycbPP7GtZ3IHK6RqqVKgoKxqtdS+R27cb
	mPwQ==
Received: by 10.216.199.30 with SMTP id w30mr8153501wen.25.1349134000920;
	Mon, 01 Oct 2012 16:26:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gg4sm10877914wib.6.2012.10.01.16.26.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 16:26:39 -0700 (PDT)
Date: Tue, 2 Oct 2012 01:26:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20121001232637.GE3454@jama.jama.net>
References: <cover.1348697518.git.Martin.Jansa@gmail.com>
	<20120928164309.GA3049@jama.jama.net>
	<20120930201818.GC3419@jama.jama.net>
	<20121001143108.GD3454@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20121001143108.GD3454@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 00/10] qt4: upgrade to 4.8.3 and cleanup
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
X-List-Received-Date: Mon, 01 Oct 2012 23:39:38 -0000
X-Groupsio-MsgNum: 30195
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T6xhMxlHU34Bk0ad"
Content-Disposition: inline

--T6xhMxlHU34Bk0ad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 01, 2012 at 04:31:08PM +0200, Martin Jansa wrote:
> On Sun, Sep 30, 2012 at 10:18:18PM +0200, Martin Jansa wrote:
> > On Fri, Sep 28, 2012 at 06:43:09PM +0200, Martin Jansa wrote:
> > > On Thu, Sep 27, 2012 at 12:27:05AM +0200, Martin Jansa wrote:
> > > > Please test on more architectures.
> > > > I've tested complete qt4-native + qt4-free-x11 on armv4t.
> > > > And only do_patch for nativesdk-qt4-tools, qt-mobility-*, qt4-embed=
ded.
> > >=20
> > > I've finished testing qt4-free-x11 on armv7a, x86_64 and armv5te +
> > > qt-mobility-x11 on armv4t and armv7a.
> > >=20
> > > Only python-pyqt_4.8.4.bb from meta-oe is failing with that, probably
> > > needs to be updated to 4.9.2 or something like that.
> >=20
> > This seems to be caused by missing webkit support in qt4-4.8.3.
> > python-pyqt-4.9.4 and 4.9.5 fails the same.
> >=20
> > Configure ignores -webkit and says that webkit won't be built I've found
> > some bug reports upstream but those were resolved by forcing xrender
> > support which doesn't help in our case..
>=20
> Found it, jansa/qt4-4.8.3 updated and 4.8.3 now added with negative D_P
> instead of replacing 4.8.1, will send v2 tonight.

Here is buildhistory log when whole patchset is applied without defining
P_P.

https://github.com/shr-distribution/buildhistory/commit/0e0245527626b77d791=
3c3b44976eab478c04ca5
https://github.com/shr-distribution/buildhistory/commit/56385ad686ab9591460=
d3be4d3eb13b4beddc45e

note that there are few changes, because before PR bump it was built
with gcc 4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede not
4.7.2.

And here are branches (oe-core-4.8.1, oe-core-4.8.3) with all patches appli=
ed
https://github.com/shr-project/qt

Cheers,

>=20
> Cheers,
>=20
> > > Should I resend only 4.8.1 cleanup without adding 4.8.3 or with 4.8.3=
=20
> > > having negative D_P?
> > >=20
> > > Cheers,
> > >=20
> > > >=20
> > > > The following changes since commit 938d07871bedd91f0d95ed6fe338ecbf=
afa5ebfe:
> > > >=20
> > > >   busybox: Fix misplaced quote (2012-09-26 18:28:17 +0100)
> > > >=20
> > > > are available in the git repository at:
> > > >=20
> > > >   git://git.openembedded.org/openembedded-core-contrib jansa/qt4-4.=
8.3
> > > >   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/l=
og/?h=3Djansa/qt4-4.8.3
> > > >=20
> > > > Martin Jansa (10):
> > > >   qt4-tools-nativesdk.inc: rename to nativesdk-qt4-tools.inc
> > > >   qt4: use releases.qt-project.org instead of get.qt.nokia.com
> > > >   qt4: rename qt-4.8.1 to qt4-4.8.1 to match other .inc and .bb
> > > >   qt4.inc: move more options to separate variables
> > > >   qt-mobility: move qt-mobility patches to separate dir
> > > >   qt4: move patches from files to qt4-4.8.1
> > > >   qt4: drop patches not used in any recipe
> > > >   qt4: replace all local patches with git patches with headers
> > > >   qt4: PR bumps
> > > >   qt4: upgrade to 4.8.3
> > > >=20
> > > >  meta/recipes-qt/qt4/files/0004-no-qmake.patch      | 27 ------
> > > >  meta/recipes-qt/qt4/files/0008-qt-lib-infix.patch  | 41 ----------
> > > >  .../qt4/files/blacklist-diginotar-certs.diff       | 95 ----------=
------------
> > > >  .../recipes-qt/qt4/files/compile.test-lflags.patch | 17 ----
> > > >  meta/recipes-qt/qt4/files/fix-config-tests.patch   | 38 ---------
> > > >  ...tools-nativesdk.inc =3D> nativesdk-qt4-tools.inc} | 18 ++--
> > > >  meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb   |  8 --
> > > >  meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb   |  8 ++
> > > >  .../qt4/qt-4.8.1/fix_conflicting_types.patch       | 29 -------
> > > >  meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch       | 35 --------
> > > >  meta/recipes-qt/qt4/qt-4.8.1/qmake_cxx_eval.patch  | 22 -----
> > > >  ...stvideoconnector-fixed-buffers-allocation.patch |  0
> > > >  ...nnecessary-rpaths-from-qml_device-example.patch |  0
> > > >  .../{files =3D> qt-mobility-1.2.0}/gcc-scope.patch   |  0
> > > >  .../qt-mobility-configure.patch                    |  0
> > > >  .../qt-mobility-no-opengl.patch                    |  0
> > > >  meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |  3 +-
> > > >  .../recipes-qt/qt4/{qt-4.8.1.inc =3D> qt4-4.8.3.inc} | 41 +++++---=
--
> > > >  ...-allow-to-set-qt.conf-from-the-outside-u.patch} | 28 +++++--
> > > >  ...ty_qws-fix-build-with-old-kernel-headers.patch} | 21 ++++-
> > > >  ...03-webkit2-set-OUTPUT_DIR-value-if-empty.patch} | 21 ++++-
> > > >  ...make-is-already-built-in-qt4-tools-native.patch | 29 +++++++
> > > >  ...-set-LFLAGS-to-pick-up-zlib-from-staging.patch} | 24 ++++--
> > > >  ...e-OE_QMAKE_-values-to-specify-Qt-utility.patch} | 26 ++++--
> > > >  ...const-usage-that-causes-compile-failure-.patch} | 26 ++++--
> > > >  ...low-building-a-separate-qmake-for-the-ta.patch} | 20 +++--
> > > >  ...-fix-source-file-references-in-qmake.pri.patch} | 15 ++--
> > > >  ...ck-to-not-use-the-pg_config-of-the-host-.patch} | 25 ++++--
> > > >  .../0011-freetype-host-includes.patch}             | 20 +++--
> > > >  .../0012-Add-2bpp-support.patch}                   | 76 ++++++++++=
-------
> > > >  .../0013-configure-add-crossarch-option.patch}     | 36 ++++----
> > > >  ...ions-fix-phony-translation-linking-error.patch} | 19 +++--
> > > >  ...configure-add-nostrip-for-debug-packages.patch} | 15 +++-
> > > >  ...sure-we-identify-the-compiler-as-g-in-co.patch} | 27 ++++--
> > > >  ...re-make-pulseaudio-a-configurable-option.patch} | 17 ++--
> > > >  ...es-for-gcc-4.7.0-particularly-on-qemux86.patch} | 45 ++++++----
> > > >  ...019-webkit-disable-the-fuse-ld-gold-flag.patch} | 23 ++++--
> > > >  .../qt4/{qt-4.8.1 =3D> qt4-4.8.3}/g++.conf           |  0
> > > >  .../qt4/{qt-4.8.1 =3D> qt4-4.8.3}/linux.conf         |  0
> > > >  meta/recipes-qt/qt4/{files =3D> qt4-4.8.3}/qte.sh    |  0
> > > >  meta/recipes-qt/qt4/qt4-embedded.inc               |  2 +-
> > > >  ...qt4-embedded_4.8.1.bb =3D> qt4-embedded_4.8.3.bb} |  4 +-
> > > >  meta/recipes-qt/qt4/qt4-native.inc                 | 10 +--
> > > >  meta/recipes-qt/qt4/qt4-native_4.8.1.bb            | 12 ---
> > > >  meta/recipes-qt/qt4/qt4-native_4.8.3.bb            |  8 ++
> > > >  meta/recipes-qt/qt4/qt4-x11-free.inc               |  2 +-
> > > >  ...qt4-x11-free_4.8.1.bb =3D> qt4-x11-free_4.8.3.bb} |  4 +-
> > > >  meta/recipes-qt/qt4/qt4.inc                        | 19 ++++-
> > > >  48 files changed, 427 insertions(+), 529 deletions(-)
> > > >  delete mode 100644 meta/recipes-qt/qt4/files/0004-no-qmake.patch
> > > >  delete mode 100644 meta/recipes-qt/qt4/files/0008-qt-lib-infix.pat=
ch
> > > >  delete mode 100644 meta/recipes-qt/qt4/files/blacklist-diginotar-c=
erts.diff
> > > >  delete mode 100644 meta/recipes-qt/qt4/files/compile.test-lflags.p=
atch
> > > >  delete mode 100644 meta/recipes-qt/qt4/files/fix-config-tests.patch
> > > >  rename meta/recipes-qt/qt4/{qt4-tools-nativesdk.inc =3D> nativesdk=
-qt4-tools.inc} (83%)
> > > >  delete mode 100644 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb
> > > >  create mode 100644 meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bb
> > > >  delete mode 100644 meta/recipes-qt/qt4/qt-4.8.1/fix_conflicting_ty=
pes.patch
> > > >  delete mode 100644 meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch
> > > >  delete mode 100644 meta/recipes-qt/qt4/qt-4.8.1/qmake_cxx_eval.pat=
ch
> > > >  rename meta/recipes-qt/qt4/{files =3D> qt-mobility-1.2.0}/0001-gst=
videoconnector-fixed-buffers-allocation.patch (100%)
> > > >  rename meta/recipes-qt/qt4/{files =3D> qt-mobility-1.2.0}/0002-Rem=
ove-unnecessary-rpaths-from-qml_device-example.patch (100%)
> > > >  rename meta/recipes-qt/qt4/{files =3D> qt-mobility-1.2.0}/gcc-scop=
e.patch (100%)
> > > >  rename meta/recipes-qt/qt4/{files =3D> qt-mobility-1.2.0}/qt-mobil=
ity-configure.patch (100%)
> > > >  rename meta/recipes-qt/qt4/{files =3D> qt-mobility-1.2.0}/qt-mobil=
ity-no-opengl.patch (100%)
> > > >  rename meta/recipes-qt/qt4/{qt-4.8.1.inc =3D> qt4-4.8.3.inc} (50%)
> > > >  rename meta/recipes-qt/qt4/{files/qt-config.patch =3D> qt4-4.8.3/0=
001-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch} (49%)
> > > >  rename meta/recipes-qt/qt4/{files/fix_qkbdtty_qws.patch =3D> qt4-4=
=2E8.3/0002-qkbdtty_qws-fix-build-with-old-kernel-headers.patch} (68%)
> > > >  rename meta/recipes-qt/qt4/{files/set-OUTPUT_DIR-if-empty.patch =
=3D> qt4-4.8.3/0003-webkit2-set-OUTPUT_DIR-value-if-empty.patch} (48%)
> > > >  create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0004-configure-qm=
ake-is-already-built-in-qt4-tools-native.patch
> > > >  rename meta/recipes-qt/qt4/{qt-4.8.1/configure-lflags.patch =3D> q=
t4-4.8.3/0005-configure-set-LFLAGS-to-pick-up-zlib-from-staging.patch} (46%)
> > > >  rename meta/recipes-qt/qt4/{files/configure-paths.patch =3D> qt4-4=
=2E8.3/0006-configure-Use-OE_QMAKE_-values-to-specify-Qt-utility.patch} (58=
%)
> > > >  rename meta/recipes-qt/qt4/{files/qt-dbus-const.patch =3D> qt4-4.8=
=2E3/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch} (52%)
> > > >  rename meta/recipes-qt/qt4/{files/target_qmake.patch =3D> qt4-4.8.=
3/0008-qmake.pro-Allow-building-a-separate-qmake-for-the-ta.patch} (57%)
> > > >  rename meta/recipes-qt/qt4/{qt-4.8.1/qmake_pri_fixes.patch =3D> qt=
4-4.8.3/0009-qmake-fix-source-file-references-in-qmake.pri.patch} (81%)
> > > >  rename meta/recipes-qt/qt4/{qt-4.8.1/hack-out-pg2-4.7.0.patch =3D>=
 qt4-4.8.3/0010-configure-Hack-to-not-use-the-pg_config-of-the-host-.patch}=
 (68%)
> > > >  rename meta/recipes-qt/qt4/{files/0006-freetype-host-includes.patc=
h =3D> qt4-4.8.3/0011-freetype-host-includes.patch} (50%)
> > > >  rename meta/recipes-qt/qt4/{files/0009-support-2bpp.patch =3D> qt4=
-4.8.3/0012-Add-2bpp-support.patch} (83%)
> > > >  rename meta/recipes-qt/qt4/{qt-4.8.1/0001-Added-Openembedded-cross=
arch-option.patch =3D> qt4-4.8.3/0013-configure-add-crossarch-option.patch}=
 (49%)
> > > >  rename meta/recipes-qt/qt4/{qt-4.8.1/fix-translations.patch =3D> q=
t4-4.8.3/0014-translations-fix-phony-translation-linking-error.patch} (63%)
> > > >  rename meta/recipes-qt/qt4/{files/add_nostrip_for_debug_packages.d=
iff =3D> qt4-4.8.3/0015-configure-add-nostrip-for-debug-packages.patch} (57=
%)
> > > >  rename meta/recipes-qt/qt4/{qt-4.8.1/configure_oe_compiler.patch =
=3D> qt4-4.8.3/0016-configure-ensure-we-identify-the-compiler-as-g-in-co.pa=
tch} (60%)
> > > >  rename meta/recipes-qt/qt4/{qt-4.8.1/pulseaudio-config.patch =3D> =
qt4-4.8.3/0017-configure-make-pulseaudio-a-configurable-option.patch} (85%)
> > > >  rename meta/recipes-qt/qt4/{qt-4.8.1/gcc47-fix2.patch =3D> qt4-4.8=
=2E3/0018-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch} (46%)
> > > >  rename meta/recipes-qt/qt4/{qt-4.8.1/disable-fuse-gold-flag.patch =
=3D> qt4-4.8.3/0019-webkit-disable-the-fuse-ld-gold-flag.patch} (46%)
> > > >  rename meta/recipes-qt/qt4/{qt-4.8.1 =3D> qt4-4.8.3}/g++.conf (100=
%)
> > > >  rename meta/recipes-qt/qt4/{qt-4.8.1 =3D> qt4-4.8.3}/linux.conf (1=
00%)
> > > >  rename meta/recipes-qt/qt4/{files =3D> qt4-4.8.3}/qte.sh (100%)
> > > >  rename meta/recipes-qt/qt4/{qt4-embedded_4.8.1.bb =3D> qt4-embedde=
d_4.8.3.bb} (73%)
> > > >  delete mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.1.bb
> > > >  create mode 100644 meta/recipes-qt/qt4/qt4-native_4.8.3.bb
> > > >  rename meta/recipes-qt/qt4/{qt4-x11-free_4.8.1.bb =3D> qt4-x11-fre=
e_4.8.3.bb} (75%)
> > > >=20
> > > > --=20
> > > > 1.7.12
> > > >=20
> > >=20
> > > --=20
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >=20
> >=20
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--T6xhMxlHU34Bk0ad
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBqJq0ACgkQN1Ujt2V2gBzvdACgmpuezEl683ze7myUY4BS4e+x
ohsAniBz4b2IA2Uq5hXrPpAd9GkxVHy8
=zVcX
-----END PGP SIGNATURE-----

--T6xhMxlHU34Bk0ad--
