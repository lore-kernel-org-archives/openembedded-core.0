Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id F2CD06130D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 16:08:21 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id t129so935263vkg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 08:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5HxT1+r38P3esleZ40KQ3EIEP0oRuGgt0bRxLIIEj8k=;
	b=EjDulcMp0njyh7hgJB6s+l00ehfSbcSLeVSAMpFdRbUYSGzjQv3MIPyDLQ1ONeNcnT
	X/1fSr4oeP/AI+SE8eV9jeNlocMwGoWRTpDc20UF6ZPce4q9zwArpzNii4xaocwHyfGJ
	sOhE7MSsyv1QsT3zZC3GCiJhD9rID+fpXAl4d36+saxemAiLXAe97k05pDXIZOtovEOz
	lxyLa1CqeRqD/GT+IcogOlK+mEffRx4Fw76wA1Gmr8zUrXsK9/B4zuBJTORUwuGRpOAP
	cFtkA71BP+5oo6t1TZvaRR4VwnvtRyCzELnh4SGlh/f3WdB1U+5sh6IUfVzJn04ZUzWi
	cC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5HxT1+r38P3esleZ40KQ3EIEP0oRuGgt0bRxLIIEj8k=;
	b=VSUuULqAL567vXL8V2wcK5bQKMHfvkTzgRyUOk/7p1ipOKxto96ZRmtUoELLHqtLKu
	GmRoG5RePwvR0vYZu41M4btfWkjQazqRaIT+OOBcD9vv+HKdXTeZReIUZx33QZZMzSGp
	Rw++MsnQWGuXeSJ+MIXNS9XKBZpDFwX+EPGNNTxzH5hiavpEejg0gw6zCnmul6byiMxJ
	Mb1LS8PiKcj6HVPhwEVOeFfX+8sBcJnt0qrJg2AEdocW9ZMhDuotVyGOFzZPCXf6b3zm
	NbWcuMUCmeeh/9xaw2siaw9m6c+T9Rjrpyl3ybaO+1CvOMLp8pR/0q2eqbL9xe07jl1w
	+PyQ==
X-Gm-Message-State: APjAAAV/ieW0ajgiCc3XLkh/lT0HULL1e7hzJwlDR5FqUCCiyUlgGV6v
	U3vFfUR1QIR7yrg9Ystqk74EMy5f8BIoCWpua5dHnw==
X-Google-Smtp-Source: APXvYqyY7OU0EMKQ9TVh62PQklZYcrYEPYJeqWRMDyMWBtlzj4kJO4viPJus6URwweP1YMyfqvo1f+1Nq3dgjPkTrvc=
X-Received: by 2002:ac5:cdcd:: with SMTP id u13mr4474630vkn.0.1582733302679;
	Wed, 26 Feb 2020 08:08:22 -0800 (PST)
MIME-Version: 1.0
References: <20200226135716.49255-1-zboszor@pr.hu>
In-Reply-To: <20200226135716.49255-1-zboszor@pr.hu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Feb 2020 17:08:10 +0100
Message-ID: <CANNYZj_-CwN4oikVz78dhrq272rGM+xSVRG-FKYu4Efse+J=gQ@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] libva: Split out the base parts into an include file
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
X-List-Received-Date: Wed, 26 Feb 2020 16:08:22 -0000
Content-Type: multipart/alternative; boundary="00000000000047ccca059f7cd0cc"

--00000000000047ccca059f7cd0cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Don't version the .inc please, this will break automated version updates.

Alex

On Wed, 26 Feb 2020 at 15:08, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n via Op=
enembedded-core <
openembedded-core@lists.openembedded.org> wrote:

> Signed-off-by: B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@pr.hu>
> ---
>  meta/recipes-graphics/libva/libva-2.6.1.inc | 30 ++++++++++++++++++++
>  meta/recipes-graphics/libva/libva_2.6.1.bb  | 31 ++-------------------
>  2 files changed, 32 insertions(+), 29 deletions(-)
>  create mode 100644 meta/recipes-graphics/libva/libva-2.6.1.inc
>
> diff --git a/meta/recipes-graphics/libva/libva-2.6.1.inc
> b/meta/recipes-graphics/libva/libva-2.6.1.inc
> new file mode 100644
> index 0000000000..ca1386d80b
> --- /dev/null
> +++ b/meta/recipes-graphics/libva/libva-2.6.1.inc
> @@ -0,0 +1,30 @@
> +SUMMARY =3D "Video Acceleration (VA) API for Linux"
> +DESCRIPTION =3D "Video Acceleration API (VA API) is a library (libVA) \
> +and API specification which enables and provides access to graphics \
> +hardware (GPU) acceleration for video processing on Linux and UNIX \
> +based operating systems. Accelerated processing includes video \
> +decoding, video encoding, subpicture blending and rendering. The \
> +specification was originally designed by Intel for its GMA (Graphics \
> +Media Accelerator) series of GPU hardware, the API is however not \
> +limited to GPUs or Intel specific hardware, as other hardware and \
> +manufacturers can also freely use this API for hardware accelerated \
> +video decoding."
> +
> +HOMEPAGE =3D "https://01.org/linuxmedia/vaapi"
> +BUGTRACKER =3D "https://github.com/intel/libva/issues"
> +
> +SECTION =3D "x11"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2e48940f94acb0af582e5ef035378=
00f"
> +
> +SRC_URI =3D "
> https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
> +SRC_URI[md5sum] =3D "aef13eb48e01a47d1416d97462a22a11"
> +SRC_URI[sha256sum] =3D
> "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
> +
> +UPSTREAM_CHECK_URI =3D "https://github.com/intel/libva/releases"
> +
> +DEPENDS =3D "libdrm"
> +
> +inherit meson pkgconfig features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "opengl"
> diff --git a/meta/recipes-graphics/libva/libva_2.6.1.bb
> b/meta/recipes-graphics/libva/libva_2.6.1.bb
> index 92cea83bc1..af4c1c98ab 100644
> --- a/meta/recipes-graphics/libva/libva_2.6.1.bb
> +++ b/meta/recipes-graphics/libva/libva_2.6.1.bb
> @@ -1,33 +1,6 @@
> -SUMMARY =3D "Video Acceleration (VA) API for Linux"
> -DESCRIPTION =3D "Video Acceleration API (VA API) is a library (libVA) \
> -and API specification which enables and provides access to graphics \
> -hardware (GPU) acceleration for video processing on Linux and UNIX \
> -based operating systems. Accelerated processing includes video \
> -decoding, video encoding, subpicture blending and rendering. The \
> -specification was originally designed by Intel for its GMA (Graphics \
> -Media Accelerator) series of GPU hardware, the API is however not \
> -limited to GPUs or Intel specific hardware, as other hardware and \
> -manufacturers can also freely use this API for hardware accelerated \
> -video decoding."
> +require libva-${PV}.inc
>
> -HOMEPAGE =3D "https://01.org/linuxmedia/vaapi"
> -BUGTRACKER =3D "https://github.com/intel/libva/issues"
> -
> -SECTION =3D "x11"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2e48940f94acb0af582e5ef035378=
00f"
> -
> -SRC_URI =3D "
> https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
> -SRC_URI[md5sum] =3D "aef13eb48e01a47d1416d97462a22a11"
> -SRC_URI[sha256sum] =3D
> "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
> -
> -UPSTREAM_CHECK_URI =3D "https://github.com/intel/libva/releases"
> -
> -DEPENDS =3D "libdrm virtual/mesa"
> -
> -inherit meson pkgconfig features_check
> -
> -REQUIRED_DISTRO_FEATURES =3D "opengl"
> +DEPENDS +=3D "virtual/mesa"
>
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11'=
,
> d)}"
>  PACKAGECONFIG[x11] =3D "-Dwith_x11=3Dyes, -Dwith_x11=3Dno,virtual/libx11
> libxext libxfixes"
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000047ccca059f7cd0cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Don&#39;t version the .inc please, this will break au=
tomated version updates.</div><div><br></div><div>Alex<br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 26 =
Feb 2020 at 15:08, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n via Openembedded-=
core &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org">openem=
bedded-core@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Signed-off-by: B=C3=B6sz=C3=B6rm=C3=A9nyi=
 Zolt=C3=A1n &lt;<a href=3D"mailto:zboszor@pr.hu" target=3D"_blank">zboszor=
@pr.hu</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/libva/libva-2.6.1.inc | 30 ++++++++++++++++++++=
<br>
=C2=A0meta/recipes-graphics/libva/<a href=3D"http://libva_2.6.1.bb" rel=3D"=
noreferrer" target=3D"_blank">libva_2.6.1.bb</a>=C2=A0 | 31 ++-------------=
------<br>
=C2=A02 files changed, 32 insertions(+), 29 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-graphics/libva/libva-2.6.1.inc<br>
<br>
diff --git a/meta/recipes-graphics/libva/libva-2.6.1.inc b/meta/recipes-gra=
phics/libva/libva-2.6.1.inc<br>
new file mode 100644<br>
index 0000000000..ca1386d80b<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/libva/libva-2.6.1.inc<br>
@@ -0,0 +1,30 @@<br>
+SUMMARY =3D &quot;Video Acceleration (VA) API for Linux&quot;<br>
+DESCRIPTION =3D &quot;Video Acceleration API (VA API) is a library (libVA)=
 \<br>
+and API specification which enables and provides access to graphics \<br>
+hardware (GPU) acceleration for video processing on Linux and UNIX \<br>
+based operating systems. Accelerated processing includes video \<br>
+decoding, video encoding, subpicture blending and rendering. The \<br>
+specification was originally designed by Intel for its GMA (Graphics \<br>
+Media Accelerator) series of GPU hardware, the API is however not \<br>
+limited to GPUs or Intel specific hardware, as other hardware and \<br>
+manufacturers can also freely use this API for hardware accelerated \<br>
+video decoding.&quot;<br>
+<br>
+HOMEPAGE =3D &quot;<a href=3D"https://01.org/linuxmedia/vaapi" rel=3D"nore=
ferrer" target=3D"_blank">https://01.org/linuxmedia/vaapi</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://github.com/intel/libva/issues" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/intel/libva/issues</a>=
&quot;<br>
+<br>
+SECTION =3D &quot;x11&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D2e48940f94acb0af582e5ef035=
37800f&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/intel/$%7BBPN%7D/releases/=
download/$%7BPV%7D/$%7BBP%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2</a>&q=
uot;<br>
+SRC_URI[md5sum] =3D &quot;aef13eb48e01a47d1416d97462a22a11&quot;<br>
+SRC_URI[sha256sum] =3D &quot;6c57eb642d828af2411aa38f55dc10111e8c98976dbab=
8fd62e48629401eaea5&quot;<br>
+<br>
+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/intel/libva/rel=
eases" rel=3D"noreferrer" target=3D"_blank">https://github.com/intel/libva/=
releases</a>&quot;<br>
+<br>
+DEPENDS =3D &quot;libdrm&quot;<br>
+<br>
+inherit meson pkgconfig features_check<br>
+<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
diff --git a/meta/recipes-graphics/libva/<a href=3D"http://libva_2.6.1.bb" =
rel=3D"noreferrer" target=3D"_blank">libva_2.6.1.bb</a> b/meta/recipes-grap=
hics/libva/<a href=3D"http://libva_2.6.1.bb" rel=3D"noreferrer" target=3D"_=
blank">libva_2.6.1.bb</a><br>
index 92cea83bc1..af4c1c98ab 100644<br>
--- a/meta/recipes-graphics/libva/<a href=3D"http://libva_2.6.1.bb" rel=3D"=
noreferrer" target=3D"_blank">libva_2.6.1.bb</a><br>
+++ b/meta/recipes-graphics/libva/<a href=3D"http://libva_2.6.1.bb" rel=3D"=
noreferrer" target=3D"_blank">libva_2.6.1.bb</a><br>
@@ -1,33 +1,6 @@<br>
-SUMMARY =3D &quot;Video Acceleration (VA) API for Linux&quot;<br>
-DESCRIPTION =3D &quot;Video Acceleration API (VA API) is a library (libVA)=
 \<br>
-and API specification which enables and provides access to graphics \<br>
-hardware (GPU) acceleration for video processing on Linux and UNIX \<br>
-based operating systems. Accelerated processing includes video \<br>
-decoding, video encoding, subpicture blending and rendering. The \<br>
-specification was originally designed by Intel for its GMA (Graphics \<br>
-Media Accelerator) series of GPU hardware, the API is however not \<br>
-limited to GPUs or Intel specific hardware, as other hardware and \<br>
-manufacturers can also freely use this API for hardware accelerated \<br>
-video decoding.&quot;<br>
+require libva-${PV}.inc<br>
<br>
-HOMEPAGE =3D &quot;<a href=3D"https://01.org/linuxmedia/vaapi" rel=3D"nore=
ferrer" target=3D"_blank">https://01.org/linuxmedia/vaapi</a>&quot;<br>
-BUGTRACKER =3D &quot;<a href=3D"https://github.com/intel/libva/issues" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/intel/libva/issues</a>=
&quot;<br>
-<br>
-SECTION =3D &quot;x11&quot;<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D2e48940f94acb0af582e5ef035=
37800f&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"https://github.com/intel/$%7BBPN%7D/releases/=
download/$%7BPV%7D/$%7BBP%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2</a>&q=
uot;<br>
-SRC_URI[md5sum] =3D &quot;aef13eb48e01a47d1416d97462a22a11&quot;<br>
-SRC_URI[sha256sum] =3D &quot;6c57eb642d828af2411aa38f55dc10111e8c98976dbab=
8fd62e48629401eaea5&quot;<br>
-<br>
-UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/intel/libva/rel=
eases" rel=3D"noreferrer" target=3D"_blank">https://github.com/intel/libva/=
releases</a>&quot;<br>
-<br>
-DEPENDS =3D &quot;libdrm virtual/mesa&quot;<br>
-<br>
-inherit meson pkgconfig features_check<br>
-<br>
-REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
+DEPENDS +=3D &quot;virtual/mesa&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39=
;, &#39;wayland x11&#39;, d)}&quot;<br>
=C2=A0PACKAGECONFIG[x11] =3D &quot;-Dwith_x11=3Dyes, -Dwith_x11=3Dno,virtua=
l/libx11 libxext libxfixes&quot;<br>
-- <br>
2.24.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000047ccca059f7cd0cc--
