Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C96CE79AB
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 09:09:44 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.33303.1695200979549065100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 02:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IatJcg37;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c0179f9043so43550341fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 02:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695200977; x=1695805777; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxVDRr1LQ1CWrz5kLIIedfYXNo67DTEYmkHOyWPWFBQ=;
        b=IatJcg37VHSUg4+hJ/gqKbeLYBZol9NqDNi1mjYB+LVOYu0AAGO6+xxqccBZAZ3cZL
         q8YlW8/Rg4966LrD3dTr1YnBzVJxtugqjBCfprINIO0zFP+YvGGFVMDHYJGwJsSO3G6p
         1aG6rnFNjMP7dmo0fHxI9U9DtJHuAqCyh5rd59AAT3MSvN/NPKYb5OdCx96UqM7hU/S7
         hVWw4xS0LtJrSq6XOYsDVHDENGk3IWa+yqErte5jjO1YHrz8uufhAMVf3SlWUxbQHp+N
         ClayGm3yN558UbgttOjgHYuuGliUtXPhQf2tL3UpTANqxf7N3WgCZ45nG+umJnanjOLw
         +fbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695200978; x=1695805778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxVDRr1LQ1CWrz5kLIIedfYXNo67DTEYmkHOyWPWFBQ=;
        b=qnStsUJ5zzQEX3UV7g5GCsgZeVWxvm4K59/QXvt3TkM9Oazoh7sT6aYew6NrsRAPuE
         YqzoJ+xUoNKNEDoHt5Cr1OKVOMMkaPQMPGDOZtJD2Nz7h1Volt9oul/f7v6Ex4j6se2k
         Elh7rztgB5ep6+oxUV7Q8Rk76odaQfVMuEfeP5Q6aADat/20vmGOEDD4G77/X1x01EC3
         JDcgwc8nHMVSWCM4ezl0y0dqy/+cFlDcg4Hu+jq/ovr+uh6eEN7lAX0/G9NPae8rwOBW
         Y00TZBsiM8mNkb9YcgutAifcsJH87BkPLbW3Y8tdSxnch8ZPphL9DFbM5DNA3nZYSlp5
         oQaQ==
X-Gm-Message-State: AOJu0YxkxjmWxT6vprJlaJgMU5fwi0A2iKpUucJDY3TLB+lC7UMZ+gU5
	vwmqFCu+WPqgUMjumAsqT9IKyMG+KwSLDXptLWpDLC49
X-Google-Smtp-Source: AGHT+IEw5bWF9c/reB7oKEyO1+tMBF+EGRCjeomuzFe9zqkkNls2FxUC0JmSnqJql+7J1QKW4Fmqojhg0M4hKA7iLWc=
X-Received: by 2002:a2e:8812:0:b0:2c0:2b93:884c with SMTP id
 x18-20020a2e8812000000b002c02b93884cmr1743568ljh.29.1695200977274; Wed, 20
 Sep 2023 02:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230920090312.2496296-1-f_l_k@t-online.de>
In-Reply-To: <20230920090312.2496296-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Sep 2023 11:09:26 +0200
Message-ID: <CANNYZj8HKKdRo=yDwsCopP8oZBpz=xyp78GUHOajcdkDQjA0=Q@mail.gmail.com>
Subject: Re: [oe-core][PATCHv3] vte: upgrade 2.72.2 -> 2.74.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 09:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187903

nativesdk variants are only enabled when there is a particular need
for it, and in this case it would be better to drop nativesdk option
from vte.

Alex

On Wed, 20 Sept 2023 at 11:03, Markus Volk <f_l_k@t-online.de> wrote:
>
> Rework recipe
>
> - remove legacy of the autotools buildsystem
> - build vapi dependent on gi-data
> - docs require gir, add a EXTRA_OEMESON:append to avoid fail in
>   a combination where docs=3Dtrue and gir=3Dfalse
> - gtk+3 and gtk4 are requested by default-> add gtk4 dependency
> - allow to build gtk4-nativesdk
> - install systemd support files depending on DISTRO_FEATURE
> - update 0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-gnome/gtk+/gtk4_4.12.1.bb        |  2 +-
>  .../xorg-lib/libxkbcommon_1.5.0.bb            |  2 +-
>  .../xorg-lib/xkeyboard-config_2.39.bb         |  2 +-
>  ...EXITCODE-macro-for-non-glibc-systems.patch | 35 ++++++++-----------
>  .../vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb}      | 24 ++++---------
>  5 files changed, 24 insertions(+), 41 deletions(-)
>  rename meta/recipes-support/vte/{vte_0.72.2.bb =3D> vte_0.74.0.bb} (64%)
>
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.12.1.bb
> index aa7115b11e..29adee4adf 100644
> --- a/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
> @@ -47,7 +47,7 @@ inherit meson gettext pkgconfig gi-docgen update-altern=
atives gsettings features
>  # gobject-introspection.bbclass pins introspection off for nativesk. As =
long as
>  # we do not remove this wisdom or hack gtk4, it is not possible to build
>  # nativesdk-gtk4
> -BBCLASSEXTEND =3D "native"
> +BBCLASSEXTEND =3D "native nativesdk"
>
>  GSETTINGS_PACKAGE:class-native =3D ""
>
> diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb b/meta/=
recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
> index 62e9b158e4..09da677de4 100644
> --- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb
> @@ -35,6 +35,6 @@ python populate_packages:prepend () {
>  # xkbcommon: ERROR: couldn't find a Compose file for locale "C"
>  RDEPENDS:${PN} =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx=
11-locale', 'libx11-compose-data', d)}"
>
> -BBCLASSEXTEND +=3D "native"
> +BBCLASSEXTEND +=3D "native nativesdk"
>
>  CVE_PRODUCT +=3D "xkbcommon:libxkbcommon"
> diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb b/me=
ta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb
> index 4795464ac0..8a87d49399 100644
> --- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb
> +++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb
> @@ -29,4 +29,4 @@ do_install:append () {
>      cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
>  }
>
> -BBCLASSEXTEND +=3D "native"
> +BBCLASSEXTEND +=3D "native nativesdk"
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
> similarity index 64%
> rename from meta/recipes-support/vte/vte_0.72.2.bb
> rename to meta/recipes-support/vte/vte_0.74.0.bb
> index 4249b75ac0..74574d3684 100644
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
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187899): https://lists.openembedded.org/g/openembedde=
d-core/message/187899
> Mute This Topic: https://lists.openembedded.org/mt/101474702/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

