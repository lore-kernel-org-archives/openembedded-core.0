Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 901F677D42
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 18:16:53 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id 76so1931022ith.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 11:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5nB6SjI009cWh/0FKqEpZTRU+QkVQVfwclFn19eIy7k=;
	b=1pGS4fc0X0df8FTYbKn5HcHySgzonMlbeb8p72yRlektsRsmKFky7N/TVajN4aGKxg
	J2qMPtpVUiWmewGBtTjMVrPUb3REaPYOzjCEnIswr6KoIxVkLun2M53Sicmz7kj5pJSU
	qxFY8q9W+oRxCw4XzZDj60+wnZuI8VhEVyTte3gEftsXZL3LIGI6heyWmQayEHsDfQ8A
	pERl8mhWeJH2Jr5cyvMnPcqQm1zXKiCT1k62bQDhp5YSN52FZ9VF0UezWpHp9F5gqk0R
	lXbTQ5BDYF+U2+bZKShivX2qUWD8rGnOXHF7ZAcEaq1v9tsfYcRZmGrEx59amD2gNei0
	jr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5nB6SjI009cWh/0FKqEpZTRU+QkVQVfwclFn19eIy7k=;
	b=A+jKQK9VCTKwc0tpu/ljou4rop7p6ZdYqdmEJvabEeWg/2xUFpS+XseT5NAKJqNzjQ
	e8FfvVvVZKqYmPJWv5gG6nhDAsyhdfQL1VUOHLi1I0JIYGfCwXwoFWX2zlVemsmICq5A
	vl/D/vzlBEzR0GRqAn0/BORUeMaoJ2TWonO2JBC42buRpBmNoBEBoK4izlebespCVY+L
	zKlVtMJUhehEswy8LEDXlzZ4/1QQZzH0x3Rg2HSvBC7YatJl/HRZB29kU6cZgQa89Huz
	nSbgyhKjKnYsnCrE0QC8oO/r7P0k8Nj6DkJuCrB3CZq+AjHq8cM2kvg3Jfvz5/ojxVuB
	89vg==
X-Gm-Message-State: AIVw1112sL6JfYSWdNQZbVz3x9YLnARuXN+Z6VAsGxnBCR7tUR+xON0u
	3AlwZBPts3bXbpvZ5F+mRCg4vFVCvbZo
X-Received: by 10.36.48.193 with SMTP id q184mr8369564itq.112.1502302614615;
	Wed, 09 Aug 2017 11:16:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Wed, 9 Aug 2017 11:16:33 -0700 (PDT)
In-Reply-To: <14814de0-6516-8e73-b11f-d2a803b8dd03@gmail.com>
References: <20170809141922.2603-1-raj.khem@gmail.com>
	<20170809141922.2603-4-raj.khem@gmail.com>
	<CAJ86T=VTVv+w9YUCU2HpMDCpY64eS9ngiOGZ0uE-CJY_2M_9RQ@mail.gmail.com>
	<14814de0-6516-8e73-b11f-d2a803b8dd03@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Aug 2017 19:16:33 +0100
Message-ID: <CAJTo0LZePXSS=RLYusEm9CJyRWZ5ygnjtk4=k=DrZtvDFYO9HA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] cairo: Add pkgconfig for opengl support
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
X-List-Received-Date: Wed, 09 Aug 2017 18:16:53 -0000
Content-Type: multipart/alternative; boundary="001a11c01030b0916605565615c5"

--001a11c01030b0916605565615c5
Content-Type: text/plain; charset="UTF-8"

Breaks the no-x11 builder:
https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/builds/543/steps/BuildImages/logs/stdio

Ross

On 9 August 2017 at 19:11, Khem Raj <raj.khem@gmail.com> wrote:

> On 8/9/17 8:41 AM, Andre McCurdy wrote:
> > On Wed, Aug 9, 2017 at 7:19 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > Any explanation? Was this previously non-deterministic? If so, how far
> > back does the problem go?
>
> it isnt non-deterministic atleast not after RSS. However, we need this
> enabled when we have openGL/X11 enabled.
>
> >
> >> ---
> >>  meta/recipes-graphics/cairo/cairo.inc | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-graphics/cairo/cairo.inc
> b/meta/recipes-graphics/cairo/cairo.inc
> >> index 8e1e2e1b88..fd376951bd 100644
> >> --- a/meta/recipes-graphics/cairo/cairo.inc
> >> +++ b/meta/recipes-graphics/cairo/cairo.inc
> >> @@ -22,7 +22,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
> >>  DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
> >>
> >>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'x11 xcb', '', d)} \
> >> -           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
> >> +           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
> >> +           ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
> >>
> >>  PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no
> --disable-xlib,${X11DEPENDS}"
> >>  PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
> >> @@ -30,6 +31,7 @@ PACKAGECONFIG[directfb] = "--enable-directfb=yes,,
> directfb"
> >>  PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--
> disable-valgrind,valgrind"
> >>  PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
> >>  PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-
> glesv2,virtual/libgles2"
> >> +PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
> >
> > Since the opengl distro feature can imply either OpenGL or OpenGL ES
> > support, it doesn't seem right to use it to select one over the other
> > (ie for recipes which support both, shouldn't the choice between
> > OpenGL or OpenGL ES be independent of the opengl distro feature) ?
>
> at some point we differentiated between opengl and gles at distro level
> atleast for RDK, but I agree that marking opengl as a distro feature
> encompassing all OpenGL implementations is better. Although, in this
> particular case all openGL implementations can be enabled simultaneously
> so may be we can enable egl and gles too with same knob. Alternatively
> We can leave the packageconfig knob disabled which will make it same
> defaults effectively ( which is disabled)
>
> >
> >>
> >>  #check for TARGET_FPU=soft and inform configure of the result so it
> can disable some floating points
> >>  require cairo-fpu.inc
> >> --
> >> 2.14.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11c01030b0916605565615c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Breaks the no-x11 builder:=C2=A0<a href=3D"https://autobui=
lder.yoctoproject.org/main/builders/nightly-no-x11/builds/543/steps/BuildIm=
ages/logs/stdio">https://autobuilder.yoctoproject.org/main/builders/nightly=
-no-x11/builds/543/steps/BuildImages/logs/stdio</a><div><br></div><div>Ross=
</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 9 =
August 2017 at 19:11, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><span class=3D"">On 8/9/17 8:41 AM, Andre=
 McCurdy wrote:<br>
&gt; On Wed, Aug 9, 2017 at 7:19 AM, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">=
raj.khem@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Any explanation? Was this previously non-deterministic? If so, how far=
<br>
&gt; back does the problem go?<br>
<br>
</span>it isnt non-deterministic atleast not after RSS. However, we need th=
is<br>
enabled when we have openGL/X11 enabled.<br>
<span class=3D""><br>
&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-graphics/cairo/<wbr>cairo.inc | 4 +++-<br>
&gt;&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-graphics/cairo/<wbr>cairo.inc b/meta/rec=
ipes-graphics/cairo/<wbr>cairo.inc<br>
&gt;&gt; index 8e1e2e1b88..fd376951bd 100644<br>
&gt;&gt; --- a/meta/recipes-graphics/cairo/<wbr>cairo.inc<br>
&gt;&gt; +++ b/meta/recipes-graphics/cairo/<wbr>cairo.inc<br>
&gt;&gt; @@ -22,7 +22,8 @@ X11DEPENDS =3D &quot;virtual/libx11 libsm libxre=
nder libxext&quot;<br>
&gt;&gt;=C2=A0 DEPENDS =3D &quot;libpng fontconfig pixman glib-2.0 zlib&quo=
t;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_<=
wbr>FEATURES&#39;, &#39;x11&#39;, &#39;x11 xcb&#39;, &#39;&#39;, d)} \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;=
DISTRO_<wbr>FEATURES&#39;, &#39;directfb&#39;, d)}&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;=
DISTRO_<wbr>FEATURES&#39;, &#39;directfb&#39;, d)} \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;=
DISTRO_<wbr>FEATURES&#39;, &#39;opengl&#39;, d)}&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[x11] =3D &quot;--with-x=3Dyes -enable-xlib,--w=
ith-x=3Dno --disable-xlib,${X11DEPENDS}&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[xcb] =3D &quot;--enable-xcb,--disable-xcb,<wbr=
>libxcb&quot;<br>
&gt;&gt; @@ -30,6 +31,7 @@ PACKAGECONFIG[directfb] =3D &quot;--enable-direc=
tfb=3Dyes,,<wbr>directfb&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[valgrind] =3D &quot;--enable-valgrind=3Dyes,--=
<wbr>disable-valgrind,valgrind&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[egl] =3D &quot;--enable-egl=3Dyes,--disable-<w=
br>egl,virtual/egl&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[glesv2] =3D &quot;--enable-glesv2,--disable-<w=
br>glesv2,virtual/libgles2&quot;<br>
&gt;&gt; +PACKAGECONFIG[opengl] =3D &quot;--enable-gl,--disable-gl,<wbr>vir=
tual/libgl&quot;<br>
&gt;<br>
&gt; Since the opengl distro feature can imply either OpenGL or OpenGL ES<b=
r>
&gt; support, it doesn&#39;t seem right to use it to select one over the ot=
her<br>
&gt; (ie for recipes which support both, shouldn&#39;t the choice between<b=
r>
&gt; OpenGL or OpenGL ES be independent of the opengl distro feature) ?<br>
<br>
</span>at some point we differentiated between opengl and gles at distro le=
vel<br>
atleast for RDK, but I agree that marking opengl as a distro feature<br>
encompassing all OpenGL implementations is better. Although, in this<br>
particular case all openGL implementations can be enabled simultaneously<br=
>
so may be we can enable egl and gles too with same knob. Alternatively<br>
We can leave the packageconfig knob disabled which will make it same<br>
defaults effectively ( which is disabled)<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 #check for TARGET_FPU=3Dsoft and inform configure of the res=
ult so it can disable some floating points<br>
&gt;&gt;=C2=A0 require cairo-fpu.inc<br>
&gt;&gt; --<br>
&gt;&gt; 2.14.0<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
<br>
<br>
</div></div><br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a11c01030b0916605565615c5--
