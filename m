Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com [209.85.219.196])
 by mx.groups.io with SMTP id smtpd.web12.13130.1596465167503959170
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cx1P3F0d;
 spf=pass (domain: gmail.com, ip: 209.85.219.196, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f196.google.com with SMTP id q3so758663ybp.7
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gocQqZpwI+Tphb8b16d4o+gedq8d0lbmbCmwV4iSOVs=;
        b=Cx1P3F0da4yMuzpkteNrAQ6uLoNIwsQurSbg2MmNFZkRtv+bzsHx0JSh74h5HEK06n
         84WnVU3cTkJQnyUXnx2/Y8CSBzEduMkZxIKl2ucuLfolnAV9cKxy3oDRoCrpmgaMWp1m
         znoXtYoJatHPlrorMip8s/BGNyAftA6+s+vOdQNazZA6z2JdlVMR7A5/Xmqi5TgkQv2m
         dLQ2jQ0uvz7tsw8Gk4V9F1xbi6AFeVwD8ZehzyOzS+3cNZxUAbN59tZ41812neykTVRt
         ZQRwEtMA577pwMa5PEf+C2D3OQbECjGNoDu2hO76WUXFu2NFs3Cuyfc8YisbegUb/ZeY
         LcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gocQqZpwI+Tphb8b16d4o+gedq8d0lbmbCmwV4iSOVs=;
        b=WxLp9/dapslHX7gAbu4LN18qB+55LH/8QCyn7FAR1/Jrctgczt5s2gp9X74zssrZsn
         DZ0euXcizSx3fQt4BoPiftZ4Lzf6ZkLcEAFGUl7hyv1b5ErKwHyJYnCB3rqQ+U1FF/zo
         84dDhqkOoDNvRzQ9QIMSOtxZcCeYCwLW3CxXkvG/daWW/E/VSnSpBgPoMzkyQ+OSFCMA
         q2MpTWYTsh50MH9mlqywZRTJR1iQ4TwwKjhXatgQqRLDDIrRGXvCkC7M1jiTCfqjwOUR
         UZpMVipa2wOjikrUc82q7LND9BX4LuDTidpCwOYbo4Wcj463LazvmjEYplhdUMhblm4i
         iL7Q==
X-Gm-Message-State: AOAM533gv+Y2fIr/RbohzLW9V+/Itt2vregiCg4L8kPpQ6anM0Yo7yFn
	sArlyNmLCqmLypcsP9f8qpm0Tg1BDRAXA87N4Uw=
X-Google-Smtp-Source: ABdhPJz+mTwT1cfqYPtu5pBL9d7KP1Vass3bf2PxmnIGCuXOc6VHtgOCbkzi+dmIJDyTUgcPTvkcQxh1o0d9uxPZIZw=
X-Received: by 2002:a05:6902:706:: with SMTP id k6mr26067374ybt.416.1596465166589;
 Mon, 03 Aug 2020 07:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <16236F46F8876220.6175@lists.openembedded.org> <631dc54f-8199-be04-c4e5-8ff48450ab42@pengutronix.de>
In-Reply-To: <631dc54f-8199-be04-c4e5-8ff48450ab42@pengutronix.de>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 3 Aug 2020 04:32:35 -1000
Message-ID: <CAGDS+n=-Y2LxWiu6vdL9Jm1re2cObHQE7A6tvQVUQXaPEqj_mg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] core: glib-2.0: fix requested libmount/mkostemp/selinux not being linked in
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	akuster <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 2, 2020 at 9:43 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hello,
>
> On 7/20/20 12:30 PM, Ahmad Fatoum wrote:
> > Since 010202076760 ("meson.bbclass: avoid unexpected operating-system
> > names"), meson is no longer used with a cross file that appends the used
> > libc to the operating system name, e.g. linux-gnueabi.
> >
> > Prior to that commit, the host_system == 'linux' checks in glib's meson
> > failed, which led to glib being compiled without libmount, mkostemp and
> > selinux even if explicitly requested.
> >
> > As the aforementioned commit affects all recipes built by glib, it might
> > not be a candidate for backporting to current stable branches. To fix
> > just the glib issue, instances of host_system == 'linux' are patched
> > locally.
> >
> > The patch is marked as Upstream-Status: Inappropriate as it is rendered
> > unnecessary for OE releases newer than Dunfell.
>
> Gentle Ping.

I didn't take this patch since it no longer seems to be needed in dunfell.

Please see:  https://lists.openembedded.org/g/openembedded-core/message/141008

If we are mistaken, please let us know!

Steve

> > Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > ---
> >  ...ot-hardcode-linux-as-the-host-system.patch | 49 +++++++++++++++++++
> >  meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb |  1 +
> >  2 files changed, 50 insertions(+)
> >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch
> >
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch b/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch
> > new file mode 100644
> > index 000000000000..616bbd8a7d7c
> > --- /dev/null
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch
> > @@ -0,0 +1,49 @@
> > +From a300a09661124451d4783d4be66e3993262dc9be Mon Sep 17 00:00:00 2001
> > +From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > +Date: Thu, 9 Jul 2020 13:00:16 +0200
> > +Subject: [PATCH] meson.build: do not hardcode 'linux' as the host system
> > +
> > +OE build system can set this to other values that include 'linux',
> > +e.g. 'linux-gnueabi'. This led to glib always being built without
> > +libmount, mkostemp and selinux support.
> > +
> > +Upstream-Status: Inappropriate [other]
> > +Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > +---
> > + meson.build | 6 +++---
> > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/meson.build b/meson.build
> > +index 3a47a7cc4b98..af09dfc853e5 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -632,7 +632,7 @@ else
> > + endif
> > + message('Checking whether to use statfs or statvfs .. ' + stat_func_to_use)
> > +
> > +-if host_system == 'linux'
> > ++if host_system.contains('linux')
> > +   if cc.has_function('mkostemp',
> > +                      prefix: '''#define _GNU_SOURCE
> > +                                 #include <stdlib.h>''')
> > +@@ -1857,7 +1857,7 @@ glib_conf.set_quoted('GLIB_LOCALE_DIR', join_paths(glib_datadir, 'locale'))
> > + # libmount is only used by gio, but we need to fetch the libs to generate the
> > + # pkg-config file below
> > + libmount_dep = []
> > +-if host_system == 'linux' and get_option('libmount')
> > ++if host_system.contains('linux') and get_option('libmount')
> > +   libmount_dep = [dependency('mount', version : '>=2.23', required : true)]
> > +   glib_conf.set('HAVE_LIBMOUNT', 1)
> > + endif
> > +@@ -1867,7 +1867,7 @@ if host_system == 'windows'
> > + endif
> > +
> > + selinux_dep = []
> > +-if host_system == 'linux'
> > ++if host_system.contains('linux')
> > +   selinux_dep = dependency('libselinux', required: get_option('selinux'))
> > +
> > +   glib_conf.set('HAVE_SELINUX', selinux_dep.found())
> > +--
> > +2.27.0
> > +
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
> > index d496235003d4..fd7f5ee920d8 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
> > @@ -19,6 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
> >             file://0011-GMainContext-Fix-GSource-iterator-if-iteration-can-m.patch \
> >             file://0012-GMainContext-Fix-memory-leaks-and-memory-corruption-.patch \
> >             file://0013-GMainContext-Move-mutex-unlocking-in-destructor-righ.patch \
> > +           file://0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
> >             "
> >
> >  SRC_URI_append_class-native = " file://relocate-modules.patch"
> >
> >
> >
> >
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 
