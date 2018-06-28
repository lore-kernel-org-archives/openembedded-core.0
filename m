Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8456C6212C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 20:13:57 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id z12-v6so4251701uac.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 13:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qDuDv//pQ4wlFb0z6kvmowjF/ShaUBtGEDqcAvbTVyY=;
	b=FLu0c26ndYg711oiX9N8qhU9an06Pj0q+PMcJAlYVk1YPrEV4Eb/h1KyPoC5ZVl3pf
	eeTRDxL1HLBmM2RMwqDzPggqsqq3dSc0zcaXkuWxGhytqzCZsGB8go7nBpvxIFxXjHmW
	bukr1rINesaTCHmbA3+vBNKyhtl0PqtJctirc3yDm3jSJT+O/L11joNLZle0LXXYHbxy
	Ru1qHMkvOe6oVDA0UOcVYDQ1DqRNN1KcdWPxFHI7siwzSzRarxbfid3JWjjDudSR9f6T
	U4W1adXCRlJb82Wdbx9MVoMrTBA66kuarwXwoLnq1wuGRTo28rMm7jsmtip603f4XHMC
	FWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qDuDv//pQ4wlFb0z6kvmowjF/ShaUBtGEDqcAvbTVyY=;
	b=VRw8xVlEmuRVmucJxVkoTmGJNvYXNGBxKI7jwVQ55OeEmJvne4BV87KbUjQKmF5/ru
	wYNFmPQXbm1/cfGJP3zBTu8ktakDxoky0sIB2BYG7JXonD3eYfVxJ4P62NyEZQCrDcsx
	thtepCf74iMhsPdX5W/nPHyHRxqGnks1k+VL28QVVxz/XHa0OWICG89ZAubGVpypvKN0
	RTc592MU1gS4C19oTjjSjdj8hyOFexMBVW2Bf3skWjjIkvcAAyOu9Q/U4n4t1788xbEc
	vH8aIf4p6YRTHjVCgeo8JqlKY6HRI3GtX00jDJT77DiS3fmICkE2paK2hkIEa/9jfYNe
	ISWg==
X-Gm-Message-State: APt69E0mF3bBrb0m1MiyBzLh+kvEQSh5fpkQ1VeFCgvOBMwTCnnBa9Jm
	2ZY1XVOBtRQoG4uceVWiewkmbmEorgdzOTQBv7Q=
X-Google-Smtp-Source: AAOMgpeRSu4pUjQqAlpCBJLUOW+00DiuI8soRCJP795+i0L2+CaU5+qlolxlPyoZT0okzyzTRqM8m2h6hh8f18XxKOk=
X-Received: by 2002:a9f:3613:: with SMTP id
	r19-v6mr7549936uad.49.1530216838036; 
	Thu, 28 Jun 2018 13:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20180628134111.18723-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20180628134111.18723-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jun 2018 13:13:39 -0700
Message-ID: <CAMKF1srjCXi3AJnEh=4dMS59emn6-JuHfgWNkfxh1cneFskrhA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: Fix parallel make race
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
X-List-Received-Date: Thu, 28 Jun 2018 20:13:57 -0000
Content-Type: multipart/alternative; boundary="0000000000000f836e056fb95fab"

--0000000000000f836e056fb95fab
Content-Type: text/plain; charset="UTF-8"

Thanks my builders have been constantly showing this failure

On Thu, Jun 28, 2018 at 6:42 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Builds keep failing with a race over the generated header file, fix it!
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../mesa/files/parallel-make-race-fix.patch   | 26 +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa_18.1.2.bb     |  1 +
>  2 files changed, 27 insertions(+)
>  create mode 100644
> meta/recipes-graphics/mesa/files/parallel-make-race-fix.patch
>
> diff --git a/meta/recipes-graphics/mesa/files/parallel-make-race-fix.patch
> b/meta/recipes-graphics/mesa/files/parallel-make-race-fix.patch
> new file mode 100644
> index 00000000000..142279584e4
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/parallel-make-race-fix.patch
> @@ -0,0 +1,26 @@
> +There is a parallel make build issue in src/egl/drivers/dri2/
> +for wayland builds. Can be reproduced with:
> +
> +$ rm src/egl/drivers/dri2/*.h src/egl/drivers/dri2/platform_wayland.lo
> +$ make -C src/egl/ drivers/dri2/platform_wayland.lo
> +
> +../../../mesa-18.1.2/src/egl/drivers/dri2/platform_wayland.c:50:10: fatal
> error: linux-dmabuf-unstable-v1-client-protocol.h: No such file or directory
> +
> +This patch adds the missing dependency.
> +
> +Signed-off-by Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +Upstream-Status: Pending
> +
> +Index: mesa-18.1.2/src/egl/Makefile.am
> +===================================================================
> +--- mesa-18.1.2.orig/src/egl/Makefile.am
> ++++ mesa-18.1.2/src/egl/Makefile.am
> +@@ -80,6 +80,7 @@ drivers/dri2/linux-dmabuf-unstable-v1-cl
> + if HAVE_PLATFORM_WAYLAND
> + drivers/dri2/linux-dmabuf-unstable-v1-protocol.lo:
> drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h
> + drivers/dri2/egl_dri2.lo:
> drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h
> ++drivers/dri2/platform_wayland.lo:
> drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h
> +
> + AM_CFLAGS += $(WAYLAND_CLIENT_CFLAGS)
> + libEGL_common_la_LIBADD += $(WAYLAND_CLIENT_LIBS)
> diff --git a/meta/recipes-graphics/mesa/mesa_18.1.2.bb
> b/meta/recipes-graphics/mesa/mesa_18.1.2.bb
> index 2c06b1eb7ba..9a9a2b25623 100644
> --- a/meta/recipes-graphics/mesa/mesa_18.1.2.bb
> +++ b/meta/recipes-graphics/mesa/mesa_18.1.2.bb
> @@ -8,6 +8,7 @@ SRC_URI = "
> https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>
> file://0005-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch \
>             file://0006-Use-Python-3-to-execute-the-scripts.patch \
>             file://0007-dri-i965-Add-missing-time.h-include.patch \
> +           file://parallel-make-race-fix.patch \
>  "
>
>  SRC_URI[md5sum] = "a2d4f031eb6bd6111d44d84004476918"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000000f836e056fb95fab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Thanks my builders have been constantly showing this=
 failure=C2=A0</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr">On Thu, Jun 28, 2018 at 6:42 AM Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">Builds keep failing with a=
 race over the generated header file, fix it!<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0.../mesa/files/parallel-make-race-fix.patch=C2=A0 =C2=A0| 26 ++++++++=
+++++++++++<br>
=C2=A0meta/recipes-graphics/mesa/<a href=3D"http://mesa_18.1.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_18.1.2.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A02 files changed, 27 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/mesa/files/parallel-make-rac=
e-fix.patch<br>
<br>
diff --git a/meta/recipes-graphics/mesa/files/parallel-make-race-fix.patch =
b/meta/recipes-graphics/mesa/files/parallel-make-race-fix.patch<br>
new file mode 100644<br>
index 00000000000..142279584e4<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/mesa/files/parallel-make-race-fix.patch<br>
@@ -0,0 +1,26 @@<br>
+There is a parallel make build issue in src/egl/drivers/dri2/<br>
+for wayland builds. Can be reproduced with:<br>
+<br>
+$ rm src/egl/drivers/dri2/*.h src/egl/drivers/dri2/platform_wayland.lo<br>
+$ make -C src/egl/ drivers/dri2/platform_wayland.lo<br>
+<br>
+../../../mesa-18.1.2/src/egl/drivers/dri2/platform_wayland.c:50:10: fatal =
error: linux-dmabuf-unstable-v1-client-protocol.h: No such file or director=
y<br>
+<br>
+This patch adds the missing dependency.<br>
+<br>
+Signed-off-by Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Index: mesa-18.1.2/src/egl/Makefile.am<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- mesa-18.1.2.orig/src/egl/Makefile.am<br>
++++ mesa-18.1.2/src/egl/Makefile.am<br>
+@@ -80,6 +80,7 @@ drivers/dri2/linux-dmabuf-unstable-v1-cl<br>
+ if HAVE_PLATFORM_WAYLAND<br>
+ drivers/dri2/linux-dmabuf-unstable-v1-protocol.lo: drivers/dri2/linux-dma=
buf-unstable-v1-client-protocol.h<br>
+ drivers/dri2/egl_dri2.lo: drivers/dri2/linux-dmabuf-unstable-v1-client-pr=
otocol.h<br>
++drivers/dri2/platform_wayland.lo: drivers/dri2/linux-dmabuf-unstable-v1-c=
lient-protocol.h<br>
+ <br>
+ AM_CFLAGS +=3D $(WAYLAND_CLIENT_CFLAGS)<br>
+ libEGL_common_la_LIBADD +=3D $(WAYLAND_CLIENT_LIBS)<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_18.1.2.bb" r=
el=3D"noreferrer" target=3D"_blank">mesa_18.1.2.bb</a> b/meta/recipes-graph=
ics/mesa/<a href=3D"http://mesa_18.1.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">mesa_18.1.2.bb</a><br>
index 2c06b1eb7ba..9a9a2b25623 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_18.1.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_18.1.2.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_18.1.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_18.1.2.bb</a><br>
@@ -8,6 +8,7 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.org/a=
rchive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://=
mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-Properly-get-LLVM-ver=
sion-when-using-LLVM-Git-releas.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0006-Use-Python-3-to-execu=
te-the-scripts.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0007-dri-i965-Add-missing-=
time.h-include.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://parallel-make-race-fix.pat=
ch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;a2d4f031eb6bd6111d44d84004476918&quot;<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000000f836e056fb95fab--
