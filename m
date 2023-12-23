Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD3DC3DA6E
	for <webhook@archiver.kernel.org>; Sat, 23 Dec 2023 08:58:09 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.3609.1703321883582295268
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Dec 2023 00:58:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m+n9+vwK;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50e64eb3bc7so1719467e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Dec 2023 00:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703321881; x=1703926681; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjCp95+dUs+vydWW1aoDRr2wyaOQuJd+8ILs4GJeQz4=;
        b=m+n9+vwKAYhz5aWSLWpG/IkwIYbhBxYL+Sf1hhS8tvjBrX4EkLM+5yzFTduzQv1i/p
         uuw8BJDee44GHzjM3xgFsjxeSpWMjSGAiAc4lNWHzWcPt3nUArQH7zF12e9NM3nEZL5A
         FMgv+W8nD3HjK8wNjj4O4xW2OzbpfvqZaac/9+KhJzl+6LIw9y+EnvnWS6rI+rGL2PQx
         z2+8jeBowRJTI0VoNGhJLAVtHtrQY2fw+6UG6DibCrH5QPlw4Mkc/zlV2T4wbp/kTerW
         0pzfUjVePkFkBKrJCH1tfbve1dbIQJkqNFH19HI27vsMJffNfnOxwVSMhNW5mLp0Jx5e
         4G3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703321881; x=1703926681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjCp95+dUs+vydWW1aoDRr2wyaOQuJd+8ILs4GJeQz4=;
        b=nbOM9L6Epe05joW4hpyh7/NVmFC93fPMQPlwqpdWYxjbnNrinZl7S4gsr5Xz3Zg7Ag
         GHHS1WS8uirc9Nxucq6Gs0NoPzcGERKKPGQBNlh6YBWylmcAif/AQFAn7JVWZlxVLqVs
         c/pZQfUU6wlorjnBoQtQOPeFfnTxR2svsRx6ZJdp+wUM9I69mxYC0HOOJ3ubrXcD4rK1
         ALyVvoBJauWMtoYLf4g51kUZZZ6SnZbFFv/7BOrQflcUTjtTke5vLRRYd7ViE+UEdxM0
         J8SySEYk4vfp2E/EH34XWN5jmhHV+WbAVzhF8IXixmuMcmzuL42x0yfTkcCtLWCcB6jW
         6hSA==
X-Gm-Message-State: AOJu0YxBpnFdlxitw3HCkpsJETZFxtNjur59FYtVcp16KFEDQVjoQLO4
	ifn0k7svn5coeM4vmZAtoEd4JRKVJtZUYbavg3Y=
X-Google-Smtp-Source: AGHT+IGXFvhSaKbsNICodV56qZAVXtq1P8EzeyfHVFm135o7989e6fLfW22vb5NLThZOwBeWb2H1Aeu1wUNWYin5g8E=
X-Received: by 2002:a19:ad01:0:b0:50e:701f:6781 with SMTP id
 t1-20020a19ad01000000b0050e701f6781mr698593lfc.15.1703321881305; Sat, 23 Dec
 2023 00:58:01 -0800 (PST)
MIME-Version: 1.0
References: <20231222104631.3810007-1-alex@linutronix.de> <20231222104631.3810007-2-alex@linutronix.de>
 <2023122304561596a0e7fb@mail.local>
In-Reply-To: <2023122304561596a0e7fb@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Dec 2023 09:57:51 +0100
Message-ID: <CANNYZj_vi5MSHMSEDhXmoK_w55Voh_ZsO-05eX96=zsH565wtA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] appstream: update 0.16.3 -> 1.0.1
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Dec 2023 08:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192881

Thanks, there's a working patch from Markus that just landed in master.

Alex

On Sat, 23 Dec 2023 at 05:56, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/5512/s=
teps/12/logs/errors
>
> On 22/12/2023 11:46:31+0100, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  ...-meson-do-not-rely-on-an-exe-wrapper.patch | 36 -------------------
> >  .../0001-remove-hardcoded-path.patch          | 28 ++++++++-------
> >  ...appstream_0.16.3.bb =3D> appstream_1.0.1.bb} | 10 +++---
> >  3 files changed, 19 insertions(+), 55 deletions(-)
> >  delete mode 100644 meta/recipes-support/appstream/appstream/0001-meson=
-do-not-rely-on-an-exe-wrapper.patch
> >  rename meta/recipes-support/appstream/{appstream_0.16.3.bb =3D> appstr=
eam_1.0.1.bb} (78%)
> >
> > diff --git a/meta/recipes-support/appstream/appstream/0001-meson-do-not=
-rely-on-an-exe-wrapper.patch b/meta/recipes-support/appstream/appstream/00=
01-meson-do-not-rely-on-an-exe-wrapper.patch
> > deleted file mode 100644
> > index d4f2951e7a9..00000000000
> > --- a/meta/recipes-support/appstream/appstream/0001-meson-do-not-rely-o=
n-an-exe-wrapper.patch
> > +++ /dev/null
> > @@ -1,36 +0,0 @@
> > -From 79bf322768990b28c29a9d907edcca52ff48e0b8 Mon Sep 17 00:00:00 2001
> > -From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau=
@redhat.com>
> > -Date: Wed, 26 Jul 2023 23:21:10 +0400
> > -Subject: meson: do not rely on an exe wrapper
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > -
> > -Upstream-Status: Backport [https://github.com/ximion/appstream/commit/=
79bf322768990b28c29a9d907edcca52ff48e0b8]
> > ----
> > - data/meson.build | 7 +++++++
> > - 1 file changed, 7 insertions(+)
> > -
> > -diff --git a/data/meson.build b/data/meson.build
> > -index aea0cb25..ec0e434f 100644
> > ---- a/data/meson.build
> > -+++ b/data/meson.build
> > -@@ -7,6 +7,13 @@ install_data('its/metainfo.its',
> > - install_data('its/metainfo.loc',
> > -               install_dir: join_paths(get_option('datadir'), 'gettext=
', 'its'))
> > -
> > -+# Do not rely on an exe wrapper for rel-info, use the system one in t=
hat case
> > -+if meson.is_cross_build()
> > -+    dependency('appstream', version: '>=3D' + as_version, native: tru=
e,
> > -+               not_found_message: 'Native appstream required for cros=
s-building')
> > -+    ascli_exe =3D find_program('appstreamcli')
> > -+endif
> > -+
> > - # NOTE: We do not translate the release notes on purpose here.
> > - # If you do want to give translators a chance to translate them,
> > - # ascli news-to-metainfo needs to produce a temporary file to transla=
te
> > ---
> > -2.41.0
> > -
> > diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardc=
oded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hard=
coded-path.patch
> > index 9cbfaca82f1..8f4cf1b82a4 100644
> > --- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-pa=
th.patch
> > +++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-pa=
th.patch
> > @@ -1,4 +1,4 @@
> > -From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 2001
> > +From 93bc5c1b221e5a10c65d4a055181dc818dfe1aa8 Mon Sep 17 00:00:00 2001
> >  From: Markus Volk <f_l_k@t-online.de>
> >  Date: Mon, 12 Dec 2022 15:42:42 +0100
> >  Subject: [PATCH] remove hardcoded path
> > @@ -9,23 +9,25 @@ Dont include hardcoded path. This fixes:
> >  | cc1: error: include location "/usr/include" is unsafe for cross-comp=
ilation [-Werror=3Dpoison-system-directories]
> >
> >  Upstream-Status: Inappropriate [oe-specific]
> > +
> >  ---
> > - meson.build       | 2 +-
> > - 1 files changed, 1 insertions(+), 1 deletions(-)
> > + meson.build | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/meson.build b/meson.build
> > -index fd0e3373..2f273ada 100644
> > +index 0556b1e..d66919f 100644
> >  --- a/meson.build
> >  +++ b/meson.build
> > -@@ -124,7 +124,7 @@ if get_option ('gir')
> > -     dependency('gobject-introspection-1.0', version: '>=3D1.56')
> > - endif
> > -
> > --stemmer_inc_dirs =3D include_directories(['/usr/include'])
> > -+stemmer_inc_dirs =3D include_directories([''])
> > +@@ -185,10 +185,10 @@ endif
> > + stemmer_inc_dirs =3D include_directories()
> >   if get_option('stemming')
> >       stemmer_lib =3D cc.find_library('stemmer', required: true)
> > +-    stemmer_inc_dirs =3D include_directories(['/usr/include'])
> > ++    stemmer_inc_dirs =3D include_directories()
> >       if not cc.has_header('libstemmer.h')
> > ---
> > -2.34.1
> > -
> > +         if cc.has_header('libstemmer/libstemmer.h')
> > +-            stemmer_inc_dirs =3D include_directories('/usr/include/li=
bstemmer')
> > ++            stemmer_inc_dirs =3D include_directories()
> > +         else
> > +             error('Unable to find Snowball header "libstemmer.h". Ple=
ase ensure libstemmer/Snowball is installed properly in order to continue.'=
)
> > +         endif
> > diff --git a/meta/recipes-support/appstream/appstream_0.16.3.bb b/meta/=
recipes-support/appstream/appstream_1.0.1.bb
> > similarity index 78%
> > rename from meta/recipes-support/appstream/appstream_0.16.3.bb
> > rename to meta/recipes-support/appstream/appstream_1.0.1.bb
> > index bde679e256a..7723800bab8 100644
> > --- a/meta/recipes-support/appstream/appstream_0.16.3.bb
> > +++ b/meta/recipes-support/appstream/appstream_1.0.1.bb
> > @@ -24,12 +24,10 @@ inherit meson gobject-introspection gettext gtk-doc=
 pkgconfig vala
> >  GIR_MESON_OPTION =3D "gir"
> >  GTKDOC_MESON_OPTION =3D "apidocs"
> >
> > -SRC_URI =3D " \
> > -     https://www.freedesktop.org/software/appstream/releases/AppStream=
-${PV}.tar.xz \
> > -     file://0001-remove-hardcoded-path.patch \
> > -     file://0001-meson-do-not-rely-on-an-exe-wrapper.patch \
> > -"
> > -SRC_URI[sha256sum] =3D "081c917646e94d7221c9e4aae54dacda95a27c607fa93c=
d8e6344a2b318b98b1"
> > +SRC_URI =3D "https://www.freedesktop.org/software/appstream/releases/A=
ppStream-${PV}.tar.xz \
> > +           file://0001-remove-hardcoded-path.patch \
> > +           "
> > +SRC_URI[sha256sum] =3D "fa4d5994e5c6f22e9b66cb0b52e8b5f5d96e7353ea5528=
b56436e0150829203b"
> >
> >  S =3D "${WORKDIR}/AppStream-${PV}"
> >
> > --
> > 2.39.2
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#192869): https://lists.openembedded.org/g/openembed=
ded-core/message/192869
> > Mute This Topic: https://lists.openembedded.org/mt/103316474/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

