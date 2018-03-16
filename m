Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id F2A7278848
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 15:57:03 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id v194-v6so2703612itb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 08:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FRJ1tzfb3NO26c4kcKM8seixdsAwt75NjtzKS4XfuUY=;
	b=JvHuRgVAez2a20HxJk4hDQbK7yCEMyjohT8xrVb/RZTQhvFemMzQ2HqGLzIdDfb+E3
	wECrqHylFYTjAMNHtezTSb5bSBDOPxgObeNA8GC+uMs4Dg9uUjZKpo6fySbBn0l/PjWz
	RVyCLlNG1uBYiRvgOxVAcPEMXeDyOEPEqqEvoPH1SMfFYGeiZAt3rT07mU6SDH2tDSAA
	3zZHJ/+MVvyyLE/2gIJyBXdvLYdojVLkJn2o6KjzjH6m09PkC3UEzrbA7kFPL65VPkE5
	W0sOr4766cdwDih5Cf310eDllsHvXfb4cHyE0DDn05h1OhFW2WAEiaVH9Td2e7KwPjpO
	WwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FRJ1tzfb3NO26c4kcKM8seixdsAwt75NjtzKS4XfuUY=;
	b=G1HHN9R95Wvtja8+H3eirNq0HZ6avc/RbLStAwTLsaGAcM1RQhm54K5AyA6Kp/+VXk
	Agm1nVGVC3idXEhbQ+75UY2lBCM5tlP/N2JBNfZMncnhinG/j6Xf2Rawz7VQmFF9l9nG
	DeH3VPXLf+YFaBgtttoktKwot0dyozr5S6PL0931uNSy6oa2bS6G8W8Mtvqz7sLfOJ/1
	ptg4VQGf89TbBKW/axGkjExgM9BUdVvIYjSa14aBfNoDtBHOgFHnxcDJV5qds1MVSEos
	h3HviMF/05QDsjFAkR6GrUMpmcsEFmf6aD4OXWAxrLaBGUXgxKwr1+nDv2Ds1IF2V4XN
	eRGw==
X-Gm-Message-State: AElRT7F9toEfbs1uNZFDznPQeicDIXjTMx+oGMVvvSDeEQHr9IXZessL
	WQZMvsikOIT5W0SCQv4fs6lfsaaw3XX4O2pQGFxN9Q==
X-Google-Smtp-Source: AG47ELt4tTm/DZiGPXPIerMB6tnBfAkscgo48mZnJ0I99zTlgSJeLBmtru+65i6vg15u7UwGiz6Va3lMbhFR0KPSDwE=
X-Received: by 2002:a24:4a53:: with SMTP id
	k80-v6mr2938579itb.45.1521215824993; 
	Fri, 16 Mar 2018 08:57:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Fri, 16 Mar 2018 08:56:44 -0700 (PDT)
In-Reply-To: <20180312091303.121887-5-xiao.zhang@windriver.com>
References: <20180312091303.121887-1-xiao.zhang@windriver.com>
	<20180312091303.121887-5-xiao.zhang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 Mar 2018 15:56:44 +0000
Message-ID: <CAJTo0LazYocenKAtBD++0Ey2bD7+6hAtyZS7gqxD9BmHt4A_Zw@mail.gmail.com>
To: Zhang Xiao <xiao.zhang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] cairo: fix file conflict when multilib enabled
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
X-List-Received-Date: Fri, 16 Mar 2018 15:57:04 -0000
Content-Type: multipart/alternative; boundary="000000000000e04b28056789a84b"

--000000000000e04b28056789a84b
Content-Type: text/plain; charset="UTF-8"

Or, don't install a *binary* package in two multilib architectures at once.

Ross

On 12 March 2018 at 09:13, Zhang Xiao <xiao.zhang@windriver.com> wrote:

> Script file cairo-trace conflict between 32 and 64 bit packages.
> Use update-alternatives to add base_libdir as suffix to avoid it.
>
> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> ---
>  meta/recipes-graphics/cairo/cairo_1.14.12.bb | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/cairo/cairo_1.14.12.bb
> b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
> index 075ca1ed34..1f2d68c0de 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.14.12.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
> @@ -10,6 +10,20 @@ SRC_URI = "http://cairographics.org/
> releases/cairo-${PV}.tar.xz \
>  SRC_URI[md5sum] = "9f0db9dbfca0966be8acd682e636d165"
>  SRC_URI[sha256sum] = "8c90f00c500b2299c0a323dd9beead
> 2a00353752b2092ead558139bd67f7bf16"
>
> +inherit update-alternatives
> +
> +MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
> +
> +ALTERNATIVE_${PN}-perf-utils="cairo-trace"
> +ALTERNATIVE_LINK_NAME[cairo-trace] = "${bindir}/cairo-trace"
> +ALTERNATIVE_TARGET[cairo-trace] = "${bindir}/cairo-trace-${
> MULTILIB_SUFFIX}"
> +
> +PACKAGE_PREPROCESS_FUNCS += "alternatives_rename"
> +
> +alternatives_rename() {
> +       mv ${PKGD}${bindir}/cairo-trace ${PKGD}${bindir}/cairo-trace-$
> {MULTILIB_SUFFIX}
> +}
> +
>  PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
>
>  SUMMARY_${PN} = "The Cairo 2D vector graphics library"
> @@ -35,7 +49,7 @@ FILES_${PN} = "${libdir}/libcairo.so.*"
>  FILES_${PN}-dev += "${libdir}/cairo/*.so"
>  FILES_${PN}-gobject = "${libdir}/libcairo-gobject.so.*"
>  FILES_${PN}-script-interpreter = "${libdir}/libcairo-script-
> interpreter.so.*"
> -FILES_${PN}-perf-utils = "${bindir}/cairo-trace ${libdir}/cairo/*.la
> ${libdir}/cairo/libcairo-trace.so.*"
> +FILES_${PN}-perf-utils = "${bindir}/cairo-trace* ${libdir}/cairo/*.la
> ${libdir}/cairo/libcairo-trace.so.*"
>
>  do_install_append () {
>         rm -rf ${D}${bindir}/cairo-sphinx
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000e04b28056789a84b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Or, don&#39;t install a *binary* package in two multilib a=
rchitectures at once.<div><br></div><div>Ross</div></div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On 12 March 2018 at 09:13, Zhang Xi=
ao <span dir=3D"ltr">&lt;<a href=3D"mailto:xiao.zhang@windriver.com" target=
=3D"_blank">xiao.zhang@windriver.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">Script file cairo-trace conflict between 32 and 64 bit pa=
ckages.<br>
Use update-alternatives to add base_libdir as suffix to avoid it.<br>
<br>
Signed-off-by: Zhang Xiao &lt;<a href=3D"mailto:xiao.zhang@windriver.com">x=
iao.zhang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.14.12.bb" rel=
=3D"noreferrer" target=3D"_blank">ca<wbr>iro_1.14.12.bb</a> | 16 ++++++++++=
+++++-<br>
=C2=A01 file changed, 15 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.14.12.bb=
" rel=3D"noreferrer" target=3D"_blank"><wbr>cairo_1.14.12.bb</a> b/meta/rec=
ipes-graphics/cairo/<a href=3D"http://cairo_1.14.12.bb" rel=3D"noreferrer" =
target=3D"_blank"><wbr>cairo_1.14.12.bb</a><br>
index 075ca1ed34..1f2d68c0de 100644<br>
--- a/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.14.12.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>cairo_1.14.12.bb</a><br>
+++ b/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.14.12.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>cairo_1.14.12.bb</a><br>
@@ -10,6 +10,20 @@ SRC_URI =3D &quot;<a href=3D"http://cairographics.org/re=
leases/cairo-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://cair=
ographics.org/<wbr>releases/cairo-${PV}.tar.xz</a> \<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>9f0db9dbfca0966be8acd682e636d1<wbr>65&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>8c90f00c500b2299c0a323dd9beead<wbr>=
2a00353752b2092ead558139bd67f7<wbr>bf16&quot;<br>
<br>
+inherit update-alternatives<br>
+<br>
+MULTILIB_SUFFIX =3D &quot;${@d.getVar(&#39;base_libdir&#39;,1).<wbr>split(=
&#39;/&#39;)[-1]}&quot;<br>
+<br>
+ALTERNATIVE_${PN}-perf-utils=3D<wbr>&quot;cairo-trace&quot;<br>
+ALTERNATIVE_LINK_NAME[cairo-<wbr>trace] =3D &quot;${bindir}/cairo-trace&qu=
ot;<br>
+ALTERNATIVE_TARGET[cairo-<wbr>trace] =3D &quot;${bindir}/cairo-trace-${<wb=
r>MULTILIB_SUFFIX}&quot;<br>
+<br>
+PACKAGE_PREPROCESS_FUNCS +=3D &quot;alternatives_rename&quot;<br>
+<br>
+alternatives_rename() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${PKGD}${bindir}/cairo-trace ${PKGD}${bindir=
}/cairo-trace-$<wbr>{MULTILIB_SUFFIX}<br>
+}<br>
+<br>
=C2=A0PACKAGES =3D+ &quot;cairo-gobject cairo-script-interpreter cairo-perf=
-utils&quot;<br>
<br>
=C2=A0SUMMARY_${PN} =3D &quot;The Cairo 2D vector graphics library&quot;<br=
>
@@ -35,7 +49,7 @@ FILES_${PN} =3D &quot;${libdir}/libcairo.so.*&quot;<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/cairo/*.so&quot;<br>
=C2=A0FILES_${PN}-gobject =3D &quot;${libdir}/libcairo-gobject.<wbr>so.*&qu=
ot;<br>
=C2=A0FILES_${PN}-script-interpreter =3D &quot;${libdir}/libcairo-script-<w=
br>interpreter.so.*&quot;<br>
-FILES_${PN}-perf-utils =3D &quot;${bindir}/cairo-trace ${libdir}/cairo/*.l=
a ${libdir}/cairo/libcairo-<wbr>trace.so.*&quot;<br>
+FILES_${PN}-perf-utils =3D &quot;${bindir}/cairo-trace* ${libdir}/cairo/*.=
la ${libdir}/cairo/libcairo-<wbr>trace.so.*&quot;<br>
<br>
=C2=A0do_install_append () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${bindir}/cairo-sphinx<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
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

--000000000000e04b28056789a84b--
