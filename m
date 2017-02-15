Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id E26FF7723B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:07:17 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id v200so78795659ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 01:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9srq1GjgcwKBDTc1LLDjmboEwLpqscOaBYJxJcCr31Q=;
	b=rywzqBj876y5n/fbQcWygTMZUn5w1VgvrRQ0duUop75HPZvPSbeBC/l+XJJjLxgzva
	SFPQGVvhktdy0t0cDIlVtnPMBYQDzKryRFOvAfaCVfciUvP5N1RrKDXl/dMXSU2LBgbn
	2aXOUF8TzDNj5RcoKS6r+Uhc9punJUIJ4TtCfmQIPwWnmK/QRGRn179ZWbWyO6Lqq1ET
	y46xGkWDVwlIKxtCXwKevFOE9iDNb0P0eDGT7YPEE4sBAMnZ/5cZMArU7lodyhNYAnU5
	KVgPXzsXMSFbfFqDzhqydlZszfb3qQRc3W1q7wqBDR0GpAgUN/V2ndahwIxPoayyC7Qx
	hsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9srq1GjgcwKBDTc1LLDjmboEwLpqscOaBYJxJcCr31Q=;
	b=tbq0gFCGJPJ6OCHT8WuovS3ofwYCJsFmrm4wVktUieoClZzUMplQghDTV/IrsGuEQA
	IOfisAJ3YrqJtGaEBaGV62J4ZYvVjFNh84zWS6jnVZtcc7L+RX64dH9R4yv7IRIq2aXv
	AykmtqR3ZBZR2oAIsniiqheAl1hQPom56J7oskqR9eA4+A+Fml6Wv3vcnRFvz16+ZjOC
	6KLrRCI9/EuGZaDnl5Bkvtzkn9RyYGEAcAkPDoui9b9TL0Mf7hy2ef/W432E7lCRUMas
	mo/bkY3WMQ/5M0MeRHJjqs7CLCUA45zZ3WpbCGfW+iAWqwz3drBSYg9TGhAmEIEn04N8
	hlUw==
X-Gm-Message-State: AMke39n+tEayC+ytNw8HAMhXffuz6n+SBudvJ01QpGBixQBrpsxLj0qkMUph7wkEiDaTqpcr+t/B1OcH05hiZ7Vr
X-Received: by 10.129.152.77 with SMTP id p74mr23934693ywg.177.1487149637416; 
	Wed, 15 Feb 2017 01:07:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.234.11 with HTTP; Wed, 15 Feb 2017 01:06:47 -0800 (PST)
In-Reply-To: <20170214224203.GA3023@jama>
References: <cover.1487065337.git.jussi.kukkonen@intel.com>
	<741d53dfad8951845bcae6ad8f7dfb75936db620.1487065337.git.jussi.kukkonen@intel.com>
	<20170214224203.GA3023@jama>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 15 Feb 2017 11:06:47 +0200
Message-ID: <CAHiDW_G-ijuEC9CvPOpQ1+S2NYciDMJiJQnzOecMycL5y2ojQg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] mesa: Upgrade 13.0.4 -> 17.0.0
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
X-List-Received-Date: Wed, 15 Feb 2017 09:07:18 -0000
Content-Type: multipart/alternative; boundary=94eb2c0bbf56de0a6a05488e0195

--94eb2c0bbf56de0a6a05488e0195
Content-Type: text/plain; charset=UTF-8

On 15 February 2017 at 00:42, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, Feb 14, 2017 at 11:54:58AM +0200, Jussi Kukkonen wrote:
> > * New feature release with lots of changes
> > * Versioning change (17 as in 2017, no longer relates to GL bumps)
>
> There is also this paragraph in release notes:
> https://www.mesa3d.org/relnotes/17.0.0.html
>
> Mesa 17.0.0 is a new development release. People who are concerned with
> stability and reliability should stick with a previous release or wait
> for Mesa 17.0.1.
>
> If you don't want to wait for 17.0.1 than maybe mention it in commit
> message.


Frankly I forgot mesa did this.

Typically the .1 release comes within a few weeks. I'm fine with waiting
for that.

Ross, let me know if you'd like me to re-submit (the piglit changes should
be fine with current mesa though).

Jussi



> > * OpenGL 4.5 support on Haswell
> > * mesa now implements its own sha1 instead of having 5
> >   configurable sha-providers
> >
> > Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > ---
> >  .../mesa/{mesa-gl_13.0.4.bb => mesa-gl_17.0.0.bb}                 | 0
> >  meta/recipes-graphics/mesa/mesa.inc                               | 8
> +-------
> >  meta/recipes-graphics/mesa/{mesa_13.0.4.bb => mesa_17.0.0.bb}     | 7
> +++----
> >  3 files changed, 4 insertions(+), 11 deletions(-)
> >  rename meta/recipes-graphics/mesa/{mesa-gl_13.0.4.bb =>
> mesa-gl_17.0.0.bb} (100%)
> >  rename meta/recipes-graphics/mesa/{mesa_13.0.4.bb => mesa_17.0.0.bb}
> (74%)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa-gl_13.0.4.bb
> b/meta/recipes-graphics/mesa/mesa-gl_17.0.0.bb
> > similarity index 100%
> > rename from meta/recipes-graphics/mesa/mesa-gl_13.0.4.bb
> > rename to meta/recipes-graphics/mesa/mesa-gl_17.0.0.bb
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> > index 5d882b1..befb35e 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES = "opengl"
> >
> >  EXTRA_OECONF = "--enable-shared-glapi"
> >
> > -PACKAGECONFIG ??= "gbm egl gles dri ${MESA_CRYPTO} \
> > +PACKAGECONFIG ??= "gbm egl gles dri \
> >               ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '',
> d)}\
> >               ${@bb.utils.contains('DISTRO_FEATURES', 'wayland',
> 'wayland', '', d)}\
> >               "
> > @@ -67,12 +67,6 @@ PACKAGECONFIG[xa]  = "--enable-xa, --disable-xa"
> >  OSMESA = "${@bb.utils.contains('PACKAGECONFIG', 'gallium',
> 'gallium-osmesa', 'osmesa', d)}"
> >  PACKAGECONFIG[osmesa] = "--enable-${OSMESA},--disable-${OSMESA}"
> >
> > -# Mesa requires one of the following crypto implementation, pick one of
> them
> > -MESA_CRYPTO ??= "openssl"
> > -PACKAGECONFIG[openssl] = "--with-sha1=libcrypto,,openssl"
> > -PACKAGECONFIG[nettle] = "--with-sha1=libnettle,,nettle"
> > -PACKAGECONFIG[gcrypt] = "--with-sha1=libgcrypt,,libgcrypt"
> > -
> >  # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
> >  FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa_13.0.4.bb
> b/meta/recipes-graphics/mesa/mesa_17.0.0.bb
> > similarity index 74%
> > rename from meta/recipes-graphics/mesa/mesa_13.0.4.bb
> > rename to meta/recipes-graphics/mesa/mesa_17.0.0.bb
> > index 1416c9f..6576e3c 100644
> > --- a/meta/recipes-graphics/mesa/mesa_13.0.4.bb
> > +++ b/meta/recipes-graphics/mesa/mesa_17.0.0.bb
> > @@ -1,13 +1,12 @@
> >  require ${BPN}.inc
> >
> > -SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz \
> > +SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/mesa-${PV}.tar.xz \
> >             file://replace_glibc_check_with_linux.patch \
> >             file://disable-asm-on-non-gcc.patch \
> >             file://0001-Use-wayland-scanner-in-the-path.patch \
> >  "
> > -
> > -SRC_URI[md5sum] = "d088a921e935218833a8071cb672a574"
> > -SRC_URI[sha256sum] = "a95d7ce8f7bd5f88585e4be3144a34
> 1236d8c0fc91f6feaec59bb8ba3120e726"
> > +SRC_URI[md5sum] = "932e4171a86b14940c06812356486155"
> > +SRC_URI[sha256sum] = "39db3d59700159add7f977307d12a7
> dfe016363e760ad82280ac4168ea668481"
> >
> >  #because we cannot rely on the fact that all apps will use pkgconfig,
> >  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> > --
> > 2.1.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--94eb2c0bbf56de0a6a05488e0195
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
5 February 2017 at 00:42, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span =
class=3D"gmail-">On Tue, Feb 14, 2017 at 11:54:58AM +0200, Jussi Kukkonen w=
rote:<br>
&gt; * New feature release with lots of changes<br>
&gt; * Versioning change (17 as in 2017, no longer relates to GL bumps)<br>
<br>
</span>There is also this paragraph in release notes:<br>
<a href=3D"https://www.mesa3d.org/relnotes/17.0.0.html" rel=3D"noreferrer" =
target=3D"_blank">https://www.mesa3d.org/<wbr>relnotes/17.0.0.html</a><br>
<br>
Mesa 17.0.0 is a new development release. People who are concerned with<br>
stability and reliability should stick with a previous release or wait<br>
for Mesa 17.0.1.<br>
<br>
If you don&#39;t want to wait for 17.0.1 than maybe mention it in commit<br=
>
message.</blockquote><div><br></div><div>Frankly I forgot mesa did this.</d=
iv><div><br></div><div>Typically the .1 release comes within a few weeks. I=
&#39;m fine with waiting for that.</div><div><br></div><div>Ross, let me kn=
ow if you&#39;d like me to re-submit (the piglit changes should be fine wit=
h current mesa though).=C2=A0</div><div><br></div><div>Jussi</div><div><br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">
&gt; * OpenGL 4.5 support on Haswell<br>
&gt; * mesa now implements its own sha1 instead of having 5<br>
&gt;=C2=A0 =C2=A0configurable sha-providers<br>
&gt;<br>
&gt; Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@int=
el.com">jussi.kukkonen@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../mesa/{<a href=3D"http://mesa-gl_13.0.4.bb" rel=3D"noreferrer=
" target=3D"_blank">mesa-gl_13.0.4.bb</a> =3D&gt; <a href=3D"http://mesa-gl=
_17.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_17.0.0.bb</a>}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 meta/recipes-graphics/mesa/<wbr>mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 8 +-------<br>
&gt;=C2=A0 meta/recipes-graphics/mesa/{<a href=3D"http://mesa_13.0.4.bb" re=
l=3D"noreferrer" target=3D"_blank">me<wbr>sa_13.0.4.bb</a> =3D&gt; <a href=
=3D"http://mesa_17.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa_17.0.0=
.bb</a>}=C2=A0 =C2=A0 =C2=A0| 7 +++----<br>
&gt;=C2=A0 3 files changed, 4 insertions(+), 11 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa-gl_13.=
0.4.bb" rel=3D"noreferrer" target=3D"_blank">me<wbr>sa-gl_13.0.4.bb</a> =3D=
&gt; <a href=3D"http://mesa-gl_17.0.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">mesa-gl_17.0.0.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa_13.0.4=
.bb" rel=3D"noreferrer" target=3D"_blank">me<wbr>sa_13.0.4.bb</a> =3D&gt; <=
a href=3D"http://mesa_17.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa_=
17.0.0.bb</a>} (74%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_13.0=
.4.bb" rel=3D"noreferrer" target=3D"_blank">m<wbr>esa-gl_13.0.4.bb</a> b/me=
ta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_17.0.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">m<wbr>esa-gl_17.0.0.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_13.0.=
4.bb" rel=3D"noreferrer" target=3D"_blank">mes<wbr>a-gl_13.0.4.bb</a><br>
&gt; rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_17.0.0.=
bb" rel=3D"noreferrer" target=3D"_blank">mes<wbr>a-gl_17.0.0.bb</a><br>
&gt; diff --git a/meta/recipes-graphics/mesa/<wbr>mesa.inc b/meta/recipes-g=
raphics/mesa/<wbr>mesa.inc<br>
&gt; index 5d882b1..befb35e 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/<wbr>mesa.inc<br>
&gt; +++ b/meta/recipes-graphics/mesa/<wbr>mesa.inc<br>
&gt; @@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OECONF =3D &quot;--enable-shared-glapi&quot;<br>
&gt;<br>
&gt; -PACKAGECONFIG ??=3D &quot;gbm egl gles dri ${MESA_CRYPTO} \<br>
&gt; +PACKAGECONFIG ??=3D &quot;gbm egl gles dri \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.cont=
ains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;x11&#39;, &#39;x11&#39;, &#39;&#3=
9;, d)}\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.cont=
ains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;wayland&#39;, &#39;wayland&#39;, =
&#39;&#39;, d)}\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; @@ -67,12 +67,6 @@ PACKAGECONFIG[xa]=C2=A0 =3D &quot;--enable-xa, --di=
sable-xa&quot;<br>
&gt;=C2=A0 OSMESA =3D &quot;${@bb.utils.contains(&#39;<wbr>PACKAGECONFIG&#3=
9;, &#39;gallium&#39;, &#39;gallium-osmesa&#39;, &#39;osmesa&#39;, d)}&quot=
;<br>
&gt;=C2=A0 PACKAGECONFIG[osmesa] =3D &quot;--enable-${OSMESA},--disable-<wb=
r>${OSMESA}&quot;<br>
&gt;<br>
&gt; -# Mesa requires one of the following crypto implementation, pick one =
of them<br>
&gt; -MESA_CRYPTO ??=3D &quot;openssl&quot;<br>
&gt; -PACKAGECONFIG[openssl] =3D &quot;--with-sha1=3Dlibcrypto,,<wbr>openss=
l&quot;<br>
&gt; -PACKAGECONFIG[nettle] =3D &quot;--with-sha1=3Dlibnettle,,<wbr>nettle&=
quot;<br>
&gt; -PACKAGECONFIG[gcrypt] =3D &quot;--with-sha1=3Dlibgcrypt,,<wbr>libgcry=
pt&quot;<br>
&gt; -<br>
&gt;=C2=A0 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -=
O2)<br>
&gt;=C2=A0 FULL_OPTIMIZATION_append =3D &quot; -fno-omit-frame-pointer&quot=
;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_13.0.4.=
bb" rel=3D"noreferrer" target=3D"_blank">m<wbr>esa_13.0.4.bb</a> b/meta/rec=
ipes-graphics/mesa/<a href=3D"http://mesa_17.0.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">m<wbr>esa_17.0.0.bb</a><br>
&gt; similarity index 74%<br>
&gt; rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa_13.0.4.b=
b" rel=3D"noreferrer" target=3D"_blank">mes<wbr>a_13.0.4.bb</a><br>
&gt; rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.0.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">mes<wbr>a_17.0.0.bb</a><br>
&gt; index 1416c9f..6576e3c 100644<br>
&gt; --- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_13.0.4.bb" rel=
=3D"noreferrer" target=3D"_blank">m<wbr>esa_13.0.4.bb</a><br>
&gt; +++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_17.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">m<wbr>esa_17.0.0.bb</a><br>
&gt; @@ -1,13 +1,12 @@<br>
&gt;=C2=A0 require ${BPN}.inc<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;<a href=3D"ftp://ftp.freedesktop.org/pub/mesa/${PV}=
/mesa-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.freedesk=
top.org/<wbr>pub/mesa/${PV}/mesa-${PV}.tar.<wbr>xz</a> \<br>
&gt; +SRC_URI =3D &quot;<a href=3D"ftp://ftp.freedesktop.org/pub/mesa/mesa-=
${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.freedesktop.or=
g/<wbr>pub/mesa/mesa-${PV}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://replace_glibc_ch=
eck_<wbr>with_linux.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable-asm-on-n=
on-gcc.<wbr>patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-wayland=
-<wbr>scanner-in-the-path.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt; -<br>
&gt; -SRC_URI[md5sum] =3D &quot;<wbr>d088a921e935218833a8071cb672a5<wbr>74&=
quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;<wbr>a95d7ce8f7bd5f88585e4be3144a34<wbr>=
1236d8c0fc91f6feaec59bb8ba3120<wbr>e726&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;<wbr>932e4171a86b14940c068123564861<wbr>55&=
quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;<wbr>39db3d59700159add7f977307d12a7<wbr>=
dfe016363e760ad82280ac4168ea66<wbr>8481&quot;<br>
&gt;<br>
&gt;=C2=A0 #because we cannot rely on the fact that all apps will use pkgco=
nfig,<br>
&gt;=C2=A0 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER<br>
&gt; --<br>
&gt; 2.1.4<br>
&gt;<br>
</div></div><span class=3D"gmail-HOEnZb"><font color=3D"#888888">&gt; --<br=
>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
<br>
--<br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span></blockquote></div><br></div></div>

--94eb2c0bbf56de0a6a05488e0195--
