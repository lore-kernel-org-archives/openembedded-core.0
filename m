Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2515365D53
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 15:08:15 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so1175786wib.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 08:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PamtP9OKN83I5bm7mKhsEDGKLTc9rlA7rm9oJpWLJU4=;
	b=EWEGhXHMCpPik3vWQAqH3yYcs7VELfTemmcEc63KAhfjLmfSsvRUUXw3Ff4ETUBki8
	c+0lqjGl+P6BmiZa0mMD8ye+tfHnaaS9zUjdt2fvP17PAsK4cQEI6vP0q1JbG0sghT+6
	Fpo3T/0ENcwaaYcYY1sdeRGkj8DV46EPJQ13T4G+nPve/+D+V4Z3SvW0Qs8GOHFb9Ql8
	PYmR+Pxn4j1O621NytU7APRQaXgpH8arO6BQ6XIX8WWo0hlCR8REZr0D9TdHXOjCBJw7
	7cmku5OVwGyDm2UNW5ax5sh12L8nl/7H9ZlogOZSDnQ5kcjE7JV9im6DKD/34lTmAy1G
	yZ5w==
X-Received: by 10.180.90.13 with SMTP id bs13mr4826224wib.74.1407510496326;
	Fri, 08 Aug 2014 08:08:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id t6sm8016290wib.4.2014.08.08.08.08.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Aug 2014 08:08:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 8 Aug 2014 17:08:47 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140808150847.GH14848@jama>
References: <20140808102805.GD14848@jama>
	<1407506787-3692-1-git-send-email-Martin.Jansa@gmail.com>
	<2818712.2hiaLxnVGE@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <2818712.2hiaLxnVGE@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] libav: drop older 0.8.11 and use libav-9 by default
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
X-List-Received-Date: Fri, 08 Aug 2014 15:08:18 -0000
X-Groupsio-MsgNum: 56159
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8zu1PYoF5C4kwccn"
Content-Disposition: inline

--8zu1PYoF5C4kwccn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2014 at 03:08:06PM +0100, Paul Eggleton wrote:
> On Friday 08 August 2014 16:06:27 Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../gstreamer/gst-ffmpeg_0.10.13.bb                |  3 +--
> >  meta/recipes-multimedia/libav/libav.inc            |  8 ++++++++
> >  .../0001-configure-enable-pic-for-AArch64.patch    | 23
> > ---------------------- meta/recipes-multimedia/libav/libav_0.8.11.bb   =
   |
> > 20 ------------------- meta/recipes-multimedia/libav/libav_9.13.bb     =
   |
> > 12 ----------- 5 files changed, 9 insertions(+), 57 deletions(-)
> >  delete mode 100644
> > meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch=
64.p
> > atch delete mode 100644 meta/recipes-multimedia/libav/libav_0.8.11.bb
> >=20
> > diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> > b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb index
> > bd7b8ce..04c08cc 100644
> > --- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> > @@ -53,7 +53,7 @@ SRC_URI =3D
> > "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
> > file://0001-qdm2-check-array-index-before-use-fix-out-of-array-a.patch \
> > file://0001-lavf-compute-probe-buffer-size-more-reliably.patch \
> > file://0001-ffserver-set-oformat.patch \
> > -           ${@bb.utils.contains('PACKAGECONFIG', 'libav9',
> > 'file://libav-9.patch', '', d)} \ +           file://libav-9.patch \
> >  "
> >=20
> >  SRC_URI[md5sum] =3D "7f5beacaf1312db2db30a026b36888c4"
> > @@ -80,7 +80,6 @@ EXTRA_OECONF =3D "${FFMPEG_EXTRA_CONFIGURE_COMMON}"
> >  PACKAGECONFIG ??=3D "external-libav"
> >  PACKAGECONFIG[external-libav] =3D "--with-system-ffmpeg,,libav"
> >  PACKAGECONFIG[orc] =3D "--enable-orc,--disable-orc,orc"
> > -PACKAGECONFIG[libav9] =3D ",,,"
> >=20
> >  FILES_${PN} +=3D "${libdir}/gstreamer-0.10/*.so"
> >  FILES_${PN}-dbg +=3D "${libdir}/gstreamer-0.10/.debug"
> > diff --git a/meta/recipes-multimedia/libav/libav.inc
> > b/meta/recipes-multimedia/libav/libav.inc index 8b470c1..21c29fc 100644
> > --- a/meta/recipes-multimedia/libav/libav.inc
> > +++ b/meta/recipes-multimedia/libav/libav.inc
> > @@ -10,6 +10,13 @@ SECTION =3D "libs"
> >  LICENSE =3D "GPLv2+"
> >  LICENSE_FLAGS =3D "commercial"
> >=20
> > +LIC_FILES_CHKSUM =3D
> > "file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \ +       =
     =20
> >       file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d47fae504 \ +  =
     =20
> >            file://COPYING.LGPLv2.1;md5=3Dbd7a443320af8c812e4c18d1b79df0=
04 \ +
> >                  =20
> > file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d983680233ad02" +
> > +SRC_URI =3D "http://libav.org/releases/${BP}.tar.xz"
> > +
> >  # Provides ffmpeg compat, see http://libav.org/about.html
> >  PROVIDES =3D "ffmpeg"
> >=20
> > @@ -86,6 +93,7 @@ do_install_append() {
> >  }
> >=20
> >  PACKAGES +=3D "${PN}-vhook-dbg ${PN}-vhook ffmpeg-x264-presets"
> > +PACKAGES_DYNAMIC +=3D "^lib(av(codec|device|filter|format|util)|swscal=
e).*"
> >=20
> >  RSUGGESTS_${PN} =3D "mplayer"
> >  FILES_${PN} =3D "${bindir}"
> > diff --git
> > a/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AAr=
ch64
> > .patch
> > b/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AAr=
ch64
> > .patch deleted file mode 100644
> > index d9b22b9..0000000
> > ---
> > a/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AAr=
ch64
> > .patch +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -From 58db99e98f615d79ea90cac8f4bcf11c94e3e7c7 Mon Sep 17 00:00:00 2001
> > -From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> > -Date: Thu, 10 Jan 2013 12:42:19 +0100
> > -Subject: [PATCH] configure: enable pic for AArch64
> > -
> > -Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> > -
> > -Upstream-Status: Backport
> > ----
> > - configure |    2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > ---- git.orig/configure
> > -+++ git/configure
> > -@@ -2393,7 +2393,7 @@ check_host_cflags -std=3Dc99
> > - check_host_cflags -Wall
> > -
> > - case "$arch" in
> > --    alpha|ia64|mips|parisc|ppc|sparc)
> > -+    alpha|ia64|mips|parisc|ppc|sparc|aarch64)
> > -         spic=3D$shared
> > -     ;;
> > -     x86)
> > diff --git a/meta/recipes-multimedia/libav/libav_0.8.11.bb
> > b/meta/recipes-multimedia/libav/libav_0.8.11.bb deleted file mode 100644
> > index 1344a2a..0000000
> > --- a/meta/recipes-multimedia/libav/libav_0.8.11.bb
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -require libav.inc
> > -
> > -SRC_URI =3D "http://libav.org/releases/${BP}.tar.xz \
> > -           file://0001-configure-enable-pic-for-AArch64.patch"
> > -
> > -SRC_URI[md5sum] =3D "cdc9b53c56a375baf73ea38cf7ade4f9"
> > -SRC_URI[sha256sum] =3D
> > "5934e4f0dbf6e0fc4987de86cdd079f1d11a1410ae275e9f46472af17f05155a" -
> > -LIC_FILES_CHKSUM =3D
> > "file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \ -       =
     =20
> >       file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d47fae504 \ -  =
     =20
> >            file://COPYING.LGPLv2.1;md5=3De344c8fa836c3a41c4cbd79d7bd3a3=
79 \ -
> >                  =20
> > file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d983680233ad02" -
> > -PROVIDES +=3D "libpostproc"
> > -
> > -EXTRA_OECONF +=3D " \
> > -    --enable-postproc \
> > -"
> > -
> > -PACKAGES_DYNAMIC +=3D
> > "^lib(av(codec|device|filter|format|util)|postproc|swscale).*" diff --g=
it
> > a/meta/recipes-multimedia/libav/libav_9.13.bb
> > b/meta/recipes-multimedia/libav/libav_9.13.bb index f9c413f..e922403 10=
0644
> > --- a/meta/recipes-multimedia/libav/libav_9.13.bb
> > +++ b/meta/recipes-multimedia/libav/libav_9.13.bb
> > @@ -1,16 +1,4 @@
> >  require libav.inc
> >=20
> > -LIC_FILES_CHKSUM =3D
> > "file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \ -       =
     =20
> >       file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d47fae504 \ -  =
     =20
> >            file://COPYING.LGPLv2.1;md5=3Dbd7a443320af8c812e4c18d1b79df0=
04 \ -
> >                  =20
> > file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d983680233ad02" -
> > -SRC_URI =3D "http://libav.org/releases/${BP}.tar.xz"
> > -
> >  SRC_URI[md5sum] =3D "23b9e34bffdaee366710fdf20157a570"
> >  SRC_URI[sha256sum] =3D
> > "2ff05df6cd2259b3bb277eb16c234214f8e0530700d0c774d033eba23edde6ca" -
> > -DEFAULT_PREFERENCE =3D "-1"
> > -
> > -# unlike 0.8.11 we don't provide libpostproc
> > -PACKAGES_DYNAMIC +=3D "^lib(av(codec|device|filter|format|util)|swscal=
e).*"
>=20
>=20
> If this works I'm definitely in favour of it.

So far I've only build tested it and it builds fine.

The question is, do we want to move libpostproc in or gst-ffmpeg out?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8zu1PYoF5C4kwccn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPk5/8ACgkQN1Ujt2V2gBx9ngCfW47u9g0ubcJ6J7tO2V4YRGk5
UwgAn3ITWcEArOYRaC/z823djGLnia5T
=1WRm
-----END PGP SIGNATURE-----

--8zu1PYoF5C4kwccn--
