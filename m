Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 79480737D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 09:23:02 +0000 (UTC)
Received: by wevm14 with SMTP id m14so18637068wev.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 01:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=33DQtt8gSsre2qXDYDTCd5Hq7vIVhiqdCkaaU+e7jTA=;
	b=QyKDOvSQuEOwyWqxN3lUrObKb+/CHfveY4eEcG+3VgYbV5wk50bao8MUAjQiC0XRcH
	oFNGnvA1KEV2Oc8BgakDyM/qMaa1nv9vtx4aDmNiVpHpv/gVD/76KaTiG9aWwHXl7HPl
	RgidTTcbq1sk/hrHqpPLbjCbGikbOwMirtFcuZorg9kVMpFA5cXUvgWqN4czGjB2ti29
	baJuR7a4zN0/VVQ0oe3buy/iaSHushSeUrYP2l+MdT0JTMA4LlpDPEw1A4nltKCiHM5F
	URWaLzezbmV1BMm9Spqb7NvtLXLLHzGo+BZ47csFASSPUBgK5dmn6rPoB0qnHYGI+WSP
	zejw==
X-Received: by 10.181.13.39 with SMTP id ev7mr4552114wid.3.1425028983821;
	Fri, 27 Feb 2015 01:23:03 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u16sm5097952wjr.5.2015.02.27.01.23.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 01:23:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Feb 2015 10:23:22 +0100
To: openembedded-core@lists.openembedded.org
Message-ID: <20150227092322.GK2309@jama>
References: <cover.1423484647.git.Martin.Jansa@gmail.com>
	<1b8369849e9c3f271231c88e9303e9cbba261a94.1423484647.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1b8369849e9c3f271231c88e9303e9cbba261a94.1423484647.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCHv6 1/1] recipes: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Fri, 27 Feb 2015 09:23:03 -0000
X-Groupsio-MsgNum: 62798
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJAclU0AInkryoed"
Content-Disposition: inline

--IJAclU0AInkryoed
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 09, 2015 at 01:25:15PM +0100, Martin Jansa wrote:
> * it's not complete, but recipes depending on virtual/libx11 are easiest
>   to spot, I've long list of PNBLACKLIST for all recipes which cannot
>   be built in distro without x11 in DISTRO_FEATURES

PING

This was first sent 8 months ago, it's trivial change, please merge it
in 1.8.

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/packagegroups/packagegroup-self-hosted.bb           | =
4 +++-
>  meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb                      | =
4 ++++
>  meta/recipes-graphics/fstests/fstests_git.bb                          | =
4 +++-
>  meta/recipes-graphics/glew/glew_1.12.0.bb                             | =
4 +++-
>  meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb                 | =
4 +++-
>  meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.bb | =
4 +++-
>  meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb                  | =
4 +++-
>  meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb     | =
4 +++-
>  meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb  | =
4 +++-
>  meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb          | =
4 +++-
>  meta/recipes-graphics/pong-clock/pong-clock_1.0.bb                    | =
4 ++++
>  .../startup-notification/startup-notification_0.12.bb                 | =
4 +++-
>  meta/recipes-graphics/x11-common/x11-common_0.1.bb                    | =
4 ++++
>  meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb                         | =
4 +++-
>  meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb      | =
4 +++-
>  meta/recipes-graphics/xrestop/xrestop_0.4.bb                          | =
4 +++-
>  meta/recipes-graphics/xtscal/xtscal_0.6.3.bb                          | =
4 +++-
>  meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb         | =
4 +++-
>  meta/recipes-support/atk/at-spi2-core_2.14.1.bb                       | =
4 +++-
>  meta/recipes-support/consolekit/consolekit_0.4.6.bb                   | =
4 +++-
>  20 files changed, 63 insertions(+), 17 deletions(-)
>=20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb =
b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> index c471020..47589b6 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
> @@ -7,7 +7,9 @@ DESCRIPTION =3D "Packages required to run the build syste=
m"
>  PR =3D "r13"
>  LICENSE =3D "MIT"
> =20
> -inherit packagegroup
> +inherit packagegroup  distro_features_check
> +# rdepends on libx11-dev
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> =20
>  PACKAGES =3D "\
>      packagegroup-self-hosted \
> diff --git a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb b/meta/reci=
pes-graphics/eglinfo/eglinfo-x11_1.0.bb
> index 18fc893..3427fdf 100644
> --- a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
> +++ b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
> @@ -5,4 +5,8 @@ include eglinfo.inc
> =20
>  DEPENDS +=3D "virtual/libx11"
> =20
> +inherit distro_features_check
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
>  SUMMARY +=3D "(X11 version)"
> diff --git a/meta/recipes-graphics/fstests/fstests_git.bb b/meta/recipes-=
graphics/fstests/fstests_git.bb
> index 57ff9f6..95c33f4 100644
> --- a/meta/recipes-graphics/fstests/fstests_git.bb
> +++ b/meta/recipes-graphics/fstests/fstests_git.bb
> @@ -13,4 +13,6 @@ LIC_FILES_CHKSUM =3D "file://test-pango-gdk.c;endline=
=3D24;md5=3D1ee74ec851ecda57eb7ac
> =20
>  S =3D "${WORKDIR}/git/tests"
> =20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig distro_features_check
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> diff --git a/meta/recipes-graphics/glew/glew_1.12.0.bb b/meta/recipes-gra=
phics/glew/glew_1.12.0.bb
> index 9343604..eb28c4d 100644
> --- a/meta/recipes-graphics/glew/glew_1.12.0.bb
> +++ b/meta/recipes-graphics/glew/glew_1.12.0.bb
> @@ -18,4 +18,6 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/glew/glew/${=
PV}/glew-${PV}.tgz \
>  SRC_URI[md5sum] =3D "01246c7ecd135d99be031aa63f86dca1"
>  SRC_URI[sha256sum] =3D "af58103f4824b443e7fa4ed3af593b8edac6f3a7be3b3091=
1edbc7344f48e4bf"
> =20
> -inherit autotools lib_package pkgconfig
> +inherit autotools lib_package pkgconfig distro_features_check
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb b/meta=
/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
> index 4acac39..f2eb675 100644
> --- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
> +++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
> @@ -16,7 +16,9 @@ SRC_URI =3D "http://downloads.yoctoproject.org/releases=
/matchbox/${BPN}/${PV}/${BP
>  SRC_URI[md5sum] =3D "fc6cc807f55a3e7c752d8013176875d7"
>  SRC_URI[sha256sum] =3D "254cab52e304a3512c8df4be59d690cf3921bbb68a28ede7=
fe26b93534217b53"
> =20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig distro_features_check
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> =20
>  PACKAGECONFIG ??=3D "jpeg png xft xsettings"
>  PACKAGECONFIG[jpeg] =3D "--enable-jpeg,--disable-jpeg,jpeg"
> diff --git a/meta/recipes-graphics/libxsettings-client/libxsettings-clien=
t_0.10.bb b/meta/recipes-graphics/libxsettings-client/libxsettings-client_0=
=2E10.bb
> index d7a8030..670d9fc 100644
> --- a/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.=
bb
> +++ b/meta/recipes-graphics/libxsettings-client/libxsettings-client_0.10.=
bb
> @@ -28,7 +28,9 @@ SRC_URI[sha256sum] =3D "f274a4bc969ae192994a856b7f786c6=
fce96bae77f96c1c2b71dd97599
> =20
>  S =3D "${WORKDIR}/Xsettings-client-0.10"
> =20
> -inherit autotools gettext
> +inherit autotools gettext distro_features_check
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> =20
>  do_configure_prepend() {
>      # This package doesn't ship with its own COPYING file and
> diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb b/meta/=
recipes-graphics/matchbox-wm/matchbox-wm_git.bb
> index 154b967..422d255 100644
> --- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
> +++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_git.bb
> @@ -18,7 +18,9 @@ SRC_URI =3D "git://git.yoctoproject.org/matchbox-window=
-manager \
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig distro_features_check
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> =20
>  FILES_${PN} =3D "${bindir}/* \
>                 ${datadir}/matchbox \
> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-ba=
se.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
> index 2eff371..17301a0 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
> @@ -3,7 +3,9 @@ DESCRIPTION =3D "Packages required to set up a basic work=
ing X11 session"
>  LICENSE =3D "MIT"
>  PR =3D "r1"
> =20
> -inherit packagegroup
> +inherit packagegroup distro_features_check
> +# rdepends on matchbox-wm
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> =20
>  RDEPENDS_${PN} =3D "\
>      packagegroup-core-x11-xserver \
> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xs=
erver.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserve=
r.bb
> index 2d68e97..c53f1b7 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-xserver.bb
> @@ -8,7 +8,9 @@ PR =3D "r40"
> =20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
> -inherit packagegroup
> +inherit packagegroup distro_features_check
> +# rdepends on XSERVER
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> =20
>  XSERVER ?=3D "xserver-xorg xf86-video-fbdev xf86-input-evdev"
>  XSERVERCODECS ?=3D ""
> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb=
 b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
> index fde5144..3537d8c 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
> @@ -5,7 +5,9 @@
>  LICENSE =3D "MIT"
>  PR =3D "r40"
> =20
> -inherit packagegroup
> +inherit packagegroup distro_features_check
> +# rdepends on x11-common
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> =20
>  PACKAGES =3D "${PN} ${PN}-utils"
> =20
> diff --git a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb b/meta/re=
cipes-graphics/pong-clock/pong-clock_1.0.bb
> index fe886f5..0e1a792 100644
> --- a/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
> +++ b/meta/recipes-graphics/pong-clock/pong-clock_1.0.bb
> @@ -2,6 +2,10 @@ SUMMARY =3D "A clock combined with a game of pong"
>  LICENSE =3D "GPLv2+"
>  DEPENDS =3D "virtual/libx11 xdmcp xau"
> =20
> +inherit distro_features_check
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
>  SRC_URI =3D "file://pong-clock-no-flicker.c"
> =20
>  LIC_FILES_CHKSUM =3D "file://pong-clock-no-flicker.c;beginline=3D1;endli=
ne=3D23;md5=3Ddd248d50f73f746d1ee78586b0b2ebd3"
> diff --git a/meta/recipes-graphics/startup-notification/startup-notificat=
ion_0.12.bb b/meta/recipes-graphics/startup-notification/startup-notificati=
on_0.12.bb
> index 363bdcd..6c1b93c 100644
> --- a/meta/recipes-graphics/startup-notification/startup-notification_0.1=
2.bb
> +++ b/meta/recipes-graphics/startup-notification/startup-notification_0.1=
2.bb
> @@ -17,7 +17,9 @@ SECTION =3D "libs"
> =20
>  DEPENDS =3D "virtual/libx11 libsm xcb-util"
> =20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig distro_features_check
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> =20
>  SRC_URI =3D "http://www.freedesktop.org/software/startup-notification/re=
leases/${BPN}-${PV}.tar.gz \
>             file://obsolete_automake_macros.patch \
> diff --git a/meta/recipes-graphics/x11-common/x11-common_0.1.bb b/meta/re=
cipes-graphics/x11-common/x11-common_0.1.bb
> index a2d8885..156b329 100644
> --- a/meta/recipes-graphics/x11-common/x11-common_0.1.bb
> +++ b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
> @@ -4,6 +4,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa95=
4499f7abaabaa882bbe"
>  SECTION =3D "x11"
>  PR =3D "r47"
> =20
> +inherit distro_features_check
> +# rdepends on xdypinfo xmodmap xinit
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
>  SRC_URI =3D "file://etc \
>             file://gplv2-license.patch"
> =20
> diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta/recipes=
-graphics/x11vnc/x11vnc_0.9.13.bb
> index 3d98172..ec0241f 100644
> --- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
> +++ b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
> @@ -16,7 +16,9 @@ SRC_URI[sha256sum] =3D "f6829f2e629667a5284de62b080b131=
26a0736499fe47cdb447aedb07a
> =20
>  DEPENDS =3D "openssl virtual/libx11 libxext jpeg zlib libxfixes libxrand=
r libxdamage libxtst"
> =20
> -inherit autotools-brokensep
> +inherit autotools-brokensep distro_features_check
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> =20
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf',=
 'avahi', '', d)}"
>  PACKAGECONFIG[avahi] =3D "--with-avahi,--without-avahi,avahi"
> diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_gi=
t.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> index 562434f..a9de3d7 100644
> --- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> +++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> @@ -7,7 +7,9 @@ DEPENDS =3D "virtual/libx11 libxi"
>  PV =3D "0.7.5+git${SRCPV}"
>  PR =3D "r6"
> =20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig distro_features_check
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> =20
>  SRCREV =3D "c01c5af807cb4b0157b882ab07a893df9a810111"
>  SRC_URI =3D "git://github.com/tias/xinput_calibrator.git \
> diff --git a/meta/recipes-graphics/xrestop/xrestop_0.4.bb b/meta/recipes-=
graphics/xrestop/xrestop_0.4.bb
> index 20d66be..ce5df03 100644
> --- a/meta/recipes-graphics/xrestop/xrestop_0.4.bb
> +++ b/meta/recipes-graphics/xrestop/xrestop_0.4.bb
> @@ -19,4 +19,6 @@ SRC_URI =3D "http://downloads.yoctoproject.org/releases=
/xrestop/xrestop-${PV}.tar.
>  SRC_URI[md5sum] =3D "d8a54596cbaf037e62b80c4585a3ca9b"
>  SRC_URI[sha256sum] =3D "67c2fc94a7ecedbaae0d1837e82e93d1d98f4a6d75982886=
0e552119af3ce257"
> =20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig distro_features_check
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> diff --git a/meta/recipes-graphics/xtscal/xtscal_0.6.3.bb b/meta/recipes-=
graphics/xtscal/xtscal_0.6.3.bb
> index 7e01775..4bfddf0 100644
> --- a/meta/recipes-graphics/xtscal/xtscal_0.6.3.bb
> +++ b/meta/recipes-graphics/xtscal/xtscal_0.6.3.bb
> @@ -23,7 +23,9 @@ SRC_URI =3D "${GPE_MIRROR}/xtscal-${PV}.tar.bz2 \
>  SRC_URI[md5sum] =3D "9bcab80b474d5454477d1ca166a68c34"
>  SRC_URI[sha256sum] =3D "27b9dc2203de9b1706ca39fa6ca80ecab8807909ec901c4a=
345b8e41178800a1"
> =20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig distro_features_check
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> =20
>  do_install_append() {
>      install -d ${D}${sysconfdir}/X11/Xsession.d/
> diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.b=
b b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> index bc3e0fd..6fb264f 100644
> --- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> +++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> @@ -8,7 +8,9 @@ PR =3D "r33"
> =20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
> -inherit packagegroup
> +inherit packagegroup distro_features_check
> +# rdepends on x11vnc
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> =20
>  PACKAGES =3D "${PN} ${PN}-base ${PN}-apps ${PN}-games"
> =20
> diff --git a/meta/recipes-support/atk/at-spi2-core_2.14.1.bb b/meta/recip=
es-support/atk/at-spi2-core_2.14.1.bb
> index 8d01124..1a1ce6c 100644
> --- a/meta/recipes-support/atk/at-spi2-core_2.14.1.bb
> +++ b/meta/recipes-support/atk/at-spi2-core_2.14.1.bb
> @@ -11,7 +11,9 @@ SRC_URI[sha256sum] =3D "eef9660b14fdf0fb1f30d1be7c72d59=
1fa7cbb87b00ca3a444425712f4
> =20
>  DEPENDS =3D "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"
> =20
> -inherit autotools gtk-doc pkgconfig
> +inherit autotools gtk-doc pkgconfig distro_features_check
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> =20
>  EXTRA_OECONF =3D "--disable-introspection --disable-xevie --with-dbus-da=
emondir=3D${bindir}"
> =20
> diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/r=
ecipes-support/consolekit/consolekit_0.4.6.bb
> index dfbd11c..66a892a 100644
> --- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
> +++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
> @@ -9,7 +9,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b=
29e73d4adb9f9f6552 \
>  DEPENDS =3D "glib-2.0 glib-2.0-native dbus dbus-glib virtual/libx11"
>  RDEPENDS_${PN} +=3D "base-files"
> =20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig distro_features_check
> +# depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> =20
>  SRC_URI =3D "http://www.freedesktop.org/software/ConsoleKit/dist/Console=
Kit-${PV}.tar.xz \
>             file://sepbuildfix.patch \
> --=20
> 2.3.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IJAclU0AInkryoed
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTwN4oACgkQN1Ujt2V2gBzEmQCgqPDot7lYGxOu1g+vLdaIHf2C
2iMAn07xY1Dn+fnUtcz3mm3zJgJBk/Q7
=QOXV
-----END PGP SIGNATURE-----

--IJAclU0AInkryoed--
