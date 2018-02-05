Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3D97F784E6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 14:51:51 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id c17so30470075iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Feb 2018 06:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G5ZE/i2ChKTEHs1Hb61Jjlg8pI9G2J2IS55c/Vh18YQ=;
	b=FNx6FUhd8I2ZJOkObB95IASdw5mLo4FmGduUMm/R1g5TB2kjBXJ0M0VDujsalKqTZJ
	dvsHmZ44i66SdEFMThKNMjkiyFdx0WOfeDKgaSYZ7JoSbZJZywaPLDYJKcTW9PE3hWkY
	qOLmYlfZymKVEqT6uOdlrvBh4h0kbf1p13DJg5/NAIzgT6hjGM2FsfiDOOjjOdBfTOsc
	bsKIj2lrrI99I37oTM+u7JLdSCIGbtUoHp7RGpwo5FyuQmTdWlZqUQGiTZ6NvXvNFfaM
	SnpOrlkBGcwWiGzU9Qp8Jjn4t1OGqwuLzMlg9rJISjEKJI6d21SoiFpP6Qaj5cCnKVee
	8a2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G5ZE/i2ChKTEHs1Hb61Jjlg8pI9G2J2IS55c/Vh18YQ=;
	b=YN7HMjTRC5i4sGc9B7Hwosl4CymLosVmjjHldKOuDn7Fm1t+/J5wNEXagBbspZnlnj
	QlgtKmYFlzlO04KMdf67vTYC3WbHz3i05Li8dn6PyG5UjGk7j5LI/4TVzkTnYTEPrqhu
	8QuNwS9CWKwQbKDMwdBl+Pqhjxo+xEBmSVjP2CgaLbUui2AB6xQS8b1Zw51mHWPfkBZU
	/LgmncNhYa1h3khDrFyoSBCa+XqvvORDEBFM7Dh3Iwt5d/21uVEOjwSLKMr/8Xa3qx+Y
	VHQC8n4sWDEt3L4EykzQ57Pni805rD595rnYA1oR2gGFQB/YMy9NoE9PLf+BKYNjuxKu
	7UjQ==
X-Gm-Message-State: AKwxytfSKbERu6fGExywonNvOpsItmKt7FZRA3DoWY7SJzTYqLSoym4Z
	VCRd2DJVR6mZR0/jE9LbBHIMURiNIeJyQu8aHHjFgw==
X-Google-Smtp-Source: AH8x224EM9zr4c9u4D3xscP8q0cLsvAsmSdhSTcca0bfR9CHvA/283jIiuKMTqXmmEnAJxrcf2vbQAllPe+bLK8E5NQ=
X-Received: by 10.107.186.86 with SMTP id k83mr53627071iof.208.1517842313314; 
	Mon, 05 Feb 2018 06:51:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 5 Feb 2018 06:51:32 -0800 (PST)
In-Reply-To: <1517811692-28225-2-git-send-email-anuj.mittal@intel.com>
References: <1517811692-28225-1-git-send-email-anuj.mittal@intel.com>
	<1517811692-28225-2-git-send-email-anuj.mittal@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Feb 2018 14:51:32 +0000
Message-ID: <CAJTo0LZdTNQB0HbRtOMMu3_6CYK6zFEM_xuRq9EntXV=BUfokg@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] libva: upgrade to 2.0.0
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
X-List-Received-Date: Mon, 05 Feb 2018 14:51:52 -0000
Content-Type: multipart/alternative; boundary="94eb2c076a70e91c4705647833b4"

--94eb2c076a70e91c4705647833b4
Content-Type: text/plain; charset="UTF-8"

(Same comment about the tarball relases)

On 5 February 2018 at 06:21, Anuj Mittal <anuj.mittal@intel.com> wrote:

> libva 2.0 bumps the VA-API version to 1.0.0 and deletes egl and
> tpi backends. The header files va_egl.h and va_tpi.h are still
> packaged in -dev to ensure packages that still use them don't fail.
>
> Major changes:
>
> * Bump VA-API version to 1.0.0
> * Add new API for H264 FEI support
> * Add definition of VA_FOURCC_I420
> * Add functions for converting common enums to strings
> * Deprecate H.264 baseline profile and FMO support
> * Deprecate packed misc packed header flag
> * Delete libva-tpi and libva-egl backends
> * Refine VASliceParameterBufferHEVC, VAEncMiscParameterBuffer
> * Fix errors in VAConfigAttribValEncROI, VAEncMacroblockParameterBuffer
> H264
> * Fix race condition in wayland support
> * Rename vaMessageCallback to VAMessageCallback
> * Make logging callbacks library-safe
>
> Also, updated the github URLs to point to renamed Intel repository.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../libva/{libva_1.8.3.bb => libva_2.0.0.bb}               | 14
> +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>  rename meta/recipes-graphics/libva/{libva_1.8.3.bb => libva_2.0.0.bb}
> (76%)
>
> diff --git a/meta/recipes-graphics/libva/libva_1.8.3.bb
> b/meta/recipes-graphics/libva/libva_2.0.0.bb
> similarity index 76%
> rename from meta/recipes-graphics/libva/libva_1.8.3.bb
> rename to meta/recipes-graphics/libva/libva_2.0.0.bb
> index ceeda84..af4c1e1 100644
> --- a/meta/recipes-graphics/libva/libva_1.8.3.bb
> +++ b/meta/recipes-graphics/libva/libva_2.0.0.bb
> @@ -11,19 +11,19 @@ manufacturers can also freely use this API for
> hardware accelerated \
>  video decoding."
>
>  HOMEPAGE = "https://01.org/linuxmedia/vaapi"
> -BUGTRACKER = "https://github.com/01org/libva/issues"
> +BUGTRACKER = "https://github.com/intel/libva/issues"
>
>  SECTION = "x11"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
>
> -SRC_URI = "git://github.com/01org/libva.git;protocol=http;branch=v1.8-
> branch "
> -SRCREV = "457470987cc9df5976ce8c72ffd4bfbd9baaf0f9"
> +SRC_URI = "git://github.com/intel/libva.git;protocol=http"
> +SRCREV = "24cbd05c9477ab59cc5665989026b4ad17e06eb6"
>  UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>(\d+(\.\d+)+))$"
>
>  S = "${WORKDIR}/git"
>
> -DEPENDS = "libdrm virtual/mesa virtual/libgles1 virtual/libgles2
> virtual/egl"
> +DEPENDS = "libdrm virtual/mesa"
>
>  inherit autotools pkgconfig distro_features_check
>
> @@ -35,17 +35,13 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES',
> 'wayland x11', d)}"
>  PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxext
> libxfixes"
>  PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland-native
> wayland"
>
> -PACKAGES =+ "${PN}-x11 ${PN}-tpi ${PN}-glx ${PN}-egl ${PN}-wayland"
> +PACKAGES =+ "${PN}-x11 ${PN}-glx ${PN}-wayland"
>
> -RDEPENDS_${PN}-tpi =+ "${PN}"
>  RDEPENDS_${PN}-x11 =+ "${PN}"
>  RDEPENDS_${PN}-glx =+ "${PN}-x11"
> -RDEPENDS_${PN}-egl =+ "${PN}-x11"
>
>  FILES_${PN}-dbg += "${libdir}/dri/.debug"
>
>  FILES_${PN}-x11 =+ "${libdir}/libva-x11*${SOLIBS}"
> -FILES_${PN}-tpi =+ "${libdir}/libva-tpi*${SOLIBS}"
>  FILES_${PN}-glx =+ "${libdir}/libva-glx*${SOLIBS}"
> -FILES_${PN}-egl =+ "${libdir}/libva-egl*${SOLIBS}"
>  FILES_${PN}-wayland =+ "${libdir}/libva-wayland*${SOLIBS}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c076a70e91c4705647833b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">(Same comment about the tarball relases)</div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 5 February 2018 at 06:21=
, Anuj Mittal <span dir=3D"ltr">&lt;<a href=3D"mailto:anuj.mittal@intel.com=
" target=3D"_blank">anuj.mittal@intel.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">libva 2.0 bumps the VA-API version to 1.0.0 and dele=
tes egl and<br>
tpi backends. The header files va_egl.h and va_tpi.h are still<br>
packaged in -dev to ensure packages that still use them don&#39;t fail.<br>
<br>
Major changes:<br>
<br>
* Bump VA-API version to 1.0.0<br>
* Add new API for H264 FEI support<br>
* Add definition of VA_FOURCC_I420<br>
* Add functions for converting common enums to strings<br>
* Deprecate H.264 baseline profile and FMO support<br>
* Deprecate packed misc packed header flag<br>
* Delete libva-tpi and libva-egl backends<br>
* Refine VASliceParameterBufferHEVC, VAEncMiscParameterBuffer<br>
* Fix errors in VAConfigAttribValEncROI, VAEncMacroblockParameterBuffer<wbr=
>H264<br>
* Fix race condition in wayland support<br>
* Rename vaMessageCallback to VAMessageCallback<br>
* Make logging callbacks library-safe<br>
<br>
Also, updated the github URLs to point to renamed Intel repository.<br>
<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com">anu=
j.mittal@intel.com</a>&gt;<br>
---<br>
=C2=A0.../libva/{<a href=3D"http://libva_1.8.3.bb" rel=3D"noreferrer" targe=
t=3D"_blank">libva_1.8.3.bb</a> =3D&gt; <a href=3D"http://libva_2.0.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libva_2.0.0.bb</a>}=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 +++++---------<br>
=C2=A01 file changed, 5 insertions(+), 9 deletions(-)<br>
=C2=A0rename meta/recipes-graphics/libva/{<a href=3D"http://libva_1.8.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">l<wbr>ibva_1.8.3.bb</a> =3D&gt; <a hr=
ef=3D"http://libva_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">libva_2.0=
.0.bb</a>} (76%)<br>
<br>
diff --git a/meta/recipes-graphics/libva/<a href=3D"http://libva_1.8.3.bb" =
rel=3D"noreferrer" target=3D"_blank"><wbr>libva_1.8.3.bb</a> b/meta/recipes=
-graphics/libva/<a href=3D"http://libva_2.0.0.bb" rel=3D"noreferrer" target=
=3D"_blank"><wbr>libva_2.0.0.bb</a><br>
similarity index 76%<br>
rename from meta/recipes-graphics/libva/<a href=3D"http://libva_1.8.3.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>bva_1.8.3.bb</a><br>
rename to meta/recipes-graphics/libva/<a href=3D"http://libva_2.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>bva_2.0.0.bb</a><br>
index ceeda84..af4c1e1 100644<br>
--- a/meta/recipes-graphics/libva/<a href=3D"http://libva_1.8.3.bb" rel=3D"=
noreferrer" target=3D"_blank"><wbr>libva_1.8.3.bb</a><br>
+++ b/meta/recipes-graphics/libva/<a href=3D"http://libva_2.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank"><wbr>libva_2.0.0.bb</a><br>
@@ -11,19 +11,19 @@ manufacturers can also freely use this API for hardware=
 accelerated \<br>
=C2=A0video decoding.&quot;<br>
<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://01.org/linuxmedia/vaapi" rel=3D=
"noreferrer" target=3D"_blank">https://01.org/linuxmedia/<wbr>vaapi</a>&quo=
t;<br>
-BUGTRACKER =3D &quot;<a href=3D"https://github.com/01org/libva/issues" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/01org/<wbr>libva/issue=
s</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://github.com/intel/libva/issues" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/intel/<wbr>libva/issue=
s</a>&quot;<br>
<br>
=C2=A0SECTION =3D &quot;x11&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>2e48940f94acb0af=
582e5ef0353780<wbr>0f&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/01org/libva.git;proto=
col=3Dhttp;branch=3Dv1.8-branch" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/01org/libva.<wbr>git;protocol=3Dhttp;branch=3Dv1.8-<wbr>branch</a> &q=
uot;<br>
-SRCREV =3D &quot;<wbr>457470987cc9df5976ce8c72ffd4bf<wbr>bd9baaf0f9&quot;<=
br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/intel/libva.git;proto=
col=3Dhttp" rel=3D"noreferrer" target=3D"_blank">github.com/intel/libva.<wb=
r>git;protocol=3Dhttp</a>&quot;<br>
+SRCREV =3D &quot;<wbr>24cbd05c9477ab59cc5665989026b4<wbr>ad17e06eb6&quot;<=
br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;^(?P&lt;pver&gt;(\d+(\.\d+)+))$&=
quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-DEPENDS =3D &quot;libdrm virtual/mesa virtual/libgles1 virtual/libgles2 vi=
rtual/egl&quot;<br>
+DEPENDS =3D &quot;libdrm virtual/mesa&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig distro_features_check<br>
<br>
@@ -35,17 +35,13 @@ PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTR=
O_<wbr>FEATURES&#39;, &#39;wayland x11&#39;, d)}&quot;<br>
=C2=A0PACKAGECONFIG[x11] =3D &quot;--enable-x11,--disable-x11,<wbr>virtual/=
libx11 libxext libxfixes&quot;<br>
=C2=A0PACKAGECONFIG[wayland] =3D &quot;--enable-wayland,--disable-<wbr>wayl=
and,wayland-native wayland&quot;<br>
<br>
-PACKAGES =3D+ &quot;${PN}-x11 ${PN}-tpi ${PN}-glx ${PN}-egl ${PN}-wayland&=
quot;<br>
+PACKAGES =3D+ &quot;${PN}-x11 ${PN}-glx ${PN}-wayland&quot;<br>
<br>
-RDEPENDS_${PN}-tpi =3D+ &quot;${PN}&quot;<br>
=C2=A0RDEPENDS_${PN}-x11 =3D+ &quot;${PN}&quot;<br>
=C2=A0RDEPENDS_${PN}-glx =3D+ &quot;${PN}-x11&quot;<br>
-RDEPENDS_${PN}-egl =3D+ &quot;${PN}-x11&quot;<br>
<br>
=C2=A0FILES_${PN}-dbg +=3D &quot;${libdir}/dri/.debug&quot;<br>
<br>
=C2=A0FILES_${PN}-x11 =3D+ &quot;${libdir}/libva-x11*${SOLIBS}<wbr>&quot;<b=
r>
-FILES_${PN}-tpi =3D+ &quot;${libdir}/libva-tpi*${SOLIBS}<wbr>&quot;<br>
=C2=A0FILES_${PN}-glx =3D+ &quot;${libdir}/libva-glx*${SOLIBS}<wbr>&quot;<b=
r>
-FILES_${PN}-egl =3D+ &quot;${libdir}/libva-egl*${SOLIBS}<wbr>&quot;<br>
=C2=A0FILES_${PN}-wayland =3D+ &quot;${libdir}/libva-wayland*${<wbr>SOLIBS}=
&quot;<br>
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
</font></span></blockquote></div><br></div>

--94eb2c076a70e91c4705647833b4--
