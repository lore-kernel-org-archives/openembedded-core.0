Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5ECC879321
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 04:15:24 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id t39-v6so3901373qtc.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 21:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9uj8WwYnGEJZljh/vVVZbwWI3D/916Y7wHRPUdRBsdE=;
	b=C7AgxN2iFU4LpfXoBScfBI4Gxgp1bwB4ESIRX2V5NryIvOufgPqjDridlNmdfem4vL
	enPxN41qqg9aSkOWH8801ooFExtdu9n974ExzGRFh0+Cl1+LntnX9UsG5mEDx44RRfUX
	w9EYQ1/NwyKtf0tQ3eTKE/dcLGbQ7i0ZgxrTMqPBZUjrm/1Pz5r40RgumUnEULg53FgH
	KC8j+Fb0R+wgFDDMwYwOO/DDEjtVWrVw3eK19l4ZXwYiG4+VQFhFYVtnjVrQMVos1xzI
	G18hcS2jp0fUYhjDvtyEG4ER1eIOP8yFb1YMM4tWMwBaPec+j3Xgmu6dw07ATGUhws3e
	Bqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9uj8WwYnGEJZljh/vVVZbwWI3D/916Y7wHRPUdRBsdE=;
	b=Drv0T1NZrVbdvVYS6ZHeZWNWpXiBfE1anMkEHjv6UyiBxrq6n6wsa1ILvxEibCZ3Nq
	Ra7/V2zcJhjg7Vq3Gxz2GTQ5c835PBXFuh5egoj7gHX3Ei2FbcfBX2NvvEqv9KfQZEL3
	qjgtd6tB8kWki0Ds1yHbW7LWfM4NdRYd4FvNYIIlOuZ3oId7z8JHC7VhRh9k/oYeYoSy
	XY0jNd/pt4NsWLnmi4nX0HI9omJ8W9FSQJaeWl4gwBFmPK+ocDEiB0WoFCzhte4iqSTN
	m3V9DrGm+lk4fekVSZDbPgsG4RPmONCmFYzKHUms2CqY5A/b79NjVfQNwZfyWKySAq3y
	Lnnw==
X-Gm-Message-State: APzg51Br0YaVCpwBZHW+MfWbLCeg+zMxFNuD41zGnE7n5VlMSDBX7cwI
	mPTeukjRaNakaSqBB+9kR2q7fqTZ5Qc7Gyrsmco=
X-Google-Smtp-Source: ANB0VdabXO56/kSJbc3L0wL8yyO3XclGPqCmpy2UBwyvw+pUMWVd2FvbVIzpvEbzNv1fA7hn7zPCWx+yC1Guk9uzvpY=
X-Received: by 2002:ac8:758d:: with SMTP id
	s13-v6mr23899827qtq.161.1537330524981; 
	Tue, 18 Sep 2018 21:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <1536941045-3581-1-git-send-email-akuster808@gmail.com>
	<C0207330DF60C5409302EC78C3FE68F302037BC6@PGSMSX105.gar.corp.intel.com>
In-Reply-To: <C0207330DF60C5409302EC78C3FE68F302037BC6@PGSMSX105.gar.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 21:14:58 -0700
Message-ID: <CAMKF1srQG=9DGxoWxYHkTo9ViDm41gQeurajDZOpFB_qDWZBqg@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] xserver-xorg: upgrade 1.19.6 -> 1.20.1
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
X-List-Received-Date: Wed, 19 Sep 2018 04:15:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 17, 2018 at 7:51 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-
> > core-bounces@lists.openembedded.org] On Behalf Of Armin Kuster
> > Sent: Saturday, September 15, 2018 12:04 AM
> > To: akuster808@gmail.com; openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 1/3] xserver-xorg: upgrade 1.19.6 -> 1.20.1
> >
> > removed included patch
> >
> > Refresh 0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC
> > Remove 0001-config-fix-NULL-value-detection-for-ID_INPUT-being-u.patch
> >
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> >  ...NULL-value-detection-for-ID_INPUT-being-u.patch | 40 -------------------
> > ...onfigure.ac-Fix-check-for-CLOCK_MONOTONIC.patch | 19 +++++----  ...003-
> > modesetting-Fix-16-bit-depth-bpp-mode.patch | 46 ----------------------
> >  .../xorg-xserver/xserver-xorg_1.19.6.bb            | 33 ----------------
> >  .../xorg-xserver/xserver-xorg_1.20.1.bb            | 31 +++++++++++++++
> >  5 files changed, 40 insertions(+), 129 deletions(-)  delete mode 100644 meta/recipes-
> > graphics/xorg-xserver/xserver-xorg/0001-config-fix-NULL-value-detection-for-
> > ID_INPUT-being-u.patch
> >  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-
> > modesetting-Fix-16-bit-depth-bpp-mode.patch
> >  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
> >  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb
> >
> > diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-config-fix-NULL-
> > value-detection-for-ID_INPUT-being-u.patch b/meta/recipes-graphics/xorg-
> > xserver/xserver-xorg/0001-config-fix-NULL-value-detection-for-ID_INPUT-being-
> > u.patch
> > deleted file mode 100644
> > index 964d5dd..0000000
> > --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-config-fix-NULL-value-
> > detection-for-ID_INPUT-being-u.patch
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -From a309323328d9d6e0bf5d9ea1d75920e53b9beef3 Mon Sep 17 00:00:00 2001
> > -From: Peter Hutterer <peter.hutterer@who-t.net>
> > -Date: Fri, 5 Jan 2018 11:58:42 +1000
> > -Subject: [PATCH] config: fix NULL value detection for ID_INPUT being unset
> > -
> > -Erroneous condition caused us to keep going with all devices that didn't have -
> > ID_INPUT set.
> > -
> > -Fixes: 5aad81445c8c3d6
> > -Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=104382
> > -Reviewed-by: Adam Jackson <ajax@redhat.com>
> > -Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> > -
> > -Upstream-status: Backport
> > -https://patchwork.freedesktop.org/patch/196090/
> > -Affects: < 1.20.0
> > -[Yocto # 12899]
> > -
> > -Signed-off-by: Armin Kuster <akuser808@gmail.com>
> > -
> > ----
> > - config/udev.c | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/config/udev.c b/config/udev.c -index e198e8609..3a73189e2 100644
> > ---- a/config/udev.c
> > -+++ b/config/udev.c
> > -@@ -135,7 +135,7 @@ device_added(struct udev_device *udev_device)
> > - #endif
> > -
> > -     value = udev_device_get_property_value(udev_device, "ID_INPUT");
> > --    if (value && !strcmp(value, "0")) {
> > -+    if (!value || !strcmp(value, "0")) {
> > -         LogMessageVerb(X_INFO, 10,
> > -                        "config/udev: ignoring device %s without "
> > -                        "property ID_INPUT set\n", path);
> > ---
> > -2.17.1
> > -
> > diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-
> > check-for-CLOCK_MONOTONIC.patch b/meta/recipes-graphics/xorg-
> > xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
> > index 16ec3ed..020a1cf 100644
> > --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-
> > for-CLOCK_MONOTONIC.patch
> > +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-
> > +++ Fix-check-for-CLOCK_MONOTONIC.patch
> > @@ -1,12 +1,13 @@
> > -Discover monotonic clock using compile-time check
> > +From 8a91316c4a38f20e7866289f3d779a037d27a129 Mon Sep 17 00:00:00 2001
> > +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > +Date: Mon, 12 Dec 2016 12:11:39 +0200
> > +Subject: [PATCH] Discover monotonic clock using compile-time check
> >
> >  monotonic clock check does not work when cross-compiling.
> >
> >  Upstream-Status: Denied [Does not work on OpenBSD]
> >  Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> >
> > -
> > -
> >  Original patch follows:
> >
> >  When xorg-xserver is being cross-compiled, there is currently no way @@ -21,15
> > +22,16 @@ monotonic clock is available. This check can run just fine when we are
> > cross-compiling.
> >
> >  Signed-off-by: David James <davidjames at google.com>
> > +
> >  ---
> >   configure.ac | 17 +++++++----------
> >   1 file changed, 7 insertions(+), 10 deletions(-)
> >
> >  diff --git a/configure.ac b/configure.ac -index f7ab48c..26e85cd 100644
> > +index 2b21667..786e002 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> > -@@ -1048,19 +1048,16 @@ if ! test "x$have_clock_gettime" = xno; then
> > +@@ -984,19 +984,16 @@ if ! test "x$have_clock_gettime" = xno; then
> >           CPPFLAGS="$CPPFLAGS -D_POSIX_C_SOURCE=200112L"
> >       fi
> >
> > @@ -54,8 +56,5 @@ index f7ab48c..26e85cd 100644
> >  -       [MONOTONIC_CLOCK="cross compiling"])
> >  +]])],[MONOTONIC_CLOCK=yes], [MONOTONIC_CLOCK=no])
> >
> > -     LIBS="$LIBS_SAVE"
> > -     CPPFLAGS="$CPPFLAGS_SAVE"
> > ---
> > -2.1.4
> > -
> > +     if test "$MONOTONIC_CLOCK" = "cross compiling"; then
> > +
> > AC_CHECK_DECL([CLOCK_MONOTONIC],[MONOTONIC_CLOCK="guessing
> > + yes"],[MONOTONIC_CLOCK=no],[#include <time.h>])
>
>
> Do we still need this patch after this change in 1.20:
>

no we dont

> https://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?h=server-1.20-branch&id=c601c8faf54ff9e3bcbc653421828d71042deef7
>
> Thanks,
> Anuj
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

