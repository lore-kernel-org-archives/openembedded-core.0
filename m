Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9CC65E1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 14:07:30 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id k48so10008801wev.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 07:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fBYZdnpT+zG6f+h2krf8+jYFnNd66i7b1HH5OEB0HiM=;
	b=SoOw6dtZb4E4nKGF2jdt+s/wuUi3rFkZPKsqM2/r5mQk2XDS8b1V8qghefEJuLqSL3
	Pq0jwH4k2jStZWKJFgeITVeNolYWutlsegbbfGdxb1AP/z7JtKp6ltZD+CUCP/8mNpmV
	hzJtn82dpKo775+uea78HKg+OcT2M6g0N51YXqkrAS9IiFVIq2xyoEIdn6ezL2tNtTVC
	mKl0kVcclfkMWZRn/iJvIH7G1wxvXAV7CU6ZAhnrxLkeVMC3OxZ8IpIqpKEoHgTXoHIQ
	31qdpe/8onlg/SV8dvhxRHIgRyWbraMoeZyn5qEOQVeHD5dRWg2ovxq64ytBmvt+q1Tv
	k/iw==
X-Received: by 10.194.6.101 with SMTP id z5mr5577140wjz.79.1407852450991;
	Tue, 12 Aug 2014 07:07:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j6sm9512390wje.29.2014.08.12.07.07.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 07:07:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Aug 2014 16:08:06 +0200
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <20140812140806.GO14848@jama>
References: <1406667922-15716-1-git-send-email-dv@pseudoterminal.org>
	<1406667922-15716-4-git-send-email-dv@pseudoterminal.org>
	<20140812140647.GN14848@jama>
MIME-Version: 1.0
In-Reply-To: <20140812140647.GN14848@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 4/7] gstreamer1.0-plugins-bad: upgrade to 1.4.0
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
X-List-Received-Date: Tue, 12 Aug 2014 14:07:34 -0000
X-Groupsio-MsgNum: 56358
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SNlyIF2RY6TSxS+s"
Content-Disposition: inline

--SNlyIF2RY6TSxS+s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2014 at 04:06:47PM +0200, Martin Jansa wrote:
> On Tue, Jul 29, 2014 at 11:05:19PM +0200, Carlos Rafael Giani wrote:
> > Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> > ---
> >  .../gstreamer/gstreamer1.0-plugins-bad.inc         | 29 ++++++++++++--=
--------
> >  ..._1.2.4.bb =3D> gstreamer1.0-plugins-bad_1.4.0.bb} |  4 +--
> >  2 files changed, 18 insertions(+), 15 deletions(-)
> >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.2=
=2E4.bb =3D> gstreamer1.0-plugins-bad_1.4.0.bb} (75%)
>=20
> Would you mind fixing this floating dependency?
> gstreamer1.0-plugins-bad-1.4.0: libgstgl-1.0 rdepends on libglu, but it i=
sn't a build dependency? [build-deps]

and

gstreamer1.0-plugins-bad-1.4.0: gstreamer1.0-plugins-bad-opengl rdepends on=
 libpng, but it isn't a build dependency? [build-deps]
gstreamer1.0-plugins-bad-1.4.0: gstreamer1.0-plugins-bad-opengl rdepends on=
 libjpeg-turbo, but it isn't a build dependency? [build-deps]
gstreamer1.0-plugins-bad-1.4.0: gstreamer1.0-plugins-bad-opengl rdepends on=
 libglu, but it isn't a build dependency? [build-deps]

>=20
> >=20
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad=
=2Einc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> > index ceb2de1..8ecc2aa 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> > @@ -11,16 +11,16 @@ inherit gettext
> > =20
> >  PACKAGECONFIG ??=3D " \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', =
d)} \
> > -    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'eglgles', '', d=
)} \
> > +    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', =
d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', ''=
, d)} \
> > -    orc curl uvch264 neon \
> > +    orc curl uvch264 neon sndfile \
> >      hls sbc dash bz2 smoothstreaming \
> >      "
> >  # dash =3D Dynamic Adaptive Streaming over HTTP
> >  PACKAGECONFIG[assrender]       =3D "--enable-assrender,--disable-assre=
nder,libass"
> >  PACKAGECONFIG[curl]            =3D "--enable-curl,--disable-curl,curl"
> > -PACKAGECONFIG[eglgles]         =3D "--enable-eglgles,--disable-eglgles=
,virtual/egl virtual/libgles2"
> > +PACKAGECONFIG[gl]              =3D "--enable-gl,--disable-gl,virtual/e=
gl virtual/libgles2"
> >  PACKAGECONFIG[faac]            =3D "--enable-faac,--disable-faac,faac"
> >  PACKAGECONFIG[faad]            =3D "--enable-faad,--disable-faad,faad2"
> >  PACKAGECONFIG[libmms]          =3D "--enable-libmms,--disable-libmms,l=
ibmms"
> > @@ -43,18 +43,25 @@ PACKAGECONFIG[schroedinger]    =3D "--enable-schro,=
--disable-schro,schroedinger"
> >  PACKAGECONFIG[smoothstreaming] =3D "--enable-smoothstreaming,--disable=
-smoothstreaming,libxml2"
> >  PACKAGECONFIG[bluez]           =3D "--enable-bluez,--disable-bluez,blu=
ez4"
> >  PACKAGECONFIG[rsvg]            =3D "--enable-rsvg,--disable-rsvg,librs=
vg"
> > +PACKAGECONFIG[sndfile]         =3D "--enable-sndfile,--disable-sndfile=
,libsndfile1"
> > +PACKAGECONFIG[webp]            =3D "--enable-webp,--disable-webp,libwe=
bp"
> > =20
> >  # these plugins have not been ported to 1.0 (yet):
> > -#   directdraw vcd apexsink cdaudio dc1394 lv2 linsys musepack mythtv
> > -#   nas timidity teletextdec sdl sndfile xvid wininet acm gsettings
> > -#   sndio cdxaparse dccp faceoverlay hdvparse ivfparse jp2kdecimator
> > -#   linsys mve nuvdemux osx_video patchdetect quicktime real sdi stereo
> > -#   tta videomeasure videosignal vmnc
> > +#   directdraw vcd apexsink dc1394 lv2 linsys musepack mythtv
> > +#   nas timidity teletextdec sdl xvid wininet acm gsettings
> > +#   sndio qtwrapper cdxaparse dccp faceoverlay hdvparse tta
> > +#   mve nuvdemux osx_video patchdetect quicktime real sdi
> > +#   videomeasure gsettings
> > +
> > +# these plugins have no corresponding library in OE-core or meta-opene=
mbedded:
> > +#   openni2 winks direct3d directdraw directsound winscreencap osx_vid=
eo
> > +#   apple_media android_media avc chromaprint daala dts gme gsm kate l=
adspa mimic
> > +#   mpeg2enc mplex ofa openjpeg opensles pvr resindvd rtmp soundtouch =
spandsp spc
> > +#   srtp vdpau voaacenc voamrwbenc wasapi zbar
> > =20
> >  EXTRA_OECONF +=3D " \
> >      --enable-dvb \
> >      --enable-shm \
> > -    --enable-mfc \
> >      --enable-fbdev \
> >      --enable-decklink \
> >      --disable-acm \
> > @@ -62,13 +69,11 @@ EXTRA_OECONF +=3D " \
> >      --disable-apexsink \
> >      --disable-apple_media \
> >      --disable-avc \
> > -    --disable-cdaudio \
> >      --disable-chromaprint \
> >      --disable-daala \
> >      --disable-dc1394 \
> >      --disable-direct3d \
> >      --disable-directdraw \
> > -    --disable-directshow \
> >      --disable-directsound \
> >      --disable-dts \
> >      --disable-gme \
> > @@ -94,7 +99,6 @@ EXTRA_OECONF +=3D " \
> >      --disable-rtmp \
> >      --disable-sdl \
> >      --disable-sdltest \
> > -    --disable-sndfile \
> >      --disable-sndio \
> >      --disable-soundtouch \
> >      --disable-spandsp \
> > @@ -107,7 +111,6 @@ EXTRA_OECONF +=3D " \
> >      --disable-voaacenc \
> >      --disable-voamrwbenc \
> >      --disable-wasapi \
> > -    --disable-webp \
> >      --disable-wildmidi \
> >      --disable-wininet \
> >      --disable-winscreencap \
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad=
_1.2.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.=
0.bb
> > similarity index 75%
> > rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_=
1.2.4.bb
> > rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.=
4.0.bb
> > index c57c98f..e6edb26 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.4.=
bb
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.0.=
bb
> > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D73a5855a8119=
deb017f5f13cf327095d \
> >                      file://gst/tta/filters.h;beginline=3D12;endline=3D=
29;md5=3D8a08270656f2f8ad7bb3655b83138e5a \
> >                      file://COPYING.LIB;md5=3D21682e4e8fea52413fd26c60a=
cb907e5 \
> >                      file://gst/tta/crc32.h;beginline=3D12;endline=3D29=
;md5=3D27db269c575d1e5317fffca2d33b3b50"
> > -SRC_URI[md5sum] =3D "16c2050716383926909664aa6c6aca2b"
> > -SRC_URI[sha256sum] =3D "984c133ec9d5d705e313d9e2bbd1472b93c6567460602a=
9a316578925ffe2eca"
> > +SRC_URI[md5sum] =3D "3bc0fcfe8d16ad1295f0454c1fcb4ba3"
> > +SRC_URI[sha256sum] =3D "ff2cb754f7725b205aec66002b1406e440f3a03194b6ca=
d2d126ef5cd00902f9"
> >  S =3D "${WORKDIR}/gst-plugins-bad-${PV}"
> > =20
> > --=20
> > 1.8.3.2
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SNlyIF2RY6TSxS+s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlPqH8YACgkQN1Ujt2V2gByqJQCYt10Gov0JLJPr9nA64ik1m108
kgCgtGGCZlOyxgYZPvYCCQiBLl2i9x8=
=QEty
-----END PGP SIGNATURE-----

--SNlyIF2RY6TSxS+s--
