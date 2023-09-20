Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5392CE79B3
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:01:45 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.34087.1695204098468170819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 03:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KTCofcJJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b974031aeaso109249601fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 03:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695204096; x=1695808896; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvjEXqUVuxfKf3bva7K1bSB+5YRmFaoDRGLOkZdzyqs=;
        b=KTCofcJJk0/tnuOsZjWHwqwgK7vUKX2FD2s0FAXNOdRfeCWmVxhKH9cKdG0yu3Xm7e
         0EjehxrJT8l36J04TmS2+3ZajYxcQjk9BecnJqPjebrQpXNDJDgiYyvALixSizIrcseP
         QNbsNyo0LIolESex3v0+CrSpL8cRI/OwEBRkuT1A8hOyVytMe6kVnRgqpTY47njJpUeN
         Bj72j6Kp5mPAurJuWto45y94KpP+tJARIwZQgbLj5kQg+F6yCSX502fKN1sjRgurE/aB
         AKwiN/n2z2S+OIcPmTYmv8T6S4uk0HEtPSceUpARasMdIApbTAEBgSr9phjA6fxf/jfz
         /SMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695204096; x=1695808896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UvjEXqUVuxfKf3bva7K1bSB+5YRmFaoDRGLOkZdzyqs=;
        b=C9iG2HkAacLvlTC14YwN2mVbmOlV7eMT09p+Bc/BoOdAlAOMYFKZI2Hlln+pjB3TEK
         RXBnNItFvXj1mhlSS+FAkbJmkALyez3llhKOJhPBWymf/LygZNTusm3wjs64nXljLsxL
         QfiFmdAIih3pei5Cs2RZT4A/mohC4rbdFcYr1Zik4t8RkLfc7ZoQvPldiIs3GFK0Ea76
         ZW05VQlbKMRV9v4ISK4kmlUY7/adV0VgVf+Ft/+lXs7ZoS9/G2y/VBPktUiiyirjodp0
         +i4HxQRoDKumwizlnNHzU2HQ4LMFQ3aXzcAv8w3MCCVsS5OcwQipC/uiIHoRG83nJRb1
         MlOQ==
X-Gm-Message-State: AOJu0Yxi9DOK6zMIRA1lfXape4XimiayEqa8oFlr8eJ3W7D4PHaFFP8n
	ecRJc/xnlV8xIaHZ/8GqxXiYlkD3g03TpGc/5QFreVMW
X-Google-Smtp-Source: AGHT+IGKyFuZU1YOBLbOXdqFxpyG7sBjlgXn3ZVzyFuTgjPuupBhehXhDN9NnOt85qzZ1fIVisKgcAEFfUAfLvOMvOY=
X-Received: by 2002:a2e:a401:0:b0:2b9:ee3e:2412 with SMTP id
 p1-20020a2ea401000000b002b9ee3e2412mr1876265ljn.22.1695204096275; Wed, 20 Sep
 2023 03:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230920095652.960124-1-f_l_k@t-online.de>
In-Reply-To: <20230920095652.960124-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Sep 2023 12:01:25 +0200
Message-ID: <CANNYZj_sjO5LCThzQRP6GuxBOhmw_a_Xa_N5ZUeDw+OmeoLNBg@mail.gmail.com>
Subject: Re: [oe-core][PATCHv4] vte: upgrade 2.72.2 -> 2.74.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 10:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187913

'native' should go as well I think.

Alex

On Wed, 20 Sept 2023 at 11:56, Markus Volk <f_l_k@t-online.de> wrote:
>
> Rework recipe
>
> - remove legacy of the autotools buildsystem
> - remove nativesdk from BBCLASSEXTEND
> - build vapi dependent on gi-data
> - docs require gir, add a EXTRA_OEMESON:append to avoid fail in
>   a combination where docs=3Dtrue and gir=3Dfalse
> - gtk+3 and gtk4 are requested by default-> add gtk4 dependency
> - install systemd support files depending on DISTRO_FEATURE
> - update 0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...EXITCODE-macro-for-non-glibc-systems.patch | 35 ++++++++-----------
>  .../vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb}      | 26 +++++---------
>  2 files changed, 22 insertions(+), 39 deletions(-)
>  rename meta/recipes-support/vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb} (62%)
>
> diff --git a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-n=
on-glibc-systems.patch b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-m=
acro-for-non-glibc-systems.patch
> index b4100fc381..8934d5f80a 100644
> --- a/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glib=
c-systems.patch
> +++ b/meta/recipes-support/vte/vte/0001-Add-W_EXITCODE-macro-for-non-glib=
c-systems.patch
> @@ -11,32 +11,25 @@ Upstream-Status: Submitted [1]
>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>
>  [1] https://gitlab.gnome.org/GNOME/vte/issues/72
> -
>  ---
> - src/missing.hh | 4 ++++
> - src/widget.cc  | 1 +
> - 2 files changed, 5 insertions(+)
> + src/widget.cc  | 4 +++
> + 1 files changed, 4 insertions(+)
>
> ---- a/src/missing.hh
> -+++ b/src/missing.hh
> -@@ -24,6 +24,10 @@
> - #define NSIG (8 * sizeof(sigset_t))
> - #endif
> +diff --git a/src/widget.cc b/src/widget.cc
> +index 07f7cabf..31a77f68 100644
> +--- a/src/widget.cc
> ++++ b/src/widget.cc
> +@@ -16,6 +16,10 @@
> +  * along with this library.  If not, see <https://www.gnu.org/licenses/=
>.
> +  */
>
>  +#ifndef W_EXITCODE
>  +#define W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
>  +#endif
>  +
> - #ifndef HAVE_FDWALK
> - int fdwalk(int (*cb)(void* data, int fd),
> -            void* data);
> ---- a/src/widget.cc
> -+++ b/src/widget.cc
> -@@ -21,6 +21,7 @@
> - #include "widget.hh"
> -
> - #include <sys/wait.h> // for W_EXITCODE
> -+#include "missing.hh" // for W_EXITCODE on non-glibc systems
> + #include "config.h"
>
> - #include <exception>
> - #include <new>
> + #include "widget.hh"
> +--
> +2.42.0
> +
> diff --git a/meta/recipes-support/vte/vte_0.72.2.bb b/meta/recipes-suppor=
t/vte/vte_0.74.0.bb
> similarity index 62%
> rename from meta/recipes-support/vte/vte_0.72.2.bb
> rename to meta/recipes-support/vte/vte_0.74.0.bb
> index 4249b75ac0..4320640e8b 100644
> --- a/meta/recipes-support/vte/vte_0.72.2.bb
> +++ b/meta/recipes-support/vte/vte_0.74.0.bb
> @@ -11,38 +11,28 @@ LIC_FILES_CHKSUM =3D " \
>      file://COPYING.XTERM;md5=3Dd7fc3a23c16c039afafe2e042030f057 \
>  "
>
> -DEPENDS =3D "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gper=
f-native icu"
> +DEPENDS =3D "glib-2.0 glib-2.0-native gtk+3 gtk4 libpcre2 libxml2-native=
 gperf-native icu"
>
>  GNOMEBASEBUILDCLASS =3D "meson"
>  GIR_MESON_OPTION =3D 'gir'
>  GIDOCGEN_MESON_OPTION =3D "docs"
>
> -inherit gnomebase gi-docgen features_check upstream-version-is-even gobj=
ect-introspection
> +inherit gnomebase gi-docgen features_check upstream-version-is-even gobj=
ect-introspection vala
>
> -# vapigen.m4 is required when vala is not present (but the one from vala=
 should be used normally)
>  SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.pat=
ch"
> -SRC_URI[archive.sha256sum] =3D "f7966fd185a6981f53964162b71cfef7e6064951=
55d6f5827b72aa0dd6741c9e"
> +SRC_URI[archive.sha256sum] =3D "9ae08f777952ba793221152d360550451580f42d=
3b570e3341ebb6841984c76b"
>
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>
> -# Help g-ir-scanner find the .so for linking
> -do_compile:prepend() {
> -    export GIR_EXTRA_LIBS_PATH=3D"${B}/src/.libs"
> -}
> +EXTRA_OEMESON +=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dv=
api=3Dtrue', '-Dvapi=3Dfalse', d)}"
> +EXTRA_OEMESON:append =3D " ${@bb.utils.contains('GI_DATA_ENABLED', 'Fals=
e', '-Ddocs=3Dfalse', '', d)}"
>
> -# Package additional files
> -FILES:${PN}-dev +=3D "${datadir}/vala/vapi/*"
> -
> -PACKAGECONFIG ??=3D "gnutls"
> -PACKAGECONFIG[vala] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse,vala-native vala"
> +PACKAGECONFIG ??=3D "gnutls ${@bb.utils.filter('DISTRO_FEATURES', 'syste=
md', d)}"
>  PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
>  PACKAGECONFIG[systemd] =3D "-D_systemd=3Dtrue,-D_systemd=3Dfalse,systemd=
"
> -# vala requires gir
> -PACKAGECONFIG:remove:class-native =3D "vala"
> -
> -CFLAGS +=3D "-D_GNU_SOURCE"
>
>  PACKAGES =3D+ "libvte ${PN}-prompt"
> +FILES:${PN} +=3D"${systemd_user_unitdir}"
>  FILES:libvte =3D "${libdir}/*.so.* ${libdir}/girepository-1.0/*"
>  FILES:${PN}-prompt =3D " \
>      ${sysconfdir}/profile.d \
> @@ -51,4 +41,4 @@ FILES:${PN}-prompt =3D " \
>
>  FILES:${PN}-dev +=3D "${datadir}/glade/"
>
> -BBCLASSEXTEND =3D "native nativesdk"
> +BBCLASSEXTEND =3D "native"
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187912): https://lists.openembedded.org/g/openembedde=
d-core/message/187912
> Mute This Topic: https://lists.openembedded.org/mt/101475150/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

