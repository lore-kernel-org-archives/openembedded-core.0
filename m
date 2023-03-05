Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E100C6FA8E
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 17:31:08 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.13534.1678037467018801509
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 09:31:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout09.t-online.de (Postfix) with SMTP id ED8ACCA81
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 18:31:04 +0100 (CET)
Received: from [192.168.178.83] ([84.163.43.219]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pYsCO-1IqeX20; Sun, 5 Mar 2023 18:31:04 +0100
Date: Sun, 05 Mar 2023 18:30:59 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] gtk4: update 4.8.3 -> 4.10.0
To: openembedded-core@lists.openembedded.org
Message-Id: <NZ52RR.5YUVX38ACG9C@t-online.de>
In-Reply-To: <20230305172853.222906-1-f_l_k@t-online.de>
References: <20230305172853.222906-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ftIjJIZ+fq3EqvCSuKht"
X-TOI-EXPURGATEID: 150726::1678037464-D571F046-C6E5F7CE/0/0 CLEAN NORMAL
X-TOI-MSGID: 7f5ec3b4-7c83-4a86-b8ff-b29dee211f0e
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 17:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178047

--=-ftIjJIZ+fq3EqvCSuKht
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

v2 I had sent the wrong patch by mistake

Am So, 5. M=E4r 2023 um 18:28:53 +0100 schrieb Markus Volk=20
<f_l_k@t-online.de>:
> A testsuite was added that breaks musl build -> disable by default
>=20
> Overview of Changes in 4.10.0, 04-03-2023
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * GtkTextView
>  - Document hanging indentation
> * GtkListView
>  - Fix a size allocation problem
> * GtkFileChooser
>  - Fix paned behavior
>  - Fix a crash
> * GtkText
>  - Fix various problems with undo
> * Accessibility
>  - Make some getters transfer-full
>  - Allow setting accessible parents and siblings
>  - Add a role for toggle buttons
>  - Miscellaneous property fixes and improvements
> * gtk
>  - Improve the handling resize-during-size-allocate
> * gdk
>  - Introduce GdkTextureDownloader and use it
>  - Make gdk_texture_get_format public
> * gsk
>  - Make mask nodes more versatile
>  - Improve the GL implementation for texture scale nodes
> * X11
>  - Fix key handling during DND
> * Tools
>  - gtk-builder-tool: Try harder to handle templates
>  - gtk-builder-tool: Prefer properties over <child>
>=20
> * Translation updates
>  Basque
>  Belarusian
>  Bulgarian
>  Indonesian
>  Galician
>  Georgian
>  German
>  Hebrew
>  Lithuanian
>  Portuguese
>  Spanish
>  Swedish
>  Turkish
>  Ukrainian
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/recipes-gnome/gtk+/{gtk4_4.8.3.bb =3D> gtk4_4.10.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-gnome/gtk+/{gtk4_4.8.3.bb =3D> gtk4_4.10.0.bb}=20
> (96%)
>=20
> diff --git a/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb=20
> b/meta/recipes-gnome/gtk+/gtk4_4.10.0.bb
> similarity index 96%
> rename from meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
> rename to meta/recipes-gnome/gtk+/gtk4_4.10.0.bb
> index b367cb066b..d58fe149ec 100644
> --- a/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.10.0.bb
> @@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
>  UPSTREAM_CHECK_REGEX =3D=20
> "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
>=20
>  SRC_URI =3D=20
> "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz=20
> <http://ftp.gnome.org/pub/gnome/sources/gtk/$%7BMAJ_VER%7D/gtk-$%7BPV%7D.=
tar.xz>"
> -SRC_URI[sha256sum] =3D=20
> "b362f968d085b4d3d9340d4d38c706377ded9d5374e694a2b6b7e6292e3cba74"
> +SRC_URI[sha256sum] =3D=20
> "8dc1e7c3b3a46772f0fa416a8ca3fd21d0d0b3b03fb307d2e7327ebee69626e4"
>=20
>  S =3D "${WORKDIR}/gtk-${PV}"
>=20
> @@ -57,7 +57,7 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
>  GIR_MESON_ENABLE_FLAG =3D 'enabled'
>  GIR_MESON_DISABLE_FLAG =3D 'disabled'
>=20
> -EXTRA_OEMESON =3D " -Dbuild-tests=3Dfalse -Ddemos=3Dfalse"
> +EXTRA_OEMESON =3D " -Dbuild-tests=3Dfalse -Dbuild-testsuite=3Dfalse=20
> -Ddemos=3Dfalse"
>=20
>  PACKAGECONFIG ??=3D "gstreamer ${@bb.utils.filter=20
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'wayland x11 vulkan',=20
> d)}"
>  PACKAGECONFIG:class-native =3D "${@bb.utils.filter=20
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'x11', d)}"
> --
> 2.34.1
>=20


--=-ftIjJIZ+fq3EqvCSuKht
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>v2 I had sent the wrong patch by m=
istake</div></div><div id=3D"geary-quote" dir=3D"auto"><br>Am So, 5. M=E4r =
2023 um 18:28:53 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><b=
lockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: brea=
k-spaces;">A testsuite was added that breaks musl build -&gt; disable by de=
fault

Overview of Changes in 4.10.0, 04-03-2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* GtkTextView
 - Document hanging indentation
* GtkListView
 - Fix a size allocation problem
* GtkFileChooser
 - Fix paned behavior
 - Fix a crash
* GtkText
 - Fix various problems with undo
* Accessibility
 - Make some getters transfer-full
 - Allow setting accessible parents and siblings
 - Add a role for toggle buttons
 - Miscellaneous property fixes and improvements
* gtk
 - Improve the handling resize-during-size-allocate
* gdk
 - Introduce GdkTextureDownloader and use it
 - Make gdk_texture_get_format public
* gsk
 - Make mask nodes more versatile
 - Improve the GL implementation for texture scale nodes
* X11
 - Fix key handling during DND
* Tools
 - gtk-builder-tool: Try harder to handle templates
 - gtk-builder-tool: Prefer properties over &lt;child&gt;

* Translation updates
 Basque
 Belarusian
 Bulgarian
 Indonesian
 Galician
 Georgian
 German
 Hebrew
 Lithuanian
 Portuguese
 Spanish
 Swedish
 Turkish
 Ukrainian

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 meta/recipes-gnome/gtk+/{gtk4_4.8.3.bb =3D&gt; gtk4_4.10.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.8.3.bb =3D&gt; gtk4_4.10.0.bb} (96%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb b/meta/recipes-gnome/gtk=
+/gtk4_4.10.0.bb
similarity index 96%
rename from meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.10.0.bb
index b367cb066b..d58fe149ec 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.10.0.bb
@@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P&lt;pver&gt;\d+\.(\d*[02468])+(\.\d+)+)\.=
tar.xz"
=20
 SRC_URI =3D "<a href=3D"http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_V=
ER}/gtk-${PV}.tar.xz">http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}=
/gtk-${PV}.tar.xz</a>"
-SRC_URI[sha256sum] =3D "b362f968d085b4d3d9340d4d38c706377ded9d5374e694a2b6=
b7e6292e3cba74"
+SRC_URI[sha256sum] =3D "8dc1e7c3b3a46772f0fa416a8ca3fd21d0d0b3b03fb307d2e7=
327ebee69626e4"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
@@ -57,7 +57,7 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
-EXTRA_OEMESON =3D " -Dbuild-tests=3Dfalse -Ddemos=3Dfalse"
+EXTRA_OEMESON =3D " -Dbuild-tests=3Dfalse -Dbuild-testsuite=3Dfalse -Ddemo=
s=3Dfalse"
=20
 PACKAGECONFIG ??=3D "gstreamer <a href=3D"mailto:${@bb.utils.filter">${@bb=
.utils.filter</a>('DISTRO_FEATURES', 'wayland x11 vulkan', d)}"
 PACKAGECONFIG:class-native =3D "<a href=3D"mailto:${@bb.utils.filter">${@b=
b.utils.filter</a>('DISTRO_FEATURES', 'x11', d)}"
<div>--=20
</div>2.34.1

</div></blockquote></div>
--=-ftIjJIZ+fq3EqvCSuKht--


