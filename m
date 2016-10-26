Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 37C96605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 09:10:27 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id c126so1810739vkd.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 02:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BMgmev+tqlp1q7vsfxya9RUZrzOA6S/6eVnyDy7fkb0=;
	b=ShKENZ64XAUnzsicVZx7c4rSEPGz1wymuEn5U3/IcFmp6NObti5o5UCETF1JvxHbOy
	IuS0foDEvZlh6upCunRa5WEUSpuOP8wmTyjeuere2q9wJJ5gTJosS4mi17QC9MQXBkik
	bTUxihKsWOjpcMSZzIDkw8UbbgTFdelNp2VOZ1Y76mA+qRL/T+MeKMiaR0jXRMOy7Tzb
	B8gPDSltwz8cF1mpp9Mu9XZxC9b3JZVqmj/yjqdVR6kLCnNLWLFUvngUWwHaZbUgMcoW
	ISCiZ1kV3HjCrQF8yLI9FNmu1647k6UTEjw7p/TagQNYwjfE4g71Y2BkmV4Fkd81iier
	yWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BMgmev+tqlp1q7vsfxya9RUZrzOA6S/6eVnyDy7fkb0=;
	b=EyC/znydPL5vBncxzMfuOlCl/qBx8juNKv/4PnB6t8jxZ1A5mGE6VFDH4Nqkk2su8y
	sLM0jGgeHCO3oNVGH2i7hed/SXagKFiuQtRbOMgGodb2iCRsngW3XC8+WSgjmHEG35QH
	NA16AmlFD5/wAok80QP1LjPOaxq6ooY/6p+AGaDdQAYfQcX+LTFbI+0nVPsSBL/alY0s
	rz+jcwifjhACZ4xDbcWYzGUWqhfNAeynIgzEdSh1amV8PtZe8hn9ntMu6HpBfuppPS7Y
	nta28ZFUjhVUZgbgHV4emv6q0TNtIyQjKSFsSbhVMz6YYAQdFSW+hPNqiMXdTevwW5qz
	9UKQ==
X-Gm-Message-State: ABUngvdXNhlPFnDNTBT65gK5zLs8zUILF2Mfr6mtAVxaGiF/4BcovhYnloLJlz7WLnIAMUPZWeHDKpMQGDFNWZSF
X-Received: by 10.31.133.130 with SMTP id h124mr296124vkd.24.1477473028363;
	Wed, 26 Oct 2016 02:10:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.74.195 with HTTP; Wed, 26 Oct 2016 02:09:57 -0700 (PDT)
In-Reply-To: <d6ab73986d4bdbf772bfeda912ba8098200c52cc.1477470209.git.yi.zhao@windriver.com>
References: <cover.1477470209.git.yi.zhao@windriver.com>
	<d6ab73986d4bdbf772bfeda912ba8098200c52cc.1477470209.git.yi.zhao@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 26 Oct 2016 12:09:57 +0300
Message-ID: <CAHiDW_FezY8Ee_VObh-n+kf_GCoOWWbwPGpVM6s_7htfv9UhmQ@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] tiff: Security fix CVE-2016-3945
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
X-List-Received-Date: Wed, 26 Oct 2016 09:10:28 -0000
Content-Type: multipart/alternative; boundary=001a11440e100569a0053fc0ff63

--001a11440e100569a0053fc0ff63
Content-Type: text/plain; charset=UTF-8

On 26 October 2016 at 11:26, Yi Zhao <yi.zhao@windriver.com> wrote:

> CVE-2016-3945 libtiff: Multiple integer overflows in the (1)
> cvt_by_strip and (2) cvt_by_tile functions in the tiff2rgba tool in
> LibTIFF 4.0.6 and earlier, when -b mode is enabled, allow remote
> attackers to cause a denial of service (crash) or execute arbitrary code
> via a crafted TIFF image, which triggers an out-of-bounds write.
>
> External References:
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3945
> http://bugzilla.maptools.org/show_bug.cgi?id=2545
>
> Patch from:
> https://github.com/vadz/libtiff/commit/7c39352ccd9060d311d3dc9a1f1bc0
> 0133a160e6
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../libtiff/files/CVE-2016-3945.patch              | 118
> +++++++++++++++++++++
>  meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   1 +
>  2 files changed, 119 insertions(+)
>  create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3945.
> patch
>
> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
> b/meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
> new file mode 100644
> index 0000000..4d965be
> --- /dev/null
> +++ b/meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
> @@ -0,0 +1,118 @@
> +From 7c39352ccd9060d311d3dc9a1f1bc00133a160e6 Mon Sep 17 00:00:00 2001
> +From: erouault <erouault>
> +Date: Mon, 15 Aug 2016 20:06:40 +0000
> +Subject: [PATCH] * tools/tiff2rgba.c: Fix integer overflow in size of
> + allocated buffer, when -b mode is enabled, that could result in
> out-of-bounds
> + write. Based initially on patch tiff-CVE-2016-3945.patch from
> + libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with correction for
> invalid
> + tests that rejected valid files.
> +
> +CVE: CVE-2016-3945
> +Upstream-Status: Backport
> +https://github.com/vadz/libtiff/commit/7c39352ccd9060d311d3dc9a1f1bc0
> 0133a160e6
>

It would be appropriate to point out that this is not the real upstream,
just a nameless github user who maintains a git mirror of the libtiff
repository. It's probably a reasonable choice -- the current libtiff
situation with no real homepage, no real tarball hosting and a half-hidden
cvs server for source control is pretty sad -- but should still be openly
mentioned.

Jussi


> +
> +Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
> +---
> + ChangeLog         |  8 ++++++++
> + tools/tiff2rgba.c | 34 ++++++++++++++++++++++++++++++----
> + 2 files changed, 38 insertions(+), 4 deletions(-)
> +
> +diff --git a/ChangeLog b/ChangeLog
> +index 62dc1b5..9c0ab29 100644
> +--- a/ChangeLog
> ++++ b/ChangeLog
> +@@ -1,3 +1,11 @@
> ++2016-08-15 Even Rouault <even.rouault at spatialys.com>
> ++
> ++      * tools/tiff2rgba.c: Fix integer overflow in size of allocated
> ++      buffer, when -b mode is enabled, that could result in out-of-bounds
> ++      write. Based initially on patch tiff-CVE-2016-3945.patch from
> ++      libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with correction for
> ++      invalid tests that rejected valid files.
> ++
> + 2016-07-11 Even Rouault <even.rouault at spatialys.com>
> +
> +       * tools/tiffcrop.c: Avoid access outside of stack allocated array
> +diff --git a/tools/tiff2rgba.c b/tools/tiff2rgba.c
> +index b7a81eb..16e3dc4 100644
> +--- a/tools/tiff2rgba.c
> ++++ b/tools/tiff2rgba.c
> +@@ -147,6 +147,7 @@ cvt_by_tile( TIFF *in, TIFF *out )
> +     uint32  row, col;
> +     uint32  *wrk_line;
> +     int           ok = 1;
> ++    uint32  rastersize, wrk_linesize;
> +
> +     TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &width);
> +     TIFFGetField(in, TIFFTAG_IMAGELENGTH, &height);
> +@@ -163,7 +164,13 @@ cvt_by_tile( TIFF *in, TIFF *out )
> +     /*
> +      * Allocate tile buffer
> +      */
> +-    raster = (uint32*)_TIFFmalloc(tile_width * tile_height * sizeof
> (uint32));
> ++    rastersize = tile_width * tile_height * sizeof (uint32);
> ++    if (tile_width != (rastersize / tile_height) / sizeof( uint32))
> ++    {
> ++      TIFFError(TIFFFileName(in), "Integer overflow when calculating
> raster buffer");
> ++      exit(-1);
> ++    }
> ++    raster = (uint32*)_TIFFmalloc(rastersize);
> +     if (raster == 0) {
> +         TIFFError(TIFFFileName(in), "No space for raster buffer");
> +         return (0);
> +@@ -173,7 +180,13 @@ cvt_by_tile( TIFF *in, TIFF *out )
> +      * Allocate a scanline buffer for swapping during the vertical
> +      * mirroring pass.
> +      */
> +-    wrk_line = (uint32*)_TIFFmalloc(tile_width * sizeof (uint32));
> ++    wrk_linesize = tile_width * sizeof (uint32);
> ++    if (tile_width != wrk_linesize / sizeof (uint32))
> ++    {
> ++        TIFFError(TIFFFileName(in), "Integer overflow when calculating
> wrk_line buffer");
> ++      exit(-1);
> ++    }
> ++    wrk_line = (uint32*)_TIFFmalloc(wrk_linesize);
> +     if (!wrk_line) {
> +         TIFFError(TIFFFileName(in), "No space for raster scanline
> buffer");
> +         ok = 0;
> +@@ -249,6 +262,7 @@ cvt_by_strip( TIFF *in, TIFF *out )
> +     uint32  row;
> +     uint32  *wrk_line;
> +     int           ok = 1;
> ++    uint32  rastersize, wrk_linesize;
> +
> +     TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &width);
> +     TIFFGetField(in, TIFFTAG_IMAGELENGTH, &height);
> +@@ -263,7 +277,13 @@ cvt_by_strip( TIFF *in, TIFF *out )
> +     /*
> +      * Allocate strip buffer
> +      */
> +-    raster = (uint32*)_TIFFmalloc(width * rowsperstrip * sizeof
> (uint32));
> ++    rastersize = width * rowsperstrip * sizeof (uint32);
> ++    if (width != (rastersize / rowsperstrip) / sizeof( uint32))
> ++    {
> ++      TIFFError(TIFFFileName(in), "Integer overflow when calculating
> raster buffer");
> ++      exit(-1);
> ++    }
> ++    raster = (uint32*)_TIFFmalloc(rastersize);
> +     if (raster == 0) {
> +         TIFFError(TIFFFileName(in), "No space for raster buffer");
> +         return (0);
> +@@ -273,7 +293,13 @@ cvt_by_strip( TIFF *in, TIFF *out )
> +      * Allocate a scanline buffer for swapping during the vertical
> +      * mirroring pass.
> +      */
> +-    wrk_line = (uint32*)_TIFFmalloc(width * sizeof (uint32));
> ++    wrk_linesize = width * sizeof (uint32);
> ++    if (width != wrk_linesize / sizeof (uint32))
> ++    {
> ++        TIFFError(TIFFFileName(in), "Integer overflow when calculating
> wrk_line buffer");
> ++      exit(-1);
> ++    }
> ++    wrk_line = (uint32*)_TIFFmalloc(wrk_linesize);
> +     if (!wrk_line) {
> +         TIFFError(TIFFFileName(in), "No space for raster scanline
> buffer");
> +         ok = 0;
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
> b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
> index 8147bc4..b978528 100644
> --- a/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.0.6.bb
> @@ -10,6 +10,7 @@ SRC_URI = "http://download.osgeo.org/
> libtiff/tiff-${PV}.tar.gz \
>             file://CVE-2016-3186.patch \
>             file://CVE-2016-5321.patch \
>             file://CVE-2016-5323.patch \
> +           file://CVE-2016-3945.patch \
>            "
>
>  SRC_URI[md5sum] = "d1d2e940dea0b5ad435f21f03d96dd72"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11440e100569a0053fc0ff63
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
6 October 2016 at 11:26, Yi Zhao <span dir=3D"ltr">&lt;<a href=3D"mailto:yi=
.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">CVE-2016-3945 libtiff: Multiple i=
nteger overflows in the (1)<br>
cvt_by_strip and (2) cvt_by_tile functions in the tiff2rgba tool in<br>
LibTIFF 4.0.6 and earlier, when -b mode is enabled, allow remote<br>
attackers to cause a denial of service (crash) or execute arbitrary code<br=
>
via a crafted TIFF image, which triggers an out-of-bounds write.<br>
<br>
External References:<br>
<a href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2016-3945=
" rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/<wbr>v=
uln/detail?vulnId=3DCVE-2016-<wbr>3945</a><br>
<a href=3D"http://bugzilla.maptools.org/show_bug.cgi?id=3D2545" rel=3D"nore=
ferrer" target=3D"_blank">http://bugzilla.maptools.org/<wbr>show_bug.cgi?id=
=3D2545</a><br>
<br>
Patch from:<br>
<a href=3D"https://github.com/vadz/libtiff/commit/7c39352ccd9060d311d3dc9a1=
f1bc00133a160e6" rel=3D"noreferrer" target=3D"_blank">https://github.com/va=
dz/<wbr>libtiff/commit/<wbr>7c39352ccd9060d311d3dc9a1f1bc0<wbr>0133a160e6</=
a><br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com">yi.zhao=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../libtiff/files/CVE-2016-<wbr>3945.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 118 +++++++++++++++++++++<br>
=C2=A0meta/recipes-multimedia/<wbr>libtiff/<a href=3D"http://tiff_4.0.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">tiff_4.0.6.bb</a>=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 119 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/<wbr>libtiff/files/CVE-201=
6-3945.<wbr>patch<br>
<br>
diff --git a/meta/recipes-multimedia/<wbr>libtiff/files/CVE-2016-3945.<wbr>=
patch b/meta/recipes-multimedia/<wbr>libtiff/files/CVE-2016-3945.<wbr>patch=
<br>
new file mode 100644<br>
index 0000000..4d965be<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/<wbr>libtiff/files/CVE-2016-3945.<wbr>patch<b=
r>
@@ -0,0 +1,118 @@<br>
+From 7c39352ccd9060d311d3dc9a1f1bc0<wbr>0133a160e6 Mon Sep 17 00:00:00 200=
1<br>
+From: erouault &lt;erouault&gt;<br>
+Date: Mon, 15 Aug 2016 20:06:40 +0000<br>
+Subject: [PATCH] * tools/tiff2rgba.c: Fix integer overflow in size of<br>
+ allocated buffer, when -b mode is enabled, that could result in out-of-bo=
unds<br>
+ write. Based initially on patch tiff-CVE-2016-3945.patch from<br>
+ libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with correction for inval=
id<br>
+ tests that rejected valid files.<br>
+<br>
+CVE: CVE-2016-3945<br>
+Upstream-Status: Backport<br>
+<a href=3D"https://github.com/vadz/libtiff/commit/7c39352ccd9060d311d3dc9a=
1f1bc00133a160e6" rel=3D"noreferrer" target=3D"_blank">https://github.com/v=
adz/<wbr>libtiff/commit/<wbr>7c39352ccd9060d311d3dc9a1f1bc0<wbr>0133a160e6<=
/a><br>
</blockquote><div><br></div><div>It would be appropriate to point out that =
this is not the real upstream, just a nameless github user who maintains a =
git mirror of the libtiff repository. It&#39;s probably a reasonable choice=
 -- the current libtiff situation with no real homepage, no real tarball ho=
sting and a half-hidden cvs server for source control is pretty sad -- but =
should still be openly mentioned.</div><div><br></div><div>Jussi</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">+<br>
+Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windirver.com">yi.zha=
o@windirver.com</a>&gt;<br>
+---<br>
+ ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++++++<br>
+ tools/tiff2rgba.c | 34 ++++++++++++++++++++++++++++++<wbr>----<br>
+ 2 files changed, 38 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/ChangeLog b/ChangeLog<br>
+index 62dc1b5..9c0ab29 100644<br>
+--- a/ChangeLog<br>
++++ b/ChangeLog<br>
+@@ -1,3 +1,11 @@<br>
++2016-08-15 Even Rouault &lt;even.rouault at <a href=3D"http://spatialys.c=
om" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 * tools/tiff2rgba.c: Fix integer overflow in size of=
 allocated<br>
++=C2=A0 =C2=A0 =C2=A0 buffer, when -b mode is enabled, that could result i=
n out-of-bounds<br>
++=C2=A0 =C2=A0 =C2=A0 write. Based initially on patch tiff-CVE-2016-3945.p=
atch from<br>
++=C2=A0 =C2=A0 =C2=A0 libtiff-4.0.3-25.el7_2.src.rpm by Nikola Forro, with=
 correction for<br>
++=C2=A0 =C2=A0 =C2=A0 invalid tests that rejected valid files.<br>
++<br>
+ 2016-07-11 Even Rouault &lt;even.rouault at <a href=3D"http://spatialys.c=
om" rel=3D"noreferrer" target=3D"_blank">spatialys.com</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* tools/tiffcrop.c: Avoid access outside of sta=
ck allocated array<br>
+diff --git a/tools/tiff2rgba.c b/tools/tiff2rgba.c<br>
+index b7a81eb..16e3dc4 100644<br>
+--- a/tools/tiff2rgba.c<br>
++++ b/tools/tiff2rgba.c<br>
+@@ -147,6 +147,7 @@ cvt_by_tile( TIFF *in, TIFF *out )<br>
+=C2=A0 =C2=A0 =C2=A0uint32=C2=A0 row, col;<br>
+=C2=A0 =C2=A0 =C2=A0uint32=C2=A0 *wrk_line;<br>
+=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok =3D 1;<=
br>
++=C2=A0 =C2=A0 uint32=C2=A0 rastersize, wrk_linesize;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &amp;width);<br>
+=C2=A0 =C2=A0 =C2=A0TIFFGetField(in, TIFFTAG_IMAGELENGTH, &amp;height);<br=
>
+@@ -163,7 +164,13 @@ cvt_by_tile( TIFF *in, TIFF *out )<br>
+=C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 * Allocate tile buffer<br>
+=C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 raster =3D (uint32*)_TIFFmalloc(tile_<wbr>width * tile_heig=
ht * sizeof (uint32));<br>
++=C2=A0 =C2=A0 rastersize =3D tile_width * tile_height * sizeof (uint32);<=
br>
++=C2=A0 =C2=A0 if (tile_width !=3D (rastersize / tile_height) / sizeof( ui=
nt32))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 TIFFError(TIFFFileName(in), &quot;Integer overflow w=
hen calculating raster buffer&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 raster =3D (uint32*)_TIFFmalloc(<wbr>rastersize);<br>
+=C2=A0 =C2=A0 =C2=A0if (raster =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TIFFError(TIFFFileName(in), &quot;No spa=
ce for raster buffer&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (0);<br>
+@@ -173,7 +180,13 @@ cvt_by_tile( TIFF *in, TIFF *out )<br>
+=C2=A0 =C2=A0 =C2=A0 * Allocate a scanline buffer for swapping during the =
vertical<br>
+=C2=A0 =C2=A0 =C2=A0 * mirroring pass.<br>
+=C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 wrk_line =3D (uint32*)_TIFFmalloc(tile_<wbr>width * sizeof =
(uint32));<br>
++=C2=A0 =C2=A0 wrk_linesize =3D tile_width * sizeof (uint32);<br>
++=C2=A0 =C2=A0 if (tile_width !=3D wrk_linesize / sizeof (uint32))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 TIFFError(TIFFFileName(in), &quot;Integer ove=
rflow when calculating wrk_line buffer&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 wrk_line =3D (uint32*)_TIFFmalloc(wrk_<wbr>linesize);<br>
+=C2=A0 =C2=A0 =C2=A0if (!wrk_line) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TIFFError(TIFFFileName(in), &quot;No spa=
ce for raster scanline buffer&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok =3D 0;<br>
+@@ -249,6 +262,7 @@ cvt_by_strip( TIFF *in, TIFF *out )<br>
+=C2=A0 =C2=A0 =C2=A0uint32=C2=A0 row;<br>
+=C2=A0 =C2=A0 =C2=A0uint32=C2=A0 *wrk_line;<br>
+=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok =3D 1;<=
br>
++=C2=A0 =C2=A0 uint32=C2=A0 rastersize, wrk_linesize;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &amp;width);<br>
+=C2=A0 =C2=A0 =C2=A0TIFFGetField(in, TIFFTAG_IMAGELENGTH, &amp;height);<br=
>
+@@ -263,7 +277,13 @@ cvt_by_strip( TIFF *in, TIFF *out )<br>
+=C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 * Allocate strip buffer<br>
+=C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 raster =3D (uint32*)_TIFFmalloc(width * rowsperstrip * size=
of (uint32));<br>
++=C2=A0 =C2=A0 rastersize =3D width * rowsperstrip * sizeof (uint32);<br>
++=C2=A0 =C2=A0 if (width !=3D (rastersize / rowsperstrip) / sizeof( uint32=
))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 TIFFError(TIFFFileName(in), &quot;Integer overflow w=
hen calculating raster buffer&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 raster =3D (uint32*)_TIFFmalloc(<wbr>rastersize);<br>
+=C2=A0 =C2=A0 =C2=A0if (raster =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TIFFError(TIFFFileName(in), &quot;No spa=
ce for raster buffer&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (0);<br>
+@@ -273,7 +293,13 @@ cvt_by_strip( TIFF *in, TIFF *out )<br>
+=C2=A0 =C2=A0 =C2=A0 * Allocate a scanline buffer for swapping during the =
vertical<br>
+=C2=A0 =C2=A0 =C2=A0 * mirroring pass.<br>
+=C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 wrk_line =3D (uint32*)_TIFFmalloc(width * sizeof (uint32));=
<br>
++=C2=A0 =C2=A0 wrk_linesize =3D width * sizeof (uint32);<br>
++=C2=A0 =C2=A0 if (width !=3D wrk_linesize / sizeof (uint32))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 TIFFError(TIFFFileName(in), &quot;Integer ove=
rflow when calculating wrk_line buffer&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 wrk_line =3D (uint32*)_TIFFmalloc(wrk_<wbr>linesize);<br>
+=C2=A0 =C2=A0 =C2=A0if (!wrk_line) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TIFFError(TIFFFileName(in), &quot;No spa=
ce for raster scanline buffer&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok =3D 0;<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-multimedia/<wbr>libtiff/<a href=3D"http://tiff_4.=
0.6.bb" rel=3D"noreferrer" target=3D"_blank">tiff_4.0.6.bb</a> b/meta/recip=
es-multimedia/<wbr>libtiff/<a href=3D"http://tiff_4.0.6.bb" rel=3D"noreferr=
er" target=3D"_blank">tiff_4.0.6.bb</a><br>
index 8147bc4..b978528 100644<br>
--- a/meta/recipes-multimedia/<wbr>libtiff/<a href=3D"http://tiff_4.0.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">tiff_4.0.6.bb</a><br>
+++ b/meta/recipes-multimedia/<wbr>libtiff/<a href=3D"http://tiff_4.0.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">tiff_4.0.6.bb</a><br>
@@ -10,6 +10,7 @@ SRC_URI =3D &quot;<a href=3D"http://download.osgeo.org/li=
btiff/tiff-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://downlo=
ad.osgeo.org/<wbr>libtiff/tiff-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2016-3186.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2016-5321.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2016-5323.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2016-3945.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>d1d2e940dea0b5ad435f21f03d96dd<wbr>72&=
quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a11440e100569a0053fc0ff63--
