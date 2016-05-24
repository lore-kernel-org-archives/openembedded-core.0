Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8C35260797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 20:21:37 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id t40so19652769ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 13:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j6mSt0UZUIv93ORTXANUPT7T889k+wZHjK8v9TuVlRs=;
	b=I14YSvA09edymeNz7ihLxUttUwybUztPyRWYHtvEY67LqZLu9O5Mk6cZUjtc0hQByl
	gY0Z8Oo56x6DqTLMCCJBNqYZNEIm8GobNGXkx/j77TMN7uUFZFj6URj771D9CGcxT4xM
	kjzYEwYUTQLhQ3+SP7L9fkJT1EmKDvZpP/XzBKtAsU+GMYPRvXFrorXpMIud6gVxP6aF
	8pQUhZ078JwB4TlK9fSmpaByBJuqqkSMAapSb8wtn8IHTD1WIpq2KztjdcQUnqt83UiN
	+jK0Ru94E8jI80F3PfhNYJEEoDzzgnp21InkfnDl1IiOzLSZXPUgcAhrc7bfF/ciyDxJ
	8DsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j6mSt0UZUIv93ORTXANUPT7T889k+wZHjK8v9TuVlRs=;
	b=a/VXHjhPDZIyoic4lD6Hh0czYcIe3DqPWHJ0E894NdCdxLP5y2GbZPSf4Y2RFFbutO
	oc2dULlu2CpU3tg8gAG7KG1tUZX49qwBlRi4qKyPUtqGhyLLxyUxmzG08DD2ct/XB3Wk
	ooKF20R0RLaTB5hd5nlpyutYODbsYfhsdWJ9PRuvctoQpp0Nez7upTfextzU1RxmH18E
	j4IhvZP5VbCIzXRr+0TDsfpaUJLUfZtyxz6v+dQsySCvLchFL5Y+6OiBZYBf2QgfX50Q
	opT90uYlXTK2Af4Gj2WCWdz4VTLMzdfIWvdNUlO5VcUsQwfaZKFz62OC8jB5TTrevwwl
	V0hQ==
X-Gm-Message-State: ALyK8tIKcKf0Intu4vRjnyhNOQBvmRY2h2jHMaFhlmvBqtti1BMyVagzJ6NAWI/m6bxAI2i4bRstQ3Y6JCokHVLS
X-Received: by 10.107.51.3 with SMTP id z3mr567067ioz.148.1464121298632; Tue,
	24 May 2016 13:21:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Tue, 24 May 2016 13:21:19 -0700 (PDT)
In-Reply-To: <1464120869-26056-1-git-send-email-stefan@agner.ch>
References: <1464120869-26056-1-git-send-email-stefan@agner.ch>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 May 2016 21:21:19 +0100
Message-ID: <CAJTo0LbxLfge7RCYZf0DRT30A8s4+WuQh3mzFdPMKRH6vvAifg@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] florence: move to latest GTK2 version 0.5.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2016 20:21:39 -0000
Content-Type: multipart/alternative; boundary=001a1144154ee9c68905339c4d77

--001a1144154ee9c68905339c4d77
Content-Type: text/plain; charset=UTF-8

Wrong list - you mean openembedded-devel@.

Ross

On 24 May 2016 at 21:14, Stefan Agner <stefan@agner.ch> wrote:

> From: Stefan Agner <stefan.agner@toradex.com>
>
> The latest GTK2 version is 0.5.4, which contains several bug fixes.
> Noteable, it fixes an issue where the SVG keys have not been displayed
> with recent versions of its dependencies.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  .../florence/files/fix-no-atspi-compile.patch      | 30
> ++++++++++++++++++++++
>  .../recipes-support/florence/florence_0.5.1.bb     | 20 ---------------
>  .../recipes-support/florence/florence_0.5.4.bb     | 20 +++++++++++++++
>  3 files changed, 50 insertions(+), 20 deletions(-)
>  create mode 100644
> meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch
>  delete mode 100644 meta-gnome/recipes-support/florence/florence_0.5.1.bb
>  create mode 100644 meta-gnome/recipes-support/florence/florence_0.5.4.bb
>
> diff --git
> a/meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch
> b/meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch
> new file mode 100644
> index 0000000..0bb5dee
> --- /dev/null
> +++ b/meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch
> @@ -0,0 +1,30 @@
> +diff --git a/src/florence.c b/src/florence.c
> +index b27c31b..feadefe 100644
> +--- a/src/florence.c
> ++++ b/src/florence.c
> +@@ -44,12 +44,6 @@
> + /* exit signal */
> + static int flo_exit=FALSE;
> +
> +-#ifdef ENABLE_AT_SPI2
> +-void flo_check_show (struct florence *florence, AtspiAccessible *obj);
> +-#else
> +-void flo_check_show (struct florence *florence, Accessible *obj);
> +-#endif
> +-
> + /* Called on destroy event (systray quit or close window) */
> + void flo_destroy (void)
> + {
> +@@ -61,6 +55,12 @@ void flo_destroy (void)
> + }
> +
> + #ifdef AT_SPI
> ++#ifdef ENABLE_AT_SPI2
> ++void flo_check_show (struct florence *florence, AtspiAccessible *obj);
> ++#else
> ++void flo_check_show (struct florence *florence, Accessible *obj);
> ++#endif
> ++
> + /* Called to destroy the icon */
> + void flo_icon_destroy (GtkWidget *widget, gpointer user_data)
> + {
> diff --git a/meta-gnome/recipes-support/florence/florence_0.5.1.bb
> b/meta-gnome/recipes-support/florence/florence_0.5.1.bb
> deleted file mode 100644
> index 71014f0..0000000
> --- a/meta-gnome/recipes-support/florence/florence_0.5.1.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DESCRIPTION = "Florence is a virtual keyboard (also called
> on-screen-keyboard), which allows the user to input text through a
> touchscreen."
> -HOMEPAGE = "http://florence.sourceforge.net/english.html"
> -
> -#NOTICE: If florence can't find its gconf settings, you need to start
> florence with --config for one time and save the configuration once.
> -
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> -
> -PR = "r1"
> -
> -DEPENDS = "gtk+ libxml2 libglade librsvg libxtst gconf cairo
> intltool-native gnome-doc-utils libnotify"
> -
> -SRC_URI =
> "${SOURCEFORGE_MIRROR}/florence/florence/${PV}/florence-${PV}.tar.bz2 \
> -           file://0001-Fix-glib-includes.patch"
> -SRC_URI[md5sum] = "56d12e5b47c100d9df172aa5ddc0f609"
> -SRC_URI[sha256sum] =
> "7b06ed84ef2b7b22d8d2cf0c7d013a05409bd82028240ac8719a68b192d5bc62"
> -
> -inherit gettext autotools gconf pkgconfig
> -
> -EXTRA_OECONF = "--disable-scrollkeeper --without-docs --without-at-spi
> --without-panelapplet"
> diff --git a/meta-gnome/recipes-support/florence/florence_0.5.4.bb
> b/meta-gnome/recipes-support/florence/florence_0.5.4.bb
> new file mode 100644
> index 0000000..dfdb6bd
> --- /dev/null
> +++ b/meta-gnome/recipes-support/florence/florence_0.5.4.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "Florence is a virtual keyboard (also called
> on-screen-keyboard), which allows the user to input text through a
> touchscreen."
> +HOMEPAGE = "http://florence.sourceforge.net/english.html"
> +
> +#NOTICE: If florence can't find its gconf settings, you need to start
> florence with --config for one time and save the configuration once.
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> +
> +PR = "r1"
> +
> +DEPENDS = "gtk+ libxml2 libglade librsvg libxtst gconf cairo
> intltool-native gnome-doc-utils libnotify gstreamer"
> +
> +SRC_URI =
> "${SOURCEFORGE_MIRROR}/florence/florence/${PV}-gtk2/florence-${PV}.tar.bz2 \
> +           file://fix-no-atspi-compile.patch"
> +SRC_URI[md5sum] = "8d5c2367a28485bfcf577650b0badab7"
> +SRC_URI[sha256sum] =
> "26d33aa20d5fbf34ceeded4c41cb922d2988b6082e33d9acc46dd7bfe56d31a1"
> +
> +inherit gettext autotools gconf pkgconfig
> +
> +EXTRA_OECONF = "--disable-scrollkeeper --without-docs --without-at-spi
> --without-panelapplet --without-xrecord"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144154ee9c68905339c4d77
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wrong list - you mean openembedded-devel@.<div><br></div><=
div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On 24 May 2016 at 21:14, Stefan Agner <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:stefan@agner.ch" target=3D"_blank">stefan@agner.ch</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">From: Stefan Agner &lt;<a href=3D"mai=
lto:stefan.agner@toradex.com">stefan.agner@toradex.com</a>&gt;<br>
<br>
The latest GTK2 version is 0.5.4, which contains several bug fixes.<br>
Noteable, it fixes an issue where the SVG keys have not been displayed<br>
with recent versions of its dependencies.<br>
<br>
Signed-off-by: Stefan Agner &lt;<a href=3D"mailto:stefan.agner@toradex.com"=
>stefan.agner@toradex.com</a>&gt;<br>
---<br>
=C2=A0.../florence/files/fix-no-atspi-compile.patch=C2=A0 =C2=A0 =C2=A0 | 3=
0 ++++++++++++++++++++++<br>
=C2=A0.../recipes-support/florence/<a href=3D"http://florence_0.5.1.bb" rel=
=3D"noreferrer" target=3D"_blank">florence_0.5.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
| 20 ---------------<br>
=C2=A0.../recipes-support/florence/<a href=3D"http://florence_0.5.4.bb" rel=
=3D"noreferrer" target=3D"_blank">florence_0.5.4.bb</a>=C2=A0 =C2=A0 =C2=A0=
| 20 +++++++++++++++<br>
=C2=A03 files changed, 50 insertions(+), 20 deletions(-)<br>
=C2=A0create mode 100644 meta-gnome/recipes-support/florence/files/fix-no-a=
tspi-compile.patch<br>
=C2=A0delete mode 100644 meta-gnome/recipes-support/florence/<a href=3D"htt=
p://florence_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">florence_0.5.1.=
bb</a><br>
=C2=A0create mode 100644 meta-gnome/recipes-support/florence/<a href=3D"htt=
p://florence_0.5.4.bb" rel=3D"noreferrer" target=3D"_blank">florence_0.5.4.=
bb</a><br>
<br>
diff --git a/meta-gnome/recipes-support/florence/files/fix-no-atspi-compile=
.patch b/meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.pat=
ch<br>
new file mode 100644<br>
index 0000000..0bb5dee<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch<=
br>
@@ -0,0 +1,30 @@<br>
+diff --git a/src/florence.c b/src/florence.c<br>
+index b27c31b..feadefe 100644<br>
+--- a/src/florence.c<br>
++++ b/src/florence.c<br>
+@@ -44,12 +44,6 @@<br>
+ /* exit signal */<br>
+ static int flo_exit=3DFALSE;<br>
+<br>
+-#ifdef ENABLE_AT_SPI2<br>
+-void flo_check_show (struct florence *florence, AtspiAccessible *obj);<br=
>
+-#else<br>
+-void flo_check_show (struct florence *florence, Accessible *obj);<br>
+-#endif<br>
+-<br>
+ /* Called on destroy event (systray quit or close window) */<br>
+ void flo_destroy (void)<br>
+ {<br>
+@@ -61,6 +55,12 @@ void flo_destroy (void)<br>
+ }<br>
+<br>
+ #ifdef AT_SPI<br>
++#ifdef ENABLE_AT_SPI2<br>
++void flo_check_show (struct florence *florence, AtspiAccessible *obj);<br=
>
++#else<br>
++void flo_check_show (struct florence *florence, Accessible *obj);<br>
++#endif<br>
++<br>
+ /* Called to destroy the icon */<br>
+ void flo_icon_destroy (GtkWidget *widget, gpointer user_data)<br>
+ {<br>
diff --git a/meta-gnome/recipes-support/florence/<a href=3D"http://florence=
_0.5.1.bb" rel=3D"noreferrer" target=3D"_blank">florence_0.5.1.bb</a> b/met=
a-gnome/recipes-support/florence/<a href=3D"http://florence_0.5.1.bb" rel=
=3D"noreferrer" target=3D"_blank">florence_0.5.1.bb</a><br>
deleted file mode 100644<br>
index 71014f0..0000000<br>
--- a/meta-gnome/recipes-support/florence/<a href=3D"http://florence_0.5.1.=
bb" rel=3D"noreferrer" target=3D"_blank">florence_0.5.1.bb</a><br>
+++ /dev/null<br>
@@ -1,20 +0,0 @@<br>
-DESCRIPTION =3D &quot;Florence is a virtual keyboard (also called on-scree=
n-keyboard), which allows the user to input text through a touchscreen.&quo=
t;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://florence.sourceforge.net/english.html=
" rel=3D"noreferrer" target=3D"_blank">http://florence.sourceforge.net/engl=
ish.html</a>&quot;<br>
-<br>
-#NOTICE: If florence can&#39;t find its gconf settings, you need to start =
florence with --config for one time and save the configuration once.<br>
-<br>
-LICENSE =3D &quot;GPLv2&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D59530bdf33659b29e73d4adb9f=
9f6552&quot;<br>
-<br>
-PR =3D &quot;r1&quot;<br>
-<br>
-DEPENDS =3D &quot;gtk+ libxml2 libglade librsvg libxtst gconf cairo intlto=
ol-native gnome-doc-utils libnotify&quot;<br>
-<br>
-SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/florence/florence/${PV}/florence-$=
{PV}.tar.bz2 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-glib-includes.pat=
ch&quot;<br>
-SRC_URI[md5sum] =3D &quot;56d12e5b47c100d9df172aa5ddc0f609&quot;<br>
-SRC_URI[sha256sum] =3D &quot;7b06ed84ef2b7b22d8d2cf0c7d013a05409bd82028240=
ac8719a68b192d5bc62&quot;<br>
-<br>
-inherit gettext autotools gconf pkgconfig<br>
-<br>
-EXTRA_OECONF =3D &quot;--disable-scrollkeeper --without-docs --without-at-=
spi --without-panelapplet&quot;<br>
diff --git a/meta-gnome/recipes-support/florence/<a href=3D"http://florence=
_0.5.4.bb" rel=3D"noreferrer" target=3D"_blank">florence_0.5.4.bb</a> b/met=
a-gnome/recipes-support/florence/<a href=3D"http://florence_0.5.4.bb" rel=
=3D"noreferrer" target=3D"_blank">florence_0.5.4.bb</a><br>
new file mode 100644<br>
index 0000000..dfdb6bd<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-support/florence/<a href=3D"http://florence_0.5.4.=
bb" rel=3D"noreferrer" target=3D"_blank">florence_0.5.4.bb</a><br>
@@ -0,0 +1,20 @@<br>
+DESCRIPTION =3D &quot;Florence is a virtual keyboard (also called on-scree=
n-keyboard), which allows the user to input text through a touchscreen.&quo=
t;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://florence.sourceforge.net/english.html=
" rel=3D"noreferrer" target=3D"_blank">http://florence.sourceforge.net/engl=
ish.html</a>&quot;<br>
+<br>
+#NOTICE: If florence can&#39;t find its gconf settings, you need to start =
florence with --config for one time and save the configuration once.<br>
+<br>
+LICENSE =3D &quot;GPLv2&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D59530bdf33659b29e73d4adb9f=
9f6552&quot;<br>
+<br>
+PR =3D &quot;r1&quot;<br>
+<br>
+DEPENDS =3D &quot;gtk+ libxml2 libglade librsvg libxtst gconf cairo intlto=
ol-native gnome-doc-utils libnotify gstreamer&quot;<br>
+<br>
+SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/florence/florence/${PV}-gtk2/flore=
nce-${PV}.tar.bz2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-no-atspi-compile.patch=
&quot;<br>
+SRC_URI[md5sum] =3D &quot;8d5c2367a28485bfcf577650b0badab7&quot;<br>
+SRC_URI[sha256sum] =3D &quot;26d33aa20d5fbf34ceeded4c41cb922d2988b6082e33d=
9acc46dd7bfe56d31a1&quot;<br>
+<br>
+inherit gettext autotools gconf pkgconfig<br>
+<br>
+EXTRA_OECONF =3D &quot;--disable-scrollkeeper --without-docs --without-at-=
spi --without-panelapplet --without-xrecord&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a1144154ee9c68905339c4d77--
