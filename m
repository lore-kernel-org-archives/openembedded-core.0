Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1ADDC001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 11:44:19 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.5329.1690458256959931401
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 04:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qe1C7aku;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b9bd59d465so12189061fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 04:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690458255; x=1691063055;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=118UsAwLkVTxnJoZAH5YUHwt1Rry2gj0PrjQfn17wg8=;
        b=qe1C7akuRIpJNyZAoPc6eEsLuyGRlBPXNKd2kzEbky1VusLgX1Yt9C75bb0vIkQYaM
         LRzGZohkLwCLZnBWuZnS13b9aYwtxLXqsKssuUupsC95x/GVE41GYDLrGOIllFdlAQ2X
         frQ1su1OJU6VpXTJOmzdQ8WkUDh8oBAQUcR3irmOFVA1mso9l08n9DrmaUZyRuOS79Np
         NmJqy51IL/CX3xhmxqOrF8b8CfvIvWluKUwPQ/0Qbid536iIWunvLy3c3e79oBisNEY/
         qqAsegh/R81MXuHg4CSw1cWbTL6vf2dLn9epIowc3BOEodkFUbwYehCpMT31JxSqUhZV
         Nd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690458255; x=1691063055;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=118UsAwLkVTxnJoZAH5YUHwt1Rry2gj0PrjQfn17wg8=;
        b=VgyPeKf2ihj9vsqlczY+i/Ag2h4IP4OvNuEz46JT+ICaVxN3bH1cPVTXaBNx/jSl31
         anAy/uqtB348jkd9oV/Lr66CjqKWvxJUuRWl5gayU8x8gnZ2jT0RHvi+8wPCT+IUEpGY
         FNsa2jnGZxcJlTedF0mQfq6epvBSZMHm3jf9o6oPpwYP+5s/DIxosoE0yfSCX0vy6Xgg
         qmQM0BDoRxqI+drEHVdPMe1Z6NSDJLOstQ1MhfYqhVsSqKCOCFSILfLp4rQscImz9Dtj
         hQ8W6YUg07VBvgMP+w70kekLQopZukKsqnT4mJ2piqsRdOd3LPlqSfyiK6byKAvGbWUY
         rGZg==
X-Gm-Message-State: ABy/qLYmWW/zLC4NG+VBJTattZDMKWpBs543aOeHAMGqrKicB7oF9Bv/
	FScWjF3ZOUW0/MyLFwcv9i+0AOB8LHi6QxSqxVA=
X-Google-Smtp-Source: APBJJlHC7yYAbihZk04ufs5MpEkwyyysTAXT12A3MpQ1RbPZiE96cWawt6ZIU1GVAlD4AfvhGvOq9b8eRZsSO64pv7M=
X-Received: by 2002:a2e:730b:0:b0:2b6:cbba:1307 with SMTP id
 o11-20020a2e730b000000b002b6cbba1307mr1587248ljc.0.1690458254783; Thu, 27 Jul
 2023 04:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230727113807.4743-1-f_l_k@t-online.de>
In-Reply-To: <20230727113807.4743-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Jul 2023 13:44:03 +0200
Message-ID: <CANNYZj9zQwGcGHaV0BU6JDDfxyRBkS+yShasBfehUsd7kkfkVg@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gcr3: remove recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 11:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184930

Note that this needs to be applied on top of my upcoming patchset
which is coming shortly :)

Alex

On Thu, 27 Jul 2023 at 13:38, Markus Volk <f_l_k@t-online.de> wrote:
>
> It will be added to meta-gnome
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 -
>  ...ectly-handle-disabled-ssh_agent-opti.patch | 36 -----------
>  meta/recipes-gnome/gcr/gcr3_3.41.1.bb         | 59 -------------------
>  3 files changed, 96 deletions(-)
>  delete mode 100644 meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
>  delete mode 100644 meta/recipes-gnome/gcr/gcr3_3.41.1.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 17f038c71e..f058647ce5 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -189,7 +189,6 @@ RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gcc-source-13.1.1 = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
> -RECIPE_MAINTAINER:pn-gcr3 = "Markus Volk <f_l_k@t-online.de>"
>  RECIPE_MAINTAINER:pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-gdb = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gdb-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
> diff --git a/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch b/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
> deleted file mode 100644
> index d3c26d97ae..0000000000
> --- a/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 9b67bb18d8409e0e693cc6000507acbd73a30eab Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Wed, 16 Nov 2022 11:27:24 +0100
> -Subject: [PATCH 1/2] meson.build: correctly handle disabled ssh_agent option
> -
> -Existing code produces these errors:
> -| gcr/meson.build:61:0: ERROR: Unable to get the path of a not-found external program
> -| gcr/meson.build:101:5: ERROR: Unknown variable "ssh_add_path".
> -
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> -
> -Upstream-Status: Backport [ https://gitlab.gnome.org/GNOME/gcr/-/commit/9b67bb18d8409e0e693cc6000507acbd73a30eab ]
> ----
> - meson.build | 12 ++++++++----
> - 1 file changed, 8 insertions(+), 4 deletions(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 3f35173..11d7fa7 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -96,8 +98,10 @@ conf.set('HAVE_TIMEGM', cc.has_function('timegm'))
> - conf.set('HAVE_MLOCK', cc.has_function('mlock'))
> - conf.set_quoted('GPG_EXECUTABLE', gpg_path)
> - conf.set_quoted('LIBGCRYPT_VERSION', libgcrypt_dep.version())
> --conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
> --conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
> -+if get_option('ssh_agent')
> -+  conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
> -+  conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
> -+endif
> - conf.set10('WITH_SYSTEMD', with_systemd)
> - config_file = configure_file(
> -   output: 'config.h',
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-gnome/gcr/gcr3_3.41.1.bb b/meta/recipes-gnome/gcr/gcr3_3.41.1.bb
> deleted file mode 100644
> index ba5660a5ed..0000000000
> --- a/meta/recipes-gnome/gcr/gcr3_3.41.1.bb
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -SUMMARY = "A library for bits of crypto UI and parsing etc"
> -DESCRIPTION = "GCR is a library for displaying certificates, and crypto UI, \
> -accessing key stores. It also provides the viewer for crypto files on the \
> -GNOME desktop."
> -HOMEPAGE = "https://gitlab.gnome.org/GNOME/gcr"
> -BUGTRACKER = "https://gitlab.gnome.org/GNOME/gcr/issues"
> -
> -LICENSE = "GPL-2.0-only"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
> -
> -DEPENDS = "p11-kit glib-2.0 libgcrypt gnupg-native \
> -           ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
> -
> -CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg2'"
> -
> -CFLAGS += "-D_GNU_SOURCE"
> -
> -GNOMEBASEBUILDCLASS = "meson"
> -GTKDOC_MESON_OPTION = "gtk_doc"
> -inherit gnomebase gtk-icon-cache gi-docgen features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
> -UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>3.(?!9\d+)\d+(\.\d+)+)\.tar"
> -
> -SRC_URI = "https://download.gnome.org/sources/gcr/3.41/gcr-${PV}.tar.xz;name=archive"
> -SRC_URI += "file://0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch"
> -SRC_URI[archive.sha256sum] = "bb7128a3c2febbfee9c03b90d77d498d0ceb237b0789802d60185c71c4bea24f"
> -
> -S = "${WORKDIR}/gcr-${PV}"
> -
> -PACKAGECONFIG ??= " \
> -       ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> -       ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
> -       ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
> -"
> -PACKAGECONFIG[gtk] = "-Dgtk=true,-Dgtk=false,gtk+3"
> -PACKAGECONFIG[ssh_agent] = "-Dssh_agent=true,-Dssh_agent=false,libsecret,openssh"
> -#'Use systemd socket activation for server programs'
> -PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
> -
> -FILES:${PN} += " \
> -    ${datadir}/dbus-1 \
> -    ${datadir}/gcr-3 \
> -    ${systemd_user_unitdir}/gcr-ssh-agent.socket \
> -    ${systemd_user_unitdir}/gcr-ssh-agent.service \
> -"
> -
> -# http://errors.yoctoproject.org/Errors/Details/20229/
> -ARM_INSTRUCTION_SET:armv4 = "arm"
> -ARM_INSTRUCTION_SET:armv5 = "arm"
> -ARM_INSTRUCTION_SET:armv6 = "arm"
> -
> -EXTRA_OEMESON += "--cross-file ${WORKDIR}/meson-${PN}.cross"
> -do_write_config:append() {
> -    cat >${WORKDIR}/meson-${PN}.cross <<EOF
> -[binaries]
> -gpg2 = '${bindir}/gpg2'
> -ssh-add = '${bindir}/ssh-add'
> -ssh-agent = '${bindir}/ssh-agent'
> -EOF
> -}
> --
> 2.39.3
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184929): https://lists.openembedded.org/g/openembedded-core/message/184929
> Mute This Topic: https://lists.openembedded.org/mt/100388552/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

