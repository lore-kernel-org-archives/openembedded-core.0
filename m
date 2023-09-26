Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC02EE3F2A
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 06:43:19 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.13262.1695710590795155742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 23:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lydb/mxm;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50306b2920dso9807037e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 23:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695710589; x=1696315389; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbzyybwPB6zSi93PUqxlJNvaRdlX0H37cHsJuux26JE=;
        b=lydb/mxmetYohSGubYiGMklHWCX7LUp2fC7pcOQDSTIVMghgn2ATvVi3pG1J3kN9/u
         flzW4JoFTMsGhq1+2bsQdRVbbiy+2YykX/9T+tkB27oQ4gk2OvXHr8D7nmNd3SY/RBob
         YgoFunvdvp2MCXi1+09D21DtCYP25HnEwVpLxjC6xM9DOyxsTOYpKuHgPi8g7jPYKOGz
         lJ1ZArWWiBtS6lb9MlM00UD6c1lSsqiUiSH9P+2VVQcrStqyKhp2j2LqnsbUMNJ9Gupl
         dcYTqsm83fMuB/MOoTgISMgQ43Xm4y115ORDTDaVe2KAFFpdUxejbLV8lcadZjpfzVJe
         in4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695710589; x=1696315389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HbzyybwPB6zSi93PUqxlJNvaRdlX0H37cHsJuux26JE=;
        b=JAFOEZjzgk2UaFD2lfziGJQdyXBX/L2UOohZYI693jdpyyP7lZ0gWUKhEW/bayxXZr
         P974gToGIHdHvPMWdJimohlSLhJ2Xybwl5Jw0q/WIEnAjMEIIaA5HiqVpdh+WKEgvc85
         M9vtQGLeVVMtoAhfhyV1RF2YUM10WsCAVLnsnXgPRBVGgykV9/m5V53ht8rIFcYYZYpA
         t0zEEfS63m1nEsL2a+Yt8E0X0oPBFiaACw35fH55Y52lMiDBeugINqNGMMPhITx4P8IL
         iS1zhUXoW6eW5artD7bHTu8+wY/6Qfld1qeVFgRjG0QWgI/T80IJjP2pdIltIldYLz77
         IWxQ==
X-Gm-Message-State: AOJu0Yy2dBZnNCvBH9S09lCo/2QZjV9vX8EOlWLB2SfjsRqQGHH720Tu
	swyvMDO2M+AoE3dpvGjb5absxcqheLNFyCSGsaEebsG9Pp8=
X-Google-Smtp-Source: AGHT+IGF5u2juGtYpdUkU70Npi664Su0wX3uQBHc5Q77DwN0XNFYDvE2o74sNUTTXkDfXGV3cCRUcVI1uHbdj3WEjb0=
X-Received: by 2002:a05:6512:b1b:b0:504:567a:19a7 with SMTP id
 w27-20020a0565120b1b00b00504567a19a7mr599913lfu.2.1695710588698; Mon, 25 Sep
 2023 23:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230922103954.1738810-1-f_l_k@t-online.de> <202309252203050a51bfa1@mail.local>
 <17885F8DB02ED3EE.16687@lists.openembedded.org>
In-Reply-To: <17885F8DB02ED3EE.16687@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Sep 2023 08:42:57 +0200
Message-ID: <CANNYZj_TA_dAoy1CAbmCbHB7LwSOtRPa32kGD7gxFYnp69dwMA@mail.gmail.com>
Subject: Re: [oe-core][PATCHv7] vte: upgrade 2.72.2 -> 2.74.0
To: alex.kanavin@gmail.com
Cc: alexandre.belloni@bootlin.com, Markus Volk <f_l_k@t-online.de>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 06:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188219

To reproduce:

local.conf:
DEFAULTTUNE =3D "x86-64-x32"
baselib =3D "lib32"

bitbake -c install librsvg

Alex


On Tue, 26 Sept 2023 at 08:38, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> "|   thread 'main' panicked at 'TARGET x86_64-poky-linux-gnux32-gnu is
> not a builtin target, and it could not be parsed as a valid triplet:
> Unrecognized binary format: gnu',
> /home/pokybuild/yocto-worker/qemux86-64-x32/build/build/tmp/work/x86_64_x=
32-poky-linux-gnux32/librsvg/2.56.3/cargo_home/bitbake/system-deps-6.1.1/sr=
c/lib.rs:868:94"
>
> The same failure already happens in master; vte merely adds a
> dependency that exposes it on the AB (and vte is not, in itself,
> guilty of it).
>
> Looks like rust triplet handling isn't correctly done on x32.
>
> Alex
>
> On Tue, 26 Sept 2023 at 00:03, Alexandre Belloni via
> lists.openembedded.org
> <alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > Hello,
> >
> > It was not clear to me but I'm fairly sure this is what causes this
> > failure:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/7719/=
steps/12/logs/stdio
> >
> > On 22/09/2023 12:39:51+0200, Markus Volk wrote:
> > > Rework recipe
> > >
> > > - remove legacy of the autotools buildsystem
> > > - remove BBCLASSEXTEND
> > > - build       vapi dependent on gi-data
> > > - docs require gir, add       a EXTRA_OEMESON:append to avoid fail in
> > >   a combination       where docs=3Dtrue and gir=3Dfalse
> > > - gtk+3 and gtk4 are requested by default-> add gtk4 depending
> > >   on DISTRO_FEATURE
> > > - install systemd support files       depending on DISTRO_FEATURE
> > > - update 0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
> > >
> > > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > > ---
> > >  ...EXITCODE-macro-for-non-glibc-systems.patch | 35 ++++++++---------=
--
> > >  .../vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb}      | 29 ++++++---------
> > >  2 files changed, 25 insertions(+), 39 deletions(-)
> > >  rename meta/recipes-support/vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb} (=
67%)
> > >
> > > diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-f=
or-non-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCO=
DE-macro-for-non-glibc-systems.patch
> > > index b4100fc381..8934d5f80a 100644
> > > --- a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-=
glibc-systems.patch
> > > +++ b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-=
glibc-systems.patch
> > > @@ -11,32 +11,25 @@ Upstream-Status: Submitted [1]
> > >  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > >
> > >  [1] https://gitlab.gnome.org/GNOME/vte/issues/72
> > > -
> > >  ---
> > > - src/missing.hh | 4 ++++
> > > - src/widget.cc  | 1 +
> > > - 2 files changed, 5 insertions(+)
> > > + src/widget.cc  | 4 +++
> > > + 1 files changed, 4 insertions(+)
> > >
> > > ---- a/src/missing.hh
> > > -+++ b/src/missing.hh
> > > -@@ -24,6 +24,10 @@
> > > - #define NSIG (8 * sizeof(sigset_t))
> > > - #endif
> > > +diff --git a/src/widget.cc b/src/widget.cc
> > > +index 07f7cabf..31a77f68 100644
> > > +--- a/src/widget.cc
> > > ++++ b/src/widget.cc
> > > +@@ -16,6 +16,10 @@
> > > +  * along with this library.  If not, see <https://www.gnu.org/licen=
ses/>.
> > > +  */
> > >
> > >  +#ifndef W_EXITCODE
> > >  +#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
> > >  +#endif
> > >  +
> > > - #ifndef HAVE_FDWALK
> > > - int fdwalk(int (*cb)(void* data, int fd),
> > > -            void* data);
> > > ---- a/src/widget.cc
> > > -+++ b/src/widget.cc
> > > -@@ -21,6 +21,7 @@
> > > - #include "widget.hh"
> > > -
> > > - #include <sys/wait.h> // for W_EXITCODE
> > > -+#include "missing.hh" // for W_EXITCODE on non-glibc systems
> > > + #include "config.h"
> > >
> > > - #include <exception>
> > > - #include <new>
> > > + #include "widget.hh"
> > > +--
> > > +2.42.0
> > > +
> > > diff --git a/meta/recipes-support/vte/vte_0.72.2.bb b/meta/recipes-su=
pport/vte/vte_0.74.0.bb
> > > similarity index 67%
> > > rename from meta/recipes-support/vte/vte_0.72.2.bb
> > > rename to meta/recipes-support/vte/vte_0.74.0.bb
> > > index 4249b75ac0..aeaf088598 100644
> > > --- a/meta/recipes-support/vte/vte_0.72.2.bb
> > > +++ b/meta/recipes-support/vte/vte_0.74.0.bb
> > > @@ -17,32 +17,27 @@ GNOMEBASEBUILDCLASS =3D "meson"
> > >  GIR_MESON_OPTION =3D 'gir'
> > >  GIDOCGEN_MESON_OPTION =3D "docs"
> > >
> > > -inherit gnomebase gi-docgen features_check upstream-version-is-even =
gobject-introspection
> > > +inherit gnomebase gi-docgen features_check upstream-version-is-even =
gobject-introspection vala
> > >
> > > -# vapigen.m4 is required when vala is not present (but the one from =
vala should be used normally)
> > >  SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems=
.patch"
> > > -SRC_URI[archive.sha256sum] =3D "f7966fd185a6981f53964162b71cfef7e606=
495155d6f5827b72aa0dd6741c9e"
> > > +SRC_URI[archive.sha256sum] =3D "9ae08f777952ba793221152d360550451580=
f42d3b570e3341ebb6841984c76b"
> > >
> > >  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> > >
> > > -# Help g-ir-scanner find the .so for linking
> > > -do_compile:prepend() {
> > > -    export GIR_EXTRA_LIBS_PATH=3D"${B}/src/.libs"
> > > -}
> > > +EXTRA_OEMESON +=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', =
'-Dvapi=3Dtrue', '-Dvapi=3Dfalse', d)}"
> > > +EXTRA_OEMESON:append =3D " ${@bb.utils.contains('GI_DATA_ENABLED', '=
False', '-Ddocs=3Dfalse', '', d)}"
> > >
> > > -# Package additional files
> > > -FILES:${PN}-dev +=3D "${datadir}/vala/vapi/*"
> > > -
> > > -PACKAGECONFIG ??=3D "gnutls"
> > > -PACKAGECONFIG[vala] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse,vala-native va=
la"
> > > +PACKAGECONFIG ??=3D " \
> > > +     gnutls \
> > > +     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> > > +     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gtk4', '', d=
)} \
> > > +"
> > > +PACKAGECONFIG[gtk4] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4"
> > >  PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
> > >  PACKAGECONFIG[systemd] =3D "-D_systemd=3Dtrue,-D_systemd=3Dfalse,sys=
temd"
> > > -# vala requires gir
> > > -PACKAGECONFIG:remove:class-native =3D "vala"
> > > -
> > > -CFLAGS +=3D "-D_GNU_SOURCE"
> > >
> > >  PACKAGES =3D+ "libvte ${PN}-prompt"
> > > +FILES:${PN} +=3D"${systemd_user_unitdir}"
> > >  FILES:libvte =3D "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
> > >  FILES:${PN}-prompt =3D " \
> > >      ${sysconfdir}/profile.d \
> > > @@ -50,5 +45,3 @@ FILES:${PN}-prompt =3D " \
> > >  "
> > >
> > >  FILES:${PN}-dev +=3D "${datadir}/glade/"
> > > -
> > > -BBCLASSEXTEND =3D "native nativesdk"
> > > --
> > > 2.42.0
> > >
> >
> > >
> > >
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188218): https://lists.openembedded.org/g/openembedde=
d-core/message/188218
> Mute This Topic: https://lists.openembedded.org/mt/101518552/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

