Return-Path: <gizero@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7685A78217
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 13:08:05 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id d124so13047187vkf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 06:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Dejh3MZsN/FhF0fC+EO1FEuaQjLAkNxM0A/inMDumk8=;
	b=YicSgXWFMNVSzeo+eNpRZ6uzZI/eGrU5um3bSV57mG3200oajg5SgnBy443CTu8Jo+
	SDZTA93cUbk4tEDWiZ+XpR8R2WFpy+/hvQtAdH26WO3JkperveqL/NSY3vYdIWFiQlNQ
	yzTc8GDjoRVcFu0hadWPzjNUaCxUDf9AQSqHehrpMbTEIew21GxX8P6yT7ej2GE2tr6C
	j7EvOaHbjX9CjbMc12rO/v/CEpqXYMu9k2fzDJUMZCdXN7YWwC7r3pVEiqeOFU1TbhSs
	7bO08bEejPlDvPhhhHMHiRVJhLhLu7BycZZP4bVqxAUF3/JBYfKRUSMimrM9pM0JZR9X
	NHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Dejh3MZsN/FhF0fC+EO1FEuaQjLAkNxM0A/inMDumk8=;
	b=UTioXSMLnhbz/iGdFxH6BlQ9/sZCCbiuqHvdRPuWyhIfcfarLcKiHm5tGLxUU7PvLm
	48SashPiOK5gAa56Jkp05txagGE/nGU92GVaSA/l6HxH/4HDeSSz98oJOSg9cY1OCx92
	DISXpzqSJ0/tTJN40HeeMxCqmdLl73Yj5SgbhRf75CTt6c/HY8p/lXJbpeT1x4TpCWFc
	6CWPTtsgbcEq092pH20HyqwGUaMPyw2y/xpjoTxJAGd/SowuGezBAWkAjIAn1Gjaqz9u
	aSjA3TGg6hiY6bNkdVE5FIcNJr69N6VWzNmM0QwnJUYQspTQ2C7f4ysAQ4tqBSEVWj1L
	aCzA==
X-Gm-Message-State: AHYfb5h4+7ZHFekgeNKiebk+Ovc/HuWSOy/nbk4T5s0YB7WhL4XfVdr+
	Arj5lUuiLvcf/kekZy6zQ/2NGl52XQ==
X-Received: by 10.31.63.23 with SMTP id m23mr10381010vka.101.1502456886144;
	Fri, 11 Aug 2017 06:08:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.74.94 with HTTP; Fri, 11 Aug 2017 06:08:05 -0700 (PDT)
In-Reply-To: <20170810093755.6342-1-schnitzeltony@googlemail.com>
References: <20170810093755.6342-1-schnitzeltony@googlemail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Fri, 11 Aug 2017 15:08:05 +0200
Message-ID: <CAC+thW0AzxtL22OCU_o+Lb_arcHkzvtu-PFSAWYPsxRAanOqUw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: update to 17.1.6
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
X-List-Received-Date: Fri, 11 Aug 2017 13:08:05 -0000
Content-Type: multipart/alternative; boundary="001a114dc096fd35a105567a008c"

--001a114dc096fd35a105567a008c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2017 at 11:37 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> Optional installation of khrplatform.h was implemented upstream by a
> slightly
> different approach -> 0001-mapi-Only-install-khrplat
> form.h-with-EGL-or-GLES.patch
> can be removed.


> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>

LGTM. Being reporting the issue that originated the here removed patch by
Jussi, I build tested this commit on the original setup with
meta-raspberrypi and everything still looks good.

---
>  ...ly-install-khrplatform.h-with-EGL-or-GLES.patch | 52
> ----------------------
>  .../mesa/{mesa-gl_17.1.5.bb =3D> mesa-gl_17.1.6.bb}  |  0
>  .../mesa/{mesa_17.1.5.bb =3D> mesa_17.1.6.bb}        |  5 +--
>  3 files changed, 2 insertions(+), 55 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/fil
> es/0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_17.1.5.bb =3D> mesa-gl_17.1.6=
.bb}
> (100%)
>  rename meta/recipes-graphics/mesa/{mesa_17.1.5.bb =3D> mesa_17.1.6.bb}
> (81%)
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-mapi-Only-install-kh
> rplatform.h-with-EGL-or-GLES.patch b/meta/recipes-graphics/mesa/f
> iles/0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.patch
> deleted file mode 100644
> index be61e2e..0000000
> --- a/meta/recipes-graphics/mesa/files/0001-mapi-Only-install-kh
> rplatform.h-with-EGL-or-GLES.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 922cb47a5b950ee5545a7a3cb4cd9a88a8b15054 Mon Sep 17 00:00:00 2001
> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Date: Wed, 12 Jul 2017 12:21:29 +0300
> -Subject: [PATCH] mapi: Only install khrplatform.h with EGL or GLES
> -
> -When mesa is built with "--disable-egl --disable-gles1
> ---disable-gles2" the KHR platform headers are not needed.
> -
> -Not installing the header when not needed allows using mesa for GL
> -and another implementation for GLES+EGL (as is done in practice with
> -userland on raspberrypi).
> -
> -Upstream-Status: Pending [waiting for test results before sending]
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ----
> - src/mapi/Makefile.am | 9 ++++++++-
> - 1 file changed, 8 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/mapi/Makefile.am b/src/mapi/Makefile.am
> -index 9ff70a14fd..94c77fb82c 100644
> ---- a/src/mapi/Makefile.am
> -+++ b/src/mapi/Makefile.am
> -@@ -188,6 +188,8 @@ es1api_libGLESv1_CM_la_LDFLAGS =3D \
> -       $(LD_NO_UNDEFINED)
> -
> - es1api_libGLESv1_CM_la_LIBADD +=3D shared-glapi/libglapi.la
> -+
> -+khr_HEADERS =3D $(top_srcdir)/include/KHR/khrplatform.h
> - endif
> -
> - es1api/glapi_mapi_tmp.h: glapi/gen/gl_and_es_API.xml
> $(glapi_gen_mapi_deps)
> -@@ -233,6 +235,12 @@ es2api_libGLESv2_la_LDFLAGS =3D \
> -       $(LD_NO_UNDEFINED)
> -
> - es2api_libGLESv2_la_LIBADD +=3D shared-glapi/libglapi.la
> -+
> -+khr_HEADERS =3D $(top_srcdir)/include/KHR/khrplatform.h
> -+endif
> -+
> -+if HAVE_EGL
> -+khr_HEADERS =3D $(top_srcdir)/include/KHR/khrplatform.h
> - endif
> -
> - es2api/glapi_mapi_tmp.h: glapi/gen/gl_and_es_API.xml
> $(glapi_gen_mapi_deps)
> -@@ -243,4 +251,3 @@ es2api/glapi_mapi_tmp.h: glapi/gen/gl_and_es_API.xml
> $(glapi_gen_mapi_deps)
> - include $(top_srcdir)/install-lib-links.mk
> -
> - khrdir =3D $(includedir)/KHR
> --khr_HEADERS =3D $(top_srcdir)/include/KHR/khrplatform.h
> ---
> -2.13.2
> -
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.1.5.bb
> b/meta/recipes-graphics/mesa/mesa-gl_17.1.6.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_17.1.5.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_17.1.6.bb
> diff --git a/meta/recipes-graphics/mesa/mesa_17.1.5.bb
> b/meta/recipes-graphics/mesa/mesa_17.1.6.bb
> similarity index 81%
> rename from meta/recipes-graphics/mesa/mesa_17.1.5.bb
> rename to meta/recipes-graphics/mesa/mesa_17.1.6.bb
> index 36b0377..111c73a 100644
> --- a/meta/recipes-graphics/mesa/mesa_17.1.5.bb
> +++ b/meta/recipes-graphics/mesa/mesa_17.1.6.bb
> @@ -5,14 +5,13 @@ SRC_URI =3D "https://mesa.freedesktop.org/
> archive/mesa-${PV}.tar.xz \
>             file://disable-asm-on-non-gcc.patch \
>             file://0001-Use-wayland-scanner-in-the-path.patch \
>             file://0002-hardware-gloat.patch \
> -           file://0001-mapi-Only-install-khrplatform.h-with-EGL-or-GLES.=
patch
> \
>             file://vulkan-mkdir.patch \
>             file://llvm-config-version.patch \
>             file://0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch \
>             file://0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch =
\
>  "
> -SRC_URI[md5sum] =3D "6cf936fbcaadd98924298a7009e8265d"
> -SRC_URI[sha256sum] =3D "378516b171712687aace4c7ea8b37
> c85895231d7a6d61e1e27362cf6034fded9"
> +SRC_URI[md5sum] =3D "54758bf842f9ea53c8b57cce4311b87e"
> +SRC_URI[sha256sum] =3D "0686deadde1f126b20aa67e47e8c5
> 0502043eee4ecdf60d5009ffda3cebfee50"
>
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> --
> 2.9.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114dc096fd35a105567a008c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Aug 10, 2017 at 11:37 AM, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a =
href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzelton=
y@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Optional installation of khrplatform.h was implemented ups=
tream by a slightly<br>
different approach -&gt; 0001-mapi-Only-install-khrplat<wbr>form.h-with-EGL=
-or-GLES.patch<br>
can be removed.</blockquote><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goog=
lemail.com" target=3D"_blank">schnitzeltony@googlemail.com</a>&gt;<br></blo=
ckquote><div><br></div><div><div>LGTM. Being reporting the issue that origi=
nated the here removed patch by Jussi, I build tested this commit on the or=
iginal setup with meta-raspberrypi and everything still looks good.</div></=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0...ly-install-khrplatform.h-w<wbr>ith-EGL-or-GLES.patch | 52 --------=
--------------<br>
=C2=A0.../mesa/{<a href=3D"http://mesa-gl_17.1.5.bb" rel=3D"noreferrer" tar=
get=3D"_blank">mesa-gl_17.1.5.bb</a> =3D&gt; <a href=3D"http://mesa-gl_17.1=
.6.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_17.1.6.bb</a>}=C2=A0 |=
=C2=A0 0<br>
=C2=A0.../mesa/{<a href=3D"http://mesa_17.1.5.bb" rel=3D"noreferrer" target=
=3D"_blank">mesa_17.1.5.bb</a> =3D&gt; <a href=3D"http://mesa_17.1.6.bb" re=
l=3D"noreferrer" target=3D"_blank">mesa_17.1.6.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 5 +--<br>
=C2=A03 files changed, 2 insertions(+), 55 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/mesa/fil<wbr>es/0001-mapi-On=
ly-install-khrp<wbr>latform.h-with-EGL-or-GLES.<wbr>patch<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa-gl_17.1.5.b=
b" rel=3D"noreferrer" target=3D"_blank">me<wbr>sa-gl_17.1.5.bb</a> =3D&gt; =
<a href=3D"http://mesa-gl_17.1.6.bb" rel=3D"noreferrer" target=3D"_blank">m=
esa-gl_17.1.6.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa_17.1.5.bb" =
rel=3D"noreferrer" target=3D"_blank">me<wbr>sa_17.1.5.bb</a> =3D&gt; <a hre=
f=3D"http://mesa_17.1.6.bb" rel=3D"noreferrer" target=3D"_blank">mesa_17.1.=
6.bb</a>} (81%)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/f<wbr>iles/0001-mapi-Only-install-k=
h<wbr>rplatform.h-with-EGL-or-GLES.<wbr>patch b/meta/recipes-graphics/mesa/=
f<wbr>iles/0001-mapi-Only-install-kh<wbr>rplatform.h-with-EGL-or-GLES.<wbr>=
patch<br>
deleted file mode 100644<br>
index be61e2e..0000000<br>
--- a/meta/recipes-graphics/mesa/f<wbr>iles/0001-mapi-Only-install-kh<wbr>r=
platform.h-with-EGL-or-GLES.<wbr>patch<br>
+++ /dev/null<br>
@@ -1,52 +0,0 @@<br>
-From 922cb47a5b950ee5545a7a3cb4cd9a<wbr>88a8b15054 Mon Sep 17 00:00:00 200=
1<br>
-From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com" targe=
t=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
-Date: Wed, 12 Jul 2017 12:21:29 +0300<br>
-Subject: [PATCH] mapi: Only install khrplatform.h with EGL or GLES<br>
-<br>
-When mesa is built with &quot;--disable-egl --disable-gles1<br>
---disable-gles2&quot; the KHR platform headers are not needed.<br>
-<br>
-Not installing the header when not needed allows using mesa for GL<br>
-and another implementation for GLES+EGL (as is done in practice with<br>
-userland on raspberrypi).<br>
-<br>
-Upstream-Status: Pending [waiting for test results before sending]<br>
-Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt;<br>
----<br>
- src/mapi/Makefile.am | 9 ++++++++-<br>
- 1 file changed, 8 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/mapi/Makefile.am b/src/mapi/Makefile.am<br>
-index 9ff70a14fd..94c77fb82c 100644<br>
---- a/src/mapi/Makefile.am<br>
-+++ b/src/mapi/Makefile.am<br>
-@@ -188,6 +188,8 @@ es1api_libGLESv1_CM_la_LDFLAGS =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(LD_NO_UNDEFINED)<br>
-<br>
- es1api_libGLESv1_CM_la_LIBADD +=3D shared-glapi/<a href=3D"http://libglap=
i.la" rel=3D"noreferrer" target=3D"_blank">libglapi.la</a><br>
-+<br>
-+khr_HEADERS =3D $(top_srcdir)/include/KHR/khrp<wbr>latform.h<br>
- endif<br>
-<br>
- es1api/glapi_mapi_tmp.h: glapi/gen/gl_and_es_API.xml $(glapi_gen_mapi_dep=
s)<br>
-@@ -233,6 +235,12 @@ es2api_libGLESv2_la_LDFLAGS =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(LD_NO_UNDEFINED)<br>
-<br>
- es2api_libGLESv2_la_LIBADD +=3D shared-glapi/<a href=3D"http://libglapi.l=
a" rel=3D"noreferrer" target=3D"_blank">libglapi.la</a><br>
-+<br>
-+khr_HEADERS =3D $(top_srcdir)/include/KHR/khrp<wbr>latform.h<br>
-+endif<br>
-+<br>
-+if HAVE_EGL<br>
-+khr_HEADERS =3D $(top_srcdir)/include/KHR/khrp<wbr>latform.h<br>
- endif<br>
-<br>
- es2api/glapi_mapi_tmp.h: glapi/gen/gl_and_es_API.xml $(glapi_gen_mapi_dep=
s)<br>
-@@ -243,4 +251,3 @@ es2api/glapi_mapi_tmp.h: glapi/gen/gl_and_es_API.xml $=
(glapi_gen_mapi_deps)<br>
- include $(top_srcdir)/<a href=3D"http://install-lib-links.mk" rel=3D"nore=
ferrer" target=3D"_blank">install-lib-link<wbr>s.mk</a><br>
-<br>
- khrdir =3D $(includedir)/KHR<br>
--khr_HEADERS =3D $(top_srcdir)/include/KHR/khrp<wbr>latform.h<br>
---<br>
-2.13.2<br>
-<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_17.1.5.bb=
" rel=3D"noreferrer" target=3D"_blank">m<wbr>esa-gl_17.1.5.bb</a> b/meta/re=
cipes-graphics/mesa/<a href=3D"http://mesa-gl_17.1.6.bb" rel=3D"noreferrer"=
 target=3D"_blank">m<wbr>esa-gl_17.1.6.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_17.1.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">mes<wbr>a-gl_17.1.5.bb</a><br>
rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_17.1.6.bb" r=
el=3D"noreferrer" target=3D"_blank">mes<wbr>a-gl_17.1.6.bb</a><br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.5.bb" r=
el=3D"noreferrer" target=3D"_blank">m<wbr>esa_17.1.5.bb</a> b/meta/recipes-=
graphics/mesa/<a href=3D"http://mesa_17.1.6.bb" rel=3D"noreferrer" target=
=3D"_blank">m<wbr>esa_17.1.6.bb</a><br>
similarity index 81%<br>
rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.5.bb" re=
l=3D"noreferrer" target=3D"_blank">mes<wbr>a_17.1.5.bb</a><br>
rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.6.bb" rel=
=3D"noreferrer" target=3D"_blank">mes<wbr>a_17.1.6.bb</a><br>
index 36b0377..111c73a 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">m<wbr>esa_17.1.5.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.1.6.bb" rel=3D"n=
oreferrer" target=3D"_blank">m<wbr>esa_17.1.6.bb</a><br>
@@ -5,14 +5,13 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.org=
/archive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:=
//mesa.freedesktop.org/<wbr>archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://disable-asm-on-non-gcc.<wb=
r>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Use-wayland-scanne<wb=
r>r-in-the-path.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-hardware-gloat.pat<wb=
r>ch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-mapi-Only-<wbr>instal=
l-khrplatform.h-with-<wbr>EGL-or-GLES.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://vulkan-mkdir.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://llvm-config-version.pat<wb=
r>ch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ac-fix-build-after<wb=
r>-LLVM-5.0-SVN-r300718.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-gallivm-Fix-build-<wb=
r>against-LLVM-SVN-r302589.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;6cf936fbcaadd98924298a7009e82<wbr>65d&quot;<br>
-SRC_URI[sha256sum] =3D &quot;378516b171712687aace4c7ea8b37<wbr>c85895231d7=
a6d61e1e27362cf6034<wbr>fded9&quot;<br>
+SRC_URI[md5sum] =3D &quot;54758bf842f9ea53c8b57cce4311b<wbr>87e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;0686deadde1f126b20aa67e47e8c5<wbr>0502043eee4=
ecdf60d5009ffda3ceb<wbr>fee50&quot;<br>
<br>
=C2=A0#because we cannot rely on the fact that all apps will use pkgconfig,=
<br>
=C2=A0#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER<br>
<span class=3D"gmail-m_5427951711383434573HOEnZb"><font color=3D"#888888">-=
-<br>
2.9.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a114dc096fd35a105567a008c--
