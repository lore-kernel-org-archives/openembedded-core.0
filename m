Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 331416FFEC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 00:05:24 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id 186so173210415iow.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 16:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bo8l7IBcIMqbRVC0Cz9y4GmHY6mtHa3YynSdB0h8Xi8=;
	b=nnMei2D5EZJs4xm1GmdwZ6b4mnXpDo95u8us4rJw0QLgPuU+bVWJ7cxalZZzvsZtrR
	ZIc18u4j9aXlldwEHL4w2mbrEtOy/YOs9dpxSY5dmB31RoM9+Dhx12/aFdOoxVuuSLCM
	hgPNXgnrAYOSEGod2+UGD776RM65mHEBxIYfXRRVHdfpS+uArSaJ5nDnSKh+0LgrDGG1
	6avACff7Kadsg3Au1e2vqEK1+jEjwWGqY0vx215H4IR91+8dh1Fi84zgnJbSutSPBJxx
	3m/YZBm9gb4mARiN2Cgkl8Z6+eOlzfqWSkirBq0kXxk7hIYGgtCYlVaBmxFEFrtydS7F
	SrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bo8l7IBcIMqbRVC0Cz9y4GmHY6mtHa3YynSdB0h8Xi8=;
	b=hBbw/1fB8hQjiFStpcm1+9NKvJ3AYelAuHYPdbUP24IgPlqg++8svdcbHwQALcbVVX
	rl3qxZBRtw26Wj4l78pttyPOYAuXMGxmwJVjBKlaxTReP9IbPp17sZPVZ6dQlNxAL4wS
	vMS8uS0bdbUDeSyleOWRl9C4N9E9DWguy29wQODnudkMyyQwnz3hJXJH0ank/7X2Lyv6
	BNvA/JsS6l4vLlzl6/e/Q5G4qLDO5J25CQh2Jg6svAemJ3aUVE/VcrgYjTAV0jyNK1om
	2VwrULRPQdI86X4mEeM7+tZi7yZagfqLaBJvCHrEsqD2W16xoWbdYKmricUSTeM/gwdl
	a5xw==
X-Gm-Message-State: ALoCoQla67zTCQhEWiRSACkj0AHW2yAyXOCXGluzvC6Hde+Wzuw20QtmFumuOXxKydY/87U4hNTor0sVKDRD8C85OLj0xW1RVbwEcHNGLOGPRNIXecGxxgg=
X-Received: by 10.107.155.209 with SMTP id d200mr24663913ioe.133.1450742725611;
	Mon, 21 Dec 2015 16:05:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 21 Dec 2015 16:05:06 -0800 (PST)
In-Reply-To: <1450717098-13653-1-git-send-email-sgw@linux.intel.com>
References: <1450717098-13653-1-git-send-email-sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Dec 2015 00:05:06 +0000
Message-ID: <CAJTo0La_xtJhbBdFHEJp78KPTS62DjyQMq+_qiyO-ZFvfOv_qg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: Upgrade to 2.4.65
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
X-List-Received-Date: Tue, 22 Dec 2015 00:05:34 -0000
Content-Type: multipart/alternative; boundary=001a11403402d229fc0527715c1a

--001a11403402d229fc0527715c1a
Content-Type: text/plain; charset=UTF-8

Buildhistory-diff says:

packages/corei7-64-poky-linux/libdrm/libdrm: PKG changed from libdrm2 to
libdrm [default] - may indicate debian renaming failure

There's a new library (libdrm_amdgpu.so) which needs to be split out.  To
be honest the splitting should be automated instead of done manually to
stop this happening in the future.

Ross

On 21 December 2015 at 16:58, Saul Wold <sgw@linux.intel.com> wrote:

> Rebased patch to reflect changes in Makefile
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../recipes-graphics/drm/libdrm/installtests.patch | 24
> ++++++++++++----------
>  .../drm/{libdrm_2.4.62.bb => libdrm_2.4.65.bb}     |  5 +++--
>  2 files changed, 16 insertions(+), 13 deletions(-)
>  rename meta/recipes-graphics/drm/{libdrm_2.4.62.bb => libdrm_2.4.65.bb}
> (92%)
>
> diff --git a/meta/recipes-graphics/drm/libdrm/installtests.patch
> b/meta/recipes-graphics/drm/libdrm/installtests.patch
> index 1175dae..f460ef5 100644
> --- a/meta/recipes-graphics/drm/libdrm/installtests.patch
> +++ b/meta/recipes-graphics/drm/libdrm/installtests.patch
> @@ -4,20 +4,22 @@ Upstream-Status: Inappropriate [configuration]
>
>  Signed-off-by: Yu Ke <ke.yu@intel.com>
>
> -diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index bf1987f..d909e19 100644
> ---- a/tests/Makefile.am
> -+++ b/tests/Makefile.am
> -@@ -27,10 +27,11 @@ AM_CPPFLAGS = \
> +Index: libdrm-2.4.65/tests/Makefile.am
> +===================================================================
> +--- libdrm-2.4.65.orig/tests/Makefile.am
> ++++ libdrm-2.4.65/tests/Makefile.am
> +@@ -29,9 +29,11 @@ AM_CFLAGS = \
>
>   LDADD = $(top_builddir)/libdrm.la
>
>  -check_PROGRAMS = \
> +-      dristat \
> +-      drmstat
>  +bin_PROGRAMS = \
> -       dristat \
> -       drmstat
> -
> ++        dristat \
> ++        drmstat
> ++
>  +check_PROGRAMS =
> - if HAVE_NOUVEAU
> - SUBDIRS += nouveau
> - endif
> +
> + dristat_LDADD = -lm
> +
> diff --git a/meta/recipes-graphics/drm/libdrm_2.4.62.bb
> b/meta/recipes-graphics/drm/libdrm_2.4.65.bb
> similarity index 92%
> rename from meta/recipes-graphics/drm/libdrm_2.4.62.bb
> rename to meta/recipes-graphics/drm/libdrm_2.4.65.bb
> index ea6305e..8390fb0 100644
> --- a/meta/recipes-graphics/drm/libdrm_2.4.62.bb
> +++ b/meta/recipes-graphics/drm/libdrm_2.4.65.bb
> @@ -12,8 +12,9 @@ DEPENDS = "libpthread-stubs udev libpciaccess"
>
>  SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
>             file://installtests.patch "
> -SRC_URI[md5sum] = "c9291bae0e5ca65d1483821d3698d3ab"
> -SRC_URI[sha256sum] =
> "906c294bdbe1c94c3ca084305d61a6e5a8367f3b4986e6cc13b1e9b3f75931dc"
> +
> +SRC_URI[md5sum] = "de49916e5f8aef4eba55223c79709b05"
> +SRC_URI[sha256sum] =
> "71960ac8bde7d710992b1bc8879935e8300a870c36bd06f22412d0447e3d96c4"
>
>  inherit autotools pkgconfig
>
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11403402d229fc0527715c1a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Buildhistory-diff says:<div><br></div><div>packages/corei7=
-64-poky-linux/libdrm/libdrm: PKG changed from libdrm2 to libdrm [default] =
- may indicate debian renaming failure<br><div><br></div><div>There&#39;s a=
 new library (libdrm_amdgpu.so) which needs to be split out.=C2=A0 To be ho=
nest the splitting should be automated instead of done manually to stop thi=
s happening in the future.</div><div><br></div><div>Ross</div></div></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 21 December 201=
5 at 16:58, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.int=
el.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Rebased patch to reflect changes in Makefile<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-graphics/drm/libdrm/installtests.patch | 24 ++++++++++++-=
---------<br>
=C2=A0.../drm/{<a href=3D"http://libdrm_2.4.62.bb" rel=3D"noreferrer" targe=
t=3D"_blank">libdrm_2.4.62.bb</a> =3D&gt; <a href=3D"http://libdrm_2.4.65.b=
b" rel=3D"noreferrer" target=3D"_blank">libdrm_2.4.65.bb</a>}=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 5 +++--<br>
=C2=A02 files changed, 16 insertions(+), 13 deletions(-)<br>
=C2=A0rename meta/recipes-graphics/drm/{<a href=3D"http://libdrm_2.4.62.bb"=
 rel=3D"noreferrer" target=3D"_blank">libdrm_2.4.62.bb</a> =3D&gt; <a href=
=3D"http://libdrm_2.4.65.bb" rel=3D"noreferrer" target=3D"_blank">libdrm_2.=
4.65.bb</a>} (92%)<br>
<br>
diff --git a/meta/recipes-graphics/drm/libdrm/installtests.patch b/meta/rec=
ipes-graphics/drm/libdrm/installtests.patch<br>
index 1175dae..f460ef5 100644<br>
--- a/meta/recipes-graphics/drm/libdrm/installtests.patch<br>
+++ b/meta/recipes-graphics/drm/libdrm/installtests.patch<br>
@@ -4,20 +4,22 @@ Upstream-Status: Inappropriate [configuration]<br>
<br>
=C2=A0Signed-off-by: Yu Ke &lt;<a href=3D"mailto:ke.yu@intel.com">ke.yu@int=
el.com</a>&gt;<br>
<br>
-diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
-index bf1987f..d909e19 100644<br>
---- a/tests/Makefile.am<br>
-+++ b/tests/Makefile.am<br>
-@@ -27,10 +27,11 @@ AM_CPPFLAGS =3D \<br>
+Index: libdrm-2.4.65/tests/Makefile.am<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- libdrm-2.4.65.orig/tests/Makefile.am<br>
++++ libdrm-2.4.65/tests/Makefile.am<br>
+@@ -29,9 +29,11 @@ AM_CFLAGS =3D \<br>
<br>
=C2=A0 LDADD =3D $(top_builddir)/<a href=3D"http://libdrm.la" rel=3D"norefe=
rrer" target=3D"_blank">libdrm.la</a><br>
<br>
=C2=A0-check_PROGRAMS =3D \<br>
+-=C2=A0 =C2=A0 =C2=A0 dristat \<br>
+-=C2=A0 =C2=A0 =C2=A0 drmstat<br>
=C2=A0+bin_PROGRAMS =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dristat \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0drmstat<br>
-<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 dristat \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 drmstat<br>
++<br>
=C2=A0+check_PROGRAMS =3D<br>
- if HAVE_NOUVEAU<br>
- SUBDIRS +=3D nouveau<br>
- endif<br>
+<br>
+ dristat_LDADD =3D -lm<br>
+<br>
diff --git a/meta/recipes-graphics/drm/<a href=3D"http://libdrm_2.4.62.bb" =
rel=3D"noreferrer" target=3D"_blank">libdrm_2.4.62.bb</a> b/meta/recipes-gr=
aphics/drm/<a href=3D"http://libdrm_2.4.65.bb" rel=3D"noreferrer" target=3D=
"_blank">libdrm_2.4.65.bb</a><br>
similarity index 92%<br>
rename from meta/recipes-graphics/drm/<a href=3D"http://libdrm_2.4.62.bb" r=
el=3D"noreferrer" target=3D"_blank">libdrm_2.4.62.bb</a><br>
rename to meta/recipes-graphics/drm/<a href=3D"http://libdrm_2.4.65.bb" rel=
=3D"noreferrer" target=3D"_blank">libdrm_2.4.65.bb</a><br>
index ea6305e..8390fb0 100644<br>
--- a/meta/recipes-graphics/drm/<a href=3D"http://libdrm_2.4.62.bb" rel=3D"=
noreferrer" target=3D"_blank">libdrm_2.4.62.bb</a><br>
+++ b/meta/recipes-graphics/drm/<a href=3D"http://libdrm_2.4.65.bb" rel=3D"=
noreferrer" target=3D"_blank">libdrm_2.4.65.bb</a><br>
@@ -12,8 +12,9 @@ DEPENDS =3D &quot;libpthread-stubs udev libpciaccess&quot=
;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://dri.freedesktop.org/libdrm/${BP}.=
tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://dri.freedesktop.org/li=
bdrm/${BP}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://installtests.patch &quot;<=
br>
-SRC_URI[md5sum] =3D &quot;c9291bae0e5ca65d1483821d3698d3ab&quot;<br>
-SRC_URI[sha256sum] =3D &quot;906c294bdbe1c94c3ca084305d61a6e5a8367f3b4986e=
6cc13b1e9b3f75931dc&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;de49916e5f8aef4eba55223c79709b05&quot;<br>
+SRC_URI[sha256sum] =3D &quot;71960ac8bde7d710992b1bc8879935e8300a870c36bd0=
6f22412d0447e3d96c4&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.5.0<br>
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

--001a11403402d229fc0527715c1a--
