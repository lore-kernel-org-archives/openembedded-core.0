Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0592CC48BFA
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 13:42:30 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.13352.1700055747683737575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 05:42:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ux3uHdoE;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c594196344so88170021fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 05:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700055745; x=1700660545; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Npz3xxi7v4n3EjNZxhztEhJYHH9McnFtqWxezrjBoRw=;
        b=Ux3uHdoEuWSC/+uEhJo3LBreYtUJBYS0vRj3HLx8N/y47tF+4SD4NQCIK5SoRmQIae
         CB2kgUk6iiid6CcrJW/P0ybE4qNNGbgJvp+M5bR/a5kpkHus31uQtR01+tXVwTAl1ean
         WzkzBy+1JOb3ir0V+VajTtOr2MvbZv/tsgmzc00jojq4jhNvMkweh8QPl3wLMjavmjMV
         sGHdixscDWscNiG9S+2/MqRhS46ZZW8DuwXowM710uEL+fOWOfQ7GpcBPW/cS7qWPsC6
         dhmTKQgMjKfbfzRcKinRxW6wxN9UwU+660p7/bUNpXoMrXy+yznSH5lW9gIN85nviuGG
         K2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700055745; x=1700660545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Npz3xxi7v4n3EjNZxhztEhJYHH9McnFtqWxezrjBoRw=;
        b=NkxHNf0PsjyXjPy1WehO4r1JW3wBlz0JdD+kv8N/XBO18b234cwsbqxVdUsdLGnOM3
         ndFE3dZczaqVjCp5o42f8S9nWgR3EhczhJuObkWuZeQ2f2jUX9q+npdTxiMJbY+2kAup
         9JWemrjE8iNn1uIjQ772hRZDTOZSftJ+5ygWQPR52ifTu2xgIjrO8WWwD81pHTzItzdX
         54edObHvTy2IAGK+F4/odUM2YNVS8toLl/O5aeROpzlaLlnNdJr904FbVOLkFajhBPo0
         d58z5/p/w8ftJ3pFSLsTDEUxGIg5diEaUmoMu+zFrV6C47DuJkeRVisoQZ7uapBwbzwf
         iFEA==
X-Gm-Message-State: AOJu0YxKfceObZ8EJ4PmG4300lkqu/ouP82kHQi5GCTi6+NPBqKonBoC
	ZGsy6nVTlUybzTfkIB5Nt5+Wwq9hmS0bxXmy7uY=
X-Google-Smtp-Source: AGHT+IESO7TAl/mtYcoJZFrFMHdKlDnXMcgqeFY4I09T5vygw0QMEuLevH8FObvIErFwxNmBczOd2WGS7jwfEd9CCMM=
X-Received: by 2002:a2e:b5d0:0:b0:2c8:3613:d07c with SMTP id
 g16-20020a2eb5d0000000b002c83613d07cmr3341398ljn.12.1700055745337; Wed, 15
 Nov 2023 05:42:25 -0800 (PST)
MIME-Version: 1.0
References: <20231114215335.1308211-1-raj.khem@gmail.com> <2023111510065022f67321@mail.local>
In-Reply-To: <2023111510065022f67321@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Nov 2023 14:42:13 +0100
Message-ID: <CANNYZj8joL0MDw+i5zcB9xYH0bHD4Gt8YbPBQutOczp0j0dKAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vte: Upgrade to 0.74.1
To: alexandre.belloni@bootlin.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 13:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190597

Please note also the earlier patch by Markus Volk, we nearly got it to
merging until a snag with rust on x32. I suspect that snag may have
been resolved since, and in any case I suggest you Khem take that
patch instead and push it forward, it's nearly ready unlike this one.

Alex

On Wed, 15 Nov 2023 at 11:06, Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> The added dependency fails on the AB:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6196/st=
eps/13/logs/warnings
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/8464/st=
eps/12/logs/warnings
> https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/8169/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/8168/st=
eps/20/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/8114/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/7488/st=
eps/12/logs/warnings
>
> On 14/11/2023 13:53:29-0800, Khem Raj wrote:
> > * Enable systemd knob for distros with systemd in them.
> > * Add dependency on gtk4 which is needed
> > * Package systemd unit files
> > * Add packageconfig for fribidi defaulted to disabled
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...01-Add-W_EXITCODE-macro-for-non-glibc-systems.patch |  4 ++--
> >  .../vte/{vte_0.72.2.bb =3D> vte_0.74.1.bb}               | 10 ++++++--=
--
> >  2 files changed, 8 insertions(+), 6 deletions(-)
> >  rename meta/recipes-support/vte/{vte_0.72.2.bb =3D> vte_0.74.1.bb} (80=
%)
> >
> > diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for=
-non-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE=
-macro-for-non-glibc-systems.patch
> > index b4100fc381e..daf07bfd3c9 100644
> > --- a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-gl=
ibc-systems.patch
> > +++ b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-gl=
ibc-systems.patch
> > @@ -19,7 +19,7 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gma=
il.com>
> >
> >  --- a/src/missing.hh
> >  +++ b/src/missing.hh
> > -@@ -24,6 +24,10 @@
> > +@@ -43,6 +43,10 @@
> >   #define NSIG (8 * sizeof(sigset_t))
> >   #endif
> >
> > @@ -27,7 +27,7 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gma=
il.com>
> >  +#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
> >  +#endif
> >  +
> > - #ifndef HAVE_FDWALK
> > + #if !HAVE_FDWALK
> >   int fdwalk(int (*cb)(void* data, int fd),
> >              void* data);
> >  --- a/src/widget.cc
> > diff --git a/meta/recipes-support/vte/vte_0.72.2.bb b/meta/recipes-supp=
ort/vte/vte_0.74.1.bb
> > similarity index 80%
> > rename from meta/recipes-support/vte/vte_0.72.2.bb
> > rename to meta/recipes-support/vte/vte_0.74.1.bb
> > index 44e71491f62..2f0448edb3c 100644
> > --- a/meta/recipes-support/vte/vte_0.72.2.bb
> > +++ b/meta/recipes-support/vte/vte_0.74.1.bb
> > @@ -11,16 +11,16 @@ LIC_FILES_CHKSUM =3D " \
> >      file://COPYING.XTERM;md5=3Dd7fc3a23c16c039afafe2e042030f057 \
> >  "
> >
> > -DEPENDS =3D "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gp=
erf-native icu"
> > +DEPENDS =3D "glib-2.0 glib-2.0-native gtk+3 gtk4 libpcre2 libxml2-nati=
ve gperf-native icu"
> >
> >  GIR_MESON_OPTION =3D 'gir'
> >  GIDOCGEN_MESON_OPTION =3D "docs"
> >
> > -inherit gnomebase gi-docgen features_check upstream-version-is-even go=
bject-introspection
> > +inherit gnomebase gi-docgen features_check upstream-version-is-even go=
bject-introspection systemd
> >
> >  # vapigen.m4 is required when vala is not present (but the one from va=
la should be used normally)
> >  SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.p=
atch"
> > -SRC_URI[archive.sha256sum] =3D "f7966fd185a6981f53964162b71cfef7e60649=
5155d6f5827b72aa0dd6741c9e"
> > +SRC_URI[archive.sha256sum] =3D "2328c3f1c998350a18e0e513348e9fc581d57e=
a4e7b89aedf11e0e3c65042b4f"
> >
> >  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> >
> > @@ -32,8 +32,9 @@ do_compile:prepend() {
> >  # Package additional files
> >  FILES:${PN}-dev +=3D "${datadir}/vala/vapi/*"
> >
> > -PACKAGECONFIG ??=3D "gnutls"
> > +PACKAGECONFIG ??=3D "gnutls ${@bb.utils.filter('DISTRO_FEATURES', 'sys=
temd', d)}"
> >  PACKAGECONFIG[vala] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse,vala-native vala=
"
> > +PACKAGECONFIG[fribidi] =3D "-Dfribidi=3Dtrue,-Dfribidi=3Dfalse,fribidi=
"
> >  PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
> >  PACKAGECONFIG[systemd] =3D "-D_systemd=3Dtrue,-D_systemd=3Dfalse,syste=
md"
> >  # vala requires gir
> > @@ -42,6 +43,7 @@ PACKAGECONFIG:remove:class-native =3D "vala"
> >  CFLAGS +=3D "-D_GNU_SOURCE"
> >
> >  PACKAGES =3D+ "libvte ${PN}-prompt"
> > +FILES:${PN} +=3D "${systemd_user_unitdir}"
> >  FILES:libvte =3D "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
> >  FILES:${PN}-prompt =3D " \
> >      ${sysconfdir}/profile.d \
> > --
> > 2.42.1
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190581): https://lists.openembedded.org/g/openembedde=
d-core/message/190581
> Mute This Topic: https://lists.openembedded.org/mt/102593386/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

