Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
	[209.85.217.54])
	by mail.openembedded.org (Postfix) with ESMTP id 23CA07FA2E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 13:21:14 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id x18so9100507vsq.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 05:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YeG11FoF7HwMyAp62DDKY+39kPpWx/Zh8MIyIOjTB64=;
	b=Qj9Fa0085m8z0Y9gZk5YtD/QS48iUqPU9Nf15Vn0qFEKGlGbcE+oxSdWYW+fflCPn6
	jqfWqKncPdLbdKlr+DB0/fHNqTXQojc8z0r/lEqqAAbm9MKUk+Sh2H3zixjGOTiI8LPK
	2YQQwnLm7Cb9tbRIWrOgqKFJYFCKNE38R/lDrQoWkFPS/soIy0odyGvFF9kXNoHBSunB
	QnHbep2Z/90OKXWpoEPO5spm5BRZUYC7TkcFGm+AVrJFA6zCnDe3N/f/Ol+qmBUz6uD+
	ZwOnbDv8GuhYBmkbK6U+r56YGiaHtGLj5yIq44g4ow69g81AcfLtDPjwahndo45uId3M
	eaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YeG11FoF7HwMyAp62DDKY+39kPpWx/Zh8MIyIOjTB64=;
	b=Tvea9afDawMZl8eqwkYUeud0EKoeB46izGIeL7HYclhxtOwUWr2AIC/f6dUgpPyHRa
	L9TqB+WtIPEBbSb9qWKRtdmfKbujknGYqyVtlyB6pRXbjjHojNYwR0l3RMCoYgLPJXF3
	DIszqoprd/fCNmYTBI1cYzpUQFbAfPcssikKt1xi/OHuAT5X/eArgnFzc+2+hNxiTTDZ
	+4YBzl3EHYI+NoNWzSySqoq1ELfZsZJUstwMOtL3X6vvrGvWe4X907Z6APcKJ5jDWDde
	mTNvnHdLu63L6H9KB/dGgfTof92h3yUeJZOozyvQpzGaQpkT53JTv1TXa4XribJ4iD0S
	G/4w==
X-Gm-Message-State: APjAAAVFkqUcdJFNgaEXF64t1zeARhbDjhKCs3JvI0hXo4hNdlZAedqJ
	bBmOcL9Ib5oZDEta5FKzP5e4RycN3vl4pezO35I68g==
X-Google-Smtp-Source: APXvYqzLDSmlwvxBFZh7/7NW9+MLgO5lxOpeXQIerXtvZAN1Og0Ud3JoWpAIuJk1fu7P5HjQ8unW7h2n5fnKHrYMcdM=
X-Received: by 2002:a05:6102:3213:: with SMTP id
	r19mr564877vsf.83.1577020875841; 
	Sun, 22 Dec 2019 05:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20191205222617.31872-1-pkj@axis.com>
	<67f9adf18b174290bd5fc91b8aa00c66@XBOX03.axis.com>
In-Reply-To: <67f9adf18b174290bd5fc91b8aa00c66@XBOX03.axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 22 Dec 2019 14:21:04 +0100
Message-ID: <CANNYZj_Pw5DmSu-P-qQJ0jKBFsDKBvMAVvU9_qTx+Ugw859Qeg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][zeus][PATCH] cairo: Adapt license for cairo-dbg and cairo-src based on contents
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
X-List-Received-Date: Sun, 22 Dec 2019 13:21:15 -0000
Content-Type: multipart/alternative; boundary="0000000000001ba5b0059a4ac957"

--0000000000001ba5b0059a4ac957
Content-Type: text/plain; charset="UTF-8"

-dbg and -src packages are unlikely to be shipped to customers. How about
either whitelisting them globally, or setting INCOMPABIBLE_LICENSE per
image?

What the patch does with LICENSE-dbg/src feels hack-ish to be honest; also
there are other recipes with a similar layout which would also need similar
fixups.

Alex

On Sun, 22 Dec 2019 at 14:01, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> *ping*
>
> //Peter
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> <openembedded-core-
> > bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > Sent: den 5 december 2019 23:26
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [master][zeus][PATCH] cairo: Adapt license for cairo-
> > dbg and cairo-src based on contents
> >
> > Introduce a PACKAGECONFIG "trace" to disable cairo-trace (the only
> > part of the code licensed as GPL-3.0, and which is normally packaged
> > separately in cairo-perf-utils). By disabling this, we can adapt the
> > licenses for cairo-dbg and cairo-src so that they do not include
> > "GPLv3+" when trace is disabled and thus they can be used also when,
> > e.g., GPL-3.0 is blacklisted in INCOMPATIBLE_LICENSE.
> >
> > The "trace" PACKAGECONFIG is enabled by default for backwards
> > compatibility.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta/recipes-graphics/cairo/cairo_1.16.0.bb | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-
> > graphics/cairo/cairo_1.16.0.bb
> > index e3de3f6164..36a7b3c180 100644
> > --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > @@ -17,6 +17,10 @@ LICENSE_${PN}-doc = "MPL-1.1 | LGPLv2.1"
> >  LICENSE_${PN}-gobject = "MPL-1.1 | LGPLv2.1"
> >  LICENSE_${PN}-script-interpreter = "MPL-1.1 | LGPLv2.1"
> >  LICENSE_${PN}-perf-utils = "GPLv3+"
> > +# Adapt the licenses for cairo-dbg and cairo-src depending on whether
> > +# cairo-trace is being built.
> > +LICENSE_${PN}-dbg = "(MPL-1.1 |
> > LGPLv2.1)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPLv3+', '',
> > d)}"
> > +LICENSE_${PN}-src = "(MPL-1.1 |
> > LGPLv2.1)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPLv3+', '',
> > d)}"
> >
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
> >
> > @@ -40,7 +44,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
> >
> >  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}
> > \
> >                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11
> > xcb', '', d)} \
> > -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
> > 'opengl', '', d)}"
> > +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',
> > 'opengl', '', d)} \
> > +                   trace"
> >
> >  PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-
> > xlib,${X11DEPENDS}"
> >  PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
> > @@ -49,6 +54,7 @@ PACKAGECONFIG[valgrind] = "--enable-valgrind=yes,--
> > disable-valgrind,valgrind"
> >  PACKAGECONFIG[egl] = "--enable-egl=yes,--disable-egl,virtual/egl"
> >  PACKAGECONFIG[glesv2] = "--enable-glesv2,--disable-
> > glesv2,virtual/libgles2"
> >  PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
> > +PACKAGECONFIG[trace] = "--enable-trace,--disable-trace"
> >
> >  EXTRA_OECONF += " \
> >      ${@bb.utils.contains('TARGET_FPU', 'soft', '--disable-some-floating-
> > point', '', d)} \
> > --
> > 2.21.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000001ba5b0059a4ac957
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>-dbg and -src packages are unlikely to be shipped to =
customers. How about either whitelisting them globally, or setting INCOMPAB=
IBLE_LICENSE per image?</div><div><br></div><div>What the patch does with L=
ICENSE-dbg/src feels hack-ish to be honest; also there are other recipes wi=
th a similar layout which would also need similar fixups.<br></div><div><br=
></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sun, 22 Dec 2019 at 14:01, Peter Kjellerstedt =
&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">*ping*<br>
<br>
//Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core-bounces@lists.openembedded.org</a> =
&lt;openembedded-core-<br>
&gt; <a href=3D"mailto:bounces@lists.openembedded.org" target=3D"_blank">bo=
unces@lists.openembedded.org</a>&gt; On Behalf Of Peter Kjellerstedt<br>
&gt; Sent: den 5 december 2019 23:26<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: [OE-core] [master][zeus][PATCH] cairo: Adapt license for cair=
o-<br>
&gt; dbg and cairo-src based on contents<br>
&gt; <br>
&gt; Introduce a PACKAGECONFIG &quot;trace&quot; to disable cairo-trace (th=
e only<br>
&gt; part of the code licensed as GPL-3.0, and which is normally packaged<b=
r>
&gt; separately in cairo-perf-utils). By disabling this, we can adapt the<b=
r>
&gt; licenses for cairo-dbg and cairo-src so that they do not include<br>
&gt; &quot;GPLv3+&quot; when trace is disabled and thus they can be used al=
so when,<br>
&gt; e.g., GPL-3.0 is blacklisted in INCOMPATIBLE_LICENSE.<br>
&gt; <br>
&gt; The &quot;trace&quot; PACKAGECONFIG is enabled by default for backward=
s<br>
&gt; compatibility.<br>
&gt; <br>
&gt; Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellers=
tedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" r=
el=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a> | 8 +++++++-<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.=
0.bb" rel=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a> b/meta/recip=
es-<br>
&gt; graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">cairo_1.16.0.bb</a><br>
&gt; index e3de3f6164..36a7b3c180 100644<br>
&gt; --- a/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" r=
el=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a><br>
&gt; +++ b/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" r=
el=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a><br>
&gt; @@ -17,6 +17,10 @@ LICENSE_${PN}-doc =3D &quot;MPL-1.1 | LGPLv2.1&quot=
;<br>
&gt;=C2=A0 LICENSE_${PN}-gobject =3D &quot;MPL-1.1 | LGPLv2.1&quot;<br>
&gt;=C2=A0 LICENSE_${PN}-script-interpreter =3D &quot;MPL-1.1 | LGPLv2.1&qu=
ot;<br>
&gt;=C2=A0 LICENSE_${PN}-perf-utils =3D &quot;GPLv3+&quot;<br>
&gt; +# Adapt the licenses for cairo-dbg and cairo-src depending on whether=
<br>
&gt; +# cairo-trace is being built.<br>
&gt; +LICENSE_${PN}-dbg =3D &quot;(MPL-1.1 |<br>
&gt; LGPLv2.1)${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;trace&#39;=
, &#39; &amp; GPLv3+&#39;, &#39;&#39;,<br>
&gt; d)}&quot;<br>
&gt; +LICENSE_${PN}-src =3D &quot;(MPL-1.1 |<br>
&gt; LGPLv2.1)${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;trace&#39;=
, &#39; &amp; GPLv3+&#39;, &#39;&#39;,<br>
&gt; d)}&quot;<br>
&gt; <br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3De73e999e0c72b5ac=
9012424fa157ad77&quot;<br>
&gt; <br>
&gt; @@ -40,7 +44,8 @@ X11DEPENDS =3D &quot;virtual/libx11 libsm libxrender=
 libxext&quot;<br>
&gt; <br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURE=
S&#39;, &#39;directfb&#39;, d)}<br>
&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x=
11<br>
&gt; xcb&#39;, &#39;&#39;, d)} \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11 opengl&#39;,<br>
&gt; &#39;opengl&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11 opengl&#39;,<br>
&gt; &#39;opengl&#39;, &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
trace&quot;<br>
&gt; <br>
&gt;=C2=A0 PACKAGECONFIG[x11] =3D &quot;--with-x=3Dyes -enable-xlib,--with-=
x=3Dno --disable-<br>
&gt; xlib,${X11DEPENDS}&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[xcb] =3D &quot;--enable-xcb,--disable-xcb,libxcb&q=
uot;<br>
&gt; @@ -49,6 +54,7 @@ PACKAGECONFIG[valgrind] =3D &quot;--enable-valgrind=
=3Dyes,--<br>
&gt; disable-valgrind,valgrind&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[egl] =3D &quot;--enable-egl=3Dyes,--disable-egl,vi=
rtual/egl&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[glesv2] =3D &quot;--enable-glesv2,--disable-<br>
&gt; glesv2,virtual/libgles2&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[opengl] =3D &quot;--enable-gl,--disable-gl,virtual=
/libgl&quot;<br>
&gt; +PACKAGECONFIG[trace] =3D &quot;--enable-trace,--disable-trace&quot;<b=
r>
&gt; <br>
&gt;=C2=A0 EXTRA_OECONF +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;TARGET_FPU&#39;, &#39;so=
ft&#39;, &#39;--disable-some-floating-<br>
&gt; point&#39;, &#39;&#39;, d)} \<br>
&gt; --<br>
&gt; 2.21.0<br>
&gt; <br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000001ba5b0059a4ac957--
