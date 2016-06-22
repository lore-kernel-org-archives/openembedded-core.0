Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 237B173175
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 11:20:13 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id u201so17036626oie.0
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 04:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=CNuSCnkPI3d8ZV71XrOuUwM/V47Cj/U2u71tBJe9HNE=;
	b=yXnLyENk44AlZtLX2EkMgqoCL8WPhIURshuKbdhZb/Xdg2xMBxeRuUDZvmteavot1H
	Qac0P+AUluJe77K7tuNWJhBtZ6NYo2xKXTaK5b1Fk4f0KeuN10kvBLBxjloF7lkKmi2F
	U6HJL9FurkFku2iiVaDEbU/78Vi+8zxZ9c9RXVxOkjQZX+je7t09L8HG+Zvgfa19wHYG
	NkaPrVWxLXK2rd/gzsBdbom2SQI/Ee3PG5Wr83mO6/sDxUecnNHQp48IZV53Pi0bUvOD
	8B85yWSoJVDdZ0O444vSeWpVBXA76ajAiCHltyOnNo2Dlw7Zlz14qWt8ulD8L+9XbSfO
	F4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=CNuSCnkPI3d8ZV71XrOuUwM/V47Cj/U2u71tBJe9HNE=;
	b=iZGUZgssfikk+N7qaj5h5OhTZgKp8A0mAYBkLS5x0u2f0TLpkEVSvAhPel3NKtkIcU
	XGM/beOLGtG4ZnpR4KQeTLWGjd8rmSQc+8nHE/tbHLbdr0lOBZGuQ9y6RTLf4oM3XmqF
	nsYAFopkEu17zNOyBYI9tFMTr5I7v2qm8E3Mftn1tcdgUGW3v8POo0B2Nje191Jw0Use
	+4L8DU5JkZ4METQ2zYN2pYoNUvG09rwgigj2ZF9KVlRh+EFnIXneGaBMxnk2h3OJ5fFf
	iyZHs2arMK2GG27I8RUapXc8Qvcn4Mf7HOBc7emBZsVGDjN9WdNZHH/pK3gE09yOD5mt
	fOwA==
X-Gm-Message-State: ALyK8tK/8d/Gut6U/J7SEYJeW8tIs2XtOCqeP0lJvfTAXZ4uElzMBBPek3czQm9xKhNpStuuz9t8nqtIugGov5qj
X-Received: by 10.202.4.204 with SMTP id 195mr1328426oie.173.1466594414172;
	Wed, 22 Jun 2016 04:20:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Wed, 22 Jun 2016 04:19:44 -0700 (PDT)
In-Reply-To: <a3c036a30e52a5a292c68183f84f4de1696973ac.1466191636.git.jussi.kukkonen@intel.com>
References: <cover.1466191636.git.jussi.kukkonen@intel.com>
	<a3c036a30e52a5a292c68183f84f4de1696973ac.1466191636.git.jussi.kukkonen@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 22 Jun 2016 14:19:44 +0300
Message-ID: <CAHiDW_FTZqQDBp9Z_+cTTEq1Z+eJ28WsZa6itqBYzd-73co29Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gtk+3: Make sure gdkx.h is updated
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
X-List-Received-Date: Wed, 22 Jun 2016 11:20:15 -0000
Content-Type: multipart/alternative; boundary=001a11c0327a1631400535dc1fcd

--001a11c0327a1631400535dc1fcd
Content-Type: text/plain; charset=UTF-8

On 17 June 2016 at 22:37, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> Always run the Makefile rule that modifies gdkx.h (for opengl
> disabling), but only do the modification if the file is not
> correct already.
>

Please don't take this patch: I'll include it in a bigger update.

The qemu patch (2/2) is still good.

Thanks,
  Jussi


Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  .../0001-Add-disable-opengl-configure-option.patch    | 19
> ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git
> a/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-option.patch
> b/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-option.patch
> index a963334..2306614 100644
> ---
> a/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-option.patch
> +++
> b/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-option.patch
> @@ -1,4 +1,4 @@
> -From c77afa19881d955d759879aeae8bbd88613dd4fe Mon Sep 17 00:00:00 2001
> +From 91814d22387370e47384206e67729a26a5729192 Mon Sep 17 00:00:00 2001
>  From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>  Date: Thu, 16 Jun 2016 15:11:34 +0300
>  Subject: [PATCH] Add --disable-opengl configure option
> @@ -28,7 +28,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>   gdk/gdkgl.c                       | 10 +++++++
>   gdk/gdkglcontext.c                |  6 ++++
>   gdk/gdkwindow.c                   | 14 +++++++++-
> - gdk/x11/Makefile.am               | 28 ++++++++++++++++---
> + gdk/x11/Makefile.am               | 29 ++++++++++++++++---
>   gdk/x11/gdkdisplay-x11.c          |  6 ++--
>   gdk/x11/gdkscreen-x11.c           |  5 ++++
>   gdk/x11/gdkwindow-x11.c           |  4 +++
> @@ -41,7 +41,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>   gtk/inspector/general.c           |  6 ++++
>   tests/Makefile.am                 | 10 +++++--
>   testsuite/gtk/objects-finalize.c  |  2 ++
> - 21 files changed, 257 insertions(+), 78 deletions(-)
> + 21 files changed, 258 insertions(+), 78 deletions(-)
>   create mode 100644 gdk/x11/gdkx-with-gl-context.h
>   create mode 100644 gdk/x11/gdkx-without-gl-context.h
>   delete mode 100644 gdk/x11/gdkx.h
> @@ -412,7 +412,7 @@ index c34c113..3025e96 100644
>             cairo_region_destroy (opaque_region);
>
>  diff --git a/gdk/x11/Makefile.am b/gdk/x11/Makefile.am
> -index c488a31..d0aa7ce 100644
> +index c488a31..576f8e1 100644
>  --- a/gdk/x11/Makefile.am
>  +++ b/gdk/x11/Makefile.am
>  @@ -39,8 +39,6 @@ libgdk_x11_la_SOURCES =      \
> @@ -424,7 +424,7 @@ index c488a31..d0aa7ce 100644
>         gdkkeys-x11.c           \
>         gdkmain-x11.c           \
>         gdkproperty-x11.c       \
> -@@ -53,14 +51,30 @@ libgdk_x11_la_SOURCES =    \
> +@@ -53,14 +51,31 @@ libgdk_x11_la_SOURCES =    \
>         gdkwindow-x11.h         \
>         gdkxftdefaults.c        \
>         gdkxid.c                \
> @@ -449,14 +449,15 @@ index c488a31..d0aa7ce 100644
>  +endif
>  +
>  +BUILT_SOURCES = gdkx.h
> -+
> ++.PHONY: gdkx.h
>  +gdkx.h:
> -+      $(AM_V_GEN) cd $(srcdir) && cp $(GDKX_HEADER) gdkx.h
> ++      $(AM_V_GEN) cd $(srcdir) \
> ++      && (cmp -s $(GDKX_HEADER) gdkx.h || cp $(GDKX_HEADER) gdkx.h )
>  +
>   libgdkx11include_HEADERS =    \
>         gdkx-autocleanups.h     \
>         gdkx11applaunchcontext.h \
> -@@ -74,7 +88,6 @@ libgdkx11include_HEADERS =   \
> +@@ -74,7 +89,6 @@ libgdkx11include_HEADERS =   \
>         gdkx11display.h         \
>         gdkx11displaymanager.h  \
>         gdkx11dnd.h             \
> @@ -464,7 +465,7 @@ index c488a31..d0aa7ce 100644
>         gdkx11keys.h            \
>         gdkx11property.h        \
>         gdkx11screen.h          \
> -@@ -83,9 +96,16 @@ libgdkx11include_HEADERS =  \
> +@@ -83,9 +97,16 @@ libgdkx11include_HEADERS =  \
>         gdkx11visual.h          \
>         gdkx11window.h
>
> --
> 2.1.4
>
>

--001a11c0327a1631400535dc1fcd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
7 June 2016 at 22:37, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Always run the Makefile=
 rule that modifies gdkx.h (for opengl<br>
disabling), but only do the modification if the file is not<br>
correct already.<br></blockquote><div><br></div><div>Please don&#39;t take =
this patch: I&#39;ll include it in a bigger update.</div><div><br></div><di=
v>The qemu patch (2/2) is still good.</div><div><br></div><div>Thanks,<br><=
/div><div>=C2=A0 Jussi</div><div>=C2=A0</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Add-disable-opengl-configure-option.patch=C2=A0 =C2=A0 | 19 =
++++++++++---------<br>
=C2=A01 file changed, 10 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configur=
e-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-conf=
igure-option.patch<br>
index a963334..2306614 100644<br>
--- a/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-optio=
n.patch<br>
+++ b/meta/recipes-gnome/gtk+/gtk+3/0001-Add-disable-opengl-configure-optio=
n.patch<br>
@@ -1,4 +1,4 @@<br>
-From c77afa19881d955d759879aeae8bbd88613dd4fe Mon Sep 17 00:00:00 2001<br>
+From 91814d22387370e47384206e67729a26a5729192 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com" =
target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
=C2=A0Date: Thu, 16 Jun 2016 15:11:34 +0300<br>
=C2=A0Subject: [PATCH] Add --disable-opengl configure option<br>
@@ -28,7 +28,7 @@ Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi=
.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
=C2=A0 gdk/gdkgl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++++<br>
=C2=A0 gdk/gdkglcontext.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 6 ++++<br>
=C2=A0 gdk/gdkwindow.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 14 +++++++++-<br>
- gdk/x11/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 28 ++++++++++++++++---<br>
+ gdk/x11/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 29 ++++++++++++++++---<br>
=C2=A0 gdk/x11/gdkdisplay-x11.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6=
 ++--<br>
=C2=A0 gdk/x11/gdkscreen-x11.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 5 ++++<br>
=C2=A0 gdk/x11/gdkwindow-x11.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 4 +++<br>
@@ -41,7 +41,7 @@ Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi=
.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
=C2=A0 gtk/inspector/general.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 6 ++++<br>
=C2=A0 tests/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 10 +++++--<br>
=C2=A0 testsuite/gtk/objects-finalize.c=C2=A0 |=C2=A0 2 ++<br>
- 21 files changed, 257 insertions(+), 78 deletions(-)<br>
+ 21 files changed, 258 insertions(+), 78 deletions(-)<br>
=C2=A0 create mode 100644 gdk/x11/gdkx-with-gl-context.h<br>
=C2=A0 create mode 100644 gdk/x11/gdkx-without-gl-context.h<br>
=C2=A0 delete mode 100644 gdk/x11/gdkx.h<br>
@@ -412,7 +412,7 @@ index c34c113..3025e96 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cairo_region_destroy (opaque_regi=
on);<br>
<br>
=C2=A0diff --git a/gdk/x11/Makefile.am b/gdk/x11/Makefile.am<br>
-index c488a31..d0aa7ce 100644<br>
+index c488a31..576f8e1 100644<br>
=C2=A0--- a/gdk/x11/Makefile.am<br>
=C2=A0+++ b/gdk/x11/Makefile.am<br>
=C2=A0@@ -39,8 +39,6 @@ libgdk_x11_la_SOURCES =3D=C2=A0 =C2=A0 =C2=A0 \<br>
@@ -424,7 +424,7 @@ index c488a31..d0aa7ce 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkkeys-x11.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkmain-x11.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkproperty-x11.c=C2=A0 =C2=A0 =C2=A0 =C2=A0\<b=
r>
-@@ -53,14 +51,30 @@ libgdk_x11_la_SOURCES =3D=C2=A0 =C2=A0 \<br>
+@@ -53,14 +51,31 @@ libgdk_x11_la_SOURCES =3D=C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkwindow-x11.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkxftdefaults.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkxid.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
@@ -449,14 +449,15 @@ index c488a31..d0aa7ce 100644<br>
=C2=A0+endif<br>
=C2=A0+<br>
=C2=A0+BUILT_SOURCES =3D gdkx.h<br>
-+<br>
++.PHONY: gdkx.h<br>
=C2=A0+gdkx.h:<br>
-+=C2=A0 =C2=A0 =C2=A0 $(AM_V_GEN) cd $(srcdir) &amp;&amp; cp $(GDKX_HEADER=
) gdkx.h<br>
++=C2=A0 =C2=A0 =C2=A0 $(AM_V_GEN) cd $(srcdir) \<br>
++=C2=A0 =C2=A0 =C2=A0 &amp;&amp; (cmp -s $(GDKX_HEADER) gdkx.h || cp $(GDK=
X_HEADER) gdkx.h )<br>
=C2=A0+<br>
=C2=A0 libgdkx11include_HEADERS =3D=C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx-autocleanups.h=C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11applaunchcontext.h \<br>
-@@ -74,7 +88,6 @@ libgdkx11include_HEADERS =3D=C2=A0 =C2=A0\<br>
+@@ -74,7 +89,6 @@ libgdkx11include_HEADERS =3D=C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11display.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11displaymanager.h=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11dnd.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
@@ -464,7 +465,7 @@ index c488a31..d0aa7ce 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11keys.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11property.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11screen.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
-@@ -83,9 +96,16 @@ libgdkx11include_HEADERS =3D=C2=A0 \<br>
+@@ -83,9 +97,16 @@ libgdkx11include_HEADERS =3D=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11visual.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gdkx11window.h<br>
<span><font color=3D"#888888"><br>
--<br>
2.1.4<br>
<br>
</font></span></blockquote></div><br></div></div>

--001a11c0327a1631400535dc1fcd--
