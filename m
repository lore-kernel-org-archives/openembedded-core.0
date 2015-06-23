Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8D05C601E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 08:39:13 +0000 (UTC)
Received: by pabvl15 with SMTP id vl15so2565902pab.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 01:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=yYAmO7+0HkdtiMJg13++rNCE8USLbxqHGl3yINFlr0M=;
	b=qVJrXSmrC1WJLghvS8uZEc2Y6WI/41PzKe2S9wgENuxZeZIBcXguClrcg7V3pQbren
	eIb8y8DRTqkbor2o6itNB2DcJQm6aeZEpLJHGdD8vNBLYqmTb4Gib2m1KGaOVQqkGxgg
	zV+IAW+ildSQHqUzqmRR4IH9lEQhTZ1/k7HnAhpzW4sTGUoOVSuF15T4ce+DJ6Yg5t8e
	XNlaNSEUtQMAr95+egtCbvltTAcqv6mKRTrDsW2B+sNxg04Lmi/lAH3iHmo3yBzEE10A
	N/XkAAoGroOyPDrsw5qqOz/TPRfSapd51xkfwWVIUV7fuUHzE4YqHiGZrzmuX5R4QSox
	x+SA==
MIME-Version: 1.0
X-Received: by 10.68.180.67 with SMTP id dm3mr30439307pbc.167.1435048754745;
	Tue, 23 Jun 2015 01:39:14 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Tue, 23 Jun 2015 01:39:14 -0700 (PDT)
In-Reply-To: <1434142243-2093-1-git-send-email-schnitzeltony@googlemail.com>
References: <1434142243-2093-1-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 23 Jun 2015 10:39:14 +0200
Message-ID: <CALbNGRTm5mZ1CdKr0YX_qRcxG1Gnkj5sjr6nh=hKo=LQZQgerw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl2: PACKAGECONFIGize
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
X-List-Received-Date: Tue, 23 Jun 2015 08:39:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2015 at 10:50 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> * DEPENDS + EXTRA_OECONF -> PACKAGECONFIG for directfb / opengl / x11
> * added PACKAGECONFIG for gles2 / pulseaudio / tslib / wayland
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb | 39 ++++++++++++++++----=
------
>  1 file changed, 24 insertions(+), 15 deletions(-)
>
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb b/meta/recipe=
s-graphics/libsdl2/libsdl2_2.0.3.bb
> index 197f962..97f64f3 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
> @@ -12,14 +12,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D67dcb7f=
ae16952557bc5f96e9eb5d188"
>
>  PROVIDES =3D "virtual/libsdl2"
>
> -DEPENDS =3D "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'direct=
fb', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/li=
bgl', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx1=
1 libxext libxrandr libxrender', '', d)} \
> -           tslib"
>  DEPENDS_class-nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x1=
1', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nati=
vesdk-libxext', '', d)}"
>
> -SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
> -       "
> +SRC_URI =3D "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
>
>  S =3D "${WORKDIR}/SDL2-${PV}"
>
> @@ -31,16 +26,30 @@ inherit autotools lib_package binconfig pkgconfig
>  EXTRA_OECONF =3D "--disable-oss --disable-esd --disable-arts \
>                  --disable-diskaudio --disable-nas --disable-esd-shared -=
-disable-esdtest \
>                  --disable-video-dummy \
> -                --enable-input-tslib --enable-pthreads \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', '--e=
nable-video-directfb', '--disable-video-directfb', d)} \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--ena=
ble-video-opengl', '--disable-video-opengl', d)} \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--enable=
-video-x11', '--disable-video-x11', d)} \
> +                --enable-pthreads \
>                  --enable-sdl-dlopen \
> -                --disable-rpath \
> -                --disable-pulseaudio"
> -
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'al=
sa', '', d)}"
> -PACKAGECONFIG[alsa] =3D "--enable-alsa --disable-alsatest,--disable-alsa=
,alsa-lib,"
> +                --disable-rpath"
> +
> +# opengl packageconfig factored out to make it easy for distros
> +# and BSP layers to pick either (desktop) opengl, gles2, or no GL
> +PACKAGECONFIG_GL ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl',=
 'opengl', '', d)}"
> +
> +PACKAGECONFIG ??=3D " \
> +    ${PACKAGECONFIG_GL} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', =
d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', =
'', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)=
} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> +"
> +PACKAGECONFIG[alsa]       =3D "--enable-alsa --disable-alsatest,--disabl=
e-alsa,alsa-lib,"
> +PACKAGECONFIG[directfb]   =3D "--enable-video-directfb --disable-video-d=
irectfb,directfb"
> +PACKAGECONFIG[gles2]      =3D "--enable-video-opengles,--disable-video-o=
pengles,virtual/libgles2"
> +PACKAGECONFIG[opengl]     =3D "--enable-video-opengl,--disable-video-ope=
ngl,virtual/libgl"
> +PACKAGECONFIG[pulseaudio] =3D "--enable-pulseaudio,--disable-pulseaudio,=
pulseaudio"
> +PACKAGECONFIG[tslib]      =3D "--enable-input-tslib,--disable-input-tsli=
b,tslib"
> +PACKAGECONFIG[wayland]    =3D "--enable-video-wayland,--disable-video-wa=
yland,wayland"
> +PACKAGECONFIG[x11]        =3D "--enable-video-x11,--disable-video-x11,vi=
rtual/libx11 libxext libxrandr libxrender"
>
>  EXTRA_AUTORECONF +=3D "--include=3Dacinclude --exclude=3Dautoheader"
>
> --
> 1.9.3
>
ping

