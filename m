Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E08FD88FF
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 09:02:59 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16441.1773219774891471752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 02:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=abv7u4wb;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3129E4E42606;
	Wed, 11 Mar 2026 09:02:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 085F360004;
	Wed, 11 Mar 2026 09:02:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92E381036991E;
	Wed, 11 Mar 2026 10:02:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773219771; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e6xFnVM4/wfmYoHGMmfmS7afW6TUjHRrvu+ejpJwFMI=;
	b=abv7u4wbHKLMIN4MXyu2jzF/v8xRrhNHesm6d3Vpm6YGJt5bFvuxgD6eYpnsV69q99XRWR
	/CWIkwJaxNRHqADYV+ANGu3oBX91H65cPZpUq44c3yWzp6UPX2++2jrBxfdSa7lhRfAAc4
	cRs//E4/80i5t9O2/6emY4suFHVz+Rrc/AdHe2kvM6hz3fYmXHC4LlYNvsAz8CUxwACZ0D
	el79qKkNm5d5dhs2loOpgFvTphEwLIkV7aXifeYDO2DPv+tUVaE1BWNfici+GWnbdOSemC
	3cZhzaRGICoWGkkDVxR5QwUtJ+//Q4BMXmCcuo7gKUYWUvl3aUjYF4P3r4DKKA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 10:02:49 +0100
Message-Id: <DGZTY4EQE4LV.DCINR32UPHUC@bootlin.com>
Cc: <ross.burton@arm.com>, "openembedded-core"
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Yogesh Tyagi" <yogesh.tyagi@intel.com>
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0-vaapi: remove recipe
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260310150155.1692111-1-ross.burton@arm.com>
In-Reply-To: <20260310150155.1692111-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 09:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232844

On Tue Mar 10, 2026 at 4:01 PM CET, Ross Burton via lists.openembedded.org =
wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> gstreamer-vappi has been removed in favour of the va plugin and is no lon=
ger
> updated going forward.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 -
>  .../gstreamer/gstreamer1.0-vaapi_1.26.9.bb    | 53 -------------------
>  2 files changed, 54 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_=
1.26.9.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 3c7fc4974de..c7a646a643e 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -261,7 +261,6 @@ RECIPE_MAINTAINER:pn-gstreamer1.0-plugins-good =3D "U=
nassigned <unassigned@yoctopr
>  RECIPE_MAINTAINER:pn-gstreamer1.0-plugins-ugly =3D "Unassigned <unassign=
ed@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-gstreamer1.0-python =3D "Unassigned <unassigned@yoc=
toproject.org>"
>  RECIPE_MAINTAINER:pn-gstreamer1.0-rtsp-server =3D "Unassigned <unassigne=
d@yoctoproject.org>"
> -RECIPE_MAINTAINER:pn-gstreamer1.0-vaapi =3D "Unassigned <unassigned@yoct=
oproject.org>"
>  RECIPE_MAINTAINER:pn-gtk+3 =3D "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-gtk-doc =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-gtk4 =3D "Markus Volk <f_l_k@t-online.de>"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.=
bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
> deleted file mode 100644
> index dc5055bb0c7..00000000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -SUMMARY =3D "VA-API support to GStreamer"
> -HOMEPAGE =3D "https://gstreamer.freedesktop.org/"
> -DESCRIPTION =3D "gstreamer-vaapi consists of a collection of VA-API \
> -based plugins for GStreamer and helper libraries: `vaapidecode', \
> -`vaapiconvert', and `vaapisink'."
> -
> -REALPN =3D "gstreamer-vaapi"
> -
> -LICENSE =3D "LGPL-2.1-or-later"
> -LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b=
364516c"
> -
> -SRC_URI =3D "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-$=
{PV}.tar.xz"
> -
> -SRC_URI[sha256sum] =3D "bf989040404515dc9b042f4fdc49ff33a6dccf49d5447361=
50e967b42665598e"
> -
> -S =3D "${UNPACKDIR}/${REALPN}-${PV}"
> -DEPENDS =3D "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-p=
lugins-bad"
> -
> -inherit meson pkgconfig features_check upstream-version-is-even
> -
> -REQUIRED_DISTRO_FEATURES ?=3D "opengl"
> -
> -EXTRA_OEMESON +=3D " \
> -    -Ddoc=3Ddisabled \
> -    -Dexamples=3Ddisabled \
> -    -Dtests=3Denabled \
> -"
> -
> -PACKAGES =3D+ "${PN}-tests"
> -
> -# OpenGL packageconfig factored out to make it easy for distros
> -# and BSP layers to pick either glx, egl, or no GL. By default,
> -# try detecting X11 first, and if found (with OpenGL), use GLX,
> -# otherwise try to check if EGL can be used.
> -PACKAGECONFIG_GL ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11 open=
gl', 'glx', \
> -                        bb.utils.contains('DISTRO_FEATURES',     'opengl=
', 'egl', \
> -                                                                       '=
', d), d)}"
> -
> -PACKAGECONFIG ??=3D "drm encoders \
> -                   ${PACKAGECONFIG_GL} \
> -                   ${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', =
d)}"
> -
> -PACKAGECONFIG[drm] =3D "-Ddrm=3Denabled,-Ddrm=3Ddisabled,udev libdrm"
> -PACKAGECONFIG[egl] =3D "-Degl=3Denabled,-Degl=3Ddisabled,virtual/egl"
> -PACKAGECONFIG[encoders] =3D "-Dencoders=3Denabled,-Dencoders=3Ddisabled"
> -PACKAGECONFIG[glx] =3D "-Dglx=3Denabled,-Dglx=3Ddisabled,virtual/libgl"
> -PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled,-Dwayland=3Ddisabled,way=
land-native wayland wayland-protocols"
> -PACKAGECONFIG[x11] =3D "-Dx11=3Denabled,-Dx11=3Ddisabled,virtual/libx11 =
libxrandr libxrender"
> -
> -FILES:${PN} +=3D "${libdir}/gstreamer-*/*.so"
> -FILES:${PN}-dbg +=3D "${libdir}/gstreamer-*/.debug"
> -FILES:${PN}-dev +=3D "${libdir}/gstreamer-*/*.a"
> -FILES:${PN}-tests =3D "${bindir}/*"

Hi Yogesh,

Just a quick note: this patch will break some meta-intel builds. Once
merged, it will require some changes on your side:

ERROR: Nothing RPROVIDES 'gstreamer1.0-vaapi' (but /srv/pokybuild/yocto-wor=
ker/meta-intel/build/layers/openembedded-core/meta/recipes-sato/images/core=
-image-sato.bb, /srv/pokybuild/yocto-worker/meta-intel/build/layers/openemb=
edded-core/meta/recipes-sato/images/core-image-sato-sdk.bb RDEPENDS on or o=
therwise requires it)
NOTE: Runtime target 'gstreamer1.0-vaapi' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gstreamer1.0-vaapi']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/41/builds/3175

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


