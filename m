Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47541C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 15:46:52 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.15987.1672933610710234196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 07:46:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a7/iJKhp;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id bn6so29139440ljb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 07:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkDaSa0TSTQGoQJ8gI4W/It7AR0E/v0iccYXbRemsuM=;
        b=a7/iJKhpCMnPPKSzbDdO6z4tzJRn8quRKUp+ct8Tsd6gOssDCgOSjyZfBup2zzpy2i
         cTFOM4h9HJyM1dnxVLO4AdZVFU8MA4bm2j3Gx7ZOrUbOIC5/NOV/slD8cHW0eBBARWyB
         2FlZ9LuGxEx6rSfi8jQFwBZ6JM7ctNIV6ystLuP5MWnt4lBd4CwQ587MH1Wuh1oF6T1B
         zstjCGhIHcrGM2cj0DUpJJWbrdeZ7n1/5XalO8q7bsf0NixT0nUjZ/GHBdke9dN0OF0n
         twJ2NEdg1FBxiwPDtdZEMDWLMOifDWK3W7kk9RbBsO5tkPUqXWoEKCQDzfSX2AMWBt0a
         9b3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkDaSa0TSTQGoQJ8gI4W/It7AR0E/v0iccYXbRemsuM=;
        b=v4sFrfbEJ9stHnlG/+hO3IX7USVKYBfBWnIJ1KvGLiZRBZTPAZIWEwwOWZzXxNu65w
         uvfXoJkzOryqvzIoIxxgfosQDszXjwD49AMqAWADiKCQnGEpgTtcyusUr1xMbZKJmOrl
         BfnifKqxCCS9DcQD7dvlUFT0/aLedpv9B0eRGwnuokXWv+Yls0Qdigo7RTx5H+u//5ly
         B2lEvrOUr3ONaxic9umRUe/cgP/sni38DuNjI+ypkkDirQGJh0YWbly6uWS1YGIK3Msq
         mv6+4ObIntBwOFDhJS2UtBMdcRmkmI/KHXGomcvyyKNSUZ+bvQTZX/+qJjanYr9J6ULt
         DecQ==
X-Gm-Message-State: AFqh2ko4bH6MON1+KcPC+wqXHkKkKuDm2Idb1cYmYtB5LBgcVidqXXHf
	D+baeXjnPwNF/uCIxp0XpqoVpgDBGGMGbJcsoP0=
X-Google-Smtp-Source: AMrXdXubbT5WIpzw2UgHLgaUiSU7cbvCSigeGyDKO7GqyrADVwMfAi2mdZ48BRGdZKmjq2gEOVkvsoBJ4JxOZCvLUEA=
X-Received: by 2002:a2e:2246:0:b0:279:bf32:34dd with SMTP id
 i67-20020a2e2246000000b00279bf3234ddmr4312896lji.31.1672933608958; Thu, 05
 Jan 2023 07:46:48 -0800 (PST)
MIME-Version: 1.0
References: <20230101142414.463881-1-f_l_k@t-online.de> <Y7YD1ZgSe7b+UIBt@mail.local>
 <DMR0OR.Q1D80VIV2M3N1@t-online.de>
In-Reply-To: <DMR0OR.Q1D80VIV2M3N1@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Jan 2023 16:46:37 +0100
Message-ID: <CANNYZj_A=RVVUVu0YQDWMOk=9ZXEQq3=UoR3iA+DAOP-qpe1AA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gcr3: update 3.40.0 -> 3.41.1
To: Markus Volk <f_l_k@t-online.de>
Cc: alexandre.belloni@bootlin.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 15:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175541

The key error is:
| Program gi-docgen found: NO
|
| ../gcr-3.41.1/docs/meson.build:1:0: ERROR: Program 'gi-docgen' not
found or not executable

So you need to add 'api-documentation' to DISTRO_FEATURES and then it
will reproduce. Probably gtk_doc class needs to be replaced with
gi-docgen.

Alex

On Thu, 5 Jan 2023 at 16:42, Markus Volk <f_l_k@t-online.de> wrote:
>
> I can't see much in the log. I'll take a closer look when I get a chance,=
 but so far I can't reproduce the problem. But I think there is no pressure=
 for the update
>
>
> Am Mi, 4. Jan 2023 um 23:55:17 +0100 schrieb Alexandre Belloni via lists.=
openembedded.org <alexandre.belloni=3Dbootlin.com@lists.openembedded.org>:
>
> This failed on the AB: https://autobuilder.yoctoproject.org/typhoon/#/bui=
lders/108/builds/3976/steps/11/logs/stdio On 01/01/2023 15:24:14+0100, Mark=
us Volk wrote:
>
> - remove unneded backport patches - partly import the patch to fix ssh_ag=
ent option from gcr4 recipe gcr 3.41.1: - meson: Fix unknown kw argument in=
 gnome.generate_gir [GNOME/gcr!68] - gcr: Add G_SPAWN_CLOEXEC_PIPES flag to=
 all the g_spawn commands - docs: Port from gtk-doc to gi-docgen [GNOME/gcr=
!76] - Unbreak build without systemd [GNOME/gcr!75] - Several CI fixes - Up=
dated translations gcr 3.41.0: - Port ssh-agent from gnome-keyring [GNOME/g=
cr!67] - build: Fix parallel build failure due to missing marshal dependenc=
y [GNOME/gcr!68] - Fix warnings by dropping `volatile` for g_once_init_inte=
r locations [GNOME/gcr!69] - tests: More robust against GTask unref race co=
ndition [GNOME/gcr!72,GNOME/gcr#84] - Updated translations Signed-off-by: M=
arkus Volk <f_l_k@t-online.de> --- ...build-fix-one-parallel-build-failure.=
patch | 37 ----------- ...ectly-handle-disabled-ssh_agent-opti.patch | 36 +=
++++++++++ ...1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch | 61 -------------=
------ .../gcr/{gcr3_3.40.0.bb =3D> gcr3_3.41.1.bb} | 17 ++++-- 4 files cha=
nged, 47 insertions(+), 104 deletions(-) delete mode 100644 meta/recipes-gn=
ome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch crea=
te mode 100644 meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handl=
e-disabled-ssh_agent-opti.patch delete mode 100644 meta/recipes-gnome/gcr/g=
cr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch rename meta/recipes-gnom=
e/gcr/{gcr3_3.40.0.bb =3D> gcr3_3.41.1.bb} (69%) diff --git a/meta/recipes-=
gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch b/=
meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-fai=
lure.patch deleted file mode 100644 index 81c4bdbbcc..0000000000 --- a/meta=
/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure=
.patch +++ /dev/null @@ -1,37 +0,0 @@ -From cb3708bad88e713e4ccf705cb8c14c5=
996cd9d06 Mon Sep 17 00:00:00 2001 -From: Changqing Li <changqing.li@windri=
ver.com> -Date: Fri, 23 Apr 2021 16:32:38 +0800 -Subject: [PATCH] gcr/meson=
.build: fix one parallel build failure - -ui/gcr-live-search.c includes gcr=
/gcr-marshal.h. Because missing -dependency, following error occurred inter=
mittently during doing parallel -build: - - -o ui/libgcr-ui-3.so.1.0.0.p/gc=
r-live-search.c.o -c ../gcr-3.38.1/ui/gcr-live-search.c -../gcr-3.38.1/ui/g=
cr-live-search.c:32:10: fatal error: gcr/gcr-marshal.h: No such file or dir=
ectory - 32 | #include "gcr/gcr-marshal.h" - | ^~~~~~~~~~~~~~~~~~~ -compila=
tion terminated. - -Upstream-Status: Submitted [https://gitlab.gnome.org/GN=
OME/gcr/-/merge_requests/68/diffs] - -Signed-off-by: Changqing Li <changqin=
g.li@windriver.com> ---- - gcr/meson.build | 1 + - 1 file changed, 1 insert=
ion(+) - -diff --git a/gcr/meson.build b/gcr/meson.build -index 06c3a63..d9=
d4b8f 100644 ---- a/gcr/meson.build -+++ b/gcr/meson.build -@@ -181,6 +181,=
7 @@ gcr_base_dep =3D declare_dependency( - sources: [ - gcr_enums_gen[1], =
- gcr_oids[1], -+ gcr_marshal_gen[1], - ], - ) - --- -2.17.1 - diff --git a=
/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-handle-disabled-ssh=
_agent-opti.patch b/meta/recipes-gnome/gcr/gcr3/0001-meson.build-correctly-=
handle-disabled-ssh_agent-opti.patch new file mode 100644 index 0000000000.=
.d3c26d97ae --- /dev/null +++ b/meta/recipes-gnome/gcr/gcr3/0001-meson.buil=
d-correctly-handle-disabled-ssh_agent-opti.patch @@ -0,0 +1,36 @@ +From 9b6=
7bb18d8409e0e693cc6000507acbd73a30eab Mon Sep 17 00:00:00 2001 +From: Alexa=
nder Kanavin <alex@linutronix.de> +Date: Wed, 16 Nov 2022 11:27:24 +0100 +S=
ubject: [PATCH 1/2] meson.build: correctly handle disabled ssh_agent option=
 + +Existing code produces these errors: +| gcr/meson.build:61:0: ERROR: Un=
able to get the path of a not-found external program +| gcr/meson.build:101=
:5: ERROR: Unknown variable "ssh_add_path". + +Signed-off-by: Alexander Kan=
avin <alex@linutronix.de> + +Upstream-Status: Backport [ https://gitlab.gno=
me.org/GNOME/gcr/-/commit/9b67bb18d8409e0e693cc6000507acbd73a30eab ] +--- +=
 meson.build | 12 ++++++++---- + 1 file changed, 8 insertions(+), 4 deletio=
ns(-) + +diff --git a/meson.build b/meson.build +index 3f35173..11d7fa7 100=
644 +--- a/meson.build ++++ b/meson.build +@@ -96,8 +98,10 @@ conf.set('HAV=
E_TIMEGM', cc.has_function('timegm')) + conf.set('HAVE_MLOCK', cc.has_funct=
ion('mlock')) + conf.set_quoted('GPG_EXECUTABLE', gpg_path) + conf.set_quot=
ed('LIBGCRYPT_VERSION', libgcrypt_dep.version()) +-conf.set_quoted('SSH_ADD=
_EXECUTABLE', ssh_add_path) +-conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_a=
gent_path) ++if get_option('ssh_agent') ++ conf.set_quoted('SSH_ADD_EXECUTA=
BLE', ssh_add_path) ++ conf.set_quoted('SSH_AGENT_EXECUTABLE', ssh_agent_pa=
th) ++endif + conf.set10('WITH_SYSTEMD', with_systemd) + config_file =3D co=
nfigure_file( + output: 'config.h', +-- +2.34.1 + diff --git a/meta/recipes=
-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch b/meta/recip=
es-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch deleted fi=
le mode 100644 index ae4e2ac1eb..0000000000 --- a/meta/recipes-gnome/gcr/gc=
r3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch +++ /dev/null @@ -1,61 +0=
,0 @@ -From b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8 Mon Sep 17 00:00:00 20=
01 -From: Jakub Jirutka <jakub@jirutka.cz> -Date: Wed, 12 Jan 2022 00:24:20=
 +0100 -Subject: [PATCH] meson: Fix unknown kw argument in gnome.generate_g=
ir - -This argument has been removed in Meson 0.61.0: - - gck/meson.build:1=
30:2: ERROR: gnome.generate_gir got unknown keyword arguments "packages" - =
-https://github.com/mesonbuild/meson/commit/f8fc5cb860465718fe7c79a1bf1fe00=
659f138de: - -> The packages argument to gnome.generate_gir was allowed, bu=
t never did anything, so stop passing it. - -Fixes #89 -Upstream-Status: Ba=
ckport -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com> ---- - gc=
k/meson.build | 1 - - gcr/meson.build | 1 - - ui/meson.build | 1 - - 3 file=
s changed, 3 deletions(-) - -diff --git a/gck/meson.build b/gck/meson.build=
 -index 756b486..a21a1e9 100644 ---- a/gck/meson.build -+++ b/gck/meson.bui=
ld -@@ -131,7 +131,6 @@ if get_option('introspection') - sources: gck_gir_s=
ources, - namespace: 'Gck', - nsversion: '@0@'.format(gck_major_version), -=
- packages: gck_deps, - export_packages: 'gck-@0@'.format(gck_major_version=
), - includes: [ 'GObject-2.0', 'Gio-2.0' ], - header: 'gck/gck.h', -diff -=
-git a/gcr/meson.build b/gcr/meson.build -index 2233a44..c83641b 100644 ---=
- a/gcr/meson.build -+++ b/gcr/meson.build -@@ -190,7 +190,6 @@ if get_opti=
on('introspection') - sources: [ gcr_base_public_sources, gcr_base_headers =
], - namespace: 'Gcr', - nsversion: '@0@'.format(gcr_major_version), -- pac=
kages: gcr_base_deps, - export_packages: 'gcr-base-@0@'.format(gcr_major_ve=
rsion), - includes: [ - 'GObject-2.0', -diff --git a/ui/meson.build b/ui/me=
son.build -index e656ea2..32ee057 100644 ---- a/ui/meson.build -+++ b/ui/me=
son.build -@@ -152,7 +152,6 @@ if get_option('introspection') - export_pack=
ages: 'gcr-ui-@0@'.format(gcr_major_version), - identifier_prefix: 'Gcr', -=
 symbol_prefix: 'gcr', -- packages: gcr_ui_deps, - includes: [ - 'GObject-2=
.0', - 'Gio-2.0', --- -GitLab - diff --git a/meta/recipes-gnome/gcr/gcr3_3.=
40.0.bb b/meta/recipes-gnome/gcr/gcr3_3.41.1.bb similarity index 69% rename=
 from meta/recipes-gnome/gcr/gcr3_3.40.0.bb rename to meta/recipes-gnome/gc=
r/gcr3_3.41.1.bb index 5318768db6..273728f6c8 100644 --- a/meta/recipes-gno=
me/gcr/gcr3_3.40.0.bb +++ b/meta/recipes-gnome/gcr/gcr3_3.41.1.bb @@ -20,24=
 +20,27 @@ GTKDOC_MESON_OPTION =3D "gtk_doc" inherit gnomebase gtk-icon-cac=
he gtk-doc features_check upstream-version-is-even vala gobject-introspecti=
on gettext mime mime-xdg UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>\d+\.(?!=
9\d+)(\d*[02468])+(\.\d+)+)\.tar" -SRC_URI =3D " \ - https://download.gnome=
.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=3Darchive \ - file://0001-gcr-m=
eson.build-fix-one-parallel-build-failure.patch \ - file://b3ca1d02bb0148ca=
787ac4aead164d7c8ce2c4d8.patch" - -SRC_URI[archive.sha256sum] =3D "b9d3645a=
5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5" +SRC_URI =3D "htt=
ps://download.gnome.org/sources/gcr/3.41/gcr-${PV}.tar.xz;name=3Darchive" +=
SRC_URI +=3D "file://0001-meson.build-correctly-handle-disabled-ssh_agent-o=
pti.patch" +SRC_URI[archive.sha256sum] =3D "bb7128a3c2febbfee9c03b90d77d498=
d0ceb237b0789802d60185c71c4bea24f" S =3D "${WORKDIR}/gcr-${PV}" PACKAGECONF=
IG ??=3D " \ + ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \ ${@bb=
.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \ ${@bb.utils.cont=
ains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \ " PACKAGECONFIG[gtk] =
=3D "-Dgtk=3Dtrue,-Dgtk=3Dfalse,gtk+3" +PACKAGECONFIG[ssh_agent] =3D "-Dssh=
_agent=3Dtrue,-Dssh_agent=3Dfalse,libsecret,openssh" +#'Use systemd socket =
activation for server programs' +PACKAGECONFIG[systemd] =3D "-Dsystemd=3Den=
abled,-Dsystemd=3Ddisabled,systemd" FILES:${PN} +=3D " \ ${datadir}/dbus-1 =
\ ${datadir}/gcr-3 \ + ${systemd_user_unitdir}/gcr-ssh-agent.socket \ + ${s=
ystemd_user_unitdir}/gcr-ssh-agent.service \ " # http://errors.yoctoproject=
.org/Errors/Details/20229/ @@ -50,5 +53,7 @@ do_write_config:append() { cat=
 >${WORKDIR}/meson-${PN}.cross <<EOF [binaries] gpg2 =3D '${bindir}/gpg2' +=
ssh-add =3D '${bindir}/ssh-add' +ssh-agent =3D '${bindir}/ssh-agent' EOF } =
-- 2.34.1
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and Kernel en=
gineering https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175540): https://lists.openembedded.org/g/openembedde=
d-core/message/175540
> Mute This Topic: https://lists.openembedded.org/mt/95988912/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

