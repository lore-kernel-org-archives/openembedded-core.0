Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1REV3a-0006re-Se
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 01:51:23 +0200
Received: by pzd13 with SMTP id 13so4017526pzd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 16:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=kf7X1ovvP8V8Dhj7YcYMrZ88E+CTPK1rkSf5gawCL7U=;
	b=xhDWdw6cXFErqMmqHwK+BGE8kbSwR8e3asbT7epxQsF1qSd3bE33RiH7N3fmacIgNk
	fG05YQHrXy7IJFiDL7a6fiA7HyrnDNYd/WUwl6VMXSzswT4Z96wiyrL/AAoX0blUBzKk
	cLT3W32efdCRQp2skfIv6u0l29yFmnwMh9tOk=
Received: by 10.68.17.225 with SMTP id r1mr12540012pbd.64.1318549536072; Thu,
	13 Oct 2011 16:45:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 13 Oct 2011 16:45:06 -0700 (PDT)
In-Reply-To: <6c75399b6bd39f4eafaf4b4964cab9e3273dd7a2.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
	<bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
	<6c75399b6bd39f4eafaf4b4964cab9e3273dd7a2.1318505196.git.Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Oct 2011 16:45:06 -0700
Message-ID: <CAMKF1sozmZ-meS18DmRejQppG9pSpvxkTosodibbcf38z6OK2w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core 07/20] mesa-common: MesaDemos is now separate recipes, bump PE, introduce INC_PR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2011 23:51:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 4:30 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =C2=A0meta/recipes-graphics/mesa/mesa-common.inc =C2=A0 | =C2=A0 =C2=A05 =
+++--
> =C2=A0meta/recipes-graphics/mesa/mesa-dri_7.11.bb =C2=A0| =C2=A0 =C2=A02 =
+-
> =C2=A0meta/recipes-graphics/mesa/mesa-dri_git.bb =C2=A0 | =C2=A0 =C2=A02 =
+-
> =C2=A0meta/recipes-graphics/mesa/mesa-xlib_7.11.bb | =C2=A0 =C2=A03 +--
> =C2=A04 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-gr=
aphics/mesa/mesa-common.inc
> index fb9a216..ee359ba 100644
> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> @@ -12,9 +12,10 @@ SECTION =3D "x11"
> =C2=A0LICENSE =3D "MIT"
> =C2=A0LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3D7a3373c039b6b9=
25c427755a4f779c1d"
>
> -SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.=
bz2;name=3Dmesalib \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ftp://ftp.freedesktop.org/pub/mesa/$=
{PV}/MesaDemos-${PV}.tar.bz2;name=3Dmesademos "
> +INC_PR =3D "r12"
> +PE =3D "2"

Do u really need PE ?

>
> +SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.=
bz2"
> =C2=A0S =3D "${WORKDIR}/Mesa-${PV}"
>
> =C2=A0PROVIDES =3D "virtual/libgl"
> diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-g=
raphics/mesa/mesa-dri_7.11.bb
> index 5f15091..5f14346 100644
> --- a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
> +++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
> @@ -7,7 +7,7 @@ LIB_DEPS =3D "libdrm virtual/libx11 libxext libxxf86vm li=
bxdamage libxfixes expat
> =C2=A0DEPENDS =3D "${PROTO_DEPS} =C2=A0${LIB_DEPS} makedepend-native pyth=
on-native"
> =C2=A0DEPENDS +=3D "mesa-dri-glsl-native"
>
> -PR =3D "r5"
> +PR =3D "${INC_PR}.0"
>
> =C2=A0SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}=
.tar.bz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://crossfix.patch \
> diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-gr=
aphics/mesa/mesa-dri_git.bb
> index 9e32d0a..c50ba15 100644
> --- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
> +++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
> @@ -13,7 +13,7 @@ DEPENDS =3D "${PROTO_DEPS} =C2=A0${LIB_DEPS}"
>
> =C2=A0SRCREV =3D "1bf94d419805538ac23a4d0b04d31ac5e4487aca"
> =C2=A0PV =3D "7.7+git${SRCPV}"
> -PR =3D "r2"
> +PR =3D "${INC_PR}.0"
>
> =C2=A0# most of our targets do not have DRI so will use mesa-xlib
> =C2=A0DEFAULT_PREFERENCE =3D "-1"
> diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb b/meta/recipes-=
graphics/mesa/mesa-xlib_7.11.bb
> index 8b83378..1e0d821 100644
> --- a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
> +++ b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
> @@ -12,8 +12,7 @@ LIB_DEPS =3D "virtual/libx11 libxext libxxf86vm libxdam=
age libxfixes libxml2-nativ
>
> =C2=A0DEPENDS =3D "${PROTO_DEPS} =C2=A0${LIB_DEPS} makedepend-native"
>
> -PE =3D "1"
> -PR =3D "r1"
> +PR =3D "${INC_PR}.0"
>
> =C2=A0EXTRA_OECONF +=3D "--with-driver=3Dxlib --without-gallium-drivers"
>
> --
> 1.7.7
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


