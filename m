Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 80B3B7C664
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 00:50:25 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id y4so8663269qtc.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2019 16:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Sxr+V8aY8srUhmPqlZMKWuBz2bR5g2xjXw76yY21D1Y=;
	b=SaM3DRvQgZMf25DxmlP3vKi/IkvI5omorTpGrYuiBda6FJjwwwaF8wZ81Xr+ffwzNt
	8jOC+0+eul+MgFUGtJhkkBZGNcs9hiucGsHdI0eYV/3q9ayqYdnPTuls6uAMsNXn0o/l
	Yb9VNecA8z0YFryeZnqop8u2jBmxAwShlZ8TCJ/SiAC3ivDB8xNQe6PC90jVaumAjOFa
	qSpqCSAy8W3VndTnhctWeJjDxM15QQbN4w/IvMTnQWQBEaWjJm/YnbI1//cMP+6quK8P
	rb1Ogofzd5ikoOn5wdnwPJ68iI2UBlTWNMIdk+zTKU2wrfbO0PWrT2S2ZZj9nGC7wdI/
	isug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Sxr+V8aY8srUhmPqlZMKWuBz2bR5g2xjXw76yY21D1Y=;
	b=gwaEF0J1p8UACAx2zWw4GrJqMDAAKgvw2HDsdD1+cmn2f7fNW6fPH9wyYq2eGWuVrf
	1gw9jEmcuxZhfHoEvBVpdoZOfmPL+feDQT3LiG5FrSxm7ri+16ekoN74Zfh4Y2r72io+
	uJEi4utQGLAbNiLzEtVCgca/uqJpR8qufP4pYNYcZR0HuAJULkBVUAiZblSfqXlv1iZh
	j09LK0M0smdLoyeoAWNnVi39IZ4amfubnzDUVnmwt7WWVntIVjMxvV1K1jyBAcir1Qui
	/wSa1P2s2/WQtACsm2TTjXp2PrqmC0yK/xLl40k2nM42a5laoF+ZXwigw8B/vaouqoTG
	uPYg==
X-Gm-Message-State: AHQUAuapj9RYVx17VVC00y5mvJEioDRotO7Jr+Y4BHNiIIUzQcTDF5bH
	JoyI9/psw/8AdFPMIEOpJfph+p3fLd+yE1Jterc=
X-Google-Smtp-Source: AHgI3Iatp+9ASWUme3Z5mnrDBuJuNi2vN7aS903wAlDpxUTzH2hrqn2hBOLX50chcnnAQiz7/CO+FVY3bXI6uyLjqrY=
X-Received: by 2002:ac8:2c51:: with SMTP id e17mr11446085qta.254.1551055826232;
	Sun, 24 Feb 2019 16:50:26 -0800 (PST)
MIME-Version: 1.0
References: <20190221221834.37807-1-raj.khem@gmail.com>
	<CAJTo0Lb_aF90SE4Exc80P5SH31u1SErPSsvsWtkfYiPz6xHVpQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lb_aF90SE4Exc80P5SH31u1SErPSsvsWtkfYiPz6xHVpQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Feb 2019 16:50:00 -0800
Message-ID: <CAMKF1spJMRRvxZh6=6+pMP5+0q9EGLKE-zfcqSYdgPgn2=p-EA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+3: Fix build failure with gold linker
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
X-List-Received-Date: Mon, 25 Feb 2019 00:50:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 24, 2019 at 3:02 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> Have you sent this upstream?
>
No, I haven't

> Ross
>
> On Thu, 21 Feb 2019 at 22:19, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Explicitly link in libfribidi
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../gtk+/gtk+3/link_fribidi.patch             | 19 +++++++++++++++++++
> >  meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb       |  1 +
> >  2 files changed, 20 insertions(+)
> >  create mode 100644 meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch
> >
> > diff --git a/meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch b/meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch
> > new file mode 100644
> > index 0000000000..e4bbd799f1
> > --- /dev/null
> > +++ b/meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch
> > @@ -0,0 +1,19 @@
> > +Link with libfribidi, this is to avoid under linking where these functions are
> > +used but the library is not linked in, and they are marked undefined by BFD linker
> > +but gold linker refuses to link
> > +
> > +| ./.libs/libgdk-3.so: error: undefined reference to 'fribidi_get_bidi_type'
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Upstream-Status: Pending
> > +
> > +--- a/gdk/Makefile.am
> > ++++ b/gdk/Makefile.am
> > +@@ -55,6 +55,7 @@ LDADD =                                      \
> > +       -version-info $(LT_VERSION_INFO)        \
> > +       -export-dynamic                         \
> > +       -rpath $(libdir)                        \
> > ++      -lfribidi                               \
> > +       $(no_undefined)
> > +
> > + #
> > diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
> > index 799cbd4707..92c9a3ebfb 100644
> > --- a/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
> > +++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
> > @@ -6,6 +6,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
> >             file://0001-Hardcoded-libtool.patch \
> >             file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
> >             file://0003-Add-disable-opengl-configure-option.patch \
> > +           file://link_fribidi.patch \
> >            "
> >  SRC_URI[md5sum] = "32862355c08f6af3e7848c695cd4081b"
> >  SRC_URI[sha256sum] = "0be5fb0d302bc3de26ab58c32990d895831e2b7c7418d0ffea1206d6a3ddb02f"
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

