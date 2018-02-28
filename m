Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 90CE678856
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 19:58:52 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id u84so4536373iod.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 11:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RhoaWEaCKv9oE4QzD5vXu02vljfHy9ySoYFt+FE+pxc=;
	b=lp9PGILiCwE9rGRFVEN2GXymvdF5eyJ6gxeMIbk8iDwhr0Y37mbNRhSOlXeQ4/OX10
	E7PGgy5nbWB/GXWXMP2Nj0PkRtR6y4HTJtIouSG384JeVM5KQPU8jUQBdiVulc/1FPLR
	/6AaLSNfhoRZvhx4/0x7ELQf+rjGcee4awQIiZLjE9blY4XfBAgcEI5qMbtuRTJNx6jl
	wsAGINsGWpxJtSEjOWByvm2Hip9FB0y++xC6sMY/wTZvvBST7CWelrZ6V1GG3Zg+wnQm
	bImLsQ6gsNEK4s97jNGGbfcfiU5EGUjxszj0KiuC82kdfPc4m4Ntwj+xbWiZtkBJhBaP
	FvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RhoaWEaCKv9oE4QzD5vXu02vljfHy9ySoYFt+FE+pxc=;
	b=iaeC0q2eyhPmZJYO159sah3zalqpXh1Byx+jMNe4XSYM7hJvhqq6FZTCMx6fzF5UUh
	UYiKQYLAjLskWtIS7tQqRlbNRuiEv0G3VQ15VfFK2WDZnCJlEmVBNs8IOZ7swwXoGBTz
	5N+gnIwXtmy/nXHbA4NeBWUNqL/dHn+A9YbbhHxo04A2DhQFqDVwNQUqRJPufms9+nY6
	5qAi3O/Ob1q+zyiGilnMsRNtVFHpIZDdlBQNymAimfIATmTZNU0Wq73gXYbK+relCMSf
	XyKvvgc+LD5l4Q9chr9zGY05pk60ljn92KtIoShLX0cusVqcIzkQnwF6+Yqiqqt778p+
	H1YQ==
X-Gm-Message-State: APf1xPAk4YVvetCs6eCPmHK57UBnEvnL46bT3XY3jOsfLEzYDGjlJedo
	4Na+Dkdr5IAkPi9gCnraYajxu47Yxcl/p6lY4ywa4g==
X-Google-Smtp-Source: AG47ELutg4k4TQJrevK0eEYayQc9Lt4PhsFfvpVgVqXvfOt6tI5quECVH8S/lGNzIO87YbZUq9UpU/+iJVybKi1tCL4=
X-Received: by 10.107.7.87 with SMTP id 84mr21844377ioh.216.1519847933487;
	Wed, 28 Feb 2018 11:58:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Wed, 28 Feb 2018 11:58:32 -0800 (PST)
In-Reply-To: <20180228184225.10017-1-francescogiancane8@gmail.com>
References: <20180228184225.10017-1-francescogiancane8@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Feb 2018 19:58:32 +0000
Message-ID: <CAJTo0LatUkmJPixp2_CnxwRfP4hqvMdjtaiX3H_ezFxRwr_mAA@mail.gmail.com>
To: Francesco Giancane <francescogiancane8@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libepoxy: New recipe updated to latest release
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
X-List-Received-Date: Wed, 28 Feb 2018 19:58:52 -0000
Content-Type: multipart/alternative; boundary="001a113ecdf430445c05664b2c1f"

--001a113ecdf430445c05664b2c1f
Content-Type: text/plain; charset="UTF-8"

Please also delete the old release.

Ross

On 28 February 2018 at 18:42, Francesco Giancane <
francescogiancane8@gmail.com> wrote:

> libepoxy 1.4.3 did not compile successfully because of
> implicit symbol definitions and link-time errors.
> A new recipe with latest libepoxy release (1.5.0) which
> successfully compiles is provided.
>
> Signed-off-by: Francesco Giancane <francescogiancane8@gmail.com>
> ---
>  meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb | 24
> ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
>
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
> b/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
> new file mode 100644
> index 0000000000..d7702cfd64
> --- /dev/null
> +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "OpenGL function pointer management library"
> +HOMEPAGE = "https://github.com/anholt/libepoxy/"
> +SECTION = "libs"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
> +
> +SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/$
> {BP}.tar.xz \
> +           "
> +SRC_URI[md5sum] = "63fe3847789258254dcd7e3fdb9e7f5e"
> +SRC_URI[sha256sum] = "4c94995398a6ebf691600dda2e9685
> a0cac261414175c2adf4645cdfab42a5d5"
> +UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
> +
> +inherit meson pkgconfig distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES = "opengl"
> +
> +DEPENDS = "util-macros"
> +
> +PACKAGECONFIG[egl] = "-Denable-egl=yes, -Denable-egl=no, virtual/egl"
> +PACKAGECONFIG[x11] = "-Denable-glx=yes, -Denable-glx=no, virtual/libx11
> virtual/libgl"
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
> +
> +EXTRA_OEMESON_append_libc-musl = " -Dhas-dlvsym=false "
> --
> 2.14.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113ecdf430445c05664b2c1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please also delete the old release.<div><br></div><div>Ros=
s</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 2=
8 February 2018 at 18:42, Francesco Giancane <span dir=3D"ltr">&lt;<a href=
=3D"mailto:francescogiancane8@gmail.com" target=3D"_blank">francescogiancan=
e8@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">libepo=
xy 1.4.3 did not compile successfully because of<br>
implicit symbol definitions and link-time errors.<br>
A new recipe with latest libepoxy release (1.5.0) which<br>
successfully compiles is provided.<br>
<br>
Signed-off-by: Francesco Giancane &lt;<a href=3D"mailto:francescogiancane8@=
gmail.com">francescogiancane8@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/<wbr>libepoxy/<a href=3D"http://libepoxy_1.5.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.bb</a> | 24 +++++++=
+++++++++++++++++<br>
=C2=A01 file changed, 24 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/<wbr>libepoxy/<a href=3D"htt=
p://libepoxy_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.=
bb</a><br>
<br>
diff --git a/meta/recipes-graphics/<wbr>libepoxy/<a href=3D"http://libepoxy=
_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.bb</a> b/met=
a/recipes-graphics/<wbr>libepoxy/<a href=3D"http://libepoxy_1.5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.bb</a><br>
new file mode 100644<br>
index 0000000000..d7702cfd64<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/<wbr>libepoxy/<a href=3D"http://libepoxy_1.5.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.bb</a><br>
@@ -0,0 +1,24 @@<br>
+SUMMARY =3D &quot;OpenGL function pointer management library&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/anholt/libepoxy/" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/anholt/<wbr>libepoxy/</a>&=
quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>58ef4c80d401e07bd9ee8=
b6b58cf46<wbr>4b&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/anholt/${BPN}/releases/dow=
nload/${PV}/${BP}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/anholt/${<wbr>BPN}/releases/download/${PV}/$<wbr>{BP}.tar.xz</a> \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>63fe3847789258254dcd7e3fdb9e7f<wbr>5e&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>4c94995398a6ebf691600dda2e9685<wbr>a0cac=
261414175c2adf4645cdfab42<wbr>a5d5&quot;<br>
+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/anholt/libepoxy=
/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/anholt/<=
wbr>libepoxy/releases</a>&quot;<br>
+<br>
+inherit meson pkgconfig distro_features_check<br>
+<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
+<br>
+DEPENDS =3D &quot;util-macros&quot;<br>
+<br>
+PACKAGECONFIG[egl] =3D &quot;-Denable-egl=3Dyes, -Denable-egl=3Dno, virtua=
l/egl&quot;<br>
+PACKAGECONFIG[x11] =3D &quot;-Denable-glx=3Dyes, -Denable-glx=3Dno, virtua=
l/libx11 virtual/libgl&quot;<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_<wbr>FEATURES&#39=
;, &#39;x11&#39;, d)} egl&quot;<br>
+<br>
+EXTRA_OEMESON_append_libc-<wbr>musl =3D &quot; -Dhas-dlvsym=3Dfalse &quot;=
<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.3<br>
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

--001a113ecdf430445c05664b2c1f--
