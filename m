Return-Path: <limon.anibal@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 03C51600EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 15:00:41 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y82so32180405wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 07:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4laCLs+NqPzlgDV/S5PGWcKFYqgJIWheP7tRkk7ciD8=;
	b=MrvldSaoPu+srMOv58YLsdXF3gDmkvEW6ckaL7e5B6Tipjqcb9XOkO1fpxWlenufoB
	ZMhO4SFEZ63TF7osn/NyxNyOIda01m/vwMQbGr5JkQflwy9bpdNAEpsK0Qh0hrVIJ8RM
	gL1HTPJ9TQqCRvcCwk9pARuyuoHjbylTfi1xhmkpIJaHuGNew/Nt+bAcp2X6LpZl7vIR
	xMJ5dskF75krNPHdWLRE7Zp4ytF8ZhMoP3SWGtKythWgTzrY9GvWZtXfloKhNnFQ401h
	1TX4eXMO57qUC8dDd53atO51/gJeHJxTKoWRvrx2/VGFlTOgomW4sGHUFpIp3r/Kvrim
	oN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4laCLs+NqPzlgDV/S5PGWcKFYqgJIWheP7tRkk7ciD8=;
	b=do7VFMZwQlc78VNvDwaTBbQ2YAymtL++wODcbAWeJYFXX8FaqW7LQ5lXgjGJJAnJRd
	U0vtmaJIJ9h22UpRGAUCVthJzSPHcnIrhQV7kOxnh9K9gAyGvjIdc4w7tAAOpL+YXd7G
	KCvK39bNgAHIPKuPmc0ofKJDneuMOMcdo2/2e1sn/HhbNc2psQVQ6Vlj5Xjm62HqzzOx
	aWLUoFxSwErfX4wmh5q9TlqxboDsB5Z+YAXX0QiZcFZKgCV0fSt4W3VGrrJEx/E7OPTd
	GBQfz/PIrVYJ2oc/Go+czoCOTW+XY6uzhJ2w+p7zY8eDt2hWcFyqRI8/abNNPQnfEEjq
	z3bA==
X-Gm-Message-State: AJaThX4vAys4ZXFkyOaTtn0QViOEUjGwAglHKO/GIyG7D/jOJ1a98wxQ
	IvqRBLVBWfaCAnAk+uROtaGiAcewMnApv7TOhvyfRg==
X-Google-Smtp-Source: AGs4zMZHEICohQK2Lhv+wEnEk+ZEQaG9zVFfRdemR7ekSIyj7xPbHcxmS+BEcPkhdqjF6H9jOiwYhYyvHZis1xRb1Sc=
X-Received: by 10.80.180.246 with SMTP id x51mr2999910edd.230.1511881242600;
	Tue, 28 Nov 2017 07:00:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.241.18 with HTTP; Tue, 28 Nov 2017 07:00:42 -0800 (PST)
In-Reply-To: <20171128145928.5784-1-limon.anibal@gmail.com>
References: <20171128145928.5784-1-limon.anibal@gmail.com>
From: =?UTF-8?Q?Anibal_Lim=C3=B3n?= <limon.anibal@gmail.com>
Date: Tue, 28 Nov 2017 09:00:42 -0600
Message-ID: <CAPS-YPCuUxWAwsir_oOfSJG9eVVtqWnOcrSymqenYSmh_b84Lg@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-core@lists.openembedded.org
Cc: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>
Subject: Re: [PATCHv2] recipes-graphics/piglit: Add patch to fix build in some platforms
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
X-List-Received-Date: Tue, 28 Nov 2017 15:00:42 -0000
Content-Type: multipart/alternative; boundary="94eb2c192e8c6869a4055f0c4856"

--94eb2c192e8c6869a4055f0c4856
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2017 at 8:59 AM, An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail=
.com>
wrote:

> From: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>
> The entry point is not guaranteed to exist, so use the
> piglit_egl_get_default_display() helper which does the correct thing.
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> ---
>  ...gl-context-priority.c-Use-piglit_egl_get_.patch | 41
> ++++++++++++++++++++++
>  meta/recipes-graphics/piglit/piglit_git.bb         |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-graphics/piglit/
> piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch
>
> diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-
> egl-context-priority.c-Use-piglit_egl_get_.patch b/meta/recipes-graphics/
> piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-
> piglit_egl_get_.patch
> new file mode 100644
> index 0000000000..13b997c037
> --- /dev/null
> +++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-
> egl-context-priority.c-Use-piglit_egl_get_.patch
> @@ -0,0 +1,41 @@
> +From cb562a383229074b44db6998b85572d2abe7c363 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?An=3DC3=3DADbal=3D20Lim=3DC3=3DB3n?=3D <anibal.limon@l=
inaro.org>
> +Date: Fri, 24 Nov 2017 10:31:55 -0600
> +Subject: [PATCH] tests/egl/egl-context-priority.c: Use
> + piglit_egl_get_default_display
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The entry point is not guaranteed to exist, so use the
> +piglit_egl_get_default_display() helper which does the correct thing.
> +
> +Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> +Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> +Reviewed-by: Tapani P=C3=A4lli <tapani.palli@intel.com>
> +Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> +
> +Upstream-status: Backport
> +
> +https://github.com/Igalia/piglit/commit/cb562a3832


Now is a backport, the piglit people pushed to master the patch.

Cheers,
Anibal


>
> +---
> + tests/egl/egl-context-priority.c | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/tests/egl/egl-context-priority.c b/tests/egl/egl-context-
> priority.c
> +index 7f26fc614..9590ccae3 100644
> +--- a/tests/egl/egl-context-priority.c
> ++++ b/tests/egl/egl-context-priority.c
> +@@ -99,8 +99,7 @@ piglit_init(int argc, char **argv)
> +       if (!strstr(exts, "EGL_MESA_platform_surfaceless"))
> +               piglit_report_result(PIGLIT_SKIP);
> +
> +-      dpy =3D eglGetPlatformDisplay(EGL_PLATFORM_SURFACELESS_MESA,
> +-                                  EGL_DEFAULT_DISPLAY, NULL);
> ++      dpy =3D piglit_egl_get_default_display(EGL_PLATFORM_
> SURFACELESS_MESA);
> +
> +       ok =3D eglInitialize(dpy, &major, &minor);
> +       if (!ok) {
> +--
> +2.11.0
> +
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb
> b/meta/recipes-graphics/piglit/piglit_git.bb
> index d274a8fbd5..45fd534dfa 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D
> b2beded7103a3d8a442a2a0391d607b0"
>  SRC_URI =3D "git://anongit.freedesktop.org/piglit \
>             file://0001-cmake-install-bash-completions-in-the-right-place=
.patch
> \
>             file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h=
.patch
> \
> +           file://0001-tests-egl-egl-context-priority.c-Use-piglit_egl_g=
et_.patch
> \
>             "
>  UPSTREAM_VERSION_UNKNOWN =3D "1"
>
> --
> 2.11.0
>
>

--94eb2c192e8c6869a4055f0c4856
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Nov 28, 2017 at 8:59 AM, An=C3=ADbal Lim=C3=B3n <span dir=3D"lt=
r">&lt;<a href=3D"mailto:limon.anibal@gmail.com" target=3D"_blank">limon.an=
ibal@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From=
: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org">ani=
bal.limon@linaro.org</a>&gt;<br>
<br>
The entry point is not guaranteed to exist, so use the<br>
piglit_egl_get_default_<wbr>display() helper which does the correct thing.<=
br>
<br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
naro.org">anibal.limon@linaro.org</a>&gt;<br>
Signed-off-by: Daniel D=C3=ADaz &lt;<a href=3D"mailto:daniel.diaz@linaro.or=
g">daniel.diaz@linaro.org</a>&gt;<br>
---<br>
=C2=A0...gl-context-priority.c-Use-<wbr>piglit_egl_get_.patch | 41 ++++++++=
++++++++++++++<br>
=C2=A0meta/recipes-graphics/piglit/<a href=3D"http://piglit_git.bb" rel=3D"=
noreferrer" target=3D"_blank">p<wbr>iglit_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 42 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/piglit/<wbr>piglit/0001-test=
s-egl-egl-<wbr>context-priority.c-Use-piglit_<wbr>egl_get_.patch<br>
<br>
diff --git a/meta/recipes-graphics/<wbr>piglit/piglit/0001-tests-egl-<wbr>e=
gl-context-priority.c-Use-<wbr>piglit_egl_get_.patch b/meta/recipes-graphic=
s/<wbr>piglit/piglit/0001-tests-egl-<wbr>egl-context-priority.c-Use-<wbr>pi=
glit_egl_get_.patch<br>
new file mode 100644<br>
index 0000000000..13b997c037<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/<wbr>piglit/piglit/0001-tests-egl-<wbr>egl-cont=
ext-priority.c-Use-<wbr>piglit_egl_get_.patch<br>
@@ -0,0 +1,41 @@<br>
+From cb562a383229074b44db6998b85572<wbr>d2abe7c363 Mon Sep 17 00:00:00 200=
1<br>
+From: =3D?UTF-8?q?An=3DC3=3DADbal=3D20Lim=3D<wbr>C3=3DB3n?=3D &lt;<a href=
=3D"mailto:anibal.limon@linaro.org">anibal.limon@linaro.org</a>&gt;<br>
+Date: Fri, 24 Nov 2017 10:31:55 -0600<br>
+Subject: [PATCH] tests/egl/egl-context-<wbr>priority.c: Use<br>
+ piglit_egl_get_default_display<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+The entry point is not guaranteed to exist, so use the<br>
+piglit_egl_get_default_<wbr>display() helper which does the correct thing.=
<br>
+<br>
+Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@l=
inaro.org">anibal.limon@linaro.org</a>&gt;<br>
+Signed-off-by: Daniel D=C3=ADaz &lt;<a href=3D"mailto:daniel.diaz@linaro.o=
rg">daniel.diaz@linaro.org</a>&gt;<br>
+Reviewed-by: Tapani P=C3=A4lli &lt;<a href=3D"mailto:tapani.palli@intel.co=
m">tapani.palli@intel.com</a>&gt;<br>
+Reviewed-by: Emil Velikov &lt;<a href=3D"mailto:emil.velikov@collabora.com=
">emil.velikov@collabora.com</a>&gt;<br>
+<br>
+Upstream-status: Backport<br>
+<br>
+<a href=3D"https://github.com/Igalia/piglit/commit/cb562a3832" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/Igalia/<wbr>piglit/commit/cb56=
2a3832</a></blockquote><div><br></div><div>Now is a backport, the piglit pe=
ople pushed to master the patch.</div><div><br></div><div>Cheers,</div><div=
>Anibal</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
+---<br>
+ tests/egl/egl-context-<wbr>priority.c | 3 +--<br>
+ 1 file changed, 1 insertion(+), 2 deletions(-)<br>
+<br>
+diff --git a/tests/egl/egl-context-<wbr>priority.c b/tests/egl/egl-context=
-<wbr>priority.c<br>
+index 7f26fc614..9590ccae3 100644<br>
+--- a/tests/egl/egl-context-<wbr>priority.c<br>
++++ b/tests/egl/egl-context-<wbr>priority.c<br>
+@@ -99,8 +99,7 @@ piglit_init(int argc, char **argv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strstr(exts, &quot;EGL_MESA_platform_<wbr>=
surfaceless&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0piglit_report_resul=
t(PIGLIT_<wbr>SKIP);<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 dpy =3D eglGetPlatformDisplay(EGL_<wbr>PLATFORM_SURF=
ACELESS_MESA,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EGL_DEFAULT_DISPLAY, NULL);<b=
r>
++=C2=A0 =C2=A0 =C2=A0 dpy =3D piglit_egl_get_default_<wbr>display(EGL_PLAT=
FORM_<wbr>SURFACELESS_MESA);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ok =3D eglInitialize(dpy, &amp;major, &amp;mino=
r);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ok) {<br>
+--<br>
+2.11.0<br>
+<br>
diff --git a/meta/recipes-graphics/<wbr>piglit/<a href=3D"http://piglit_git=
.bb" rel=3D"noreferrer" target=3D"_blank">piglit_git.bb</a> b/meta/recipes-=
graphics/<wbr>piglit/<a href=3D"http://piglit_git.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">piglit_git.bb</a><br>
index d274a8fbd5..45fd534dfa 100644<br>
--- a/meta/recipes-graphics/<wbr>piglit/<a href=3D"http://piglit_git.bb" re=
l=3D"noreferrer" target=3D"_blank">piglit_git.bb</a><br>
+++ b/meta/recipes-graphics/<wbr>piglit/<a href=3D"http://piglit_git.bb" re=
l=3D"noreferrer" target=3D"_blank">piglit_git.bb</a><br>
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>b2bede=
d7103a3d8a442a2a0391d607<wbr>b0&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://anongit.freedesktop.org/pig=
lit" rel=3D"noreferrer" target=3D"_blank">anongit.freedesktop.<wbr>org/pigl=
it</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-cmake-install-<wbr>ba=
sh-completions-in-the-right-<wbr>place.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-tests-Use-FE_<wbr>UPW=
ARD-only-if-its-defined-in-<wbr>fenv.h.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tests-egl-egl-<wbr>co=
ntext-priority.c-Use-piglit_<wbr>egl_get_.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0UPSTREAM_VERSION_UNKNOWN =3D &quot;1&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br></div></div>

--94eb2c192e8c6869a4055f0c4856--
