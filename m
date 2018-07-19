Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 92A1278A65
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 12:12:49 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id z13-v6so6159907wma.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 05:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Yk+LHlh4UKrFZwCDsG4R8FmhJGAdpGvivXmiFVh/Pos=;
	b=huIbW40/k2d9KH5H1HYrQh21uWaGidTHVWagz6fleLUi22rqqzrVdKzf8Yyj+HIxGo
	f2lRDYGGLd3rp7Dxi3i4M3Rl7iIPhVPD8+qX7UYwc0ZMC8i2q+c9fvLQGNKYP4w2EbH0
	YZxWopg/EW8PQR/XQwQwti2zZ5X/OcNfww5hWRYDIN3nVnWm/D+Tpvch7Hv9xIQBtUHa
	D24nQmKjLD08Ux3yQP1ith3/zgImgiOA4V8QoSeM4zySkf8+7FeCDToHW36UWP1wYuSA
	+wX3k/ljFUHo62bkxkgYVOKRXbFCfkLneEYh9o0XHSKb4cnXLbl7vb8v7WhJ5jNIo2wa
	Akng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Yk+LHlh4UKrFZwCDsG4R8FmhJGAdpGvivXmiFVh/Pos=;
	b=LlrjhahYni1wfARsVaN/f4MQLYmp/h75IqfDpqByLHyCa86DqAiBGr12uZ4rwiRGzb
	CUDBlgQmo1PdKfCBA0GHtNk6Psjz9wv7fPIqu3Igz+xRbu1dSUezSLwUe6MOl0XrPGEJ
	YRcVfjXhOheCxQBPWFFTvcEDVjfOA2ZZH/o98NUCm/jk9W5Y8XfBR0bY3YZlltV3cHGu
	hQOsEve3PkDEqElHkH/tIraEPmoc5AVxUo5gTuDYjnNEHl7Ex5JZUZHbteRB+yV1zNtZ
	b4zwO9U/Js/RdWkV6lHHmNb0Cllf9/P4EMGU6PYfD2H3U680FPeohVtDKUvygPW59+0A
	0lQw==
X-Gm-Message-State: AOUpUlHDGSbKZQHrWDb9ZV8M+MN+KdteWnHB0QfY39C8bPoR7uX/Oozs
	Mp7ejzlPDSjyn6bMpPe67jPPRHY+
X-Google-Smtp-Source: AAOMgpfS4qesEcK43qBkD8ByexK3NXoPC2OENbfOUA7p3JVHZQJw5nQBSUt/6toVVbZUD3iQ8rhIzg==
X-Received: by 2002:a1c:9b43:: with SMTP id
	d64-v6mr4146439wme.109.1532002369983; 
	Thu, 19 Jul 2018 05:12:49 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g10-v6sm7971782wru.43.2018.07.19.05.12.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 19 Jul 2018 05:12:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Jul 2018 14:12:52 +0200
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <20180719121252.GB1436@jama>
References: <20180719100714.9639-1-dv@pseudoterminal.org>
	<20180719110720.GA1436@jama>
	<1eb8494d-fb4b-1585-3502-4142548345a5@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <1eb8494d-fb4b-1585-3502-4142548345a5@pseudoterminal.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/6] gstreamer1.0-plugin-base: Update packageconfigs
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
X-List-Received-Date: Thu, 19 Jul 2018 12:12:50 -0000
X-Groupsio-MsgNum: 113685
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s/l3CgOIzMHHjg/5"
Content-Disposition: inline

--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 19, 2018 at 01:16:51PM +0200, Carlos Rafael Giani wrote:
> As a general rule, I think adding packageconfigs to an oe-core recipe=20
> that has dependencies outside of oe-core and meta-openembedded is=20
> questionable. Take the qt5 packageconfig for example. It is *not* part=20
> of gstreamer1.0-plugins-good in oe-core, and for good reason - it needs=
=20
> extra switches for passing paths to moc, uic etc.

I don't see what's questionable with that. PACKAGECONFIG is just a way
to pass configure options like EXTRA_OECONF just with benefit that it's
easily switched from outside and that it encapsulates build time and
runtime dependencies together with the options.

> Now, what if a recipe outside of oe-core and meta-openembedded is just=20
> like that? It needs its own customizations, its own switches. It would=20
> be better off setting up its own packageconfig, just like what that=20
> bbappend in meta-qt5 does.

If someone submits PACKAGECONFIG addition for something which only
exists in his own layer, I'm fine with that, why should we make it
harder for people to use oe-core or meta-oe recipes?

No I don't like that meta-qt5 has to use own bbappend for gstreamer,
it's necessary in this case because of the paths as you sad, but also
causes:
https://github.com/meta-qt5/meta-qt5/commit/73f99f2370a3dc5b81f42d0af7fe530=
431599454
which is quite annoying for meta-qt5 users, because this is one of very
few reasons why different meta-qt5 version isn't compatible with
different oe-core. So in order to use Qt 5.11 with oe-core from morty, I
need to BBMASK this bbappend and create the old one for
gstreamer1.0-plugins-bad in our project layer, it would be much nicer
and less error prone with PACKAGECONFIG directly in oe-core.

Also if you look at EXTRA_OECONF you'll see either --disable-qt twice or
--disable-qt followed by --enable-qt (when we depend on configure to let
the last option on command line win) which isn't ideal as well and might
confuse people looking at the log.do_configure.

> I suppose with libvisual such a central packageconfig would work, but=20
> isn't the whole idea of oe-core to be lean? And yet, now we start adding=
=20
> more and more packageconfigs even though the recipes are in some other=20
> layers that are not part of the central ones (oe-core and=20
> meta-openembedded)?

Yes it's supposed to be lean as in number of recipes it needs to carry,
not lean by number of lines (PACKAGECONFIG is 1 line exactly as the
--diable flag in EXTRA_OECONF) or lean in number of ways how people are
able to use it.

Why should meta-openembedded have special status for PACKAGECONFIGs
anyway, if you want to make it harder to customize the build, why stop
there?

> You might as well add dozens of packageconfigs to=20
> gstreamer1.0-plugins-bad, just in case some obscure layer adds a recipe=
=20
> for OpenEXR or spandsp for example.

Yes, that's exactly what I often do, last time e.g. with libdrm
http://git.openembedded.org/openembedded-core/commit/?id=3Ddc7d3b2ff79ae324=
b96a51ec1be557a432ed351d
and e.g. qemu before that, adding PACKAGECONFIG for dependencies which
I haven't submitted to meta-networking yet at that time:
http://git.openembedded.org/openembedded-core/commit/?id=3Debb6ef1dbc7e03a4=
b7030b3056bd0fa59fdd047b
and I haven't submitted the recipe for virglrenderer yet as well and
I don't see any issue with having the PACKAGECONFIG for it already.

Cheers,

> On 2018-07-19 13:07, Martin Jansa wrote:
> > On Thu, Jul 19, 2018 at 12:07:09PM +0200, Carlos Rafael Giani wrote:
> >> * Add patches for gbm, libpng, libjpeg to conditionally enable/disable
> >>    them in the configure script
> >> * There is no libvisual recipe in oe-core or in meta-openembedded, so
> >>    the visual packageconfig needs to go
> > No, it doesn't need to go and shouldn't.
> >
> > Why are you trying to force people who already have libvisual recipe
> > (maybe from one of these 2
> > layers: http://layers.openembedded.org/layerindex/branch/master/recipes=
/?q=3Dlibvisual )
> > to create gstreamer1.0-plugins-base bbappend just to return the
> > PACKAGECONFIG and remove the --disable-libvisual from EXTRA_OECONF?
> > It doesn't make any sense. Extra PACKAGECONFIGs for stuff you might not
> > use doesn't cause any extra overhead, yes they are less tested than the
> > stuff which people usually have enabled/disabled, but still having the
> > PACKAGECONFIG available makes it much easier for project layers to
> > correctly configure recipes in upstream layers.
> >
> >> * Reorder the packageconfigs alphabetically
> >>
> >> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> >> ---
> >>   ...r-explicitely-enabling-disabling-GBM.patch |  70 ++++++++++++
> >>   ...for-explicitely-enabling-disabling-P.patch | 107 ++++++++++++++++=
++
> >>   .../gstreamer1.0-plugins-base_1.14.1.bb       |  29 +++--
> >>   3 files changed, 196 insertions(+), 10 deletions(-)
> >>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-base/0010-gl-Add-switch-for-explicitely-enabling-disabling-GBM.patch
> >>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-pl=
ugins-base/0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch
> >>
> >> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ba=
se/0010-gl-Add-switch-for-explicitely-enabling-disabling-GBM.patch b/meta/r=
ecipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-gl-Add-switch-fo=
r-explicitely-enabling-disabling-GBM.patch
> >> new file mode 100644
> >> index 0000000000..79e0b78aaf
> >> --- /dev/null
> >> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010=
-gl-Add-switch-for-explicitely-enabling-disabling-GBM.patch
> >> @@ -0,0 +1,70 @@
> >> +From 7f93afc497010384da9f9d15163c31a862bd1dfa Mon Sep 17 00:00:00 2001
> >> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
> >> +Date: Thu, 19 Jul 2018 10:30:54 +0200
> >> +Subject: [PATCH 10/11] gl: Add switch for explicitely enabling/disabl=
ing GBM
> >> + support
> >> +
> >> +https://bugzilla.gnome.org/show_bug.cgi?id=3D796833
> >> +---
> >> + m4/gst-gl.m4 | 38 +++++++++++++++++++++++++++++---------
> >> + 1 file changed, 29 insertions(+), 9 deletions(-)
> >> +
> >> +diff --git a/m4/gst-gl.m4 b/m4/gst-gl.m4
> >> +index 1e9724094..20b2233de 100644
> >> +--- a/m4/gst-gl.m4
> >> ++++ b/m4/gst-gl.m4
> >> +@@ -117,6 +117,15 @@ AC_ARG_ENABLE([dispmanx],
> >> +        *) AC_MSG_ERROR([bad value ${enableval} for --enable-dispmanx=
]) ;;
> >> +      esac],[NEED_DISPMANX=3Dauto])
> >> +
> >> ++AC_ARG_ENABLE([gbm],
> >> ++     [  --enable-gbm        Enable Mesa3D GBM support (requires EGL)=
 @<:@default=3Dauto@:>@],
> >> ++     [case "${enableval}" in
> >> ++       yes)  NEED_GBM=3Dyes ;;
> >> ++       no)   NEED_GBM=3Dno ;;
> >> ++       auto) NEED_GBM=3Dauto ;;
> >> ++       *) AC_MSG_ERROR([bad value ${enableval} for --enable-gbm]) ;;
> >> ++     esac],[NEED_GBM=3Dauto])
> >> ++
> >> + AG_GST_PKG_CHECK_MODULES(X11_XCB, x11-xcb)
> >> + save_CPPFLAGS=3D"$CPPFLAGS"
> >> + save_LIBS=3D"$LIBS"
> >> +@@ -172,15 +181,26 @@ case $host in
> >> +         AC_CHECK_LIB([EGL], [fbGetDisplay], [HAVE_VIV_FB_EGL=3Dyes])
> >> +     fi
> >> +
> >> +-    if test "x$HAVE_EGL" =3D "xyes"; then
> >> +-        PKG_CHECK_MODULES(DRM, libdrm >=3D 2.4.55, HAVE_DRM=3Dyes, H=
AVE_DRM=3Dno)
> >> +-        AC_SUBST(DRM_CFLAGS)
> >> +-        AC_SUBST(DRM_LIBS)
> >> +-        if test "x$HAVE_DRM" =3D "xyes" -a "x$HAVE_GUDEV" =3D "xyes"=
; then
> >> +-          PKG_CHECK_MODULES(GBM, gbm, HAVE_GBM_EGL=3Dyes, HAVE_GBM_E=
GL=3Dno)
> >> +-          AC_SUBST(GBM_CFLAGS)
> >> +-          AC_SUBST(GBM_LIBS)
> >> +-       fi
> >> ++    if test "x$HAVE_EGL" =3D "xyes" -a "x$NEED_GBM" !=3D "xno"; then
> >> ++      PKG_CHECK_MODULES(DRM, libdrm >=3D 2.4.55, HAVE_DRM=3Dyes, HAV=
E_DRM=3Dno)
> >> ++      AC_SUBST(DRM_CFLAGS)
> >> ++      AC_SUBST(DRM_LIBS)
> >> ++      if test "x$NEED_GBM" =3D "xyes"; then
> >> ++        if test "x$HAVE_DRM" =3D "xno"; then
> >> ++          AC_MSG_ERROR([GBM support requested but libdrm is not avai=
lable])
> >> ++        fi
> >> ++        if test "x$HAVE_GUDEV" =3D "xno"; then
> >> ++          AC_MSG_ERROR([GBM support requested but gudev is not avail=
able])
> >> ++        fi
> >> ++      fi
> >> ++      if test "x$HAVE_DRM" =3D "xyes" -a "x$HAVE_GUDEV" =3D "xyes"; =
then
> >> ++        PKG_CHECK_MODULES(GBM, gbm, HAVE_GBM_EGL=3Dyes, HAVE_GBM_EGL=
=3Dno)
> >> ++        if test "x$HAVE_GBM_EGL" =3D "xno" -a "x$NEED_GBM" =3D "xyes=
"; then
> >> ++          AC_MSG_ERROR([GBM support requested but gbm library is not=
 available])
> >> ++        fi
> >> ++        AC_SUBST(GBM_CFLAGS)
> >> ++        AC_SUBST(GBM_LIBS)
> >> ++      fi
> >> +     fi
> >> +
> >> +     dnl FIXME: Mali EGL depends on GLESv1 or GLESv2
> >> +--
> >> +2.17.1
> >> +
> >> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ba=
se/0011-gl-Add-switches-for-explicitely-enabling-disabling-P.patch b/meta/r=
ecipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-gl-Add-switches-=
for-explicitely-enabling-disabling-P.patch
> >> new file mode 100644
> >> index 0000000000..3e22332dab
> >> --- /dev/null
> >> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011=
-gl-Add-switches-for-explicitely-enabling-disabling-P.patch
> >> @@ -0,0 +1,107 @@
> >> +From 092aadfc1df69c46d920b0cd39f98d363d6988b3 Mon Sep 17 00:00:00 2001
> >> +From: Carlos Rafael Giani <dv@pseudoterminal.org>
> >> +Date: Thu, 19 Jul 2018 11:16:05 +0200
> >> +Subject: [PATCH 11/11] gl: Add switches for explicitely enabling/disa=
bling PNG
> >> + and JPEG support
> >> +
> >> +https://bugzilla.gnome.org/show_bug.cgi?id=3D796833
> >> +---
> >> + m4/gst-gl.m4 | 66 ++++++++++++++++++++++++++++++++++++--------------=
--
> >> + 1 file changed, 46 insertions(+), 20 deletions(-)
> >> +
> >> +diff --git a/m4/gst-gl.m4 b/m4/gst-gl.m4
> >> +index 20b2233de..f8809981c 100644
> >> +--- a/m4/gst-gl.m4
> >> ++++ b/m4/gst-gl.m4
> >> +@@ -126,6 +126,24 @@ AC_ARG_ENABLE([gbm],
> >> +        *) AC_MSG_ERROR([bad value ${enableval} for --enable-gbm]) ;;
> >> +      esac],[NEED_GBM=3Dauto])
> >> +
> >> ++AC_ARG_ENABLE([png],
> >> ++     [  --enable-png        Enable libpng support @<:@default=3Dauto=
@:>@],
> >> ++     [case "${enableval}" in
> >> ++       yes)  NEED_PNG=3Dyes ;;
> >> ++       no)   NEED_PNG=3Dno ;;
> >> ++       auto) NEED_PNG=3Dauto ;;
> >> ++       *) AC_MSG_ERROR([bad value ${enableval} for --enable-png]) ;;
> >> ++     esac],[NEED_PNG=3Dauto])
> >> ++
> >> ++AC_ARG_ENABLE([jpeg],
> >> ++     [  --enable-jpeg        Enable libjpeg support @<:@default=3Dau=
to@:>@],
> >> ++     [case "${enableval}" in
> >> ++       yes)  NEED_JPEG=3Dyes ;;
> >> ++       no)   NEED_JPEG=3Dno ;;
> >> ++       auto) NEED_JPEG=3Dauto ;;
> >> ++       *) AC_MSG_ERROR([bad value ${enableval} for --enable-jpeg]) ;;
> >> ++     esac],[NEED_JPEG=3Dauto])
> >> ++
> >> + AG_GST_PKG_CHECK_MODULES(X11_XCB, x11-xcb)
> >> + save_CPPFLAGS=3D"$CPPFLAGS"
> >> + save_LIBS=3D"$LIBS"
> >> +@@ -1043,9 +1061,13 @@ dnl Needed by plugins that use g_module_*() API
> >> + PKG_CHECK_MODULES(GMODULE_NO_EXPORT, gmodule-no-export-2.0)
> >> +
> >> + dnl libpng is optional
> >> +-PKG_CHECK_MODULES(LIBPNG, libpng >=3D 1.0, HAVE_PNG=3Dyes, HAVE_PNG=
=3Dno)
> >> +-if test "x$HAVE_PNG" =3D "xyes"; then
> >> +-  AC_DEFINE(HAVE_PNG, [1] , [Use libpng])
> >> ++if test "x$NEED_PNG" !=3D "xno"; then
> >> ++  PKG_CHECK_MODULES(LIBPNG, libpng >=3D 1.0, HAVE_PNG=3Dyes, HAVE_PN=
G=3Dno)
> >> ++  if test "x$HAVE_PNG" =3D "xyes"; then
> >> ++    AC_DEFINE(HAVE_PNG, [1] , [Use libpng])
> >> ++  elif test "x$NEED_PNG" =3D "xyes"; then
> >> ++    AC_MSG_ERROR([libpng support requested but libpng is not availab=
le])
> >> ++  fi
> >> + fi
> >> + AC_SUBST(HAVE_PNG)
> >> + AC_SUBST(LIBPNG_LIBS)
> >> +@@ -1053,25 +1075,29 @@ AC_SUBST(LIBPNG_CFLAGS)
> >> +
> >> + dnl libjpeg is optional
> >> + AC_ARG_WITH(jpeg-mmx, [  --with-jpeg-mmx, path to MMX'ified JPEG lib=
rary])
> >> +-OLD_LIBS=3D"$LIBS"
> >> +-if test x$with_jpeg_mmx !=3D x; then
> >> +-  LIBS=3D"$LIBS -L$with_jpeg_mmx"
> >> +-fi
> >> +-AC_CHECK_LIB(jpeg-mmx, jpeg_set_defaults, HAVE_JPEG=3D"yes", HAVE_JP=
EG=3D"no")
> >> +-JPEG_LIBS=3D"$LIBS -ljpeg-mmx"
> >> +-LIBS=3D"$OLD_LIBS"
> >> +-if test x$HAVE_JPEG !=3D xyes; then
> >> +-  JPEG_LIBS=3D"-ljpeg"
> >> +-  AC_CHECK_LIB(jpeg, jpeg_set_defaults, HAVE_JPEG=3D"yes", HAVE_JPEG=
=3D"no")
> >> +-fi
> >> ++if test "x$NEED_JPEG" !=3D "xno"; then
> >> ++  OLD_LIBS=3D"$LIBS"
> >> ++  if test x$with_jpeg_mmx !=3D x; then
> >> ++    LIBS=3D"$LIBS -L$with_jpeg_mmx"
> >> ++  fi
> >> ++  AC_CHECK_LIB(jpeg-mmx, jpeg_set_defaults, HAVE_JPEG=3D"yes", HAVE_=
JPEG=3D"no")
> >> ++  JPEG_LIBS=3D"$LIBS -ljpeg-mmx"
> >> ++  LIBS=3D"$OLD_LIBS"
> >> ++  if test x$HAVE_JPEG !=3D xyes; then
> >> ++    JPEG_LIBS=3D"-ljpeg"
> >> ++    AC_CHECK_LIB(jpeg, jpeg_set_defaults, HAVE_JPEG=3D"yes", HAVE_JP=
EG=3D"no")
> >> ++  fi
> >> +
> >> +-if test x$HAVE_JPEG =3D xyes; then
> >> +-  AC_DEFINE(HAVE_JPEG, [1], [Use libjpeg])
> >> +-else
> >> +-  JPEG_LIBS=3D
> >> ++  if test x$HAVE_JPEG =3D xyes; then
> >> ++    AC_DEFINE(HAVE_JPEG, [1], [Use libjpeg])
> >> ++  elif test "x$NEED_JPEG" =3D "xyes"; then
> >> ++    AC_MSG_ERROR([libjpeg support requested but libjpeg is not avail=
able])
> >> ++  else
> >> ++    JPEG_LIBS=3D
> >> ++  fi
> >> ++  AC_SUBST(JPEG_LIBS)
> >> ++  AC_SUBST(HAVE_JPEG)
> >> + fi
> >> +-AC_SUBST(JPEG_LIBS)
> >> +-AC_SUBST(HAVE_JPEG)
> >> + ])
> >> +
> >> + dnl ----------------------------------------------------------------=
----------
> >> +--
> >> +2.17.1
> >> +
> >> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ba=
se_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_=
1.14.1.bb
> >> index 8d7d3c6192..a848fa0e01 100644
> >> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14=
=2E1.bb
> >> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.14=
=2E1.bb
> >> @@ -17,6 +17,8 @@ SRC_URI =3D " \
> >>               file://0004-rtsp-drop-incorrect-reference-to-gstreamer-s=
dp-in-Ma.patch \
> >>               file://0009-glimagesink-Downrank-to-marginal.patch \
> >>               file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to=
-CFLAGS.patch \
> >> +            file://0010-gl-Add-switch-for-explicitely-enabling-disabl=
ing-GBM.patch \
> >> +            file://0011-gl-Add-switches-for-explicitely-enabling-disa=
bling-P.patch \
> >>               file://link-with-libvchostif.patch \
> >>               "
> >>   SRC_URI[md5sum] =3D "c42154ab6f85c59f0e449d8d7e290342"
> >> @@ -30,12 +32,15 @@ inherit gettext
> >>  =20
> >>   PACKAGES_DYNAMIC =3D+ "^libgst.*"
> >>  =20
> >> +# opengl packageconfig factored out to make it easy for distros
> >> +# and BSP layers to pick either (desktop) opengl, gles2, or no GL
> >>   PACKAGECONFIG_GL ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'open=
gl', 'gles2 egl', '', d)}"
> >> +
> >>   PACKAGECONFIG ??=3D " \
> >>       ${GSTREAMER_ORC} \
> >> -    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa x11', d)} \
> >> -    gio-unix-2.0 ogg pango theora vorbis zlib jpeg \
> >>       ${PACKAGECONFIG_GL} \
> >> +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa x11', d)} \
> >> +    gio-unix-2.0 jpeg ogg pango png theora vorbis zlib \
> >>       ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland egl'=
, '', d)} \
> >>   "
> >>  =20
> >> @@ -45,26 +50,30 @@ X11DISABLEOPTS =3D "--disable-x --disable-xvideo -=
-disable-xshm"
> >>  =20
> >>   PACKAGECONFIG[alsa]         =3D "--enable-alsa,--disable-alsa,alsa-l=
ib"
> >>   PACKAGECONFIG[cdparanoia]   =3D "--enable-cdparanoia,--disable-cdpar=
anoia,cdparanoia"
> >> +PACKAGECONFIG[egl]          =3D "--enable-egl,--disable-egl,virtual/e=
gl"
> >> +PACKAGECONFIG[gbm]          =3D "--enable-gbm,--disable-gbm,virtual/l=
ibgbm libgudev libdrm"
> >>   PACKAGECONFIG[gio-unix-2.0] =3D "--enable-gio_unix_2_0,--disable-gio=
_unix_2_0,glib-2.0"
> >> +PACKAGECONFIG[gles2]        =3D "--enable-gles2,--disable-gles2,virtu=
al/libgles2"
> >>   PACKAGECONFIG[ivorbis]      =3D "--enable-ivorbis,--disable-ivorbis,=
tremor"
> >> +PACKAGECONFIG[jpeg]         =3D "--enable-jpeg,--disable-jpeg,jpeg"
> >>   PACKAGECONFIG[ogg]          =3D "--enable-ogg,--disable-ogg,libogg"
> >> +PACKAGECONFIG[opengl]       =3D "--enable-opengl,--disable-opengl,vir=
tual/libgl libglu"
> >>   PACKAGECONFIG[opus]         =3D "--enable-opus,--disable-opus,libopu=
s"
> >>   PACKAGECONFIG[pango]        =3D "--enable-pango,--disable-pango,pang=
o"
> >> +PACKAGECONFIG[png]          =3D "--enable-png,--disable-png,libpng"
> >>   PACKAGECONFIG[theora]       =3D "--enable-theora,--disable-theora,li=
btheora"
> >> -PACKAGECONFIG[visual]       =3D "--enable-libvisual,--disable-libvisu=
al,libvisual"
> >>   PACKAGECONFIG[vorbis]       =3D "--enable-vorbis,--disable-vorbis,li=
bvorbis"
> >>   PACKAGECONFIG[x11]          =3D "${X11ENABLEOPTS},${X11DISABLEOPTS},=
${X11DEPENDS}"
> >> -PACKAGECONFIG[zlib]         =3D "--enable-zlib,--disable-zlib,zlib"
> >> -PACKAGECONFIG[opengl]       =3D "--enable-opengl,--disable-opengl,vir=
tual/libgl libglu"
> >> -PACKAGECONFIG[gles2]        =3D "--enable-gles2,--disable-gles2,virtu=
al/libgles2"
> >> -PACKAGECONFIG[egl]          =3D "--enable-egl,--disable-egl,virtual/e=
gl"
> >>   PACKAGECONFIG[wayland]      =3D "--enable-wayland,--disable-wayland,=
wayland-native wayland wayland-protocols libdrm"
> >> -PACKAGECONFIG[jpeg]         =3D ",,jpeg"
> >> +PACKAGECONFIG[zlib]         =3D "--enable-zlib,--disable-zlib,zlib"
> >> +
> >> +EXTRA_OECONF +=3D " \
> >> +    --disable-libvisual \
> >> +"
> >>  =20
> >> +FILES_${PN}-dev +=3D "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstg=
lconfig.h"
> >>   FILES_${MLPREFIX}libgsttag-1.0 +=3D "${datadir}/gst-plugins-base/1.0=
/license-translations.dict"
> >>  =20
> >>   do_compile_prepend() {
> >>           export GIR_EXTRA_LIBS_PATH=3D"${B}/gst-libs/gst/tag/.libs:${=
B}/gst-libs/gst/video/.libs:${B}/gst-libs/gst/audio/.libs:${B}/gst-libs/gst=
/rtp/.libs:${B}/gst-libs/gst/allocators/.libs"
> >>   }
> >> -
> >> -FILES_${PN}-dev +=3D "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstg=
lconfig.h"
> >> --=20
> >> 2.17.1
> >>
> >> --=20
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW1CAQwAKCRA3VSO3ZXaA
HLU2AJ9pEKYXkP30Uj+UmVNOylhRpRS8DwCbBdavSKNeekrmUO08o2QICLCePs8=
=VTT9
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
