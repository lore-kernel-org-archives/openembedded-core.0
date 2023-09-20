Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FE4CE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 09:08:14 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.33290.1695200893680652917
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 02:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X8uWs3ZH;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so109536941fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 02:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695200891; x=1695805691; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0jeFmAa3PIMCLh21cQZ1vBythicny6pkhILIh2jY2c=;
        b=X8uWs3ZH3uMLkA4n/7xM4i0JbRAJ3JlVxMk8Qk5RXj6FDgbtObIYZm4v3yTCv++uy1
         2E2jbR/yW9Z3uH6sJqvVW7aFrvQ6gVXI3R9sNUDDy7wC0ngsekuwaxso0wT696enEEPO
         dx2Fy5ajeoebe6X959TylZPHaCkLwu+0RpbCYHiYCn9mMy6EFcljh1Z8cG0fpMu60RdB
         vnQHAqsC3tmgY1qCkJJUlmE+2FTTWvxYppfM3hn/rF3iS9O5Ly4JTkpb2lR+PimLIbDp
         2Re4t34xfyUSqZTlUAMUXcrW5kOkGvFOC4LEWPbNVUqlcjUbAwgWVIsDDR5tUK6ImCt9
         oKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695200891; x=1695805691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0jeFmAa3PIMCLh21cQZ1vBythicny6pkhILIh2jY2c=;
        b=Xed9jA6x0wuMdrKJdRBkJKuBUGIewtIKnC721KjkYTkL18QdZiE1qPhc4NYEyJt+N3
         vV1kE1YiK4qzzzRSRlc1RUWzYusU1zjhW7sMji1ylt7yKBpZRqC9T4yoJeLOn/vbBhcF
         WxvM+0hv5DDZmCPEicocCojUGndZSpqedYcP3EARDKvIl/6KjGlNojw50uCekfZpRxOX
         FJbBwZ1fqN+h1vaD5jeUK0oYiAFbiSB6jh/47wjjUxx3W2qXahO6EHQhmDrbw/NJ79S1
         TggQm2OfdQKSpiTvokX8QgSAiqMbAfPYpM+DrvmjWuULY1NuObG0H7v+uVJYwUqp8XOe
         4gUg==
X-Gm-Message-State: AOJu0YzzjdWYOu4xVvwAFXzYt1ijDMnOJZLEiw9xI5x5AD3jzwRXT8Ti
	7GbfX0GKAmKww8kZ36OZ0+5hXqoML8qZnQXS06U=
X-Google-Smtp-Source: AGHT+IFUKN5dNLCicQT0qOByNV1YVWtOmYVzhYRUjqBrv9AO3ZSj769tFWbPy12sVW8IPkQLS0orLdNLVoi8PCM0byc=
X-Received: by 2002:a2e:9410:0:b0:2bc:f5a0:cc27 with SMTP id
 i16-20020a2e9410000000b002bcf5a0cc27mr1460779ljh.47.1695200890925; Wed, 20
 Sep 2023 02:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230919133427.2319190-1-f_l_k@t-online.de> <2023092007502630214fb4@mail.local>
In-Reply-To: <2023092007502630214fb4@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Sep 2023 11:07:59 +0200
Message-ID: <CANNYZj-xbEBmUQbfO74VbGV_VFhDuAJ6LBs6RRMAKFhw3B0e=g@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] vte: upgrade 2.72.2 -> 2.74.0
To: alexandre.belloni@bootlin.com
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 09:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187901

I honestly can't explain why vte is enabled for native or nativesdk
(it was a part of
https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D997b526d8b73
)
so I'd suggest dropping that line from the recipe and see what breaks,
if anything.

Alex

On Wed, 20 Sept 2023 at 09:50, Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> This caused:
>
> stdio: WARNING: Nothing PROVIDES 'nativesdk-gtk4' (but virtual:nativesdk:=
/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-support/vte=
/vte_0.74.0.bb DEPENDS on or otherwise requires it). Close matches:
> stdio: WARNING: Nothing RPROVIDES 'nativesdk-vte' (but virtual:nativesdk:=
/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-support/vte=
/vte_0.74.0.bb RDEPENDS on or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'nativesdk-vte-dev' (but virtual:native=
sdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-support=
/vte/vte_0.74.0.bb RDEPENDS on or otherwise requires it)
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/8147/st=
eps/12/logs/stdio
>
>
>
> On 19/09/2023 15:33:56+0200, Markus Volk wrote:
> > Rework recipe
> >
> > - remove legacy of the autotools buildsystem
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
> >  .../vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb}      | 24 ++++---------
> >  2 files changed, 21 insertions(+), 38 deletions(-)
> >  rename meta/recipes-support/vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb} (64=
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
> > similarity index 64%
> > rename from meta/recipes-support/vte/vte_0.72.2.bb
> > rename to meta/recipes-support/vte/vte_0.74.0.bb
> > index 4249b75ac0..74574d3684 100644
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
> View/Reply Online (#187897): https://lists.openembedded.org/g/openembedde=
d-core/message/187897
> Mute This Topic: https://lists.openembedded.org/mt/101455999/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

