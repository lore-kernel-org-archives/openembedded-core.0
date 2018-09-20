Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6599160272
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 12:38:10 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id c190-v6so8191648oig.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 05:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u7TpXXuSfO157Byk9zczuH6WzaAfH8o7l3tQDVW5N3g=;
	b=IU5/fRVdgGN0SPte4PONH1V0huLKUCnvSOQmJGZqiagst8e+EyhDVFqpDiEixM+Ukn
	Vo/AccmctOKq4creMn/r1SdgIylSZJB2Sgdn1W9P2k/RWbo6VwclKGwUwL3GwvIzcnOx
	vfOOIIBoJHGQ1Qqd2mu779XmOW9ph72RTd/qef2cT+PQyCv4gge7IK2kIuzXhtedVKMU
	HFCN2r0OiE1vDM3UnT/cg7VTmgSZVmNkAQdhrXhaXGRCH/j52UueOMg4pna+3PstFII4
	c4p97sx2wwY7mT7gLTEDVcjizbI/eQuOjBtxwwlXv/tZixlcATfCCnzYszNgHExW5Q23
	BldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u7TpXXuSfO157Byk9zczuH6WzaAfH8o7l3tQDVW5N3g=;
	b=WFZQtwyaEmP+BRukuzEK7u2yZGjhsT0dR5lZiHBd/eZggLZgPFOV38G7Yn2vtFCCjN
	tZwQSb78MkL7XVWyeejIzRM56m7yl74nCNSfKt4tX79NRsrjoUJ2YOVz09SPryIAK+Tj
	Cg1JVFgZjtXqXIB5t6OUr8jQejY2PFGt+9NSuNpcK7UM5giI1/qXShDxwroem9iMZjeY
	t4XiJp0yCt5MQAYulecFcnLtItvcHNvZpLEY7E5T3d8leEsjQmncGFEi3uWocqjuLzJr
	a3sFZ4MLYFlrl+ApNNt3tljJBzlMM5ut+EW1/JpVSt8HumkA1MGFsc5Zz33ftdqu2ACI
	mObg==
X-Gm-Message-State: APzg51DJKP3rISnsNDkpkwWOY5iH/QIsvnW0iw1u7ERjPcaiV9WDeJQy
	eMCJEr2MtomZ8gVFzg8vJJ6RnR2VkfjTTwNJJyXomQ==
X-Google-Smtp-Source: ANB0VdbPhfAmWURzPxSDxIu1q19xUfUR50wDL/67Bcc7gdMmcabHSjpvNP5xxuVCWmll1j/ofr344cIDYl/wPTvgMK4=
X-Received: by 2002:aca:2c5:: with SMTP id 188-v6mr890537oic.192.1537447091282;
	Thu, 20 Sep 2018 05:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <1536941045-3581-1-git-send-email-akuster808@gmail.com>
	<C0207330DF60C5409302EC78C3FE68F302037BC6@PGSMSX105.gar.corp.intel.com>
	<CAMKF1srQG=9DGxoWxYHkTo9ViDm41gQeurajDZOpFB_qDWZBqg@mail.gmail.com>
In-Reply-To: <CAMKF1srQG=9DGxoWxYHkTo9ViDm41gQeurajDZOpFB_qDWZBqg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Sep 2018 13:37:59 +0100
Message-ID: <CAJTo0LYkToeigD8SQ9Q_rpeiV4g9r=xC1s2P4jFQCp_Z=1+4RA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 20 Sep 2018 12:38:10 -0000
Content-Type: text/plain; charset="UTF-8"

Patch to remove that sent.  I also sent upstream the arm/musl/inb patch.

Ross
On Wed, 19 Sep 2018 at 05:15, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Sep 17, 2018 at 7:51 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-
> > > core-bounces@lists.openembedded.org] On Behalf Of Armin Kuster
> > > Sent: Saturday, September 15, 2018 12:04 AM
> > > To: akuster808@gmail.com; openembedded-core@lists.openembedded.org
> > > Subject: [OE-core] [PATCH 1/3] xserver-xorg: upgrade 1.19.6 -> 1.20.1
> > >
> > > removed included patch
> > >
> > > Refresh 0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC
> > > Remove 0001-config-fix-NULL-value-detection-for-ID_INPUT-being-u.patch
> > >
> > > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > > ---
> > >  ...NULL-value-detection-for-ID_INPUT-being-u.patch | 40 -------------------
> > > ...onfigure.ac-Fix-check-for-CLOCK_MONOTONIC.patch | 19 +++++----  ...003-
> > > modesetting-Fix-16-bit-depth-bpp-mode.patch | 46 ----------------------
> > >  .../xorg-xserver/xserver-xorg_1.19.6.bb            | 33 ----------------
> > >  .../xorg-xserver/xserver-xorg_1.20.1.bb            | 31 +++++++++++++++
> > >  5 files changed, 40 insertions(+), 129 deletions(-)  delete mode 100644 meta/recipes-
> > > graphics/xorg-xserver/xserver-xorg/0001-config-fix-NULL-value-detection-for-
> > > ID_INPUT-being-u.patch
> > >  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-
> > > modesetting-Fix-16-bit-depth-bpp-mode.patch
> > >  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
> > >  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb
> > >
> > > diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-config-fix-NULL-
> > > value-detection-for-ID_INPUT-being-u.patch b/meta/recipes-graphics/xorg-
> > > xserver/xserver-xorg/0001-config-fix-NULL-value-detection-for-ID_INPUT-being-
> > > u.patch
> > > deleted file mode 100644
> > > index 964d5dd..0000000
> > > --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-config-fix-NULL-value-
> > > detection-for-ID_INPUT-being-u.patch
> > > +++ /dev/null
> > > @@ -1,40 +0,0 @@
> > > -From a309323328d9d6e0bf5d9ea1d75920e53b9beef3 Mon Sep 17 00:00:00 2001
> > > -From: Peter Hutterer <peter.hutterer@who-t.net>
> > > -Date: Fri, 5 Jan 2018 11:58:42 +1000
> > > -Subject: [PATCH] config: fix NULL value detection for ID_INPUT being unset
> > > -
> > > -Erroneous condition caused us to keep going with all devices that didn't have -
> > > ID_INPUT set.
> > > -
> > > -Fixes: 5aad81445c8c3d6
> > > -Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=104382
> > > -Reviewed-by: Adam Jackson <ajax@redhat.com>
> > > -Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
> > > -
> > > -Upstream-status: Backport
> > > -https://patchwork.freedesktop.org/patch/196090/
> > > -Affects: < 1.20.0
> > > -[Yocto # 12899]
> > > -
> > > -Signed-off-by: Armin Kuster <akuser808@gmail.com>
> > > -
> > > ----
> > > - config/udev.c | 2 +-
> > > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > > -
> > > -diff --git a/config/udev.c b/config/udev.c -index e198e8609..3a73189e2 100644
> > > ---- a/config/udev.c
> > > -+++ b/config/udev.c
> > > -@@ -135,7 +135,7 @@ device_added(struct udev_device *udev_device)
> > > - #endif
> > > -
> > > -     value = udev_device_get_property_value(udev_device, "ID_INPUT");
> > > --    if (value && !strcmp(value, "0")) {
> > > -+    if (!value || !strcmp(value, "0")) {
> > > -         LogMessageVerb(X_INFO, 10,
> > > -                        "config/udev: ignoring device %s without "
> > > -                        "property ID_INPUT set\n", path);
> > > ---
> > > -2.17.1
> > > -
> > > diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-
> > > check-for-CLOCK_MONOTONIC.patch b/meta/recipes-graphics/xorg-
> > > xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
> > > index 16ec3ed..020a1cf 100644
> > > --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-
> > > for-CLOCK_MONOTONIC.patch
> > > +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-
> > > +++ Fix-check-for-CLOCK_MONOTONIC.patch
> > > @@ -1,12 +1,13 @@
> > > -Discover monotonic clock using compile-time check
> > > +From 8a91316c4a38f20e7866289f3d779a037d27a129 Mon Sep 17 00:00:00 2001
> > > +From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > > +Date: Mon, 12 Dec 2016 12:11:39 +0200
> > > +Subject: [PATCH] Discover monotonic clock using compile-time check
> > >
> > >  monotonic clock check does not work when cross-compiling.
> > >
> > >  Upstream-Status: Denied [Does not work on OpenBSD]
> > >  Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > >
> > > -
> > > -
> > >  Original patch follows:
> > >
> > >  When xorg-xserver is being cross-compiled, there is currently no way @@ -21,15
> > > +22,16 @@ monotonic clock is available. This check can run just fine when we are
> > > cross-compiling.
> > >
> > >  Signed-off-by: David James <davidjames at google.com>
> > > +
> > >  ---
> > >   configure.ac | 17 +++++++----------
> > >   1 file changed, 7 insertions(+), 10 deletions(-)
> > >
> > >  diff --git a/configure.ac b/configure.ac -index f7ab48c..26e85cd 100644
> > > +index 2b21667..786e002 100644
> > >  --- a/configure.ac
> > >  +++ b/configure.ac
> > > -@@ -1048,19 +1048,16 @@ if ! test "x$have_clock_gettime" = xno; then
> > > +@@ -984,19 +984,16 @@ if ! test "x$have_clock_gettime" = xno; then
> > >           CPPFLAGS="$CPPFLAGS -D_POSIX_C_SOURCE=200112L"
> > >       fi
> > >
> > > @@ -54,8 +56,5 @@ index f7ab48c..26e85cd 100644
> > >  -       [MONOTONIC_CLOCK="cross compiling"])
> > >  +]])],[MONOTONIC_CLOCK=yes], [MONOTONIC_CLOCK=no])
> > >
> > > -     LIBS="$LIBS_SAVE"
> > > -     CPPFLAGS="$CPPFLAGS_SAVE"
> > > ---
> > > -2.1.4
> > > -
> > > +     if test "$MONOTONIC_CLOCK" = "cross compiling"; then
> > > +
> > > AC_CHECK_DECL([CLOCK_MONOTONIC],[MONOTONIC_CLOCK="guessing
> > > + yes"],[MONOTONIC_CLOCK=no],[#include <time.h>])
> >
> >
> > Do we still need this patch after this change in 1.20:
> >
>
> no we dont
>
> > https://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?h=server-1.20-branch&id=c601c8faf54ff9e3bcbc653421828d71042deef7
> >
> > Thanks,
> > Anuj
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

