Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.59549.1595867138569153432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 09:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XAydmahE;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.65, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f65.google.com with SMTP id d6so3862940ejr.5
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 09:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ih3ZxQdp4SYeh29LrM1FNfBx4A0GbDgcaFHBGkAVa3E=;
        b=XAydmahEyZ2HYCR7bqbA60akejaRbRpe1jaFzxCNEOlMwFjMgGjQtEj+TguIhmYPw9
         tCD1NGyf3Qko0D/tSDtaPdp/h1MtVikl083pUtCjg/0764R8g2XKUDcPYQNLXM4Azysp
         Kdp90gUaPl12VcE8NDZFJA5w51xfKvCWXWPn2WyhREspr/xlZLcY2IlvbarAbAJkLFFJ
         dP9i1++NxC729QSlp2MwjFQmJU6Tp2fgMd1Zn+G1EMsKr6BamRQBiG9s/2yjSM/jU6Mc
         E4nBqwwDSJaQ9N9ObzyNNyPbJ0YVGJJUXnoZJtl1YiQix1Lpovq91vUWTqlmzeNm8HUh
         JCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ih3ZxQdp4SYeh29LrM1FNfBx4A0GbDgcaFHBGkAVa3E=;
        b=eWcX+9rZdBDUjjG8lnmcQkAj22QcVURoIJj9Ily7P8Ojo5XPKqIlEvhkNKnFVtHgVr
         7h82Nj+xMGAReo0oUrG0lhp+pYfv1eG48C4l0JtN1DSYFL55vITT7hIVpX6wQPFhH7ki
         1bvwdlLZzmXi7+ZO8zeYXExMTo2a0ZVbba6ug6QDzHtlB/8T+J+tldJC79R40Q6ncBDI
         gC9c8TwAkus3xp24f/jCKkgRRMVFlUK6YWyM319SujYuYylNrk9+3J4tOmGhmEuHK7jn
         apfim/hQGJLRg6numY7WLMVW3Tn5ky/J4ljpzbc6GbO6tYkf8NGFsuJVb7zcKUntWgE3
         zhFA==
X-Gm-Message-State: AOAM5328R9GeZ9/cWB2Uaq8F6udJMxJHZwK+i62EoNMfBxqDevSYBXKh
	8xBATfG2J9EES4hWzJ3Lke8QDf6AaRf257YGRzX0kQ==
X-Google-Smtp-Source: ABdhPJyjZxnmUBn0ttmaUUijVEqZRZ1D8VuMRbBqnhmkkAMOCtPIq/k/Ry5D6Gqaf4SCzxPDSBQ+6qt9JSlzG9GelmM=
X-Received: by 2002:a17:906:6055:: with SMTP id p21mr3346193ejj.173.1595867137010;
 Mon, 27 Jul 2020 09:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595862361.git.steve@sakoman.com> <1eb5483fea909177dd4f510ebcb32084d77897b3.1595862361.git.steve@sakoman.com>
 <CALbNGRR-rF1A0ej3R7T+VbX1VuC5vixi_-Rr4myFjYrwjV1JZA@mail.gmail.com>
In-Reply-To: <CALbNGRR-rF1A0ej3R7T+VbX1VuC5vixi_-Rr4myFjYrwjV1JZA@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 27 Jul 2020 06:25:24 -1000
Message-ID: <CAOSpxdaDqwnVhbzuZO87b_kb-KqBOtNbohRtd3Hr_SDTnPtG0A@mail.gmail.com>
Subject: Re: [OE-core][dunfell 14/18] core: glib-2.0: fix requested libmount/mkostemp/selinux not being linked in
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2020 at 6:14 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:

> If I am not mistaken, the patch
> "meson.bbclass: avoid unexpected operating-system names"
> made it into dunfell so this patch does not change anything (it should
> do no harm either)

You are correct!  I didn't parse the commit message properly when I
took this patch.

I'll drop this patch from the final pull request.

Thanks for reviewing it, I really appreciate your help!

Steve


> Andreas
> > To fix just the glib issue, instances of host_system =3D=3D 'linux' ar=
e patched
> > locally.
> >
> > The patch is marked as Upstream-Status: Inappropriate as it is rendere=
d
> > unnecessary for OE releases newer than Dunfell.
> >
> > Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  ...ot-hardcode-linux-as-the-host-system.patch | 49 ++++++++++++++++++=
+
> >  meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb |  1 +
> >  2 files changed, 50 insertions(+)
> >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0020-meson.bui=
ld-do-not-hardcode-linux-as-the-host-system.patch
> >
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-n=
ot-hardcode-linux-as-the-host-system.patch b/meta/recipes-core/glib-2.0/gli=
b-2.0/0020-meson.build-do-not-hardcode-linux-as-the-host-system.patch
> > new file mode 100644
> > index 0000000000..616bbd8a7d
> > --- /dev/null
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0/0020-meson.build-do-not-hard=
code-linux-as-the-host-system.patch
> > @@ -0,0 +1,49 @@
> > +From a300a09661124451d4783d4be66e3993262dc9be Mon Sep 17 00:00:00 200=
1
> > +From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > +Date: Thu, 9 Jul 2020 13:00:16 +0200
> > +Subject: [PATCH] meson.build: do not hardcode 'linux' as the host sys=
tem
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
> > + message('Checking whether to use statfs or statvfs .. ' + stat_func_=
to_use)
> > +
> > +-if host_system =3D=3D 'linux'
> > ++if host_system.contains('linux')
> > +   if cc.has_function('mkostemp',
> > +                      prefix: '''#define _GNU_SOURCE
> > +                                 #include <stdlib.h>''')
> > +@@ -1857,7 +1857,7 @@ glib_conf.set_quoted('GLIB_LOCALE_DIR', join_pa=
ths(glib_datadir, 'locale'))
> > + # libmount is only used by gio, but we need to fetch the libs to gen=
erate the
> > + # pkg-config file below
> > + libmount_dep =3D []
> > +-if host_system =3D=3D 'linux' and get_option('libmount')
> > ++if host_system.contains('linux') and get_option('libmount')
> > +   libmount_dep =3D [dependency('mount', version : '>=3D2.23', requir=
ed : true)]
> > +   glib_conf.set('HAVE_LIBMOUNT', 1)
> > + endif
> > +@@ -1867,7 +1867,7 @@ if host_system =3D=3D 'windows'
> > + endif
> > +
> > + selinux_dep =3D []
> > +-if host_system =3D=3D 'linux'
> > ++if host_system.contains('linux')
> > +   selinux_dep =3D dependency('libselinux', required: get_option('sel=
inux'))
> > +
> > +   glib_conf.set('HAVE_SELINUX', selinux_dep.found())
> > +--
> > +2.27.0
> > +
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb b/meta/reci=
pes-core/glib-2.0/glib-2.0_2.62.4.bb
> > index d496235003..fd7f5ee920 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
> > @@ -19,6 +19,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-$=
{PV}.tar.xz \
> >             file://0011-GMainContext-Fix-GSource-iterator-if-iteration=
-can-m.patch \
> >             file://0012-GMainContext-Fix-memory-leaks-and-memory-corru=
ption-.patch \
> >             file://0013-GMainContext-Move-mutex-unlocking-in-destructo=
r-righ.patch \
> > +           file://0020-meson.build-do-not-hardcode-linux-as-the-host-=
system.patch \
> >             "
> >
> >  SRC_URI_append_class-native =3D " file://relocate-modules.patch"
> > --
> > 2.17.1
> >
> >=20
