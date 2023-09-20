Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35C3C04ABF
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 17:52:48 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.2253.1695232365308880507
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 10:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SrPGqX/Q;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c123eed8b2so1267831fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 10:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695232363; x=1695837163; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hGZIVQQeLmmy3icl8CRIz5ZRuwuJgWuqehcgWvWaIQ=;
        b=SrPGqX/QePspqjrcp6w3pgj0uMwKQHNHpY8JE3Z0aRGqn7DyIvPPD9xXggShG9kkuJ
         huPhKmNhzZ2FF3NAsZqCXXYyqbwzYCi5ft6CO0Bmtzpb6vfc++VUN1gV4JvQtdnz2buR
         XaQsvjALubcbq6wAbJbSz83xNkGCI9ckB9Tl8OVLvs3fXloHY/vgoVKMNP8vJFYcgB4F
         X1p0n/wdLzeBdYA99CrpVO73u9M9E8vkx+jN/YzlvfdYZSAPATDWXxn3YlDGxHBmdDPD
         LEVJT79oZ5WElpWWSrGQZjWDGX1Pb5gL6H0+knPiVSOTcZ+j130PNQIjEVNdVc8QLb2M
         iagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695232363; x=1695837163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hGZIVQQeLmmy3icl8CRIz5ZRuwuJgWuqehcgWvWaIQ=;
        b=eSIq9xH/MtryDELAV39kvIgSk6XwBlzeKvDJViJoypZjGIOSy2zXOqkAShvAxjCEDJ
         K2yMwQYkomey/B+TTyYWPddjzBPuZSUsJx7B3Ly0XUMpFridLPLAPng2pVFmdyiKCyMP
         Idb3Wy3D1WlcgzvcOBQJ9xUgYLYqERIICLGhierbvYrWRkkPNiV32p9mYB8yERVaWQp+
         xtX05RCY85FHnHeBPO3o+ddoDpfNmZ4A3d75HR1Ulr1Fj6Xx0QR94Yd65f0ac9K6cu30
         xgyfKXCVqwxfYLb7SrVY8wpL3IGjdLwGP4i9ubrcrC5PXqLpcKEwPqUFahLZ4bSCgE2h
         lJ7w==
X-Gm-Message-State: AOJu0YxMPN2jnit9mVcZSLDNNa91ah/K5SEy9PgHmMKHZrDtuUeDSh9E
	mF1x9VOPfXyGDIJW92z3aluey7wMriOweIAoLBo=
X-Google-Smtp-Source: AGHT+IFIIbv4x1CxfX+dRO2kkLyta17idj8Pkve+H9DBzf+4U0k2MmlyyM8kjHvtQnvdpjGG59JYardK64/H0IriA78=
X-Received: by 2002:a2e:99ca:0:b0:2c0:1fe2:15fd with SMTP id
 l10-20020a2e99ca000000b002c01fe215fdmr3243484ljj.20.1695232363136; Wed, 20
 Sep 2023 10:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230920100440.966479-1-f_l_k@t-online.de> <2023092016401074583386@mail.local>
In-Reply-To: <2023092016401074583386@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Sep 2023 19:52:31 +0200
Message-ID: <CANNYZj-LK0ekhT_DWTJiVLhsSz=gP-JxOB233Rt2smo2GB2rzg@mail.gmail.com>
Subject: Re: [oe-core][PATCHv5] vte: upgrade 2.72.2 -> 2.74.0
To: alexandre.belloni@bootlin.com
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 17:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187935

I think the vte recipe needs
REQUIRED_DISTRO_FEATURES =3D "opengl"

Alex

On Wed, 20 Sept 2023 at 18:40, Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> This fails in oe-core:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/7808/st=
eps/11/logs/stdio
>
> ERROR: Nothing PROVIDES 'gtk4' (but /home/pokybuild/yocto-worker/qemuarm-=
oecore/build/meta/recipes-support/vte/vte_0.74.0.bb DEPENDS on or otherwise=
 requires it)
>
> On 20/09/2023 12:04:38+0200, Markus Volk wrote:
> > Rework recipe
> >
> > - remove legacy of the autotools buildsystem
> > - remove BBCLASSEXTEND
> > - build       vapi dependent on gi-data
> > - docs require gir, add       a EXTRA_OEMESON:append to avoid fail in
> >   a combination       where docs=3Dtrue and gir=3Dfalse
> > - gtk+3 and gtk4 are requested by default-> add gtk4 dependency
> > - install systemd support files       depending on DISTRO_FEATURE
> > - update 0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  ...EXITCODE-macro-for-non-glibc-systems.patch | 35 ++++++++-----------
> >  .../vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb}      | 26 ++++----------
> >  2 files changed, 21 insertions(+), 40 deletions(-)
> >  rename meta/recipes-support/vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb} (62=
%)
> >
> > diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for=
-non-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE=
-macro-for-non-glibc-systems.patch
> > index b4100fc381..8934d5f80a 100644
> > --- a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-gl=
ibc-systems.patch
> > +++ b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-gl=
ibc-systems.patch
> > @@ -11,32 +11,25 @@ Upstream-Status: Submitted [1]
> >  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> >
> >  [1] https://gitlab.gnome.org/GNOME/vte/issues/72
> > -
> >  ---
> > - src/missing.hh | 4 ++++
> > - src/widget.cc  | 1 +
> > - 2 files changed, 5 insertions(+)
> > + src/widget.cc  | 4 +++
> > + 1 files changed, 4 insertions(+)
> >
> > ---- a/src/missing.hh
> > -+++ b/src/missing.hh
> > -@@ -24,6 +24,10 @@
> > - #define NSIG (8 * sizeof(sigset_t))
> > - #endif
> > +diff --git a/src/widget.cc b/src/widget.cc
> > +index 07f7cabf..31a77f68 100644
> > +--- a/src/widget.cc
> > ++++ b/src/widget.cc
> > +@@ -16,6 +16,10 @@
> > +  * along with this library.  If not, see <https://www.gnu.org/license=
s/>.
> > +  */
> >
> >  +#ifndef W_EXITCODE
> >  +#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
> >  +#endif
> >  +
> > - #ifndef HAVE_FDWALK
> > - int fdwalk(int (*cb)(void* data, int fd),
> > -            void* data);
> > ---- a/src/widget.cc
> > -+++ b/src/widget.cc
> > -@@ -21,6 +21,7 @@
> > - #include "widget.hh"
> > -
> > - #include <sys/wait.h> // for W_EXITCODE
> > -+#include "missing.hh" // for W_EXITCODE on non-glibc systems
> > + #include "config.h"
> >
> > - #include <exception>
> > - #include <new>
> > + #include "widget.hh"
> > +--
> > +2.42.0
> > +
> > diff --git a/meta/recipes-support/vte/vte_0.72.2.bb b/meta/recipes-supp=
ort/vte/vte_0.74.0.bb
> > similarity index 62%
> > rename from meta/recipes-support/vte/vte_0.72.2.bb
> > rename to meta/recipes-support/vte/vte_0.74.0.bb
> > index 4249b75ac0..cfb232ce98 100644
> > --- a/meta/recipes-support/vte/vte_0.72.2.bb
> > +++ b/meta/recipes-support/vte/vte_0.74.0.bb
> > @@ -11,38 +11,28 @@ LIC_FILES_CHKSUM =3D " \
> >      file://COPYING.XTERM;md5=3Dd7fc3a23c16c039afafe2e042030f057 \
> >  "
> >
> > -DEPENDS =3D "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gp=
erf-native icu"
> > +DEPENDS =3D "glib-2.0 glib-2.0-native gtk+3 gtk4 libpcre2 libxml2-nati=
ve gperf-native icu"
> >
> >  GNOMEBASEBUILDCLASS =3D "meson"
> >  GIR_MESON_OPTION =3D 'gir'
> >  GIDOCGEN_MESON_OPTION =3D "docs"
> >
> > -inherit gnomebase gi-docgen features_check upstream-version-is-even go=
bject-introspection
> > +inherit gnomebase gi-docgen features_check upstream-version-is-even go=
bject-introspection vala
> >
> > -# vapigen.m4 is required when vala is not present (but the one from va=
la should be used normally)
> >  SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.p=
atch"
> > -SRC_URI[archive.sha256sum] =3D "f7966fd185a6981f53964162b71cfef7e60649=
5155d6f5827b72aa0dd6741c9e"
> > +SRC_URI[archive.sha256sum] =3D "9ae08f777952ba793221152d360550451580f4=
2d3b570e3341ebb6841984c76b"
> >
> >  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> >
> > -# Help g-ir-scanner find the .so for linking
> > -do_compile:prepend() {
> > -    export GIR_EXTRA_LIBS_PATH=3D"${B}/src/.libs"
> > -}
> > +EXTRA_OEMESON +=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-=
Dvapi=3Dtrue', '-Dvapi=3Dfalse', d)}"
> > +EXTRA_OEMESON:append =3D " ${@bb.utils.contains('GI_DATA_ENABLED', 'Fa=
lse', '-Ddocs=3Dfalse', '', d)}"
> >
> > -# Package additional files
> > -FILES:${PN}-dev +=3D "${datadir}/vala/vapi/*"
> > -
> > -PACKAGECONFIG ??=3D "gnutls"
> > -PACKAGECONFIG[vala] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse,vala-native vala=
"
> > +PACKAGECONFIG ??=3D "gnutls ${@bb.utils.filter('DISTRO_FEATURES', 'sys=
temd', d)}"
> >  PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
> >  PACKAGECONFIG[systemd] =3D "-D_systemd=3Dtrue,-D_systemd=3Dfalse,syste=
md"
> > -# vala requires gir
> > -PACKAGECONFIG:remove:class-native =3D "vala"
> > -
> > -CFLAGS +=3D "-D_GNU_SOURCE"
> >
> >  PACKAGES =3D+ "libvte ${PN}-prompt"
> > +FILES:${PN} +=3D"${systemd_user_unitdir}"
> >  FILES:libvte =3D "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
> >  FILES:${PN}-prompt =3D " \
> >      ${sysconfdir}/profile.d \
> > @@ -50,5 +40,3 @@ FILES:${PN}-prompt =3D " \
> >  "
> >
> >  FILES:${PN}-dev +=3D "${datadir}/glade/"
> > -
> > -BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.42.0
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
> View/Reply Online (#187933): https://lists.openembedded.org/g/openembedde=
d-core/message/187933
> Mute This Topic: https://lists.openembedded.org/mt/101475208/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

