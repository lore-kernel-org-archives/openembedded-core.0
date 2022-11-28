Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBC3C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 16:13:11 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.122228.1669651987189585341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 08:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WRopzQG2;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id j16so18109330lfe.12
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 08:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yj4fi+pruDM5Y32XwoQ7Lt3DqNJh9gpI9lwMb0Av+Dc=;
        b=WRopzQG2A9K+IYNVey/TDXLw16w4icChSafNt281Aa7Jrg9v8qECxB3hqYoX0j4jXl
         bOr3/tcjmMJIg/n4ZCUUNzKH+w93jY4yEgsCjV+rSqZuNNz2DUxwiRmhSlAa6MYr3jZv
         4RMzoEYl6wriwbXxoX3Ka810U3OADeaDkZUChQVPh9piQ6JmmU6GfCDB/KR0nyCCT1P3
         eqHxfkJsB1S8OtOCynSf+kKNg0laE270Nyraf372o+++XccEt2a63Kt7EfPaEaRNSGlh
         wC+IW02zVuDuQlXQyyEG5KFMuGHORNr3ge1uYmeuZjjbj9E798J2dYC3Q9az4fkEkpce
         yKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yj4fi+pruDM5Y32XwoQ7Lt3DqNJh9gpI9lwMb0Av+Dc=;
        b=yzMPbnGSP9e0a7iyYlCRHuzfL/sE+Udoy1mM2/th6lQCOXdKRCiZKOUP1nAIO9QCWX
         B16SHTJ7IRoVjkVw+MQEdbB9yMg6N9NaSlrPFYFcJyoU5W0t+X7dDf5saH4e3VA3EI8u
         E5lbdDMKhirZuWYzQ8d5IC4KC3h8lOsUuWXm1lhfZA+Ho5ZGz4xseXWrSsUsNBi4MzqQ
         KnndcJ5c29TsLB3dSbzSR6lZbAUeLVkwdtiYY5mEJEibKMK2EnyUzSAI0BY14tWyHSxt
         cmDDQbhy9zzr3n3ptN0BWQHVzHl87Im5/XbJ4ndr4Xueeh7akXM7MQrYnFhBiHntxowe
         IDtA==
X-Gm-Message-State: ANoB5pmCM2kribazy/+ZLwyqZrWREd9Y+S/v5e9IwKvvUdw/EnW1a5CB
	Vm4yUp33YRigkwTSazjGCxyXhQmOVM1fLLQh+1E=
X-Google-Smtp-Source: AA0mqf5LJdY3JX6ltS/RFXM/4NM/VAs4xz5ZfqKfC7vuxBEDc4X/FnhN4UK9QhBlZNPg7o840C3M69F+L9wo2Ys4Wk4=
X-Received: by 2002:ac2:4a62:0:b0:4aa:323f:e850 with SMTP id
 q2-20020ac24a62000000b004aa323fe850mr17658330lfp.492.1669651984861; Mon, 28
 Nov 2022 08:13:04 -0800 (PST)
MIME-Version: 1.0
References: <20221128160842.335665-1-f_l_k@t-online.de>
In-Reply-To: <20221128160842.335665-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Nov 2022 17:12:53 +0100
Message-ID: <CANNYZj-kEos_m9v=M4t_w3gZLxrX7h4qvtV0WNHwy2zL=7sacQ@mail.gmail.com>
Subject: Re: [oe-core][PATCHv4] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 16:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173928

It's me again :)
I think epiphany is going to fail unless adjusted to gcr. There might
be more pieces in core, not sure. Yes it's annoying to wait for webkit
to build before you can test that.

Alex

On Mon, 28 Nov 2022 at 17:08, Markus Volk <f_l_k@t-online.de> wrote:
>
> gcr-3 recipe is still needed for gnome projects that stick to gtk+3, rename to gcr3.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...-add-options-to-set-ssh-binary-paths.patch | 60 +++++++++++++++++++
>  ...ectly-handle-disabled-ssh_agent-opti.patch | 49 +++++++++++++++
>  ...build-fix-one-parallel-build-failure.patch |  0
>  ...1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch |  0
>  .../gcr/{gcr_3.40.0.bb => gcr3_3.40.0.bb}     |  8 ++-
>  meta/recipes-gnome/gcr/gcr_4.0.0.bb           | 51 ++++++++++++++++
>  6 files changed, 166 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-gnome/gcr/gcr/0001-meson-add-options-to-set-ssh-binary-paths.patch
>  create mode 100644 meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patch
>  rename meta/recipes-gnome/gcr/{gcr => gcr3}/0001-gcr-meson.build-fix-one-parallel-build-failure.patch (100%)
>  rename meta/recipes-gnome/gcr/{gcr => gcr3}/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch (100%)
>  rename meta/recipes-gnome/gcr/{gcr_3.40.0.bb => gcr3_3.40.0.bb} (87%)
>  create mode 100644 meta/recipes-gnome/gcr/gcr_4.0.0.bb
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
> index 0000000000..21f5f30fbf
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
> +EXTRA_OEMESON += "-Dgpg_path=${bindir}/gpg"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173927): https://lists.openembedded.org/g/openembedded-core/message/173927
> Mute This Topic: https://lists.openembedded.org/mt/95313232/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

