Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f48.google.com (unknown [209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id C6C646116C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 13:23:51 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id mc6so2573412lab.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 06:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rXTGmvuWKhANOHSpafDSuTrjYHGeXx7mDlwBHykoX4w=;
	b=NUkSDA1DuMQ8bbkoDxRDQEfDh2rKzMYb5gDEIEsayuxiZ2hTzWqvyyo8dyrho2r8q1
	GPK4gDp01e2l6Fw5WxiYbiSKA72F1necx5Iki1Bg9csqlR00NKZPv4TBOj0RAzWLjxJu
	2x44lCu5kDiSJQG8HhW17IQ8yztmZGunygP6/67rSb5hnhvry0jYV2qxXqRQXD8xOqHo
	zYeh+e60qvXNd2zJOuGM1iKYsAoK0RRmsnh8HjYHgt/bo8oPM7R+znMAfDINtwn0YcKO
	MN6v1uP4RLqlbbyPLogAKgIPK52fcIEOYy1xwACelzRVKdhs1j0TCkQWkX9LGsCaLvxZ
	ZiYQ==
X-Received: by 10.152.87.176 with SMTP id az16mr33176581lab.43.1400765031627; 
	Thu, 22 May 2014 06:23:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dl4sm4914951lbc.4.2014.05.22.06.23.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 May 2014 06:23:49 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 22 May 2014 15:23:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Message-ID: <20140522132348.GA2715@jama>
References: <cover.1400690725.git.valentin.popa@intel.com>
	<2af5d5ff37f4dc6cfb7758ff884cecb65883124d.1400690725.git.valentin.popa@intel.com>
	<20140521183339.GG2424@jama> <537DECE4.1010306@intel.com>
MIME-Version: 1.0
In-Reply-To: <537DECE4.1010306@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] mesa: upgrade to 10.1.3
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
X-List-Received-Date: Thu, 22 May 2014 13:23:56 -0000
X-Groupsio-MsgNum: 53459
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2014 at 03:26:12PM +0300, Valentin Popa wrote:
> On 05/21/2014 09:33 PM, Martin Jansa wrote:
> > On Wed, May 21, 2014 at 07:50:01PM +0300, Valentin Popa wrote:
> >> (*) libdricore was removed.
> >> (*) added libmesa-megadriver that includes
> >>      all the hardlinks to the mesa megadriver.
> > Why not call it mesa-drivers to be more consistent with kernel-modules
> > or gst-plugins-good, etc "meta" packages?
>=20
>      I can call it mesa-megadriver (I still need to keep "megadriver",=20
> because inside the package is only on driver (multiple hardlinks to it,=
=20
> with the proper names)).

Sorry, I fail to parse this sentence. Where do you have hardlinks?

> >> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> >> ---
> >>   .../mesa/{mesa-gl_9.2.5.bb =3D> mesa-gl_10.1.3.bb}   |  0
> >>   meta/recipes-graphics/mesa/mesa.inc                | 36 ++++++++++++=
++--------
> >>   .../mesa/{mesa_9.2.5.bb =3D> mesa_10.1.3.bb}         |  4 +--
> >>   meta/recipes-graphics/mesa/mesa_git.bb             |  4 +--
> >>   4 files changed, 28 insertions(+), 16 deletions(-)
> >>   rename meta/recipes-graphics/mesa/{mesa-gl_9.2.5.bb =3D> mesa-gl_10.=
1.3.bb} (100%)
> >>   rename meta/recipes-graphics/mesa/{mesa_9.2.5.bb =3D> mesa_10.1.3.bb=
} (82%)
> >>
> >> diff --git a/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb b/meta/recipe=
s-graphics/mesa/mesa-gl_10.1.3.bb
> >> similarity index 100%
> >> rename from meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb
> >> rename to meta/recipes-graphics/mesa/mesa-gl_10.1.3.bb
> >> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphi=
cs/mesa/mesa.inc
> >> index a33b7b5..f7ee7c1 100644
> >> --- a/meta/recipes-graphics/mesa/mesa.inc
> >> +++ b/meta/recipes-graphics/mesa/mesa.inc
> >> @@ -10,11 +10,11 @@ HOMEPAGE =3D "http://mesa3d.org"
> >>   BUGTRACKER =3D "https://bugs.freedesktop.org"
> >>   SECTION =3D "x11"
> >>   LICENSE =3D "MIT"
> >> -LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3Df69a4626e9efc40f=
a0d3cc3b02c9eacf"
> >>  =20
> >> -INC_PR =3D "r9"
> >>   PE =3D "2"
> >>  =20
> >> +LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3D6a23445982a7a972=
ac198e93cc1cb3de"
> >> +
> >>   DEPENDS =3D "expat makedepend-native flex-native bison-native udev"
> >>  =20
> >>   PROVIDES =3D "virtual/libgl virtual/libgles1 virtual/libgles2 virtua=
l/egl virtual/mesa"
> >> @@ -39,6 +39,7 @@ DRIDRIVERS =3D "swrast"
> >>   DRIDRIVERS_append_x86 =3D ",radeon,r200,nouveau,i965,i915"
> >>   DRIDRIVERS_append_x86-64 =3D ",radeon,r200,nouveau,i965,i915"
> >>   PACKAGECONFIG[dri] =3D "--enable-dri --with-dri-drivers=3D${DRIDRIVE=
RS}, --disable-dri, dri2proto libdrm"
> >> +PACKAGECONFIG[dri3] =3D "--enable-dri3, --disable-dri3, dri3proto pre=
sentproto libxshmfence"
> >>  =20
> >>   EXTRA_OECONF +=3D "--enable-gbm"
> >>  =20
> >> @@ -78,7 +79,7 @@ RDEPENDS_${PN}-dev =3D ""
> >>   PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
> >>                libosmesa libosmesa-dev \
> >>                libgl-mesa libgl-mesa-dev \
> >> -             libdricore libdricore-dev \
> >> +             libmesa-megadriver \
> >>                libglapi libglapi-dev \
> >>                libgbm libgbm-dev \
> >>                libgles1-mesa libgles1-mesa-dev \
> >> @@ -96,7 +97,7 @@ do_install_append () {
> >>       rm -f ${D}${libdir}/egl/*.la
> >>       rm -f ${D}${libdir}/gallium-pipe/*.la
> >>       rm -f ${D}${libdir}/gbm/*.la
> >> -
> >> +
> >>       # it was packaged in libdricore9.1.3-1 and preventing upgrades w=
hen debian.bbclass was used
> >>       rm -f ${D}${sysconfdir}/drirc
> >>   }
> >> @@ -119,7 +120,7 @@ python __anonymous() {
> >>           d.appendVar("RREPLACES_" + fullp, pkgs)
> >>           d.appendVar("RPROVIDES_" + fullp, pkgs)
> >>           d.appendVar("RCONFLICTS_" + fullp, pkgs)
> >> -
> >> +
> >>           # For -dev, the first element is both the Debian and origina=
l name
> >>           fullp +=3D "-dev"
> >>           pkgs =3D p[1] + "-dev"
> >> @@ -130,15 +131,27 @@ python __anonymous() {
> >>   }
> >>  =20
> >>   python mesa_populate_packages() {
> >> -    dri_drivers_root =3D os.path.join(d.getVar('libdir', True), "dri")
> >> -
> >>       pkgs =3D ['mesa', 'mesa-dev', 'mesa-dbg']
> >> -    pkgs +=3D do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$'=
, 'mesa-driver-%s', 'Mesa %s DRI driver', extra_depends=3D'')
> >>       for pkg in pkgs:
> >>           d.setVar("RPROVIDES_%s" % pkg, pkg.replace("mesa-", "mesa-dr=
i-"))
> >>           d.setVar("RCONFLICTS_%s" % pkg, pkg.replace("mesa-", "mesa-d=
ri-"))
> >>           d.setVar("RREPLACES_%s" % pkg, pkg.replace("mesa-", "mesa-dr=
i-"))
> >> -
> >> +
> >> +    import re
> >> +    dri_drivers_root =3D os.path.join(d.getVar('libdir', True), "dri")
> >> +    dri_pkgs =3D os.listdir(d.getVar('PKGD', True) + dri_drivers_root)
> >> +    lib_name =3D "libmesa-megadriver"
> >> +    mlprefix =3D d.getVar('MLPREFIX', True)
> >> +    if mlprefix:
> >> +       lib_name =3D "%s%s" % (mlprefix, lib_name)
> >> +    for p in sorted(dri_pkgs):
> >> +        m =3D re.match('^(.*)_dri\.so$', p)
> >> +        if m:
> >> +            pkg_name =3D " mesa-driver-%s" % legitimize_package_name(=
m.group(1))
> >> +            d.appendVar("RPROVIDES_%s" % lib_name, pkg_name)
> >> +            d.appendVar("RCONFLICTS_%s" % lib_name, pkg_name)
> >> +            d.appendVar("RREPLACES_%s" % lib_name, pkg_name)
> >> +
> >>       pipe_drivers_root =3D os.path.join(d.getVar('libdir', True), "ga=
llium-pipe")
> >>       do_split_packages(d, pipe_drivers_root, '^pipe_(.*)\.so$', 'mesa=
-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends=3D'')
> >>   }
> >> @@ -148,8 +161,8 @@ PACKAGESPLITFUNCS_prepend =3D "mesa_populate_packa=
ges "
> >>   PACKAGES_DYNAMIC +=3D "^mesa-driver-.*"
> >>  =20
> >>   FILES_${PN}-dbg +=3D "${libdir}/dri/.debug/*"
> >> -
> >> -FILES_libdricore =3D "${sysconfdir}/drirc ${libdir}/libdricore*.so.*"
> >> +FILES_${PN} +=3D "${sysconfdir}/drirc"
> >> +FILES_libmesa-megadriver =3D "${libdir}/dri/*"
> >>   FILES_libegl-mesa =3D "${libdir}/libEGL.so.*"
> >>   FILES_libgbm =3D "${libdir}/libgbm.so.*"
> >>   FILES_libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
> >> @@ -164,7 +177,6 @@ FILES_libopenvg =3D "${libdir}/libOpenVG.so.*"
> >>   FILES_libxvmcsoftpipe =3D "${libdir}/libXvMCsoftpipe.so.*"
> >>  =20
> >>   FILES_${PN}-dev =3D "${libdir}/pkgconfig/dri.pc"
> >> -FILES_libdricore-dev =3D "${libdir}/libdricore*.*"
> >>   FILES_libegl-mesa-dev =3D "${libdir}/libEGL.* ${includedir}/EGL ${in=
cludedir}/KHR ${libdir}/pkgconfig/egl.pc"
> >>   FILES_libgbm-dev =3D "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc =
${includedir}/gbm.h"
> >>   FILES_libgl-mesa-dev =3D "${libdir}/libGL.* ${includedir}/GL ${libdi=
r}/pkgconfig/gl.pc"
> >> diff --git a/meta/recipes-graphics/mesa/mesa_9.2.5.bb b/meta/recipes-g=
raphics/mesa/mesa_10.1.3.bb
> >> similarity index 82%
> >> rename from meta/recipes-graphics/mesa/mesa_9.2.5.bb
> >> rename to meta/recipes-graphics/mesa/mesa_10.1.3.bb
> >> index 02ecd46..abc450a 100644
> >> --- a/meta/recipes-graphics/mesa/mesa_9.2.5.bb
> >> +++ b/meta/recipes-graphics/mesa/mesa_10.1.3.bb
> >> @@ -5,8 +5,8 @@ SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/=
MesaLib-${PV}.tar.bz2 \
> >>              file://0006-fix-out-of-tree-egl.patch \
> >>              "
> >>  =20
> >> -SRC_URI[md5sum] =3D "9fb4de29ca1d9cfd03cbdefa123ba336"
> >> -SRC_URI[sha256sum] =3D "b46ab9efed176df0591993397594d712ada9da6a47fd3=
1bbe75050fe28eb6bf0"
> >> +SRC_URI[md5sum] =3D "ba6dbe2b9cab0b4de840c996b9b6a3ad"
> >> +SRC_URI[sha256sum] =3D "b2615e236ef25d0fb94b8420bdd2e2a520b7dd5ca2d4b=
93306154f7fd4adecc3"
> >>  =20
> >>   S =3D "${WORKDIR}/Mesa-${PV}"
> >>  =20
> >> diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-gra=
phics/mesa/mesa_git.bb
> >> index 1e6fdb5..59b0d1c 100644
> >> --- a/meta/recipes-graphics/mesa/mesa_git.bb
> >> +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> >> @@ -5,8 +5,8 @@ DEFAULT_PREFERENCE =3D "-1"
> >>   LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3Df69a4626e9efc40=
fa0d3cc3b02c9eacf"
> >>  =20
> >>   PR =3D "${INC_PR}.0"
> >> -SRCREV =3D "4636e87191fddd492ed8c61ba61faf4b2d89b2e4"
> >> -PV =3D "9.2.5+git${SRCPV}"
> >> +SRCREV =3D "0028eb1083e6adc110a23a5f02c993cda217067a"
> >> +PV =3D "10.1.3+git${SRCPV}"
> >>  =20
> >>   SRC_URI =3D "git://anongit.freedesktop.org/git/mesa/mesa \
> >>              file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-=
when-HA.patch \
> >> --=20
> >> 1.9.1
> >>
> >> --=20
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlN9+mQACgkQN1Ujt2V2gByl7QCfZivZ5E6WqolCm+9zz7BXbzxn
jAIAn0Dw7reGGWJ0REP6CG2UyWQ7i2TT
=C+vW
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
