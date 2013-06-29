Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id ED15D6A413
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 10:45:34 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id y10so2377921wgg.20
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 03:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nb4H8dtclcE9D+/lHVOr4hV+G5uR5jk2xKbJg6a0MAs=;
	b=Y37ysIzpeCFanNBpxpZBkl3qdjhJQ+yDyG0UD/37AqPPPoKQYwIWe7EvPN3YxnQuoz
	CkdTH1Xchf+Mm2ok/W6Y5ex1N9joSkyMdQfKq3TbXWQ98QxnQ0QR1yhdXPO90SZSgdzB
	20mPjyPXIMqfALXxeB48jXTLlYDydLSobQp7ffThYknHWye8v/XLR6XG+YDT1FERgRyB
	eSKp+gWxHMsgsYfeitrSl48bycD6d42cu1ch0/at40ZkIVjPBykUcv/1zuoEsMNHMuOA
	5+ZsAJlMldSwwL+ZWSuA7YQx1OHd3pzooK8O03eRAp9++bhg1+Df8V+Em4+BoT8iFP4X
	k/TA==
X-Received: by 10.180.21.147 with SMTP id v19mr5839645wie.25.1372502735143;
	Sat, 29 Jun 2013 03:45:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n45sm16312193eew.1.2013.06.29.03.45.33 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 29 Jun 2013 03:45:34 -0700 (PDT)
Date: Sat, 29 Jun 2013 12:46:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130629104614.GR3261@jama>
References: <1372174723-24943-1-git-send-email-nicolas.dechesne@linaro.org>
	<20130627180228.GI3261@jama>
	<CAJTo0Laa3ed2qVqbAsMUmnEmispMprkyJJmKr9sTt3XO_7c_vw@mail.gmail.com>
	<CA+chaQfOeZGc5bXe=FemuADt5L5AJth4JnofrjrEcKaLHh1EDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQfOeZGc5bXe=FemuADt5L5AJth4JnofrjrEcKaLHh1EDA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"patches@linaro.org" <patches@linaro.org>
Subject: Re: [dylan][PATCH] mesa: fix EGL compilation without X11 headers
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
X-List-Received-Date: Sat, 29 Jun 2013 10:45:35 -0000
X-Groupsio-MsgNum: 41193
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eBTWNsZZiigckDWV"
Content-Disposition: inline

--eBTWNsZZiigckDWV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2013 at 11:11:20PM +0200, Martin Jansa wrote:
> Almost all of them :)
>=20
> PACKAGECONFIG =3D "egl gles dri wayland gallium gallium-llvmpipe openvg"

I've updated
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/mesa

http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/mes=
a&id=3Db141f10bbd59c38419c25f6aa88b6fd293d981ae
should fix the issue with state_tracker/xlib_sw_winsys.h

I'll send this patchset to master after few more tests.

> On Thu, Jun 27, 2013 at 11:00 PM, Burton, Ross <ross.burton@intel.com>wro=
te:
>=20
> > I'm actively fixing this upstream now, so I will make sure this is sort=
ed.
> >  What PACKAGECONFIG are you using?
> >
> > Ross
> >
> >
> > On Thursday, 27 June 2013, Martin Jansa wrote:
> >
> >> On Tue, Jun 25, 2013 at 05:38:43PM +0200, Nicolas Dechesne wrote:
> >> > Extracted from "d7033f4 mesa: upgrade to 9.1.3", already merged in
> >> master:
> >> >
> >> > --
> >> > Add EGL-Mutate-NativeDisplayType-depending-on-config.patch to build
> >> correctly in
> >> > a non-X11 environment.
> >> >
> >> > Drop fix-egl-compilation-without-x11-headers.patch as they were
> >> backports.
> >> > --
> >> >
> >> > The new patch was also backported (trivial) to mesa 9.0.2 which is in
> >> > dylan.
> >> >
> >> > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> >> > ---
> >> >  meta/recipes-graphics/mesa/mesa-9.0.2.inc          |   2 +-
> >> >  ...ate-NativeDisplayType-depending-on-config.patch | 361
> >> +++++++++++++++++++++
> >> >  2 files changed, 362 insertions(+), 1 deletion(-)
> >> >  create mode 100644
> >> meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending=
-on-config.patch
> >> >
> >> > diff --git a/meta/recipes-graphics/mesa/mesa-9.0.2.inc
> >> b/meta/recipes-graphics/mesa/mesa-9.0.2.inc
> >> > index b88bc42..e2dcfdb 100644
> >> > --- a/meta/recipes-graphics/mesa/mesa-9.0.2.inc
> >> > +++ b/meta/recipes-graphics/mesa/mesa-9.0.2.inc
> >> > @@ -2,7 +2,7 @@ SRC_URI =3D "
> >> ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
> >> >             file://0002-cross-compile.patch \
> >> >             file://cross-glsl.patch \
> >> >             file://dont-fail-if-libX11-isnt-installed.patch \
> >> > -           file://fix-egl-compilation-without-x11-headers.patch \
> >> > +
> >> file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \
> >> >             "
> >>
> >> EGL-Mutate-NativeDisplayType-depending-on-config.patch does not cover
> >>
> >> #include "state_tracker/xlib_sw_winsys.h"
> >> in
> >> src/gallium/auxiliary/pipe-loader/pipe_loader_sw.c
> >>
> >> so builds with pipe-loader enabled and without x11 headers are still
> >> failing, the same issue is in master.
> >>
> >> >  SRC_URI[md5sum] =3D "dc45d1192203e418163e0017640e1cfc"
> >> > diff --git
> >> a/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-dependi=
ng-on-config.patch
> >> b/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-dependi=
ng-on-config.patch
> >> > new file mode 100644
> >> > index 0000000..98c4095
> >> > --- /dev/null
> >> > +++
> >> b/meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-dependi=
ng-on-config.patch
> >> > @@ -0,0 +1,361 @@
> >> > +From 7e5846aa52c7cb00b0db9fa393975880371d2620 Mon Sep 17 00:00:00 2=
001
> >> > +From: Daniel Stone <daniel@fooishbar.org>
> >> > +Date: Fri, 24 May 2013 17:20:27 +0100
> >> > +Subject: [PATCH] EGL: Mutate NativeDisplayType depending on config
> >> > +
> >> > +If we go through ./configure without enabling X11 anywhere, then set
> >> the
> >> > +fallback types for EGL NativeDisplay and friends, rather than assum=
ing
> >> > +X11/Xlib.
> >> > +
> >> > +Signed-off-by: Daniel Stone <daniel@fooishbar.org>
> >> > +
> >> > +Conflicts:
> >> > +     configure.ac
> >> > +---
> >> > + configure.ac                 |   9 +++
> >> > + include/EGL/eglplatform.h    | 146
> >> -------------------------------------------
> >> > + include/EGL/eglplatform.h.in | 146
> >> +++++++++++++++++++++++++++++++++++++++++++
> >> > + 3 files changed, 155 insertions(+), 146 deletions(-)
> >> > + delete mode 100644 include/EGL/eglplatform.h
> >> > + create mode 100644 include/EGL/eglplatform.h.in
> >> > +
> >> > +diff --git a/configure.ac b/configure.ac
> >> > +index 682e0a5..a8a485d 100644
> >> > +--- a/configure.ac
> >> > ++++ b/configure.ac
> >> > +@@ -1577,12 +1577,20 @@ fi
> >> > +
> >> > + EGL_PLATFORMS=3D"$egl_platforms"
> >> > +
> >> > ++if echo "$egl_platforms" | grep 'x11' >/dev/null 2>&1; then
> >> > ++    MESA_EGL_NO_X11_HEADERS=3D0
> >> > ++else
> >> > ++    MESA_EGL_NO_X11_HEADERS=3D1
> >> > ++fi
> >> > ++
> >> > + AM_CONDITIONAL(HAVE_EGL_PLATFORM_X11, echo "$egl_platforms" | grep
> >> 'x11' >/dev/null 2>&1)
> >> > + AM_CONDITIONAL(HAVE_EGL_PLATFORM_WAYLAND, echo "$egl_platforms" |
> >> grep 'wayland' >/dev/null 2>&1)
> >> > + AM_CONDITIONAL(HAVE_EGL_PLATFORM_DRM, echo "$egl_platforms" | grep
> >> 'drm' >/dev/null 2>&1)
> >> > + AM_CONDITIONAL(HAVE_EGL_PLATFORM_FBDEV, echo "$egl_platforms" | gr=
ep
> >> 'fbdev' >/dev/null 2>&1)
> >> > + AM_CONDITIONAL(HAVE_EGL_PLATFORM_NULL, echo "$egl_platforms" | grep
> >> 'null' >/dev/null 2>&1)
> >> > +
> >> > ++AC_SUBST([MESA_EGL_NO_X11_HEADERS])
> >> > ++
> >> > + AM_CONDITIONAL(HAVE_EGL_DRIVER_DRI2, test "x$HAVE_EGL_DRIVER_DRI2"=
 !=3D
> >> "x")
> >> > + AM_CONDITIONAL(HAVE_EGL_DRIVER_GLX, test "x$HAVE_EGL_DRIVER_GLX" !=
=3D
> >> "x")
> >> > +
> >> > +@@ -1953,6 +1961,7 @@ CXXFLAGS=3D"$CXXFLAGS $USER_CXXFLAGS"
> >> > + dnl Substitute the config
> >> > + AC_CONFIG_FILES([configs/current
> >> > +             Makefile
> >> > ++            include/EGL/eglplatform.h
> >> > +             src/egl/Makefile
> >> > +             src/egl/drivers/Makefile
> >> > +             src/egl/drivers/dri2/Makefile
> >> > +diff --git a/include/EGL/eglplatform.h b/include/EGL/eglplatform.h
> >> > +deleted file mode 100644
> >> > +index 17fdc61..0000000
> >> > +--- a/include/EGL/eglplatform.h
> >> > ++++ /dev/null
> >> > +@@ -1,146 +0,0 @@
> >> > +-#ifndef __eglplatform_h_
> >> > +-#define __eglplatform_h_
> >> > +-
> >> > +-/*
> >> > +-** Copyright (c) 2007-2009 The Khronos Group Inc.
> >> > +-**
> >> > +-** Permission is hereby granted, free of charge, to any person
> >> obtaining a
> >> > +-** copy of this software and/or associated documentation files (the
> >> > +-** "Materials"), to deal in the Materials without restriction,
> >> including
> >> > +-** without limitation the rights t--
> >>
> >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >>
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eBTWNsZZiigckDWV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHOuvYACgkQN1Ujt2V2gBzAUACgifQ/dmvu5nvNIhr7iaj0433r
riwAnjaNpuqCtfXNVKBH+xZlWyw3ILHt
=GDhf
-----END PGP SIGNATURE-----

--eBTWNsZZiigckDWV--
