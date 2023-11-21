Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE98C5AD4C
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 02:16:56 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.25729.1700533014841881572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 18:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dwlHOdAe;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1f0f94a08a0so3044883fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 18:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700533014; x=1701137814; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s08gvU5Lf5W9XIVyMCv64ypzRUUqMzU1F5a9tOqlZZQ=;
        b=dwlHOdAeNX/Da6tJOUyO9heQVz+vnwMrmSmWnZFv6MRpMVMB1SB/ZKXG+2yCVPjrH/
         IAUywrenXExjQEOLdTJX8yDmtQGrF3D8+8QfuACnLzsxt8B51okJOYAAA9EhXOIXU2u8
         RWc8TbQ+Fl7CfHVq0igqD8ty46qsU2oYr3ZZJY/KQD69eHwcH3mvYJO/uq8aBrsW81FQ
         1Qxsz536JypBOdeDo8AHgIVXG/qJc+cwrskS8X1+CzlDK8LJeU7f0PFphnwVoCajnlhw
         zsTI8kipx3U6SSnpfp4lvUTXELC43eq/90t6F4jmqFTB9ocY4B4pCoUiQ66DwLHGDKKj
         woYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700533014; x=1701137814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s08gvU5Lf5W9XIVyMCv64ypzRUUqMzU1F5a9tOqlZZQ=;
        b=XswLNoMQko2sGaQ0WHjfyZhz26bHSaeG80tmaCZ6CoSz+nuUE8b+oXQ0OETA5o27/7
         Zsyo1VYL08TkfP7F1gPfo2qz4b2qpu62i3b8IS9ioA0B2FPtWlhGRrwM2gAE8SByCnCm
         4wGFojeZEmXo0AHIkBxEzli4FuZ3/v+S2a1GDYi/7xBmBpLTs9UB8VCkd20VyUpUqL8X
         Lr8p4hx8Bv0gD60arh3ICQR3kscTxjKBtH9AwjroqEu1Qg5oI0i4VWJv1qqded4+gf4h
         Vc1Liw2evAsfWz+galGzmZ5mJjuiEFZceTJHMtJlUGYngmBUpjnFdTD/sD1p+JAeU5lX
         X08g==
X-Gm-Message-State: AOJu0Yxseultr0ly2wUPDipq4Q+CmPVwWVcCl9S7YreART8pKGmzDdcg
	x6YS5sR61VDLdi4/cwSd33iqWBkQr7Kig6AjZhw=
X-Google-Smtp-Source: AGHT+IGloncjt90Oju9Y1ZXWOjcTa7QAdBWu2ZO53E0ud0uMjWk2Ajn/hQhZIh1y6tpWpK5+9uQy+I/tpZp3d2utu7E=
X-Received: by 2002:a05:6870:3055:b0:1ef:ace4:f360 with SMTP id
 u21-20020a056870305500b001eface4f360mr11043475oau.17.1700533013968; Mon, 20
 Nov 2023 18:16:53 -0800 (PST)
MIME-Version: 1.0
References: <20231115182417.415940-1-raj.khem@gmail.com> <20231117110630da1a7c99@mail.local>
In-Reply-To: <20231117110630da1a7c99@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Nov 2023 18:16:27 -0800
Message-ID: <CAMKF1spZp2oX=g5umm7KSdN_sGgr9Jyr7R_jzK0O9-U+=YXoJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v8 1/2] vte: upgrade 2.72.2 -> 2.74.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 02:16:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190952

On Fri, Nov 17, 2023 at 3:06=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/8176/st=
eps/21/logs/stdio
>
> ERROR: core-image-sato-1.0-r0 do_rootfs: Multilib check error: duplicate =
files /home/pokybuild/yocto-worker/multilib/build/build/tmp/work/qemux86_64=
-poky-linux/core-image-sato/1.0/multilib/lib32/usr/share/glib-2.0/schemas/g=
schemas.compiled /home/pokybuild/yocto-worker/multilib/build/build/tmp/work=
/qemux86_64-poky-linux/core-image-sato/1.0/rootfs/usr/share/glib-2.0/schema=
s/gschemas.compiled is not the same
>

This is interesting problem is that we are pulling in gtk4 now as part
of vte but it does not get pulled into lib32
runtime like it does for gtk+3 ( it comes via adwaita-icon-theme
recipe as dep) and they both install some gschemas
32bit rootfs does not have gtk4 schemas but 64bit does have. gschemas
are compiled at the end of do_rootfs
and now we have different final schema files. I think these schemas
should be packages into package of its own
perhaps instead of adding them to gtk+3 or gtk4 packages since these
are architecture independent xml files.

>
> On 15/11/2023 10:24:15-0800, Khem Raj wrote:
> > From: Markus Volk <f_l_k@t-online.de>
> >
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
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v8: Rebased on latest tip of trunk
> >
> >  ...EXITCODE-macro-for-non-glibc-systems.patch | 35 ++++++++-----------
> >  .../vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb}      | 29 ++++++---------
> >  2 files changed, 25 insertions(+), 39 deletions(-)
> >  rename meta/recipes-support/vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb} (66=
%)
> >
> > diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for=
-non-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE=
-macro-for-non-glibc-systems.patch
> > index b4100fc381e..8934d5f80a6 100644
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
> > similarity index 66%
> > rename from meta/recipes-support/vte/vte_0.72.2.bb
> > rename to meta/recipes-support/vte/vte_0.74.0.bb
> > index 44e71491f62..21203adcf79 100644
> > --- a/meta/recipes-support/vte/vte_0.72.2.bb
> > +++ b/meta/recipes-support/vte/vte_0.74.0.bb
> > @@ -16,32 +16,27 @@ DEPENDS =3D "glib-2.0 glib-2.0-native gtk+3 libpcre=
2 libxml2-native gperf-native i
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
> > @@ -49,5 +44,3 @@ FILES:${PN}-prompt =3D " \
> >  "
> >
> >  FILES:${PN}-dev +=3D "${datadir}/glade/"
> > -
> > -BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.42.1
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#190739): https://lists.openembedded.org/g/openembed=
ded-core/message/190739
> > Mute This Topic: https://lists.openembedded.org/mt/102611065/3617179
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

