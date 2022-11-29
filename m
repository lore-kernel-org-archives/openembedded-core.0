Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABCBC4332F
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 09:14:36 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.144821.1669713266832466992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 01:14:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C+p0JJK+;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id b3so21512262lfv.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 01:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qn78nFCbl8D62oyQbQLUVndlLfmpcOho3mgN9AUrTAA=;
        b=C+p0JJK+kP5MPbevAAN92XJK1bJOBZcbIHIvl1V1KmO0+1N3Xw7UynYlMp8JnS5lDv
         t7LgjVC+JSf+c+WTlv9uw4AQE1UWkBHFX/A4rUtqR1r+t4irtnL3nU+iJOIoTPFQ7302
         DMi9IRAWAqTc/QA9DPRXqkvau6YRmUzYOv8bqes5jYcG9CcUIFZ93KaR51DaHxfHZYOZ
         FlsiDDeRPSMdUq1swHOPn7TORO87EONq5LZobyeqM4Zdwf1Jw2hDan/BBiF5Ex5k2FMg
         aTkMpIVEQ43zXcgpEARSckkwJwn0x+a+ZlzlBGjkcNiIchK82SndvK7qLWWW74Pabbpr
         CQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qn78nFCbl8D62oyQbQLUVndlLfmpcOho3mgN9AUrTAA=;
        b=6r2wJV7Ou9xdSyIiLqJgfW/sGl0MngcnrxAECh5tYzGMe6Ie3Pe8pXRtvC0bg0QLIb
         YsB8iG21UN7dCU1ulU+fu3MaZNR3djYQgU8T5NZrrHB3VSNIBRXK03O+J5WBbDVeUZvF
         eQZGDA80jNR48Ka7SZosOdML6fg+LJyEeBFTG0sRczJZsvtyKcfZ9UKtfy93CjRxGw2Y
         6EuKSuRTfPZdeBlmgglblau7KoZUS5RM4E/czHE6v29QQ+zx1qifxXsDq0uBNZLeG27W
         zclXE32j4b4XI8cIyTVMHd6137AGPDVAPJCWIh7uSRNQ7HLSUCHzzZOajfOzB3CkFvvX
         yREA==
X-Gm-Message-State: ANoB5pnqYOGU19PavGDvwOX2S5MOwqYefgKXkKNTKhc2qlMtuCW5EEPi
	gD/C0VwxljpTGpv0GQWQBkBvmQKzaQLTg1ega68=
X-Google-Smtp-Source: AA0mqf4lfUA1GlRmsCVIlg8sdCAGq6egwkSHvGuMpKxTOmxOdn+/qCWFZGjVxgZfu3VzitE8fBeR1hyB1a+KrlJ4k+s=
X-Received: by 2002:a05:6512:746:b0:4a2:4f74:f47c with SMTP id
 c6-20020a056512074600b004a24f74f47cmr18043293lfs.367.1669713264825; Tue, 29
 Nov 2022 01:14:24 -0800 (PST)
MIME-Version: 1.0
References: <20221129064257.81184-1-f_l_k@t-online.de>
In-Reply-To: <20221129064257.81184-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 29 Nov 2022 10:14:12 +0100
Message-ID: <CANNYZj9NHYWFUXaQwWZroJV0b1qQFhrg0dG6vDb9C-bDaWZudQ@mail.gmail.com>
Subject: Re: [oe-core][PATCHv6] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 09:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173963

Please split this into two, first add gtk4, then then gcr changes.

Alex

On Tue, 29 Nov 2022 at 07:43, Markus Volk <f_l_k@t-online.de> wrote:
>
> - gcr-3 recipe is still needed for gnome projects that stick to gtk+3, rename to gcr3.
> - Move gtk4 recipe from meta-gnome
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...-add-options-to-set-ssh-binary-paths.patch |  60 ++++++++
>  ...ectly-handle-disabled-ssh_agent-opti.patch |  49 ++++++
>  ...build-fix-one-parallel-build-failure.patch |   0
>  ...1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch |   0
>  .../gcr/{gcr_3.40.0.bb => gcr3_3.40.0.bb}     |   8 +-
>  meta/recipes-gnome/gcr/gcr_4.0.0.bb           |  51 +++++++
>  meta/recipes-gnome/gtk+/gtk4_4.6.7.bb         | 142 ++++++++++++++++++
>  7 files changed, 308 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-gnome/gcr/gcr/0001-meson-add-options-to-set-ssh-binary-paths.patch
>  create mode 100644 meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
>  rename meta/recipes-gnome/gcr/{gcr => gcr3}/0001-gcr-meson.build-fix-one-parallel-build-failure.patch (100%)
>  rename meta/recipes-gnome/gcr/{gcr => gcr3}/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch (100%)
>  rename meta/recipes-gnome/gcr/{gcr_3.40.0.bb => gcr3_3.40.0.bb} (87%)
>  create mode 100644 meta/recipes-gnome/gcr/gcr_4.0.0.bb
>  create mode 100644 meta/recipes-gnome/gtk+/gtk4_4.6.7.bb
>
> diff --git a/meta/recipes-gnome/gcr/gcr/0001-meson-add-options-to-set-ssh-binary-paths.patch b/meta/recipes-gnome/gcr/gcr/0001-meson-add-options-to-set-ssh-binary-paths.patch
> new file mode 100644
> index 0000000000..cd3552464a
> --- /dev/null
> +++ b/meta/recipes-gnome/gcr/gcr/0001-meson-add-options-to-set-ssh-binary-paths.patch
> @@ -0,0 +1,60 @@
> +From 89992bde916fe53dd737a5d678bc66dd51cd1f45 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Mon, 28 Nov 2022 15:47:50 +0100
> +Subject: [PATCH] meson: add options to set ssh binary paths
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
> +Upstream-Status: Submitted [ https://gitlab.gnome.org/GNOME/gcr/-/merge_requests/115/diffs?commit_id=f19dfa4fe0986f3f75b29f9c05cead59fe87cd19 ]
> +---
> + meson.build       | 11 +++++++++--
> + meson_options.txt | 10 ++++++++++
> + 2 files changed, 19 insertions(+), 2 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 11d7fa7..231d7e2 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -58,9 +58,16 @@ if p11_system_config_modules == ''
> +   error('Couldn\'t find location for pkcs11 module config')
> + endif
> + libsecret_dep = dependency('libsecret-1', version: '>= 0.20', required: get_option('ssh_agent'))
> ++
> + if get_option('ssh_agent')
> +-  ssh_add_path = find_program('ssh-add').full_path()
> +-  ssh_agent_path = find_program('ssh-agent').full_path()
> ++  ssh_add_path = get_option('ssh_add_path')
> ++  ssh_agent_path = get_option('ssh_agent_path')
> ++  if ssh_add_path == ''
> ++    ssh_add_path = find_program('ssh-add').full_path()
> ++  endif
> ++  if ssh_agent_path == ''
> ++    ssh_agent_path = find_program('ssh-agent').full_path()
> ++  endif
> + endif
> +
> + with_systemd = false
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 6840e44..5355940 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -23,6 +23,16 @@ option('gpg_path',
> +   value: '',
> +   description: 'Path to gpg, autodetected if not set',
> + )
> ++option('ssh_add_path',
> ++  type: 'string',
> ++  value: '',
> ++  description: 'Path to ssh-add, autodetected if not set',
> ++)
> ++option('ssh_agent_path',
> ++  type: 'string',
> ++  value: '',
> ++  description: 'Path to ssh-agent, autodetected if not set',
> ++)
> + option('ssh_agent',
> +   type: 'boolean',
> +   value: true,
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch b/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
> new file mode 100644
> index 0000000000..940f78ebab
> --- /dev/null
> +++ b/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
> @@ -0,0 +1,49 @@
> +From 9b67bb18d8409e0e693cc6000507acbd73a30eab Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Wed, 16 Nov 2022 11:27:24 +0100
> +Subject: [PATCH 1/2] meson.build: correctly handle disabled ssh_agent option
> +
> +Existing code produces these errors:
> +| gcr/meson.build:61:0: ERROR: Unable to get the path of a not-found external program
> +| gcr/meson.build:101:5: ERROR: Unknown variable "ssh_add_path".
> +
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +
> +Upstream-Status: Backport [ https://gitlab.gnome.org/GNOME/gcr/-/commit/9b67bb18d8409e0e693cc6000507acbd73a30eab ]
> +---
> + meson.build | 12 ++++++++----
> + 1 file changed, 8 insertions(+), 4 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 3f35173..11d7fa7 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -58,8 +58,10 @@ if p11_system_config_modules == ''
> +   error('Couldn\'t find location for pkcs11 module config')
> + endif
> + libsecret_dep = dependency('libsecret-1', version: '>= 0.20', required: get_option('ssh_agent'))
> +-ssh_add_path = find_program('ssh-add', required: get_option('ssh_agent')).full_path()
> +-ssh_agent_path = find_program('ssh-agent', required: get_option('ssh_agent')).full_path()
> ++if get_option('ssh_agent')
> ++  ssh_add_path = find_program('ssh-add').full_path()
> ++  ssh_agent_path = find_program('ssh-agent').full_path()
> ++endif
> +
> + with_systemd = false
> + libsystemd_deps = []
> +@@ -96,8 +98,10 @@ conf.set('HAVE_TIMEGM', cc.has_function('timegm'))
> + conf.set('HAVE_MLOCK', cc.has_function('mlock'))
> + conf.set_quoted('GPG_EXECUTABLE', gpg_path)
> + conf.set_quoted('LIBGCRYPT_VERSION', libgcrypt_dep.version())
> +-conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
> +-conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
> ++if get_option('ssh_agent')
> ++  conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
> ++  conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
> ++endif
> + conf.set10('WITH_SYSTEMD', with_systemd)
> + config_file = configure_file(
> +   output: 'config.h',
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-parallel-build-failure.patch b/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> similarity index 100%
> rename from meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> rename to meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> diff --git a/meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch b/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> similarity index 100%
> rename from meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> rename to meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb b/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> similarity index 87%
> rename from meta/recipes-gnome/gcr/gcr_3.40.0.bb
> rename to meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> index 917be5938b..5318768db6 100644
> --- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
> +++ b/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> @@ -20,11 +20,15 @@ GTKDOC_MESON_OPTION = "gtk_doc"
>  inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
>  UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
>
> -SRC_URI += "file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch \
> -            file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
> +SRC_URI = " \
> +       https://download.gnome.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=archive \
> +       file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch \
> +       file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
>
>  SRC_URI[archive.sha256sum] = "b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5"
>
> +S = "${WORKDIR}/gcr-${PV}"
> +
>  PACKAGECONFIG ??= " \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
> diff --git a/meta/recipes-gnome/gcr/gcr_4.0.0.bb b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
> new file mode 100644
> index 0000000000..ff2f7978a9
> --- /dev/null
> +++ b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
> @@ -0,0 +1,51 @@
> +SUMMARY = "A library for bits of crypto UI and parsing etc"
> +DESCRIPTION = "GCR is a library for displaying certificates, and crypto UI, \
> +accessing key stores. It also provides the viewer for crypto files on the \
> +GNOME desktop."
> +HOMEPAGE = "https://gitlab.gnome.org/GNOME/gcr"
> +BUGTRACKER = "https://gitlab.gnome.org/GNOME/gcr/issues"
> +
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
> +
> +DEPENDS = "p11-kit glib-2.0 libgcrypt gnupg-native \
> +           ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
> +
> +CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg2'"
> +
> +CFLAGS += "-D_GNU_SOURCE"
> +
> +GNOMEBASEBUILDCLASS = "meson"
> +GTKDOC_MESON_OPTION = "gtk_doc"
> +inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
> +UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
> +
> +SRC_URI += " \
> +       file://0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch \
> +       file://0001-meson-add-options-to-set-ssh-binary-paths.patch \
> +"
> +SRC_URI[archive.sha256sum] = "c45855924f0ee7bab43e2dd38bfafd2ac815c6e9864341c0161e171173dcec7c"
> +
> +PACKAGECONFIG ??= " \
> +       ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +       ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
> +       ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
> +"
> +PACKAGECONFIG[gtk] = "-Dgtk4=true,-Dgtk4=false,gtk4"
> +PACKAGECONFIG[ssh_agent] = "-Dssh_agent=true -Dssh_add_path=${bindir}/ssh-add -Dssh_agent_path=${bindir}/ssh-agent,-Dssh_agent=false,libsecret,openssh"
> +#'Use systemd socket activation for server programs'
> +PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
> +
> +FILES:${PN} += " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/gcr-4 \
> +    ${systemd_user_unitdir}/gcr-ssh-agent.socket \
> +    ${systemd_user_unitdir}/gcr-ssh-agent.service \
> +"
> +
> +# http://errors.yoctoproject.org/Errors/Details/20229/
> +ARM_INSTRUCTION_SET:armv4 = "arm"
> +ARM_INSTRUCTION_SET:armv5 = "arm"
> +ARM_INSTRUCTION_SET:armv6 = "arm"
> +
> +EXTRA_OEMESON += "-Dgpg_path=${bindir}/gpg2"
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.6.7.bb b/meta/recipes-gnome/gtk+/gtk4_4.6.7.bb
> new file mode 100644
> index 0000000000..c71be23a7d
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.6.7.bb
> @@ -0,0 +1,142 @@
> +SUMMARY = "Multi-platform toolkit for creating GUIs"
> +DESCRIPTION = "GTK is a multi-platform toolkit for creating graphical user interfaces. Offering a complete \
> +set of widgets, GTK is suitable for projects ranging from small one-off projects to complete application suites."
> +HOMEPAGE = "http://www.gtk.org"
> +BUGTRACKER = "https://bugzilla.gnome.org/"
> +SECTION = "libs"
> +
> +DEPENDS = " \
> +    sassc-native \
> +    glib-2.0 \
> +    libepoxy \
> +    graphene \
> +    cairo \
> +    pango \
> +    atk \
> +    jpeg \
> +    libpng \
> +    librsvg \
> +    tiff \
> +    gdk-pixbuf-native gdk-pixbuf \
> +"
> +
> +LICENSE = "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM = " \
> +    file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
> +    file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
> +    file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
> +    file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
> +"
> +
> +MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
> +
> +UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
> +
> +SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
> +SRC_URI[sha256sum] = "effd2e7c4b5e2a5c7fad43e0f24adea68baa4092abb0b752caff278e6bb010e8"
> +
> +S = "${WORKDIR}/gtk-${PV}"
> +
> +inherit meson gettext pkgconfig gtk-doc update-alternatives gsettings features_check gobject-introspection
> +
> +# TBD: nativesdk
> +# gobject-introspection.bbclass pins introspection off for nativesk. As long as
> +# we do not remove this wisdom or hack gtk4, it is not possible to build
> +# nativesdk-gtk4
> +BBCLASSEXTEND = "native"
> +
> +GSETTINGS_PACKAGE:class-native = ""
> +
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +REQUIRED_DISTRO_FEATURES = "opengl"
> +
> +GIR_MESON_ENABLE_FLAG = 'enabled'
> +GIR_MESON_DISABLE_FLAG = 'disabled'
> +GTKDOC_MESON_OPTION = 'gtk_doc'
> +
> +EXTRA_OEMESON = " -Dbuild-tests=false"
> +
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
> +PACKAGECONFIG:class-native = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +PACKAGECONFIG:class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +
> +PACKAGECONFIG[x11] = "-Dx11-backend=true,-Dx11-backend=false,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes xinerama"
> +PACKAGECONFIG[wayland] = "-Dwayland-backend=true,-Dwayland-backend=false,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2 wayland-native"
> +PACKAGECONFIG[cups] = "-Dprint-cups=enabled,-Dprint-cups=disabled,cups"
> +PACKAGECONFIG[colord] = "-Dcolord=enabled,-Dcolord=disabled,colord"
> +# gtk4 wants gstreamer-player-1.0 -> gstreamer1.0-plugins-bad
> +PACKAGECONFIG[gstreamer] = "-Dmedia-gstreamer=enabled,-Dmedia-gstreamer=disabled,gstreamer1.0-plugins-bad"
> +PACKAGECONFIG[tracker] = "-Dtracker=enabled,-Dtracker=disabled,tracker"
> +
> +
> +do_compile:prepend() {
> +    export GIR_EXTRA_LIBS_PATH="${B}/gdk/.libs"
> +}
> +
> +
> +PACKAGES =+ "${PN}-demo"
> +LIBV = "4.0.0"
> +
> +FILES:${PN}-demo = " \
> +    ${datadir}/applications/org.gtk.Demo4.desktop \
> +    ${datadir}/applications/org.gtk.IconBrowser4.desktop \
> +    ${datadir}/applications/org.gtk.WidgetFactory4.desktop \
> +    ${datadir}/icons/hicolor/*/apps/org.gtk.Demo4*.* \
> +    ${datadir}/icons/hicolor/*/apps/org.gtk.IconBrowser4*.* \
> +    ${datadir}/icons/hicolor/*/apps/org.gtk.WidgetFactory4*.* \
> +    ${bindir}/gtk4-demo \
> +    ${bindir}/gtk4-demo-application \
> +    ${bindir}/gtk4-icon-browser \
> +    ${bindir}/gtk4-widget-factory \
> +"
> +
> +FILES:${PN}:append = " \
> +    ${datadir}/glib-2.0/schemas/ \
> +    ${datadir}/gtk-4.0/emoji/ \
> +    ${datadir}/metainfo/ \
> +    ${datadir}/icons/hicolor/*/apps/org.gtk.PrintEditor4*.* \
> +    ${libdir}/gtk-4.0/${LIBV}/printbackends \
> +    ${bindir}/gtk4-update-icon-cache \
> +    ${bindir}/gtk4-launch \
> +"
> +
> +FILES:${PN}-dev += " \
> +    ${datadir}/gtk-4.0/gtk4builder.rng \
> +    ${datadir}/gtk-4.0/include \
> +    ${datadir}/gtk-4.0/valgrind \
> +    ${datadir}/gettext/its \
> +    ${bindir}/gtk4-builder-tool \
> +    ${bindir}/gtk4-encode-symbolic-svg \
> +    ${bindir}/gtk4-query-settings \
> +"
> +
> +GTKBASE_RRECOMMENDS ?= " \
> +    liberation-fonts \
> +    gdk-pixbuf-loader-png \
> +    gdk-pixbuf-loader-jpeg \
> +    gdk-pixbuf-loader-gif \
> +    gdk-pixbuf-loader-xpm \
> +    shared-mime-info \
> +    adwaita-icon-theme-symbolic \
> +"
> +
> +GTKBASE_RRECOMMENDS:class-native ?= ""
> +
> +GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
> +
> +RRECOMMENDS:${PN} = "${GTKBASE_RRECOMMENDS}"
> +RRECOMMENDS:${PN}:libc-glibc = "${GTKGLIBC_RRECOMMENDS}"
> +RDEPENDS:${PN}-dev += "${@bb.utils.contains("PACKAGECONFIG", "wayland", "wayland-protocols", "", d)}"
> +
> +PACKAGES_DYNAMIC += "^gtk4-printbackend-.*"
> +python populate_packages:prepend () {
> +    import os.path
> +
> +    gtk_libdir = d.expand('${libdir}/gtk-3.0/${LIBV}')
> +    printmodules_root = os.path.join(gtk_libdir, 'printbackends');
> +
> +    do_split_packages(d, printmodules_root, r'^libprintbackend-(.*)\.so$', 'gtk4-printbackend-%s', 'GTK printbackend module for %s')
> +
> +    if (d.getVar('DEBIAN_NAMES')):
> +        d.setVar(d.expand('PKG:${PN}'), '${MLPREFIX}libgtk-4.0')
> +}
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173961): https://lists.openembedded.org/g/openembedded-core/message/173961
> Mute This Topic: https://lists.openembedded.org/mt/95329790/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

