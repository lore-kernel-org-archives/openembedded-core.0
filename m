Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id D11647D109
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 19:41:32 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id n14so8373395vsp.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 12:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9ZInCgCCourEl+csScFvQL14MLPgDYAwFlh7Y77I2XI=;
	b=YDysQ/V5nRkKiA7A5q7zu/GG2pjD+Qvm9DOHRZlFeWS64WVG5qdGpEmMJYEroMbPLF
	G9l2DCNG1vd/xvCIY8PrT3OIxFbAQ16UQNMQ8DfBTmL65GLeVBfywFQfMtaj2xmywTwG
	U+4rP9rQ7ZP7xhawintPcFiVrD1ZJ+aNkgOmMQdNPJLFlMRUkhw/BrfxPTB1+HOEevhQ
	q8VKjH2aC43FqoPFU//cn5xgckbDDybTFD16Zt0Y3C97f+vJCso0SKJWwGW7Gyua6nnS
	VKfFRRq1w4wRr44WQ2Wj3QfuelTRNgmij3WScgOeF+FmZDi5pIPvVDRBJcRVqk5kR66B
	w6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9ZInCgCCourEl+csScFvQL14MLPgDYAwFlh7Y77I2XI=;
	b=Bb1M34X52sr6KD0YgRKbfiKBAH0sl8yEm/RTDS1iqvb5CXj/dFiyH9saGIQRqluG8Q
	IWCBwfKfmQ21j4MNsmGUUjony6D/G2cpQJPw8K+7urbHK/gz/Dt5yO011XqT+JfMhgcH
	p0ynApphZoqfSdXoXPJ8aAowhEtKtOcPeYYAZMDkBG4ygmPa33ybKNMiOfhZfcZppAhq
	1OyiZRTC9f8/3NXS78FFUfaHHoNgjJFqsFCSGilTR+gPBuJ5A8p3Z1KVzlPwGPEqPGiN
	TX+oky8KshmYSBI+bRUDOcA6moXM0gKjT6qUMbyD4W15x9u0gHlu+XMU6IWUIuuu75Yv
	JsEA==
X-Gm-Message-State: APjAAAU7yf9y+JTJYiypvR1EY304HYEFcSQoWP/T1/TjrYd2a0q+JZUA
	/dsdX/Ma7X8OqLi8htdGpnmaLm7H7ZNsxCHqRxA=
X-Google-Smtp-Source: APXvYqyO0RQRYGnoVYVLBSmAqNi5NtgzLUY2/nrC5CTIi1BkLvBJGmSuDljE3C6A8hVVJ49JWbjVhD4KDFjXbTGrTZ8=
X-Received: by 2002:a67:6983:: with SMTP id
	e125mr19019788vsc.222.1553629293455; 
	Tue, 26 Mar 2019 12:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190326120157.4397-1-ross.burton@intel.com>
	<CAMKF1sprxcvAtLQsu-dueRZtvPXvo+ozg9HZ+w+yU417sU3AfQ@mail.gmail.com>
In-Reply-To: <CAMKF1sprxcvAtLQsu-dueRZtvPXvo+ozg9HZ+w+yU417sU3AfQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 26 Mar 2019 12:41:21 -0700
Message-ID: <CAJ86T=VZpLxYwh2Su+HLFCJFvbEm043fyiaBf4Dezo66O-h=aQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib: set glib-specific cross properties
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
X-List-Received-Date: Tue, 26 Mar 2019 19:41:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 26, 2019 at 11:08 AM Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Mar 26, 2019 at 5:02 AM Ross Burton <ross.burton@intel.com> wrote:
> >
> > GLib wants to execute code to identify several properties of the system, for
> > example is vsprintf() broken and what direction does the stack grow. In
> > cross-compiled environments these fallback to the default values which are not
> > always correct (our vsprintf() is fine, but the test assumes it isn't) so set
> > these properties explicitly.
> >
> > Ideally this happens magically by meson.bbclass using the same logic as
> > siteinfo.bbclass, but we need to fix glib now.
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross | 6 ++++++
> >  meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb        | 1 +
> >  meta/recipes-core/glib-2.0/glib.inc                  | 1 +
> >  3 files changed, 8 insertions(+)
> >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross
> >
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross b/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross
> > new file mode 100644
> > index 00000000000..8420f9874e1
> > --- /dev/null
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross
> > @@ -0,0 +1,6 @@
> > +[properties]
> > +have_c99_vsnprintf = true
> > +have_c99_snprintf = true
> > +have_unix98_printf = true
> > +va_val_copy = true
> > +growing_stack = false
>
> this is mostly true for arches we support but maybe a comment
> to check it when doing explicit arch ports ( e.g. arm can grown both ways)

Not on EABI or any other ARM ABI which could possibly be targeted by
OE... unless you have evidence to prove otherwise?

> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
> > index 2de2affa51a..c872c749202 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
> > @@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
> >             file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch \
> >             file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
> >             file://0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
> > +           file://glib-meson.cross \
> >             "
> >
> >  SRC_URI_append_class-native = " file://relocate-modules.patch"
> > diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> > index 6f0ec1ad2e9..574bb38557b 100644
> > --- a/meta/recipes-core/glib-2.0/glib.inc
> > +++ b/meta/recipes-core/glib-2.0/glib.inc
> > @@ -53,6 +53,7 @@ PACKAGECONFIG[libelf] = ",,elfutils"
> >  PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false,dbus"
> >
> >  EXTRA_OEMESON = "-Ddtrace=false -Dfam=false -Dsystemtap=false -Dselinux=false"
> > +EXTRA_OEMESON_append_class-target = " --cross-file ${WORKDIR}/glib-meson.cross"
> >
> >  do_configure_prepend() {
> >         sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
> > --
> > 2.11.0
> >
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

