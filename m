Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C448EC46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 16:38:51 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.21505.1704818324230948913
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 08:38:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L/6ezlVD;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2064cc6cc51so613187fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 08:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704818323; x=1705423123; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/yia8yD1atXSl6IgRENERXqEvuFJYD0o1zwRfxM/FrY=;
        b=L/6ezlVD9/U9DvW749HK6CXIbr1DaARUh+3bWhF/F/L6UCmDDTVNCOcImEGJ0gxSlv
         7X13DyXENFYV45pBd6fznYCSvL5pHDACTgAI5wGHVdBGyrrfOtr04RWveF2rC5m/8oXw
         DzB8ns6tU/82odkfrm3rwVY3IVmF5riLkgA5lF9CkPMy81uktBGglk+y9/Kf2rnaX8Dp
         4hrCyg39GEazGOOf6NijETMIg2jzvhEgV+RJZbnHeXObCrF0cTg8YRXI8PJrj99YqttB
         +GjRi+TNPCZDF4o8FnX7vvAOTEF7hx6xqqXvbm41ecYRxF1hNYLYwot5bH4b3iqE5ACg
         Mdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704818323; x=1705423123;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/yia8yD1atXSl6IgRENERXqEvuFJYD0o1zwRfxM/FrY=;
        b=F9fKaiM2r/LcYC3AbK7Xsb+0RCsvcTx15NEeRyr7tPtKQ1sleds02WRb0a/2i18xCD
         Hcu8RlIH3hVid+PSh09WmrBZuqJ7eZxWbvKkt7WfwleOTGe33+hVuDjBYn7RUVo9unqt
         UAlKTKhiLd3hK//VdF3zfVbhAQrOuFId0HcU1YROEXrTakXseRQwgpokKjMzVDnJX9iV
         B943rWSevStMKPJOsbhrv4prdE9ZbxSvfqXp2JRjYYa/xUcob1iQBbxYptYDG4mJFIsi
         BSA6BhJ/nbKnjv+pozc/5mvI6ZfpBQ/qxfqM0mzvoR3Co/PaVhEXOrrn2Euk9CRCFV8J
         KBJA==
X-Gm-Message-State: AOJu0Yw7682r6+4cidaro7qrWAgWBncpxBGzMl8P0cD+DJqzRuR9J286
	eLcCfVryxhh+sQpD714TrVzn1U7xuvhaicyZoW4=
X-Google-Smtp-Source: AGHT+IHCf+j8BYkA6hbHat6jj/C5BsOAD0FDzBJ6B+HDEm8EeTnyMAlU1aOjxIjxcSHvcLrZpi4q6I4Wx5XK1yy7Knw=
X-Received: by 2002:a05:6870:4584:b0:203:ced3:12ee with SMTP id
 y4-20020a056870458400b00203ced312eemr4735831oao.93.1704818322986; Tue, 09 Jan
 2024 08:38:42 -0800 (PST)
MIME-Version: 1.0
References: <17A8B0DD7AD4D31C.21327@lists.openembedded.org> <PLXZ6S.UNFZMOJ43CYT3@t-online.de>
In-Reply-To: <PLXZ6S.UNFZMOJ43CYT3@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jan 2024 08:38:32 -0800
Message-ID: <CAMKF1soVHRa7Ksw5jtkedFQuJzM08tEzK-810p0RtGmKe_YRMQ@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCH] webp: switch recipe to cmake buildsystem
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008c5ab7060e85f287"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 16:38:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193470

--0000000000008c5ab7060e85f287
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is upstream also switching to use cmake as primary build system ?

On Tue, Jan 9, 2024 at 5:32=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wrot=
e:

> Tested this to be working with just oe-core layers (poky and nodistro)
> with glibc and musl for x86_64, aarch64 rpi and qemuarm.
> Still this is quite invasive and one can have strong opinions about cmake=
,
> so i marked it RFC
>
> On Tue, Jan 9 2024 at 02:28:26 PM +01:00:00, Markus Volk <
> f_l_k@t-online.de> wrote:
>
> Besides the improvements that cmake offers compared to autotools, the
> advantage would be that cmake config files get created. This is useful so
> that other projects can find webp using cmake. Remove EXTRA_OECONF settin=
gs
> because all of them are set like this by default. CMakeLists.txt doesn't
> provide an option for selecting neon but from what I have tested it gets
> selected properly. Downside is that there is no way to deactivate
> gif,jpeg,tiff,png or opengl. The libraries are used whenever they are
> pulled into the sysroot. Signed-off-by: Markus Volk <f_l_k@t-online.de>
> --- meta/recipes-multimedia/webp/libwebp_1.3.2.bb | 35
> +++++-------------- 1 file changed, 9 insertions(+), 26 deletions(-) diff
> --git a/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
> b/meta/recipes-multimedia/webp/libwebp_1.3.2.bb index
> 63b0fd9a6c..c6a4b97884 100644 --- a/meta/recipes-multimedia/webp/
> libwebp_1.3.2.bb +++ b/meta/recipes-multimedia/webp/libwebp_1.3.2.bb @@
> -18,40 +18,23 @@ SRC_URI[sha256sum] =3D
> "2a499607df669e40258e53d0ade8035ba4ec0175244869d1025d460562
> UPSTREAM_CHECK_URI =3D "
> http://downloads.webmproject.org/releases/webp/index.html" -EXTRA_OECONF
> =3D " \ - --disable-wic \ - --enable-libwebpmux \ - --enable-libwebpdemux=
 \ -
> --enable-threading \ -" +EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON" -# =
Do not
> trust configure to determine if neon is available. -# -EXTRA_OECONF_ARM =
=3D "
> \ - ${@bb.utils.contains("TUNE_FEATURES","neon","--enable-neon","--disabl=
e-neon",d)}
> \ -" -EXTRA_OECONF:append:arm =3D " ${EXTRA_OECONF_ARM}"
> -EXTRA_OECONF:append:armeb =3D " ${EXTRA_OECONF_ARM}" - -inherit autotool=
s
> lib_package - -PACKAGECONFIG ??=3D "" - -# libwebpdecoder is a subset of
> libwebp, don't build it unless requested -PACKAGECONFIG[decoder] =3D
> "--enable-libwebpdecoder,--disable-libwebpdecoder" +inherit cmake
> lib_package +PACKAGECONFIG ?=3D "" # Apply for examples programs: cwebp a=
nd
> dwebp -PACKAGECONFIG[gif] =3D "--enable-gif,--disable-gif,giflib"
> -PACKAGECONFIG[jpeg] =3D "--enable-jpeg,--disable-jpeg,jpeg"
> -PACKAGECONFIG[png] =3D "--enable-png,--disable-png,,libpng"
> -PACKAGECONFIG[tiff] =3D "--enable-tiff,--disable-tiff,tiff" -
> +PACKAGECONFIG[gif] =3D ",,giflib" +PACKAGECONFIG[jpeg] =3D ",,jpeg"
> +PACKAGECONFIG[png] =3D ",,libpng" +PACKAGECONFIG[tiff] =3D ",,tiff" # Ap=
ply
> only for example program vwebp -PACKAGECONFIG[gl] =3D
> "--enable-gl,--disable-gl,mesa-glut" +PACKAGECONFIG[opengl] =3D ",,mesa-g=
lut"
> PACKAGES =3D+ "${PN}-gif2webp" DESCRIPTION:${PN}-gif2webp =3D "Simple too=
l to
> convert animated GIFs to WebP" FILES:${PN}-gif2webp =3D "${bindir}/gif2we=
bp"
> +FILES:${PN} +=3D "${datadir}" BBCLASSEXTEND +=3D "native nativesdk"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193457):
> https://lists.openembedded.org/g/openembedded-core/message/193457
> Mute This Topic: https://lists.openembedded.org/mt/103619059/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008c5ab7060e85f287
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Is upstream also switching to use cmake as primary build =
system ?</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Jan 9, 2024 at 5:32=E2=80=AFAM Markus Volk &lt;<a href=
=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div id=3D"m_-3774061781069978739geary-body" di=
r=3D"auto"><div>Tested this to be working with just oe-core layers (poky an=
d nodistro) with glibc and musl for x86_64, aarch64 rpi and qemuarm.</div><=
div>Still this is quite invasive and one can have strong opinions about cma=
ke, so i marked it RFC</div></div><div id=3D"m_-3774061781069978739geary-qu=
ote" dir=3D"auto"><br>On Tue, Jan 9 2024 at 02:28:26 PM +01:00:00, Markus V=
olk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-onli=
ne.de</a>&gt; wrote:<br><blockquote type=3D"cite"><div style=3D"white-space=
:break-spaces">Besides the improvements that cmake offers compared to autot=
ools,
the advantage would be that cmake config files get created.
This is useful so that other projects can find webp using cmake.

Remove EXTRA_OECONF settings because all of them are set like this
by default.

CMakeLists.txt doesn&#39;t provide an option for selecting neon but from
what I have tested it gets selected properly.

Downside is that there is no way to deactivate gif,jpeg,tiff,png or
opengl. The libraries are used whenever they are pulled into the sysroot.

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;
---
 meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.3.2.bb" target=3D=
"_blank">libwebp_1.3.2.bb</a> | 35 +++++--------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.3.2.b=
b" target=3D"_blank">libwebp_1.3.2.bb</a> b/meta/recipes-multimedia/webp/<a=
 href=3D"http://libwebp_1.3.2.bb" target=3D"_blank">libwebp_1.3.2.bb</a>
index 63b0fd9a6c..c6a4b97884 100644
--- a/meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.3.2.bb" targ=
et=3D"_blank">libwebp_1.3.2.bb</a>
+++ b/meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.3.2.bb" targ=
et=3D"_blank">libwebp_1.3.2.bb</a>
@@ -18,40 +18,23 @@ SRC_URI[sha256sum] =3D &quot;2a499607df669e40258e53d0ad=
e8035ba4ec0175244869d1025d460562
=20
 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://downloads.webmproject.org/r=
eleases/webp/index.html" target=3D"_blank">http://downloads.webmproject.org=
/releases/webp/index.html</a>&quot;
=20
-EXTRA_OECONF =3D &quot; \
-    --disable-wic \
-    --enable-libwebpmux \
-    --enable-libwebpdemux \
-    --enable-threading \
-&quot;
+EXTRA_OECMAKE =3D &quot;-DBUILD_SHARED_LIBS=3DON&quot;
=20
-# Do not trust configure to determine if neon is available.
-#
-EXTRA_OECONF_ARM =3D &quot; \
-    <a href=3D"mailto:$%7B@bb.utils.contains" target=3D"_blank">${@bb.util=
s.contains</a>(&quot;TUNE_FEATURES&quot;,&quot;neon&quot;,&quot;--enable-ne=
on&quot;,&quot;--disable-neon&quot;,d)} \
-&quot;
-EXTRA_OECONF:append:arm =3D &quot; ${EXTRA_OECONF_ARM}&quot;
-EXTRA_OECONF:append:armeb =3D &quot; ${EXTRA_OECONF_ARM}&quot;
-
-inherit autotools lib_package
-
-PACKAGECONFIG ??=3D &quot;&quot;
-
-# libwebpdecoder is a subset of libwebp, don&#39;t build it unless request=
ed
-PACKAGECONFIG[decoder] =3D &quot;--enable-libwebpdecoder,--disable-libwebp=
decoder&quot;
+inherit cmake lib_package
=20
+PACKAGECONFIG ?=3D &quot;&quot;
 # Apply for examples programs: cwebp and dwebp
-PACKAGECONFIG[gif] =3D &quot;--enable-gif,--disable-gif,giflib&quot;
-PACKAGECONFIG[jpeg] =3D &quot;--enable-jpeg,--disable-jpeg,jpeg&quot;
-PACKAGECONFIG[png] =3D &quot;--enable-png,--disable-png,,libpng&quot;
-PACKAGECONFIG[tiff] =3D &quot;--enable-tiff,--disable-tiff,tiff&quot;
-
+PACKAGECONFIG[gif] =3D &quot;,,giflib&quot;
+PACKAGECONFIG[jpeg] =3D &quot;,,jpeg&quot;
+PACKAGECONFIG[png] =3D &quot;,,libpng&quot;
+PACKAGECONFIG[tiff] =3D &quot;,,tiff&quot;
 # Apply only for example program vwebp
-PACKAGECONFIG[gl] =3D &quot;--enable-gl,--disable-gl,mesa-glut&quot;
+PACKAGECONFIG[opengl] =3D &quot;,,mesa-glut&quot;
=20
 PACKAGES =3D+ &quot;${PN}-gif2webp&quot;
=20
 DESCRIPTION:${PN}-gif2webp =3D &quot;Simple tool to convert animated GIFs =
to WebP&quot;
 FILES:${PN}-gif2webp =3D &quot;${bindir}/gif2webp&quot;
=20
+FILES:${PN} +=3D &quot;${datadir}&quot;
 BBCLASSEXTEND +=3D &quot;native nativesdk&quot;
<div>--=20
</div>2.43.0

</div><div style=3D"white-space:break-spaces">


</div></blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#193457): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/193457" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/193457</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103619059/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103619059/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000008c5ab7060e85f287--

