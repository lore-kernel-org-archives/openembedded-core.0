Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD46EE14D8
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 06:38:49 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.13216.1695710321405181642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 23:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FtMEQJRv;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c124adf469so135641011fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 23:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695710319; x=1696315119; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xXqpmBzxGsJ/006S2kVoVMmgBFrsGMwMMljYGW/tvM=;
        b=FtMEQJRvDqF4nONoC2dDZdOOwKN/UQaA80qJw/UVINZhKJkIdDreR1d3RbACfRVv7S
         AO6VEepdUwkTyeStCH5jkk4dFZQ+a2lg7Qnnh32M9f4qkSHfWLC4AfPOlN/tikWYVMt2
         6rdaV1ePurUches43+EMkZHNU1GgPgvuupWubJffo2CsM0Vlyjk0IPkl5idyGZJiQBuB
         KlA6/wBW1iXLZh/JiDGcykUvkcsVPkqo0wVjGSZMckGRqcazms16dvttFaCddyXOSjKA
         A9Qp0w/JsDkkACmz/ySteLYFjvZoDyYwXXb+jvGdI8awk12VSS4RgKdYG03I7+4I8KtB
         c/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695710319; x=1696315119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xXqpmBzxGsJ/006S2kVoVMmgBFrsGMwMMljYGW/tvM=;
        b=rQ6vXD1lbAlC4EO8ce4Mifk/GN72gruVV6wMcFcB9DLSaTHmc9RJoeTq52vv0PjWmc
         mwHfCAurdZH7H7mE52mG5WFEvE6Xkiiu7bBmJv8YO4fF3chhDpZuZlun/tJDIFya6UXh
         g7r4dmH860VM/+wKgjrhrWwWzv82ra2LFr44LZNG8cuLwBu2um1rzJrvIFx1lgJp1dzn
         P2Btsu27pxX6JB3ZFotJ5AxdiLLfdq495sH1K1rcIO2DR2CZS2jByqiBFtHeNgts9flA
         MvbwmnoMgPqDrqnSnRqCpOl/5mRADpQuLrlS6fF4nmZpSKwb4Iw4k99u4wqMyrVhAmLz
         qXMw==
X-Gm-Message-State: AOJu0YwEdVgpbpi/z0GbFbBVcRLYmMBUI2CdjgXBazfMno7RioLceQ4o
	EKzy/Ml87i+immDn6yNxKI5bGSL3g4Z7uou/dwg=
X-Google-Smtp-Source: AGHT+IFJRSV0vC/pvRdej92aSnrLyeTd+NLMIVYI7u7f2o+LlQXyaByFjcne+I+u3YyPMP+gviVJAdbYK0ZPkRGH5TY=
X-Received: by 2002:a2e:9c50:0:b0:2bc:e51d:89a3 with SMTP id
 t16-20020a2e9c50000000b002bce51d89a3mr7612555ljj.29.1695710319125; Mon, 25
 Sep 2023 23:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230922103954.1738810-1-f_l_k@t-online.de> <202309252203050a51bfa1@mail.local>
In-Reply-To: <202309252203050a51bfa1@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Sep 2023 08:38:27 +0200
Message-ID: <CANNYZj97yoZVqhT5tBNBKb-ApY6XhUq-yPza3vdccGYTe8ayiA@mail.gmail.com>
Subject: Re: [oe-core][PATCHv7] vte: upgrade 2.72.2 -> 2.74.0
To: alexandre.belloni@bootlin.com
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 06:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188218

"|   thread 'main' panicked at 'TARGET x86_64-poky-linux-gnux32-gnu is
not a builtin target, and it could not be parsed as a valid triplet:
Unrecognized binary format: gnu',
/home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x32=
-poky-linux-gnux32/librsvg/2.56.3/cargo_home/bitbake/system-deps-6.1.1/src/=
lib.rs:868:94"

The same failure already happens in master; vte merely adds a
dependency that exposes it on the AB (and vte is not, in itself,
guilty of it).

Looks like rust triplet handling isn't correctly done on x32.

Alex

On Tue, 26 Sept 2023 at 00:03, Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> It was not clear to me but I'm fairly sure this is what causes this
> failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/7719/st=
eps/12/logs/stdio
>
> On 22/09/2023 12:39:51+0200, Markus Volk wrote:
> > Rework recipe
> >
> > - remove legacy of the autotools buildsystem
> > - remove BBCLASSEXTEND
> > - build       vapi dependent on gi-data
> > - docs require gir, add       a EXTRA_OEMESON:append to avoid fail in
> >   a combination       where docs=3Dtrue and gir=3Dfalse
> > - gtk+3 and gtk4 are requested by default-> add gtk4 depending
> >   on DISTRO_FEATURE
> > - install systemd support files       depending on DISTRO_FEATURE
> > - update 0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  ...EXITCODE-macro-for-non-glibc-systems.patch | 35 ++++++++-----------
> >  .../vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb}      | 29 ++++++---------
> >  2 files changed, 25 insertions(+), 39 deletions(-)
> >  rename meta/recipes-support/vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb} (67=
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
> > similarity index 67%
> > rename from meta/recipes-support/vte/vte_0.72.2.bb
> > rename to meta/recipes-support/vte/vte_0.74.0.bb
> > index 4249b75ac0..aeaf088598 100644
> > --- a/meta/recipes-support/vte/vte_0.72.2.bb
> > +++ b/meta/recipes-support/vte/vte_0.74.0.bb
> > @@ -17,32 +17,27 @@ GNOMEBASEBUILDCLASS =3D "meson"
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
> > +PACKAGECONFIG ??=3D " \
> > +     gnutls \
> > +     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> > +     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gtk4', '', d)}=
 \
> > +"
> > +PACKAGECONFIG[gtk4] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4"
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
> > @@ -50,5 +45,3 @@ FILES:${PN}-prompt =3D " \
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
> View/Reply Online (#188212): https://lists.openembedded.org/g/openembedde=
d-core/message/188212
> Mute This Topic: https://lists.openembedded.org/mt/101518552/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

