Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id C39907289A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 17:01:19 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id x13so2200664wgg.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 09:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3N47Hq48pRCQ6KoPBHsHPD3Ps5raILmMrLXRHcIOY5I=;
	b=VVlAxrGCLZWSmgqwmsdSI/A0ktG/D9B8ByX2tPrPO/MO/0v4dXkgxY2rCawzAEi6UY
	zFc+No5eDLg5uiP/iqkz+h3fekJsS3Az58GXGyCGIFUgcG3KvEzo672wZCWk/kVP8TcC
	ye4O+jnpWccAF1pxnM2g1tTlY5I6i1bzEZYe0lAOuFYvtJzXJzur8fZF2FkDm5HhGvI+
	SZOFlHQQoIyYioxvqu3A26SCRwUWvT2wkeOBCVnbicBR9cRpxNtiZzljHY2WXfHjE2Y6
	Z6P68sfUcvP18b6wikVQNdNx+eZIixxvuvm/UihMeTca+JVhUS0Oyv4zLldwwXlkI9Hz
	/y2g==
X-Received: by 10.180.198.211 with SMTP id je19mr6853010wic.27.1418922076706; 
	Thu, 18 Dec 2014 09:01:16 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wx3sm9611957wjc.19.2014.12.18.09.01.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 09:01:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 18 Dec 2014 18:01:20 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20141218170120.GE2462@jama>
References: <20141030082101.GE15148@jama>
	<1418221027-12371-1-git-send-email-Martin.Jansa@gmail.com>
	<1418221027-12371-3-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LbA7rVxmFGZS9zcAiVbnLSpEhZqM0KutYJy9D02Gqfvag@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbA7rVxmFGZS9zcAiVbnLSpEhZqM0KutYJy9D02Gqfvag@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 3/4] libav: drop older 0.8.11 and use libav-9 by default
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
X-List-Received-Date: Thu, 18 Dec 2014 17:01:23 -0000
X-Groupsio-MsgNum: 60630
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WBsA/oQW3eTA3LlM"
Content-Disposition: inline

--WBsA/oQW3eTA3LlM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2014 at 04:29:55PM +0000, Burton, Ross wrote:
> Hi Martin,
>=20
> Can this be squashed with the previous patch which makes changes to libav
> 0.8?

I would prefer to keep it separate, because 0.8 fix can be applied even
without removing 0.8* version.

> Merging the .inc and .bb together seems sensible too, especially as
> the .inc contains the checksums so isn't actually useful for multiple
> versions.

If I see correctly it only has LIC_FILES_CHKSUMs which can be shared for
multiple versions and with some people being afraid about 9*
compatibility with other projects I would keep .inc (in case someone
will need to restore 0.8 in own layer for some weird dependency.


> Also theres a version typo in the commit shortlog.

You mean 0.8.11 version instead of 0.8.15? It's not a typo, I just forgot to
update it when rebasing (there wasn't 0.8.15 when I was sending this
patch on Aug 8)
http://lists.openembedded.org/pipermail/openembedded-core/2014-August/09550=
7.html

> Ross
>=20
> On 10 December 2014 at 14:17, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../gstreamer/gst-ffmpeg_0.10.13.bb                |  3 +--
> >  meta/recipes-multimedia/libav/libav.inc            |  8 ++++++++
> >  .../0001-configure-enable-pic-for-AArch64.patch    | 23
> > ----------------------
> >  meta/recipes-multimedia/libav/libav_0.8.15.bb      | 20
> > -------------------
> >  meta/recipes-multimedia/libav/libav_9.16.bb        | 12 -----------
> >  5 files changed, 9 insertions(+), 57 deletions(-)
> >  delete mode 100644
> > meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch=
64.patch
> >  delete mode 100644 meta/recipes-multimedia/libav/libav_0.8.15.bb
> >
> > diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> > b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> > index 7304fff..219feaa 100644
> > --- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> > @@ -57,7 +57,7 @@ SRC_URI =3D "
> > http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
> >
> > file://0001-h264-skip-error-concealment-when-SPS-and-slices-are-.patch \
> >             file://0001-avcodec-smc-fix-off-by-1-error.patch \
> >
> > file://0002-avcodec-mjpegdec-check-bits-per-pixel-for-changes-si.patch \
> > -           ${@bb.utils.contains('PACKAGECONFIG', 'libav9',
> > 'file://libav-9.patch', '', d)} \
> > +           file://libav-9.patch \
> >  "
> >
> >  SRC_URI[md5sum] =3D "7f5beacaf1312db2db30a026b36888c4"
> > @@ -84,7 +84,6 @@ EXTRA_OECONF =3D "${FFMPEG_EXTRA_CONFIGURE_COMMON}"
> >  PACKAGECONFIG ??=3D "external-libav"
> >  PACKAGECONFIG[external-libav] =3D "--with-system-ffmpeg,,libav"
> >  PACKAGECONFIG[orc] =3D "--enable-orc,--disable-orc,orc"
> > -PACKAGECONFIG[libav9] =3D ",,,"
> >
> >  FILES_${PN} +=3D "${libdir}/gstreamer-0.10/*.so"
> >  FILES_${PN}-dbg +=3D "${libdir}/gstreamer-0.10/.debug"
> > diff --git a/meta/recipes-multimedia/libav/libav.inc
> > b/meta/recipes-multimedia/libav/libav.inc
> > index 8b470c1..21c29fc 100644
> > --- a/meta/recipes-multimedia/libav/libav.inc
> > +++ b/meta/recipes-multimedia/libav/libav.inc
> > @@ -10,6 +10,13 @@ SECTION =3D "libs"
> >  LICENSE =3D "GPLv2+"
> >  LICENSE_FLAGS =3D "commercial"
> >
> > +LIC_FILES_CHKSUM =3D
> > "file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> > +
> > file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> > +
> > file://COPYING.LGPLv2.1;md5=3Dbd7a443320af8c812e4c18d1b79df004 \
> > +
> > file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d983680233ad02"
> > +
> > +SRC_URI =3D "http://libav.org/releases/${BP}.tar.xz"
> > +
> >  # Provides ffmpeg compat, see http://libav.org/about.html
> >  PROVIDES =3D "ffmpeg"
> >
> > @@ -86,6 +93,7 @@ do_install_append() {
> >  }
> >
> >  PACKAGES +=3D "${PN}-vhook-dbg ${PN}-vhook ffmpeg-x264-presets"
> > +PACKAGES_DYNAMIC +=3D "^lib(av(codec|device|filter|format|util)|swscal=
e).*"
> >
> >  RSUGGESTS_${PN} =3D "mplayer"
> >  FILES_${PN} =3D "${bindir}"
> > diff --git
> > a/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AAr=
ch64.patch
> > b/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AAr=
ch64.patch
> > deleted file mode 100644
> > index d9b22b9..0000000
> > ---
> > a/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AAr=
ch64.patch
> > +++ /dev/null
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
> > diff --git a/meta/recipes-multimedia/libav/libav_0.8.15.bb
> > b/meta/recipes-multimedia/libav/libav_0.8.15.bb
> > deleted file mode 100644
> > index 127a088..0000000
> > --- a/meta/recipes-multimedia/libav/libav_0.8.15.bb
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -require libav.inc
> > -
> > -SRC_URI =3D "http://libav.org/releases/${BP}.tar.xz \
> > -           file://0001-configure-enable-pic-for-AArch64.patch"
> > -
> > -SRC_URI[md5sum] =3D "e483ea8f482b5ecd65ee1d09251b0a5b"
> > -SRC_URI[sha256sum] =3D
> > "495789ec547e93632937f0f36b06f4dd3180bc61518181f124af6746c6218710"
> > -
> > -LIC_FILES_CHKSUM =3D
> > "file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> > -
> > file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> > -
> > file://COPYING.LGPLv2.1;md5=3De344c8fa836c3a41c4cbd79d7bd3a379 \
> > -
> > file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d983680233ad02"
> > -
> > -PROVIDES +=3D "libpostproc"
> > -
> > -EXTRA_OECONF +=3D " \
> > -    --enable-postproc \
> > -"
> > -
> > -PACKAGES_DYNAMIC +=3D
> > "^lib(av(codec|device|filter|format|util)|postproc|swscale).*"
> > diff --git a/meta/recipes-multimedia/libav/libav_9.16.bb
> > b/meta/recipes-multimedia/libav/libav_9.16.bb
> > index 8ced2dc..79ff3f8 100644
> > --- a/meta/recipes-multimedia/libav/libav_9.16.bb
> > +++ b/meta/recipes-multimedia/libav/libav_9.16.bb
> > @@ -1,16 +1,4 @@
> >  require libav.inc
> >
> > -LIC_FILES_CHKSUM =3D
> > "file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> > -
> > file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> > -
> > file://COPYING.LGPLv2.1;md5=3Dbd7a443320af8c812e4c18d1b79df004 \
> > -
> > file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d983680233ad02"
> > -
> > -SRC_URI =3D "http://libav.org/releases/${BP}.tar.xz"
> > -
> >  SRC_URI[md5sum] =3D "7b44b75cec24b8e7545e5029e76917e0"
> >  SRC_URI[sha256sum] =3D
> > "ca846473b0b8ed8e3404c52e5e92df6d35cb5fa487eec498525de3ffda4367a0"
> > -
> > -DEFAULT_PREFERENCE =3D "-1"
> > -
> > -# unlike 0.8.11 we don't provide libpostproc
> > -PACKAGES_DYNAMIC +=3D "^lib(av(codec|device|filter|format|util)|swscal=
e).*"
> > --
> > 2.1.3
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WBsA/oQW3eTA3LlM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSTCGAACgkQN1Ujt2V2gBxnDwCfa1vHyn+A+X8PZVgFIJWcZHeU
PtEAn2WehctM6ZlAWPzEiBbVPiIKr8Ku
=9mk2
-----END PGP SIGNATURE-----

--WBsA/oQW3eTA3LlM--
