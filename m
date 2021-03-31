Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web10.8832.1617205749545303602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 08:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CWVOYI6X;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id e1so6273231uaa.4
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 08:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qo/BVXfiBpoC6z3hLHcfBEYTQWH3sHUUkGmLkdCvD0I=;
        b=CWVOYI6XkalJe1i9eA1bj4amxQK1t3tCdJcBnc9Ut/2/GVBJJY0ZU+y6z2X6C5Z7gS
         b1ZNDYnVzaitBrtY2yVUtASmmvyMiBcm+2q6RHStLKVgsl7cEF4pGgzari2QiCB0Njeq
         tKR0dWavnEwOi5ae/BlkP6QHEQ1jHRNY8EmtCXjosOqV8vCXOOrz0Tpf8emkl+lGK5tf
         mxN7919wboix0F8IrFD1m+7MAsR5ns339qzV6vjDPqni5orauBCl0h20Vkpq3Y7LqX0d
         gJznIZ3C/1qsbNTBMOExP+N7VQk93Vktk97GLpaMvNORiURcinjJIMvpbNYCwRfvEKbq
         zRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qo/BVXfiBpoC6z3hLHcfBEYTQWH3sHUUkGmLkdCvD0I=;
        b=L8BELfqf+GroAh6y0n5iGSAKAiPs9vjna3HC3YM8u1xczzcMCMOQPubdGEWU4XH/OW
         NZj7RpLFiDnhslRyTC6UvsykFUaratUoeNrzcoltWKaZhxDu2Vya3in1Kdhj4M6pvTt8
         8d0dwlDKfcFYRf/IGdwHhikM6YQzEesQ0qb2Dh5C8TiqYvftxvKTrmS768SHwzvHILBr
         Q/AObkqsEUF3YjZWu9KuLWH0BvxZ9gDfvKsnquVzA+yAUj+lpgGy424MOw25VTFhvywP
         Nn1WCwcDotNkVABU6InAylDmbXTEJSjaEeYqmbI8fVvGEBD8MuWC5txAAexwfgMztEnx
         Rz9Q==
X-Gm-Message-State: AOAM531ckco76qNgQ4O38vblxM3VdeRulPQHojQtLo1466136Gl2tWV3
	A4cw9spKnTCVYVeV4b+no2Xf1twW8U05hZDhgzM=
X-Google-Smtp-Source: ABdhPJz66xOWoKWyOoQGl0G1fdBvYTpeGf6sVOwcrXcSZyY6LwKyirJhFAIC4v5U446xFpkfufz4WidA85YELHp9XkY=
X-Received: by 2002:ab0:7150:: with SMTP id k16mr1986575uao.71.1617205748697;
 Wed, 31 Mar 2021 08:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <1617200547-62088-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1617200547-62088-1-git-send-email-wangmy@fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 31 Mar 2021 17:48:56 +0200
Message-ID: <CANNYZj9uPZeUDLiH2zC3EtYV9+j+6YJ_z4m8H7ajZcExJud_uw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cairo: upgrade 1.16.0 -> 1.17.4
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000002e0d7d05bed70e0a"

--0000000000002e0d7d05bed70e0a
Content-Type: text/plain; charset="UTF-8"

This is a development version, which is made very clearly:
https://cairographics.org/snapshots/

What's the rationale for this update?

Alex

On Wed, 31 Mar 2021 at 16:22, wangmy <wangmy@fujitsu.com> wrote:

> CVE-2018-19876.patch
> removed since it is included in 1.17.4
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../cairo/cairo/CVE-2018-19876.patch          | 34 -------------------
>  .../{cairo_1.16.0.bb => cairo_1.17.4.bb}      |  7 ++--
>  2 files changed, 3 insertions(+), 38 deletions(-)
>  delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
>  rename meta/recipes-graphics/cairo/{cairo_1.16.0.bb => cairo_1.17.4.bb}
> (94%)
>
> diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
> b/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
> deleted file mode 100644
> index 4252a5663b..0000000000
> --- a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -CVE: CVE-2018-19876
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 90e85c2493fdfa3551f202ff10282463f1e36645 Mon Sep 17 00:00:00 2001
> -From: Carlos Garcia Campos <cgarcia@igalia.com>
> -Date: Mon, 19 Nov 2018 12:33:07 +0100
> -Subject: [PATCH] ft: Use FT_Done_MM_Var instead of free when available in
> - cairo_ft_apply_variations
> -
> -Fixes a crash when using freetype >= 2.9
> ----
> - src/cairo-ft-font.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c
> -index 325dd61b4..981973f78 100644
> ---- a/src/cairo-ft-font.c
> -+++ b/src/cairo-ft-font.c
> -@@ -2393,7 +2393,11 @@ skip:
> - done:
> -         free (coords);
> -         free (current_coords);
> -+#if HAVE_FT_DONE_MM_VAR
> -+        FT_Done_MM_Var (face->glyph->library, ft_mm_var);
> -+#else
> -         free (ft_mm_var);
> -+#endif
> -     }
> - }
> -
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> b/meta/recipes-graphics/cairo/cairo_1.17.4.bb
> similarity index 94%
> rename from meta/recipes-graphics/cairo/cairo_1.16.0.bb
> rename to meta/recipes-graphics/cairo/cairo_1.17.4.bb
> index 68f993d7ca..e92540c49e 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.17.4.bb
> @@ -22,15 +22,14 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
>
>  DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
>
> -SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
> +SRC_URI = "https://cairographics.org/snapshots/cairo-${PV}.tar.xz \
>             file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
> -           file://CVE-2018-19876.patch \
>             file://CVE-2019-6461.patch \
>             file://CVE-2019-6462.patch \
>            "
>
> -SRC_URI[md5sum] = "f19e0353828269c22bd72e271243a552"
> -SRC_URI[sha256sum] =
> "5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331"
> +SRC_URI[md5sum] = "bf9d0d324ecbd350d0e9308125fa4ce0"
> +SRC_URI[sha256sum] =
> "74b24c1ed436bbe87499179a3b27c43f4143b8676d8ad237a6fa787401959705"
>
>  inherit autotools pkgconfig upstream-version-is-even gtk-doc
> multilib_script
>
> --
> 2.25.1
>
>
> 
>
>

--0000000000002e0d7d05bed70e0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is a development version, which is made very cle=
arly:</div><div><a href=3D"https://cairographics.org/snapshots/">https://ca=
irographics.org/snapshots/</a></div><div><br></div><div>What&#39;s the rati=
onale for this update?<br></div><div><br></div><div>Alex<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 3=
1 Mar 2021 at 16:22, wangmy &lt;<a href=3D"mailto:wangmy@fujitsu.com">wangm=
y@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">CVE-2018-19876.patch<br>
removed since it is included in 1.17.4<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" targe=
t=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../cairo/cairo/CVE-2018-19876.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 34 -------------------<br>
=C2=A0.../{<a href=3D"http://cairo_1.16.0.bb" rel=3D"noreferrer" target=3D=
"_blank">cairo_1.16.0.bb</a> =3D&gt; <a href=3D"http://cairo_1.17.4.bb" rel=
=
=3D"noreferrer" target=3D"_blank">cairo_1.17.4.bb</a>}=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 7 ++--<br>
=C2=A02 files changed, 3 insertions(+), 38 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2018-19876.=
patch<br>
=C2=A0rename meta/recipes-graphics/cairo/{<a href=3D"http://cairo_1.16.0.b=
b" rel=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a> =3D&gt; <a href=
=
=3D"http://cairo_1.17.4.bb" rel=3D"noreferrer" target=3D"_blank">cairo_1.1=
7.4.bb</a>} (94%)<br>
<br>
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch b/meta=
/recipes-graphics/cairo/cairo/CVE-2018-19876.patch<br>
deleted file mode 100644<br>
index 4252a5663b..0000000000<br>
--- a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-CVE: CVE-2018-19876<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" t=
arget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
-<br>
-From 90e85c2493fdfa3551f202ff10282463f1e36645 Mon Sep 17 00:00:00 2001<br=
>
-From: Carlos Garcia Campos &lt;<a href=3D"mailto:cgarcia@igalia.com" targ=
et=3D"_blank">cgarcia@igalia.com</a>&gt;<br>
-Date: Mon, 19 Nov 2018 12:33:07 +0100<br>
-Subject: [PATCH] ft: Use FT_Done_MM_Var instead of free when available in=
<br>
- cairo_ft_apply_variations<br>
-<br>
-Fixes a crash when using freetype &gt;=3D 2.9<br>
----<br>
- src/cairo-ft-font.c | 4 ++++<br>
- 1 file changed, 4 insertions(+)<br>
-<br>
-diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c<br>
-index 325dd61b4..981973f78 100644<br>
---- a/src/cairo-ft-font.c<br>
-+++ b/src/cairo-ft-font.c<br>
-@@ -2393,7 +2393,11 @@ skip:<br>
- done:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free (coords);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free (current_coords);<br>
-+#if HAVE_FT_DONE_MM_VAR<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FT_Done_MM_Var (face-&gt;glyph-&gt;library, =
ft_mm_var);<br>
-+#else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free (ft_mm_var);<br>
-+#endif<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
- <br>
--- <br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb=
" rel=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a> b/meta/recipes-g=
raphics/cairo/<a href=3D"http://cairo_1.17.4.bb" rel=3D"noreferrer" target=
=3D"_blank">cairo_1.17.4.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a><br>
rename to meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.17.4.bb" r=
el=3D"noreferrer" target=3D"_blank">cairo_1.17.4.bb</a><br>
index 68f993d7ca..e92540c49e 100644<br>
--- a/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" rel=
=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a><br>
+++ b/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.17.4.bb" rel=
=3D"noreferrer" target=3D"_blank">cairo_1.17.4.bb</a><br>
@@ -22,15 +22,14 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3De73e99=
9e0c72b5ac9012424fa157ad77&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;fontconfig glib-2.0 libpng pixman zlib&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://cairographics.org/releases/cairo-$%7B=
PV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://cairographics.org=
/releases/cairo-${PV}.tar.xz</a> \<br>
+SRC_URI =3D &quot;<a href=3D"https://cairographics.org/snapshots/cairo-$%=
7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://cairographics.=
org/snapshots/cairo-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cairo-get_bitmap_surface-=
bsc1036789-CVE-2017-7475.diff \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2018-19876.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2019-6461.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2019-6462.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;f19e0353828269c22bd72e271243a552&quot;<br>
-SRC_URI[sha256sum] =3D &quot;5e7b29b3f113ef870d1e3ecf8adf21f923396401604b=
da16d44be45e66052331&quot;<br>
+SRC_URI[md5sum] =3D &quot;bf9d0d324ecbd350d0e9308125fa4ce0&quot;<br>
+SRC_URI[sha256sum] =3D &quot;74b24c1ed436bbe87499179a3b27c43f4143b8676d8a=
d237a6fa787401959705&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig upstream-version-is-even gtk-doc multili=
b_script<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000002e0d7d05bed70e0a--
