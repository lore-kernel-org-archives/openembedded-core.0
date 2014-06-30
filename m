Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id B4AED60559
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 16:40:30 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id n3so6404483wiv.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 09:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uZ8VjPXbphXfG9AhUQ2uJThO90+2+/sQWfgjp75xEog=;
	b=f71iuASzYAdNJHbi3DNLZL4gHshvaQBaGbixzklR/VXqwrjITw+UBAzIBraElovHS+
	uVYET+xktaJDXPSztUwL1w7VFrdbjD+27If4OL+2dvz0BdbrGWYiwowgMtxz671hUhTW
	IqLpqynvWLo+MRH6+t0gMfo4zwa9RLnu9iI1P8XbfUwijhnFTTfgDE/ESSHmanSmd2gA
	xnVrLrZRaw8zwPVFl72NFfhoF74RMXRFYCutw/3GyInGaCS2erUkOs1TnM9VWUs7ZJSL
	SXJGg9K+9VdlSmglimsDmRGWoqjkunm2836eFN6UqzW/GDfDrxk+zupvwThiCBjj5Mj0
	YMSQ==
X-Received: by 10.180.188.103 with SMTP id fz7mr30925216wic.73.1404146431731; 
	Mon, 30 Jun 2014 09:40:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hi4sm42345349wjc.27.2014.06.30.09.40.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Jun 2014 09:40:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 Jun 2014 18:40:39 +0200
To: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
Message-ID: <20140630164039.GC2437@jama>
References: <1404138201-22662-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
In-Reply-To: <1404138201-22662-1-git-send-email-Matthieu.Crapet@ingenico.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] libav: add PACKAGECONFIG for theora, libvorbis, speex and openssl
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
X-List-Received-Date: Mon, 30 Jun 2014 16:40:33 -0000
X-Groupsio-MsgNum: 54489
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k8ylJtLa18RSEDYA"
Content-Disposition: inline

--k8ylJtLa18RSEDYA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2014 at 04:23:21PM +0200, Matthieu Crapet wrote:
> Dropped libvorvis dependency because there is already a (better) builtin =
vorbis codec.
> Don't confuse codec names: "vorbis" (builtin) and "libvorbis" (using exte=
rnal library).
> Changes:
> - add --enable-nonfree when faac or openssl are used
> - add DESCRIPTION
> - sort PACKAGECONFIG entries
>=20
> Tested with libav-0.8.11 & libav-9.13.
>=20
> Note: Be sure to have a recent version of bitbake (2014-06-11 or better) =
including this:
> http://cgit.openembedded.org/bitbake/commit/?id=3D2e742c03e8dfdfa67899e7f=
5d579ed14bd87e139
> It affects behavior of bb.utils.contains_any
>=20
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>  meta/recipes-multimedia/libav/libav.inc | 30 ++++++++++++++++++++++-----=
---
>  1 file changed, 22 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multi=
media/libav/libav.inc
> index a05a2a6..1d617a2 100644
> --- a/meta/recipes-multimedia/libav/libav.inc
> +++ b/meta/recipes-multimedia/libav/libav.inc
> @@ -1,6 +1,12 @@
> -SUMMARY =3D "A complete, cross-platform solution to record, convert and =
stream audio and video"
> +SUMMARY =3D "Open source audio and video processing tools and librairies"
> +DESCRIPTION =3D "Libav is a friendly and community-driven effort to prov=
ide its users \
> +               with a set of portable, functional and high-performance l=
ibraries for \
> +               dealing with multimedia formats of all sorts. It originat=
es from the \
> +               FFmpeg codebase, but goes its own way these days, providi=
ng its users \
> +               with reliable releases and a clear vision how to go forwa=
rd."
>  HOMEPAGE =3D "http://libav.org/"
>  SECTION =3D "libs"
> +
>  LICENSE =3D "GPLv2+"
>  LICENSE_FLAGS =3D "commercial"
> =20
> @@ -9,7 +15,7 @@ PROVIDES =3D "ffmpeg"
> =20
>  ARM_INSTRUCTION_SET =3D "arm"
> =20
> -DEPENDS =3D "zlib libogg libvorbis libtheora yasm-native"
> +DEPENDS =3D "zlib libogg yasm-native"
> =20
>  INC_PR =3D "r8"
> =20
> @@ -23,21 +29,29 @@ BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
>  EXTRA_FFCONF_armv7a =3D "--cpu=3Dcortex-a8"
>  EXTRA_FFCONF ?=3D ""
> =20
> -PACKAGECONFIG ??=3D "bzip2 x264 ${@bb.utils.contains('DISTRO_FEATURES', =
'x11', 'x11', '', d)}"
> -PACKAGECONFIG[jack] =3D "--enable-indev=3Djack,--disable-indev=3Djack,ja=
ck"
> +PACKAGECONFIG ??=3D "bzip2 x264 theora ${@bb.utils.contains('DISTRO_FEAT=
URES', 'x11', 'x11', '', d)}"
>  PACKAGECONFIG[bzip2] =3D "--enable-bzlib,--disable-bzlib,bzip2"
> -PACKAGECONFIG[schroedinger] =3D "--enable-libschroedinger,--disable-libs=
chroedinger,schroedinger"
> +PACKAGECONFIG[faac] =3D "--enable-libfaac,--disable-libfaac,faac"
>  PACKAGECONFIG[gsm] =3D "--enable-libgsm,--disable-libgsm,libgsm"
> -PACKAGECONFIG[x264] =3D "--enable-libx264,--disable-libx264,x264"
> -PACKAGECONFIG[vpx] =3D "--enable-libvpx,--disable-libvpx,libvpx"
> +PACKAGECONFIG[jack] =3D "--enable-indev=3Djack,--disable-indev=3Djack,ja=
ck"
> +PACKAGECONFIG[libvorbis] =3D "--enable-libvorbis,--disable-libvorbis,lib=
vorbis"
>  PACKAGECONFIG[mp3lame] =3D "--enable-libmp3lame,--disable-libmp3lame,lam=
e"
> -PACKAGECONFIG[faac] =3D "--enable-libfaac,--disable-libfaac,faac"
> +PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-openssl,openssl"
> +PACKAGECONFIG[schroedinger] =3D "--enable-libschroedinger,--disable-libs=
chroedinger,schroedinger"
> +PACKAGECONFIG[speex] =3D "--enable-libspeex,--disable-libspeex,speex"
> +PACKAGECONFIG[theora] =3D "--enable-libtheora,--disable-libtheora,libthe=
ora"
> +PACKAGECONFIG[vpx] =3D "--enable-libvpx,--disable-libvpx,libvpx"
>  PACKAGECONFIG[x11] =3D "--enable-x11grab,--disable-x11grab,virtual/libx1=
1 libxfixes libxext xproto virtual/libsdl"
> +PACKAGECONFIG[x264] =3D "--enable-libx264,--disable-libx264,x264"
> +
> +# Check codecs that require --enable-nonfree
> +USE_NONFREE =3D "${@bb.utils.contains_any('PACKAGECONFIG', [ 'faac', 'op=
enssl' ], 'yes', '', d)}"
> =20
>  EXTRA_OECONF =3D " \
>      --enable-shared \
>      --enable-pthreads \
>      --enable-gpl \
> +    ${@bb.utils.contains('USE_NONFREE', 'yes', '--enable-nonfree', '', d=
)} \

cannot you just pass --enable-nonfree in faac and openssl PACKAGECONFIG?
In worse case when both are enabled the option will be added twice.

>      --enable-avfilter \
>      \
>      --cross-prefix=3D${TARGET_PREFIX} \
> --=20
> 2.0.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k8ylJtLa18RSEDYA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOxkwcACgkQN1Ujt2V2gBz46gCgoXr5hXpHCUFw6ElM2ig++uh2
2C8An1QpSTk7r90qqfpMo2q7/lmpLmL5
=K4nS
-----END PGP SIGNATURE-----

--k8ylJtLa18RSEDYA--
