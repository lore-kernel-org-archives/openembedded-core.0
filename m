Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web08.24.1614728179645385155
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 15:36:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nlUxfGDy;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: rwmacleod@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id f4so22544558ybk.11
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 15:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xawnxh9UlAbvbX1y4En7e0LogOg5wiThl/J9xzEDdec=;
        b=nlUxfGDyujIaf2bvNwBpIZQa+T/pna0MOiCYktkbaaD3s8u8mPH4ciS3Nc+qkd2/R2
         Inyst7AZ+DUYz83ySTkLrTi3gCd8OeM4Om3d1ey0MCOK/XngBgQ5nz+02FrdQqGBKqKC
         sD+qBLuVVKxmvndowFHsi8g4LA3xlvz5k3EQ5qbpzMyH3+kkHr5/764qF0FoQzfgSZRl
         F1J9pjZpiVh8gip6nBVjs4UZNjPUYZFq5pKNi+7ssCIM7VGpPjxuZafYuvo4MV1FqxZN
         7yO89zOVGS0ummlAKf2sjkao+RFV55326fDY633bR3r0u+TvN/ft1uS2TTSh1r2p9UPv
         yodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xawnxh9UlAbvbX1y4En7e0LogOg5wiThl/J9xzEDdec=;
        b=YDDsOgaAGOY40VZOjnK7pTeJ3zTO3BIO1wQQ9hJ/E23rvukVp4C8moHrtOHjGdMQrR
         jGTrM10QBsVNn20FyMNjvvi09/Y4zTwvKVBXHm3CUDdpDlZDR9iHdZVRJdBICIJy0knB
         Vu4F1GY576lrDKZQC92oBwrvBLio3NrlrMy5nXpFZ1Jvko2nr0Ig6BbR1bqSjDy/J68V
         wuSliHb5ATEU1T5JrRF+HWwwRS0zee944zEx9Yv1cgzzmcDLqhVVF8hPC0bJD/ecq/HN
         kgop8Yfz6OB2E1IQ1nGbUA/zilxVDb1XEx5e16JP6tcsxpL0MFAwmpJFy6iH4rARLIGb
         PprQ==
X-Gm-Message-State: AOAM533iL99VikWAk7gG387rfOEekSAv8eN148KWUp8HUufXo4Gansb3
	lJqF4hE998etvqVF6YAgBy4RDmmZNos+e4wFdIQ=
X-Google-Smtp-Source: ABdhPJwrXAKtf+tSWYcx+2XdwKxLR4y/wTXbTWL/uatObMQ4+L5miFH2kieYNkzvnBeOHbW51aGNY0hMIsFqqWmCb2s=
X-Received: by 2002:a05:6902:72a:: with SMTP id l10mr35472026ybt.350.1614728178808;
 Tue, 02 Mar 2021 15:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20210302062805.9917-1-yifan.yu@windriver.com> <20210302062805.9917-2-yifan.yu@windriver.com>
In-Reply-To: <20210302062805.9917-2-yifan.yu@windriver.com>
From: "Randy MacLeod" <rwmacleod@gmail.com>
Date: Tue, 2 Mar 2021 18:36:04 -0500
Message-ID: <CAK6=ix6D7YSrT440VPMNJpkFeJTARYdiCvyK25AfkCJfPrbA=g@mail.gmail.com>
Subject: Re: [oe-core][PATCH] cairo: Update 1.16 -> 1.17.4
To: Yi Fan Yu <yifan.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000081beba05bc963389"

--00000000000081beba05bc963389
Content-Type: text/plain; charset="UTF-8"

As Alex said in another thread, we should wait for the 1.18 release. Thanks
for looking into this Yi.

Randy

On Tue., Mar. 2, 2021, 01:29 Yi Fan Yu, <yifan.yu@windriver.com> wrote:

> Drop a backported CVE patch:
> * CVE-2018-19876
>
> Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
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
> index 68f993d7ca..5155cbbf2c 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.17.4.bb
> @@ -22,15 +22,14 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
>
>  DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
>
> -SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
> +SRC_URI = "http://cairographics.org/snapshots/cairo-${PV}.tar.xz \
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
> 2.29.2
>
>
> 
>
>

--00000000000081beba05bc963389
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">As Alex said in another thread, we should wait for the 1.=
18 release. Thanks for looking into this Yi.<div dir=3D"auto"><br></div><di=
v dir=3D"auto">Randy</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue., Mar. 2, 2021, 01:29 Yi Fan Yu, &lt;<a hr=
ef=3D"mailto:yifan.yu@windriver.com">yifan.yu@windriver.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Drop a backported CVE patch:<br>
* CVE-2018-19876<br>
<br>
Signed-off-by: Yi Fan Yu &lt;<a href=3D"mailto:yifan.yu@windriver.com" tar=
get=3D"_blank" rel=3D"noreferrer">yifan.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../cairo/cairo/CVE-2018-19876.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 34 -------------------<br>
=C2=A0.../{<a href=3D"http://cairo_1.16.0.bb" rel=3D"noreferrer noreferrer=
" target=3D"_blank">cairo_1.16.0.bb</a> =3D&gt; <a href=3D"http://cairo_1.1=
7.4.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cairo_1.17.4.bb</a>=
}=C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 ++--<br>
=C2=A02 files changed, 3 insertions(+), 38 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2018-19876.=
patch<br>
=C2=A0rename meta/recipes-graphics/cairo/{<a href=3D"http://cairo_1.16.0.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">cairo_1.16.0.bb</a> =3D&=
gt; <a href=3D"http://cairo_1.17.4.bb" rel=3D"noreferrer noreferrer" target=
=
=3D"_blank">cairo_1.17.4.bb</a>} (94%)<br>
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
arget=3D"_blank" rel=3D"noreferrer">ross.burton@intel.com</a>&gt;<br>
-<br>
-From 90e85c2493fdfa3551f202ff10282463f1e36645 Mon Sep 17 00:00:00 2001<br=
>
-From: Carlos Garcia Campos &lt;<a href=3D"mailto:cgarcia@igalia.com" targ=
et=3D"_blank" rel=3D"noreferrer">cgarcia@igalia.com</a>&gt;<br>
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
" rel=3D"noreferrer noreferrer" target=3D"_blank">cairo_1.16.0.bb</a> b/met=
a/recipes-graphics/cairo/<a href=3D"http://cairo_1.17.4.bb" rel=3D"noreferr=
er noreferrer" target=3D"_blank">cairo_1.17.4.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">cairo_1.16.0.bb</a><br>
rename to meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.17.4.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">cairo_1.17.4.bb</a><br>
index 68f993d7ca..5155cbbf2c 100644<br>
--- a/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">cairo_1.16.0.bb</a><br>
+++ b/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.17.4.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">cairo_1.17.4.bb</a><br>
@@ -22,15 +22,14 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3De73e99=
9e0c72b5ac9012424fa157ad77&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;fontconfig glib-2.0 libpng pixman zlib&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://cairographics.org/releases/cairo-$%7B=
PV%7D.tar.xz" rel=3D"noreferrer noreferrer" target=3D"_blank">http://cairog=
raphics.org/releases/cairo-${PV}.tar.xz</a> \<br>
+SRC_URI =3D &quot;<a href=3D"http://cairographics.org/snapshots/cairo-$%7=
BPV%7D.tar.xz" rel=3D"noreferrer noreferrer" target=3D"_blank">http://cairo=
graphics.org/snapshots/cairo-${PV}.tar.xz</a> \<br>
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
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000081beba05bc963389--
