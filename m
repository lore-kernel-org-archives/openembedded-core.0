Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28278C43217
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 06:56:21 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.87453.1669532176014445423
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 22:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DdvZK1wv;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id a7so9647977ljq.12
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 22:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B3kzlyooUfMjuX9WuKMwEGsvZQUocjqai+6CHtMUTLs=;
        b=DdvZK1wvrVKT8XSi0TcVKsCUYvENS3k66HoqbBEXzLVzeflQdA+UyUkJMSyXJ79fZf
         Tp5nAr4i0QUmxp54lekroxc4k9iTJnCdy2PH35nSlqkThZo+sYzVwlit67p749PJ+wAI
         /pcrO7r6Ic91qDzzqdxMDi8i9vwE5CZHhh7jOXYsyFaCFXIRsnhl+ESyDSn2K78nNLXa
         I7uzpb428lEEcbE7O0WRY88g8tgL2mgj8KzIIUKQtI4b9MWLi+YVnRKPWnUGt8K3i9n8
         8QU98TSjfRLdDs4GiTYbLefUpnQCtuFG3xtYH1hNpuzPTZhVz/z5lebZo5nQj/2Jsr8a
         AX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3kzlyooUfMjuX9WuKMwEGsvZQUocjqai+6CHtMUTLs=;
        b=28trY8RLipUTP3cn2DX5ITx8/JB/q/8i/JHbHdIUlqAgQcGN7xHwudPFcf+yhiNk9f
         YIlKq8lqco6z3fmfk8090PlHZstDJNCYFsJlrV63k2VSkDSZbVI8+bTiMkPZEyrPybkU
         N3NKDiKsNNB1654K8Zscbu7BDHwV/thfkRyNgHD4I+opR6D0AiCYtzwiQtGPwSY81pU4
         e1yBlJpblFfQrG4vumJJSDZwAcccm2xVeE7vnqDL7bbi7GqLMmseZYswbIKfv+xJE3ry
         jh9MM9c9pA75CC/txGP2+px5GmhMEiwfrKqC+eZ6CrcY6bIq//fbYSJJGrAZu2clSgR7
         GBnA==
X-Gm-Message-State: ANoB5pn85b7dDmmMkGDEEfjk7ClK6Lak/8HSr6nUcLVtfiqTLZkx0tYE
	w+Dr0fWlWuXP13U79wqRDcXzZoQQ4WCsrR/qm9Y=
X-Google-Smtp-Source: AA0mqf7PgIMzHgCnp/yJAyW5UmLNcqvhi2/r9hKqPq6v+kmDr75K8BpiZsPujzO+JN/i2njmts7DH7BRwptTRAcwIUY=
X-Received: by 2002:a2e:94cb:0:b0:279:8865:38e1 with SMTP id
 r11-20020a2e94cb000000b00279886538e1mr4906974ljh.217.1669532173999; Sat, 26
 Nov 2022 22:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20221126230547.1432326-1-f_l_k@t-online.de> <20221126230547.1432326-2-f_l_k@t-online.de>
In-Reply-To: <20221126230547.1432326-2-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 27 Nov 2022 07:56:03 +0100
Message-ID: <CANNYZj85CRTtm7Qq1=UUS2MBfXoiBatbGa8ORVA6xVV-E1CSqA@mail.gmail.com>
Subject: Re: [oe-core][PATCH 2/2] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002c222f05ee6e40ab"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 06:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173837

--0000000000002c222f05ee6e40ab
Content-Type: text/plain; charset="UTF-8"

Can you name the 4.x recipe simply gcr please?

Alex

On Sun 27. Nov 2022 at 0.06, Markus Volk <f_l_k@t-online.de> wrote:

> gcr-3 recipe is still needed for gnome projects that stick to gtk+3,
> rename to gcr3.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...build-fix-one-parallel-build-failure.patch |  0
>  ...1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch |  0
>  .../gcr_3.40.0.bb => gcr4/gcr3_3.40.0.bb}     |  8 ++-
>  meta/recipes-gnome/gcr4/gcr4_4.0.0.bb         | 59 +++++++++++++++++++
>  4 files changed, 65 insertions(+), 2 deletions(-)
>  rename meta/recipes-gnome/{gcr/gcr =>
> gcr4/gcr3}/0001-gcr-meson.build-fix-one-parallel-build-failure.patch (100%)
>  rename meta/recipes-gnome/{gcr/gcr =>
> gcr4/gcr3}/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch (100%)
>  rename meta/recipes-gnome/{gcr/gcr_3.40.0.bb => gcr4/gcr3_3.40.0.bb}
> (87%)
>  create mode 100644 meta/recipes-gnome/gcr4/gcr4_4.0.0.bb
>
> diff --git
> a/meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> b/meta/recipes-gnome/gcr4/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> similarity index 100%
> rename from
> meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> rename to
> meta/recipes-gnome/gcr4/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> diff --git
> a/meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> b/meta/recipes-gnome/gcr4/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> similarity index 100%
> rename from
> meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> rename to
> meta/recipes-gnome/gcr4/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
> b/meta/recipes-gnome/gcr4/gcr3_3.40.0.bb
> similarity index 87%
> rename from meta/recipes-gnome/gcr/gcr_3.40.0.bb
> rename to meta/recipes-gnome/gcr4/gcr3_3.40.0.bb
> index 917be5938b..5318768db6 100644
> --- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
> +++ b/meta/recipes-gnome/gcr4/gcr3_3.40.0.bb
> @@ -20,11 +20,15 @@ GTKDOC_MESON_OPTION = "gtk_doc"
>  inherit gnomebase gtk-icon-cache gtk-doc features_check
> upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
>  UPSTREAM_CHECK_REGEX =
> "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
>
> -SRC_URI +=
> "file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch \
> -            file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
> +SRC_URI = " \
> +
> https://download.gnome.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=archive
> \
> +       file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch \
> +       file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"
>
>  SRC_URI[archive.sha256sum] =
> "b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5"
>
> +S = "${WORKDIR}/gcr-${PV}"
> +
>  PACKAGECONFIG ??= " \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
> diff --git a/meta/recipes-gnome/gcr4/gcr4_4.0.0.bb
> b/meta/recipes-gnome/gcr4/gcr4_4.0.0.bb
> new file mode 100644
> index 0000000000..13efdcc2bd
> --- /dev/null
> +++ b/meta/recipes-gnome/gcr4/gcr4_4.0.0.bb
> @@ -0,0 +1,59 @@
> +SUMMARY = "A library for bits of crypto UI and parsing etc"
> +DESCRIPTION = "GCR is a library for displaying certificates, and crypto
> UI, \
> +accessing key stores. It also provides the viewer for crypto files on the
> \
> +GNOME desktop."
> +HOMEPAGE = "https://gitlab.gnome.org/GNOME/gcr"
> +BUGTRACKER = "https://gitlab.gnome.org/GNOME/gcr/issues"
> +
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
> +
> +DEPENDS = "p11-kit glib-2.0 libgcrypt gnupg-native libsecret \
> +           ${@bb.utils.contains('GI_DATA_ENABLED', 'True',
> 'libxslt-native', '', d)}"
> +
> +CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg2'"
> +
> +CFLAGS += "-D_GNU_SOURCE"
> +
> +GNOMEBASEBUILDCLASS = "meson"
> +GTKDOC_MESON_OPTION = "gtk_doc"
> +inherit gnomebase gtk-icon-cache gtk-doc features_check
> upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
> +UPSTREAM_CHECK_REGEX =
> "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
> +
> +SRC_URI = "
> https://download.gnome.org/sources/gcr/${PV}/gcr-${PV}.tar.xz;name=archive
> "
> +SRC_URI[archive.sha256sum] =
> "c45855924f0ee7bab43e2dd38bfafd2ac815c6e9864341c0161e171173dcec7c"
> +
> +S = "${WORKDIR}/gcr-${PV}"
> +
> +PACKAGECONFIG ??= " \
> +       ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +       ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
> +       ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
> +"
> +PACKAGECONFIG[gtk] = "-Dgtk4=true,-Dgtk4=false,gtk4"
> +PACKAGECONFIG[ssh_agent] = "-Dssh_agent=true,-Dssh_agent=false,,openssh"
> +#'Use systemd socket activation for server programs'
> +PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
> +
> +FILES:${PN} += " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/gcr-4 \
> +"
> +
> +# http://errors.yoctoproject.org/Errors/Details/20229/
> +ARM_INSTRUCTION_SET:armv4 = "arm"
> +ARM_INSTRUCTION_SET:armv5 = "arm"
> +ARM_INSTRUCTION_SET:armv6 = "arm"
> +
> +EXTRA_OEMESON += "--cross-file ${WORKDIR}/meson-${PN}.cross"
> +do_write_config:append() {
> +    cat >${WORKDIR}/meson-${PN}.cross <<EOF
> +[binaries]
> +gpg2 = '${bindir}/gpg2'
> +EOF
> +}
> +
> +do_configure:prepend() {
> +    sed -i "s|ssh_add_path = find_program('ssh-add', required:
> get_option('ssh_agent')).full_path()|ssh_add_path = '${bindir}/ssh-add'|"
> ${S}/meson.build
> +    sed -i "s|ssh_agent_path = find_program('ssh-agent', required:
> get_option('ssh_agent')).full_path()|ssh_agent_path =
> '${bindir}/ssh-agent'|" ${S}/meson.build
> +}
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173832):
> https://lists.openembedded.org/g/openembedded-core/message/173832
> Mute This Topic: https://lists.openembedded.org/mt/95280551/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000002c222f05ee6e40ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can you name the 4.x recipe simply gcr please?</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun 27. Nov 2022 at 0.=
06, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)">gcr-3 recipe is still needed for g=
nome projects that stick to gtk+3, rename to gcr3.<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0...build-fix-one-parallel-build-failure.patch |=C2=A0 0<br>
=C2=A0...1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch |=C2=A0 0<br>
=C2=A0.../<a href=3D"http://gcr_3.40.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">gcr_3.40.0.bb</a> =3D&gt; gcr4/<a href=3D"http://gcr3_3.40.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gcr3_3.40.0.bb</a>}=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 8 ++-<br>
=C2=A0meta/recipes-gnome/gcr4/<a href=3D"http://gcr4_4.0.0.bb" rel=3D"noref=
errer" target=3D"_blank">gcr4_4.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 59 +++++++++++++++++++<br>
=C2=A04 files changed, 65 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-gnome/{gcr/gcr =3D&gt; gcr4/gcr3}/0001-gcr-meson.=
build-fix-one-parallel-build-failure.patch (100%)<br>
=C2=A0rename meta/recipes-gnome/{gcr/gcr =3D&gt; gcr4/gcr3}/b3ca1d02bb0148c=
a787ac4aead164d7c8ce2c4d8.patch (100%)<br>
=C2=A0rename meta/recipes-gnome/{gcr/<a href=3D"http://gcr_3.40.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gcr_3.40.0.bb</a> =3D&gt; gcr4/<a href=3D=
"http://gcr3_3.40.0.bb" rel=3D"noreferrer" target=3D"_blank">gcr3_3.40.0.bb=
</a>} (87%)<br>
=C2=A0create mode 100644 meta/recipes-gnome/gcr4/<a href=3D"http://gcr4_4.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">gcr4_4.0.0.bb</a><br>
<br>
diff --git a/meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-parall=
el-build-failure.patch b/meta/recipes-gnome/gcr4/gcr3/0001-gcr-meson.build-=
fix-one-parallel-build-failure.patch<br>
similarity index 100%<br>
rename from meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-paralle=
l-build-failure.patch<br>
rename to meta/recipes-gnome/gcr4/gcr3/0001-gcr-meson.build-fix-one-paralle=
l-build-failure.patch<br>
diff --git a/meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce=
2c4d8.patch b/meta/recipes-gnome/gcr4/gcr3/b3ca1d02bb0148ca787ac4aead164d7c=
8ce2c4d8.patch<br>
similarity index 100%<br>
rename from meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce2=
c4d8.patch<br>
rename to meta/recipes-gnome/gcr4/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2=
c4d8.patch<br>
diff --git a/meta/recipes-gnome/gcr/<a href=3D"http://gcr_3.40.0.bb" rel=3D=
"noreferrer" target=3D"_blank">gcr_3.40.0.bb</a> b/meta/recipes-gnome/gcr4/=
<a href=3D"http://gcr3_3.40.0.bb" rel=3D"noreferrer" target=3D"_blank">gcr3=
_3.40.0.bb</a><br>
similarity index 87%<br>
rename from meta/recipes-gnome/gcr/<a href=3D"http://gcr_3.40.0.bb" rel=3D"=
noreferrer" target=3D"_blank">gcr_3.40.0.bb</a><br>
rename to meta/recipes-gnome/gcr4/<a href=3D"http://gcr3_3.40.0.bb" rel=3D"=
noreferrer" target=3D"_blank">gcr3_3.40.0.bb</a><br>
index 917be5938b..5318768db6 100644<br>
--- a/meta/recipes-gnome/gcr/<a href=3D"http://gcr_3.40.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">gcr_3.40.0.bb</a><br>
+++ b/meta/recipes-gnome/gcr4/<a href=3D"http://gcr3_3.40.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">gcr3_3.40.0.bb</a><br>
@@ -20,11 +20,15 @@ GTKDOC_MESON_OPTION =3D &quot;gtk_doc&quot;<br>
=C2=A0inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-vers=
ion-is-even vala gobject-introspection gettext mime mime-xdg<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;[^\d\.](?P&lt;pver&gt;\d+\.(?!9\d+)(\d=
*[02468])+(\.\d+)+)\.tar&quot;<br>
<br>
-SRC_URI +=3D &quot;file://0001-gcr-meson.build-fix-one-parallel-build-fail=
ure.patch \ <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://b3ca1d02bb0148ca787ac4aea=
d164d7c8ce2c4d8.patch&quot;<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://download.gnome.org/sources/g=
cr/3.40/gcr-$%7BPV%7D.tar.xz;name=3Darchive" rel=3D"noreferrer" target=3D"_=
blank">https://download.gnome.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=3D=
archive</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gcr-meson.build-fix-one-parallel-bu=
ild-failure.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8=
.patch&quot;<br>
<br>
=C2=A0SRC_URI[archive.sha256sum] =3D &quot;b9d3645a5fd953a54285cc64d4fc0467=
36463dbd4dcc25caf5c7b59bed3027f5&quot;<br>
<br>
+S =3D &quot;${WORKDIR}/gcr-${PV}&quot;<br>
+<br>
=C2=A0PACKAGECONFIG ??=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
 &#39;x11&#39;, &#39;gtk&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
 &#39;wayland&#39;, &#39;gtk&#39;, &#39;&#39;, d)} \<br>
diff --git a/meta/recipes-gnome/gcr4/<a href=3D"http://gcr4_4.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gcr4_4.0.0.bb</a> b/meta/recipes-gnome/gc=
r4/<a href=3D"http://gcr4_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">gc=
r4_4.0.0.bb</a><br>
new file mode 100644<br>
index 0000000000..13efdcc2bd<br>
--- /dev/null<br>
+++ b/meta/recipes-gnome/gcr4/<a href=3D"http://gcr4_4.0.0.bb" rel=3D"noref=
errer" target=3D"_blank">gcr4_4.0.0.bb</a><br>
@@ -0,0 +1,59 @@<br>
+SUMMARY =3D &quot;A library for bits of crypto UI and parsing etc&quot;<br=
>
+DESCRIPTION =3D &quot;GCR is a library for displaying certificates, and cr=
ypto UI, \<br>
+accessing key stores. It also provides the viewer for crypto files on the =
\<br>
+GNOME desktop.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://gitlab.gnome.org/GNOME/gcr" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/gcr</a>&quot;<b=
r>
+BUGTRACKER =3D &quot;<a href=3D"https://gitlab.gnome.org/GNOME/gcr/issues"=
 rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/gcr/is=
sues</a>&quot;<br>
+<br>
+LICENSE =3D &quot;GPL-2.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9=
abc605&quot;<br>
+<br>
+DEPENDS =3D &quot;p11-kit glib-2.0 libgcrypt gnupg-native libsecret \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;GI_DATA=
_ENABLED&#39;, &#39;True&#39;, &#39;libxslt-native&#39;, &#39;&#39;, d)}&qu=
ot;<br>
+<br>
+CACHED_CONFIGUREVARS +=3D &quot;ac_cv_path_GPG=3D&#39;gpg2&#39;&quot;<br>
+<br>
+CFLAGS +=3D &quot;-D_GNU_SOURCE&quot;<br>
+<br>
+GNOMEBASEBUILDCLASS =3D &quot;meson&quot;<br>
+GTKDOC_MESON_OPTION =3D &quot;gtk_doc&quot;<br>
+inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-i=
s-even vala gobject-introspection gettext mime mime-xdg<br>
+UPSTREAM_CHECK_REGEX =3D &quot;[^\d\.](?P&lt;pver&gt;\d+\.(?!9\d+)(\d*[024=
68])+(\.\d+)+)\.tar&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://download.gnome.org/sources/gcr/$%7BPV=
%7D/gcr-$%7BPV%7D.tar.xz;name=3Darchive" rel=3D"noreferrer" target=3D"_blan=
k">https://download.gnome.org/sources/gcr/${PV}/gcr-${PV}.tar.xz;name=3Darc=
hive</a>&quot;<br>
+SRC_URI[archive.sha256sum] =3D &quot;c45855924f0ee7bab43e2dd38bfafd2ac815c=
6e9864341c0161e171173dcec7c&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/gcr-${PV}&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &=
#39;systemd&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
 &#39;x11&#39;, &#39;gtk&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
 &#39;wayland&#39;, &#39;gtk&#39;, &#39;&#39;, d)} \<br>
+&quot;<br>
+PACKAGECONFIG[gtk] =3D &quot;-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4&quot;<br>
+PACKAGECONFIG[ssh_agent] =3D &quot;-Dssh_agent=3Dtrue,-Dssh_agent=3Dfalse,=
,openssh&quot;<br>
+#&#39;Use systemd socket activation for server programs&#39;<br>
+PACKAGECONFIG[systemd] =3D &quot;-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,=
systemd&quot;<br>
+<br>
+FILES:${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${datadir}/dbus-1 \<br>
+=C2=A0 =C2=A0 ${datadir}/gcr-4 \<br>
+&quot;<br>
+<br>
+# <a href=3D"http://errors.yoctoproject.org/Errors/Details/20229/" rel=3D"=
noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Details=
/20229/</a><br>
+ARM_INSTRUCTION_SET:armv4 =3D &quot;arm&quot;<br>
+ARM_INSTRUCTION_SET:armv5 =3D &quot;arm&quot;<br>
+ARM_INSTRUCTION_SET:armv6 =3D &quot;arm&quot;<br>
+<br>
+EXTRA_OEMESON +=3D &quot;--cross-file ${WORKDIR}/meson-${PN}.cross&quot;<b=
r>
+do_write_config:append() {<br>
+=C2=A0 =C2=A0 cat &gt;${WORKDIR}/meson-${PN}.cross &lt;&lt;EOF<br>
+[binaries]<br>
+gpg2 =3D &#39;${bindir}/gpg2&#39;<br>
+EOF<br>
+}<br>
+<br>
+do_configure:prepend() {<br>
+=C2=A0 =C2=A0 sed -i &quot;s|ssh_add_path =3D find_program(&#39;ssh-add&#3=
9;, required: get_option(&#39;ssh_agent&#39;)).full_path()|ssh_add_path =3D=
 &#39;${bindir}/ssh-add&#39;|&quot; ${S}/meson.build<br>
+=C2=A0 =C2=A0 sed -i &quot;s|ssh_agent_path =3D find_program(&#39;ssh-agen=
t&#39;, required: get_option(&#39;ssh_agent&#39;)).full_path()|ssh_agent_pa=
th =3D &#39;${bindir}/ssh-agent&#39;|&quot; ${S}/meson.build<br>
+}<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#173832): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/173832" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/173832</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95280551/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95280551/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002c222f05ee6e40ab--

