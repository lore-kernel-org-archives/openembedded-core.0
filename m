Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03044C4167B
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 16:02:19 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.153387.1669737734272835465
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 08:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K6BDFtQ+;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id a7so17780705ljq.12
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 08:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzHVhB2Ic7xr7w1H0t2onHDfmP7DptmwfdTXSeKF4ks=;
        b=K6BDFtQ+cwstX9gpU7jaFx3GqoGyGOAXlgSBwpdMaJdN7e1Y2ma6Wb3LoCwf87jY3t
         zmC2BtiZnQFpz40C1MTr2G2xyexY56topMqd1XPJvMACrtwYdJ4pwAvEzFSTAk3RVzLl
         9M8G1awnjXwGLKEtPW8dAjFqxtCf+PaoUm5klPtqq2hgmRDrGdK3cRrTRcybd8tYiQJG
         Yqi61TVtf/rX9BFGbwEJ3M6VEBB97FmsJwC2dJoYIv7FKuSfYajmJU2FsKWRvLaI98US
         q7wBg785dg9E5nP7C8bekQZGwsRSr3iCdS3tCkLz2sP+Epsr37kEUjE8RWASJJCOr5yr
         xsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzHVhB2Ic7xr7w1H0t2onHDfmP7DptmwfdTXSeKF4ks=;
        b=jNE3aWjFK2sPNWt1GoqB6urGEZjaMuvPxikWH6/c27FaBJQFeX3Mkb4G3cg1exzQdd
         r8plMrfxfLnFLRJktsoY5nkAX1p2QDIDlGwIfPrwfZegO3U6pmJUlc0qfFwpmhd7cWC+
         DJprNsjN3k0AuozLI8NewmdKi0xOBhrCSiaSL53EUlSoXv0SbuGucdtlaE3zntUDDib1
         PpLyy+JqOPqXQ8eWfmQ05Ia5w9BKm7taiFrLTqFGHSWLBvQE2EpyjDf5N748fVby0BHw
         ej377A/OT8o3X11xHqihiNNoUAxIMvw2blHsuQu1GuPfPIhZ1isdaTFTlEvP6Se2jFS4
         C/Nw==
X-Gm-Message-State: ANoB5plyBDsms8IwycHVkNhFScjse+uQKGJdWoyhcKrXYdHYpgUrmkqU
	z9saktjhuTZ0VPawfOZOKbV5PbK4OGE1Htr6lLk=
X-Google-Smtp-Source: AA0mqf7C0rfGsOIpewnU/roRQY3ifnPi1/kWH/NWGHQqsQcdPAHj/cEUJlUbH3v198MAILTuc81Cl7OTdt8Yojq63Oc=
X-Received: by 2002:a2e:94cb:0:b0:279:8865:38e1 with SMTP id
 r11-20020a2e94cb000000b00279886538e1mr8695957ljh.217.1669737730591; Tue, 29
 Nov 2022 08:02:10 -0800 (PST)
MIME-Version: 1.0
References: <20221129132220.6357-1-f_l_k@t-online.de> <20221129132220.6357-2-f_l_k@t-online.de>
 <F7525B10-17D1-43C6-B2AF-DF5BAEE11246@arm.com>
In-Reply-To: <F7525B10-17D1-43C6-B2AF-DF5BAEE11246@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 29 Nov 2022 17:01:58 +0100
Message-ID: <CANNYZj9XvDiuZiUgKmEJcvHX_U7Q4KmH93GFGtH-N8FxqEn=GA@mail.gmail.com>
Subject: Re: [oe-core][PATCHv7 2/2] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Ross Burton <ross.burton@arm.com>
Cc: Markus Volk <f_l_k@t-online.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 16:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173982

Epiphany has moved to gtk4 in master. This makes us prepared for that.
https://github.com/GNOME/epiphany/blob/master/meson.build

Alex

On Tue, 29 Nov 2022 at 16:50, Ross Burton <ross.burton@arm.com> wrote:
>
> I=E2=80=99m obviously missing some context: why is gcr4 being added to co=
re along with gtk4?  Why can=E2=80=99t gcr4 be added to meta-gnome along wi=
th gtk4?
>
> Ross
>
>
> > On 29 Nov 2022, at 13:22, Markus Volk via lists.openembedded.org <f_l_k=
=3Dt-online.de@lists.openembedded.org> wrote:
> >
> > gcr-3 recipe is still needed for gnome projects that stick to gtk+3, re=
name to gcr3.
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> > ...-add-options-to-set-ssh-binary-paths.patch | 60 +++++++++++++++++++
> > ...ectly-handle-disabled-ssh_agent-opti.patch | 49 +++++++++++++++
> > ...build-fix-one-parallel-build-failure.patch |  0
> > ...1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch |  0
> > .../gcr/{gcr_3.40.0.bb =3D> gcr3_3.40.0.bb}     |  8 ++-
> > meta/recipes-gnome/gcr/gcr_4.0.0.bb           | 51 ++++++++++++++++
> > 6 files changed, 166 insertions(+), 2 deletions(-)
> > create mode 100644 meta/recipes-gnome/gcr/gcr/0001-meson-add-options-to=
-set-ssh-binary-paths.patch
> > create mode 100644 meta/recipes-gnome/gcr/gcr/0001-meson.build-correctl=
y-handle-disabled-ssh_agent-opti.patch
> > rename meta/recipes-gnome/gcr/{gcr =3D> gcr3}/0001-gcr-meson.build-fix-=
one-parallel-build-failure.patch (100%)
> > rename meta/recipes-gnome/gcr/{gcr =3D> gcr3}/b3ca1d02bb0148ca787ac4aea=
d164d7c8ce2c4d8.patch (100%)
> > rename meta/recipes-gnome/gcr/{gcr_3.40.0.bb =3D> gcr3_3.40.0.bb} (87%)
> > create mode 100644 meta/recipes-gnome/gcr/gcr_4.0.0.bb
> >
> > diff --git a/meta/recipes-gnome/gcr/gcr/0001-meson-add-options-to-set-s=
sh-binary-paths.patch b/meta/recipes-gnome/gcr/gcr/0001-meson-add-options-t=
o-set-ssh-binary-paths.patch
> > new file mode 100644
> > index 0000000000..cd3552464a
> > --- /dev/null
> > +++ b/meta/recipes-gnome/gcr/gcr/0001-meson-add-options-to-set-ssh-bina=
ry-paths.patch
> > @@ -0,0 +1,60 @@
> > +From 89992bde916fe53dd737a5d678bc66dd51cd1f45 Mon Sep 17 00:00:00 2001
> > +From: Markus Volk <f_l_k@t-online.de>
> > +Date: Mon, 28 Nov 2022 15:47:50 +0100
> > +Subject: [PATCH] meson: add options to set ssh binary paths
> > +
> > +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > +
> > +Upstream-Status: Submitted [ https://gitlab.gnome.org/GNOME/gcr/-/merg=
e_requests/115/diffs?commit_id=3Df19dfa4fe0986f3f75b29f9c05cead59fe87cd19 ]
> > +---
> > + meson.build       | 11 +++++++++--
> > + meson_options.txt | 10 ++++++++++
> > + 2 files changed, 19 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/meson.build b/meson.build
> > +index 11d7fa7..231d7e2 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -58,9 +58,16 @@ if p11_system_config_modules =3D=3D ''
> > +   error('Couldn\'t find location for pkcs11 module config')
> > + endif
> > + libsecret_dep =3D dependency('libsecret-1', version: '>=3D 0.20', req=
uired: get_option('ssh_agent'))
> > ++
> > + if get_option('ssh_agent')
> > +-  ssh_add_path =3D find_program('ssh-add').full_path()
> > +-  ssh_agent_path =3D find_program('ssh-agent').full_path()
> > ++  ssh_add_path =3D get_option('ssh_add_path')
> > ++  ssh_agent_path =3D get_option('ssh_agent_path')
> > ++  if ssh_add_path =3D=3D ''
> > ++    ssh_add_path =3D find_program('ssh-add').full_path()
> > ++  endif
> > ++  if ssh_agent_path =3D=3D ''
> > ++    ssh_agent_path =3D find_program('ssh-agent').full_path()
> > ++  endif
> > + endif
> > +
> > + with_systemd =3D false
> > +diff --git a/meson_options.txt b/meson_options.txt
> > +index 6840e44..5355940 100644
> > +--- a/meson_options.txt
> > ++++ b/meson_options.txt
> > +@@ -23,6 +23,16 @@ option('gpg_path',
> > +   value: '',
> > +   description: 'Path to gpg, autodetected if not set',
> > + )
> > ++option('ssh_add_path',
> > ++  type: 'string',
> > ++  value: '',
> > ++  description: 'Path to ssh-add, autodetected if not set',
> > ++)
> > ++option('ssh_agent_path',
> > ++  type: 'string',
> > ++  value: '',
> > ++  description: 'Path to ssh-agent, autodetected if not set',
> > ++)
> > + option('ssh_agent',
> > +   type: 'boolean',
> > +   value: true,
> > +--
> > +2.34.1
> > +
> > diff --git a/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-hand=
le-disabled-ssh_agent-opti.patch b/meta/recipes-gnome/gcr/gcr/0001-meson.bu=
ild-correctly-handle-disabled-ssh_agent-opti.patch
> > new file mode 100644
> > index 0000000000..940f78ebab
> > --- /dev/null
> > +++ b/meta/recipes-gnome/gcr/gcr/0001-meson.build-correctly-handle-disa=
bled-ssh_agent-opti.patch
> > @@ -0,0 +1,49 @@
> > +From 9b67bb18d8409e0e693cc6000507acbd73a30eab Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex@linutronix.de>
> > +Date: Wed, 16 Nov 2022 11:27:24 +0100
> > +Subject: [PATCH 1/2] meson.build: correctly handle disabled ssh_agent =
option
> > +
> > +Existing code produces these errors:
> > +| gcr/meson.build:61:0: ERROR: Unable to get the path of a not-found e=
xternal program
> > +| gcr/meson.build:101:5: ERROR: Unknown variable "ssh_add_path".
> > +
> > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > +
> > +Upstream-Status: Backport [ https://gitlab.gnome.org/GNOME/gcr/-/commi=
t/9b67bb18d8409e0e693cc6000507acbd73a30eab ]
> > +---
> > + meson.build | 12 ++++++++----
> > + 1 file changed, 8 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/meson.build b/meson.build
> > +index 3f35173..11d7fa7 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -58,8 +58,10 @@ if p11_system_config_modules =3D=3D ''
> > +   error('Couldn\'t find location for pkcs11 module config')
> > + endif
> > + libsecret_dep =3D dependency('libsecret-1', version: '>=3D 0.20', req=
uired: get_option('ssh_agent'))
> > +-ssh_add_path =3D find_program('ssh-add', required: get_option('ssh_ag=
ent')).full_path()
> > +-ssh_agent_path =3D find_program('ssh-agent', required: get_option('ss=
h_agent')).full_path()
> > ++if get_option('ssh_agent')
> > ++  ssh_add_path =3D find_program('ssh-add').full_path()
> > ++  ssh_agent_path =3D find_program('ssh-agent').full_path()
> > ++endif
> > +
> > + with_systemd =3D false
> > + libsystemd_deps =3D []
> > +@@ -96,8 +98,10 @@ conf.set('HAVE_TIMEGM', cc.has_function('timegm'))
> > + conf.set('HAVE_MLOCK', cc.has_function('mlock'))
> > + conf.set_quoted('GPG_EXECUTABLE', gpg_path)
> > + conf.set_quoted('LIBGCRYPT_VERSION', libgcrypt_dep.version())
> > +-conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
> > +-conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
> > ++if get_option('ssh_agent')
> > ++  conf.set_quoted('SSH_ADD_EXECUTABLE', ssh_add_path)
> > ++  conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_path)
> > ++endif
> > + conf.set10('WITH_SYSTEMD', with_systemd)
> > + config_file =3D configure_file(
> > +   output: 'config.h',
> > +--
> > +2.34.1
> > +
> > diff --git a/meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-pa=
rallel-build-failure.patch b/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.bui=
ld-fix-one-parallel-build-failure.patch
> > similarity index 100%
> > rename from meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-par=
allel-build-failure.patch
> > rename to meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-para=
llel-build-failure.patch
> > diff --git a/meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7=
c8ce2c4d8.patch b/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164=
d7c8ce2c4d8.patch
> > similarity index 100%
> > rename from meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c=
8ce2c4d8.patch
> > rename to meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8=
ce2c4d8.patch
> > diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb b/meta/recipes-gnome/=
gcr/gcr3_3.40.0.bb
> > similarity index 87%
> > rename from meta/recipes-gnome/gcr/gcr_3.40.0.bb
> > rename to meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> > index 917be5938b..5318768db6 100644
> > --- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
> > +++ b/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> > @@ -20,11 +20,15 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
> > inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-versio=
n-is-even vala gobject-introspection gettext mime mime-xdg
> > UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.=
\d+)+)\.tar"
> >
> > -SRC_URI +=3D "file://0001-gcr-meson.build-fix-one-parallel-build-failu=
re.patch \
> > -            file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
> > +SRC_URI =3D " \
> > + https://download.gnome.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=3Da=
rchive \
> > + file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch \
> > + file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
> >
> > SRC_URI[archive.sha256sum] =3D "b9d3645a5fd953a54285cc64d4fc046736463db=
d4dcc25caf5c7b59bed3027f5"
> >
> > +S =3D "${WORKDIR}/gcr-${PV}"
> > +
> > PACKAGECONFIG ??=3D " \
> > ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
> > ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
> > diff --git a/meta/recipes-gnome/gcr/gcr_4.0.0.bb b/meta/recipes-gnome/g=
cr/gcr_4.0.0.bb
> > new file mode 100644
> > index 0000000000..ff2f7978a9
> > --- /dev/null
> > +++ b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
> > @@ -0,0 +1,51 @@
> > +SUMMARY =3D "A library for bits of crypto UI and parsing etc"
> > +DESCRIPTION =3D "GCR is a library for displaying certificates, and cry=
pto UI, \
> > +accessing key stores. It also provides the viewer for crypto files on =
the \
> > +GNOME desktop."
> > +HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/gcr"
> > +BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gcr/issues"
> > +
> > +LICENSE =3D "GPL-2.0-only"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9a=
bc605"
> > +
> > +DEPENDS =3D "p11-kit glib-2.0 libgcrypt gnupg-native \
> > +           ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-na=
tive', '', d)}"
> > +
> > +CACHED_CONFIGUREVARS +=3D "ac_cv_path_GPG=3D'gpg2'"
> > +
> > +CFLAGS +=3D "-D_GNU_SOURCE"
> > +
> > +GNOMEBASEBUILDCLASS =3D "meson"
> > +GTKDOC_MESON_OPTION =3D "gtk_doc"
> > +inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-versi=
on-is-even vala gobject-introspection gettext mime mime-xdg
> > +UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\=
.\d+)+)\.tar"
> > +
> > +SRC_URI +=3D " \
> > + file://0001-meson.build-correctly-handle-disabled-ssh_agent-opti.patc=
h \
> > + file://0001-meson-add-options-to-set-ssh-binary-paths.patch \
> > +"
> > +SRC_URI[archive.sha256sum] =3D "c45855924f0ee7bab43e2dd38bfafd2ac815c6=
e9864341c0161e171173dcec7c"
> > +
> > +PACKAGECONFIG ??=3D " \
> > + ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> > + ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
> > + ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
> > +"
> > +PACKAGECONFIG[gtk] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4"
> > +PACKAGECONFIG[ssh_agent] =3D "-Dssh_agent=3Dtrue -Dssh_add_path=3D${bi=
ndir}/ssh-add -Dssh_agent_path=3D${bindir}/ssh-agent,-Dssh_agent=3Dfalse,li=
bsecret,openssh"
> > +#'Use systemd socket activation for server programs'
> > +PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,s=
ystemd"
> > +
> > +FILES:${PN} +=3D " \
> > +    ${datadir}/dbus-1 \
> > +    ${datadir}/gcr-4 \
> > +    ${systemd_user_unitdir}/gcr-ssh-agent.socket \
> > +    ${systemd_user_unitdir}/gcr-ssh-agent.service \
> > +"
> > +
> > +# http://errors.yoctoproject.org/Errors/Details/20229/
> > +ARM_INSTRUCTION_SET:armv4 =3D "arm"
> > +ARM_INSTRUCTION_SET:armv5 =3D "arm"
> > +ARM_INSTRUCTION_SET:armv6 =3D "arm"
> > +
> > +EXTRA_OEMESON +=3D "-Dgpg_path=3D${bindir}/gpg2"
> > --
> > 2.34.1
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173980): https://lists.openembedded.org/g/openembedde=
d-core/message/173980
> Mute This Topic: https://lists.openembedded.org/mt/95333761/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

