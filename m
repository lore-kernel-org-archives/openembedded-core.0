Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.14357.1617358552625224109
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Apr 2021 03:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PvCBDrjp;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id u17so532942ejk.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Apr 2021 03:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HJ4OJyhUM7EoFjLREsERnoyUiIFiUQMNE8w7w1fcrUQ=;
        b=PvCBDrjpO4RXQpVaUwCyWkXMkcfLvDsNLGccoA52Xb+YMueclgSVNuUCXz+KPvol/4
         ++CPk4Rml7637GmENsHJirtTENDmydBumOAc4e3cQf7in6cdNnS4/68JC45ti+0yi9LQ
         S6H5mtWq65b7hICuIFhJ+GA3r/FWjhTqNBBtZ9XXwSwMC43uEnOtH8xTfvXsq8apXUL6
         CYDUqgOND5+eSJZQf2PeWk94jfNAAvJ+DxJNPAXb8NjktSU3WAt1NVfyimzLK+lQ8zM9
         P+riGGqvzrzBHOk9d/iVlOy8weZW8ruCqAJUkeVOUtvqSu9uenJuNyPAG6IqscJePKsj
         Rk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HJ4OJyhUM7EoFjLREsERnoyUiIFiUQMNE8w7w1fcrUQ=;
        b=KEbQ9i1bAEaCNVvbxStsdCVoD8II0+fZa7fBCZVBwyMvZWiLHXMk5wF1RYT3YXvgEP
         922ar4ASM32PBeoFq/z8xXKCCvLrz23HeGaGnKYt1mbyhjdVClBjx4fsGJkAFcqyCTnR
         AToTqOV4GdcW2+B4X4NroBRn4Q9Kbf4Aek7HqEHi86VRTc+uU2WNSNgDh+SVP9ndbvAn
         Ltzd+jzqeQ69nDR+PbTZuM+7OI0jMPsSSarhVFvO0UFrjhwcEKSZUMN99skYWAzNtyQ+
         UYnvMKxzlNEO6+W5hwWFyTnf6vHpaZPYuRgQShfGNyfGr8HajbyvDV58IKjc1Ogn+HJ9
         4OIQ==
X-Gm-Message-State: AOAM533cMpyNO9N6ytKD0I065XwkRELXDcvOh3YlD8XIt4NhfRfW2KBR
	BZ353Hj6piwd6qbD3ns7kY1S/gd6XLaf5lZ3Bbo=
X-Google-Smtp-Source: ABdhPJz1LgWyLvt+Ku30hYKMX8RyB0qVfnEbNHQVJHVDVhL5YuJJqmkMcrc2nS5CzfzHNXtNRdSFPaltq7aX8lRUjE4=
X-Received: by 2002:a17:906:ce4e:: with SMTP id se14mr134666ejb.54.1617358550872;
 Fri, 02 Apr 2021 03:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210331225051.3823769-1-raj.khem@gmail.com> <20210401101908.qsyswliokyze37tm@jama>
 <CAMKF1srP43Xoew=7=R7XDJsDX5-dHp6z0UXPbPJ6-GSogDdxmg@mail.gmail.com>
In-Reply-To: <CAMKF1srP43Xoew=7=R7XDJsDX5-dHp6z0UXPbPJ6-GSogDdxmg@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 2 Apr 2021 12:15:39 +0200
Message-ID: <CA+chaQd7XR9rY9Yz3dJrtJC2Lg2DjJYugGXQdkGEqjjqaQUKSw@mail.gmail.com>
Subject: Re: [PATCH] mesa-gl: Use swrast gallium driver
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e636eb05befaa165"

--000000000000e636eb05befaa165
Content-Type: text/plain; charset="UTF-8"

Unfortunately it still fails the same for qemux86* with this change.

Enabling wayland PACKAGECONFIG doesn't help as well.

Building for qemuarm with empty DRIDRIVERS does pass the do_configure with:
EXTRA_OEMESON="     -Dshared-glapi=enabled     -Dgallium-opencl=disabled
  -Dglx-read-only-text=true     -Dplatforms='wayland'   -Ddri-drivers=
 -Ddri3=disabled  -Degl=disabled  -Delf-tls=false
-Dgallium-drivers=swrast,swrast  -Dllvm=disabled -Dgbm=disabled  -D
gles1=disabled -Dgles2=disabled -Dopengl=true -Dosmesa=true
-Dlibunwind=disabled -Dgallium-va=disabled -Dgallium-vdpau=disabled
 -Dvulkan-drivers='' -Dglx=disabled  -Dgallium-xa=disabled
-Dgallium-xvmc=disabled"

which is a bit surprising as mesa-gl_21.0.0.bb comment says:
# When NOT using X11, we need to make sure we have at least one driver
enabled
and now the only build which isn't broken by the 21 upgrade is the one
without any driver.

and x86 and x86-64 always enable some DRIDRIVERS in mesa.inc:
DRIDRIVERS_class-native = "nouveau"
DRIDRIVERS_class-nativesdk = "nouveau"
DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"

Maybe this upgrade to development version 21.0.0 should be reverted and
21.0.1 should be merged after this meta-gl breakage is resolved somehow?

On Thu, Apr 1, 2021 at 3:58 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Apr 1, 2021 at 3:19 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > On Wed, Mar 31, 2021 at 03:50:51PM -0700, Khem Raj wrote:
> > > Fixes
> > > ../mesa-21.0.0/meson.build:21:0: ERROR: Options "swrast" are not in
> allowed choices: "auto, i915, i965, r100, r200, nouveau"
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> > > index e50782be1c..fc8b4f7504 100644
> > > --- a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> > > +++ b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> > > @@ -12,4 +12,4 @@ PACKAGECONFIG ??= "opengl dri
> ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x1
> > >  PACKAGECONFIG_class-target = "opengl dri
> ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
> > >
> > >  # When NOT using X11, we need to make sure we have swrast available.
> > > -DRIDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> '', ',swrast', d)}"
> > > +GALLIUMDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', '', ',swrast', d)}"
> >
> > With:
> > DISTRO_FEATURES_remove = "x11"
> > PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
> > PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
> > in local.conf this is unfortunately still failing, now with:
> >
> > ../mesa-21.0.0/meson.build:519:4: ERROR: Problem encountered: building
> dri drivers require at least one windowing system
> >
> > whole log:
> > http://errors.yoctoproject.org/Errors/Details/575265/
> >
> > adding nouveau to DRIDRIVERS like normal mesa doesn't help in this case,
> > because I was building for qemux86-64 which already has bunch of
> > DRIDRIVERS added by default (but adding at least one DRIDRIVER might be
> still
> > needed for other architectures).
> >
>
> classic OSMesa is removed and swrast gallium drivers are needed for osmsa
> to run
> could you also add below patch and try. ?
>
>
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> index fc8b4f7504..47b14fb97f 100644
> --- a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> +++ b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> @@ -8,8 +8,8 @@ S = "${WORKDIR}/mesa-${PV}"
>
> # At least one DRI rendering engine is required to build mesa.
> # When no X11 is available, use osmesa for the rendering engine.
> -PACKAGECONFIG ??= "opengl dri ${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', 'x11', 'osmesa', d)}"
> -PACKAGECONFIG_class-target = "opengl dri
> ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
> +PACKAGECONFIG ??= "opengl dri ${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', 'x11', 'osmesa gallium', d)}"
> +PACKAGECONFIG_class-target = "opengl dri
> ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa
> gallium', d)}"
>
> # When NOT using X11, we need to make sure we have swrast available.
> GALLIUMDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', '', ',swrast', d)}"
>
>
> > # $DRIDRIVERS [4 operations]
> > #   _append[x86_class-target]
> /OE/build/oe-core/openembedded-core/meta/recipes-graphics/mesa/mesa.inc:107
> > #     ",r100,r200,nouveau,i965,i915"
> > #   _append[x86-64_class-target]
> /OE/build/oe-core/openembedded-core/meta/recipes-graphics/mesa/mesa.inc:108
> > #     ",r100,r200,nouveau,i965,i915"
> > #   override[class-native]:set
> /OE/build/oe-core/openembedded-core/meta/recipes-graphics/mesa/mesa.inc:105
> > #     "nouveau"
> > #   override[class-nativesdk]:set
> /OE/build/oe-core/openembedded-core/meta/recipes-graphics/mesa/mesa.inc:106
> > #     "nouveau"
> > # pre-expansion value:
> > #   ",r100,r200,nouveau,i965,i915"
> > DRIDRIVERS=",r100,r200,nouveau,i965,i915"
> >
> > Reverting Alex's upgrade to 21.0.0 allows to build mesa-gl again and it
> should surely pass AB build :).
>

--000000000000e636eb05befaa165
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Unfortunately it still fails the same for qemux86* with th=
is change.<div><br></div><div>Enabling wayland PACKAGECONFIG doesn&#39;t he=
lp as well.</div><div><br></div><div>Building for qemuarm with empty DRIDRI=
VERS does pass the do_configure with:</div><div>EXTRA_OEMESON=3D&quot; =C2=
=A0 =C2=A0 -Dshared-glapi=3Denabled =C2=A0 =C2=A0 -Dgallium-opencl=3Ddisabl=
ed =C2=A0 =C2=A0 -Dglx-read-only-text=3Dtrue =C2=A0 =C2=A0 -Dplatforms=3D&#=
39;wayland&#39; =C2=A0 -Ddri-drivers=3D =C2=A0-Ddri3=3Ddisabled =C2=A0-Degl=
=3Ddisabled =C2=A0-Delf-tls=3Dfalse -Dgallium-drivers=3Dswrast,swrast =C2=
=A0-Dllvm=3Ddisabled -Dgbm=3Ddisabled =C2=A0-D<br>gles1=3Ddisabled -Dgles2=
=3Ddisabled -Dopengl=3Dtrue -Dosmesa=3Dtrue -Dlibunwind=3Ddisabled -Dgalliu=
m-va=3Ddisabled -Dgallium-vdpau=3Ddisabled =C2=A0-Dvulkan-drivers=3D&#39;&#=
39; -Dglx=3Ddisabled =C2=A0-Dgallium-xa=3Ddisabled -Dgallium-xvmc=3Ddisable=
d&quot;<br></div><div><br></div><div>which is a bit surprising as=C2=A0<a h=
ref=3D"http://mesa-gl_21.0.0.bb">mesa-gl_21.0.0.bb</a> comment says:</div><=
div># When NOT using X11, we need to make sure we have at least one driver =
enabled<br></div><div>and now the only build which isn&#39;t broken by the =
21 upgrade is the one without any driver.</div><div><br></div><div>and x86 =
and x86-64 always enable some DRIDRIVERS in mesa.inc:</div><div>DRIDRIVERS_=
class-native =3D &quot;nouveau&quot;<br>DRIDRIVERS_class-nativesdk =3D &quo=
t;nouveau&quot;<br>DRIDRIVERS_append_x86_class-target =3D &quot;,r100,r200,=
nouveau,i965,i915&quot;<br>DRIDRIVERS_append_x86-64_class-target =3D &quot;=
,r100,r200,nouveau,i965,i915&quot;<br></div><div><br></div><div>Maybe this =
upgrade to development version 21.0.0 should be reverted and 21.0.1 should =
be merged after this meta-gl breakage is resolved somehow?</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr=
 1, 2021 at 3:58 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.=
khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Thu, Apr 1, 2021 at 3:19 AM Martin Jansa &lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t; wrote:<br>
&gt;<br>
&gt; On Wed, Mar 31, 2021 at 03:50:51PM -0700, Khem Raj wrote:<br>
&gt; &gt; Fixes<br>
&gt; &gt; ../mesa-21.0.0/meson.build:21:0: ERROR: Options &quot;swrast&quot=
; are not in allowed choices: &quot;auto, i915, i965, r100, r200, nouveau&q=
uot;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; Cc: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0=
.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a> | 2 +-<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl=
_21.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a> b/me=
ta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
&gt; &gt; index e50782be1c..fc8b4f7504 100644<br>
&gt; &gt; --- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0=
.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
&gt; &gt; +++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0=
.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
&gt; &gt; @@ -12,4 +12,4 @@ PACKAGECONFIG ??=3D &quot;opengl dri ${@bb.util=
s.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x1<br>
&gt; &gt;=C2=A0 PACKAGECONFIG_class-target =3D &quot;opengl dri ${@bb.utils=
.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x11&#39;, &#39;osm=
esa&#39;, d)}&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 # When NOT using X11, we need to make sure we have swrast a=
vailable.<br>
&gt; &gt; -DRIDRIVERS_append =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEA=
TURES&#39;, &#39;x11&#39;, &#39;&#39;, &#39;,swrast&#39;, d)}&quot;<br>
&gt; &gt; +GALLIUMDRIVERS_append =3D &quot;${@bb.utils.contains(&#39;DISTRO=
_FEATURES&#39;, &#39;x11&#39;, &#39;&#39;, &#39;,swrast&#39;, d)}&quot;<br>
&gt;<br>
&gt; With:<br>
&gt; DISTRO_FEATURES_remove =3D &quot;x11&quot;<br>
&gt; PREFERRED_PROVIDER_virtual/libgl =3D &quot;mesa-gl&quot;<br>
&gt; PREFERRED_PROVIDER_virtual/mesa =3D &quot;mesa-gl&quot;<br>
&gt; in local.conf this is unfortunately still failing, now with:<br>
&gt;<br>
&gt; ../mesa-21.0.0/meson.build:519:4: ERROR: Problem encountered: building=
 dri drivers require at least one windowing system<br>
&gt;<br>
&gt; whole log:<br>
&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/575265/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Det=
ails/575265/</a><br>
&gt;<br>
&gt; adding nouveau to DRIDRIVERS like normal mesa doesn&#39;t help in this=
 case,<br>
&gt; because I was building for qemux86-64 which already has bunch of<br>
&gt; DRIDRIVERS added by default (but adding at least one DRIDRIVER might b=
e still<br>
&gt; needed for other architectures).<br>
&gt;<br>
<br>
classic OSMesa is removed and swrast gallium drivers are needed for osmsa t=
o run<br>
could you also add below patch and try. ?<br>
<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0.bb=
" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0.bb" rel=3D"no=
referrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
index fc8b4f7504..47b14fb97f 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
@@ -8,8 +8,8 @@ S =3D &quot;${WORKDIR}/mesa-${PV}&quot;<br>
<br>
# At least one DRI rendering engine is required to build mesa.<br>
# When no X11 is available, use osmesa for the rendering engine.<br>
-PACKAGECONFIG ??=3D &quot;opengl dri ${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;,<br>
&#39;x11&#39;, &#39;x11&#39;, &#39;osmesa&#39;, d)}&quot;<br>
-PACKAGECONFIG_class-target =3D &quot;opengl dri<br>
${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x11&#39=
;, &#39;osmesa&#39;, d)}&quot;<br>
+PACKAGECONFIG ??=3D &quot;opengl dri ${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;,<br>
&#39;x11&#39;, &#39;x11&#39;, &#39;osmesa gallium&#39;, d)}&quot;<br>
+PACKAGECONFIG_class-target =3D &quot;opengl dri<br>
${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x11&#39=
;, &#39;osmesa<br>
gallium&#39;, d)}&quot;<br>
<br>
# When NOT using X11, we need to make sure we have swrast available.<br>
GALLIUMDRIVERS_append =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#=
39;,<br>
&#39;x11&#39;, &#39;&#39;, &#39;,swrast&#39;, d)}&quot;<br>
<br>
<br>
&gt; # $DRIDRIVERS [4 operations]<br>
&gt; #=C2=A0 =C2=A0_append[x86_class-target] /OE/build/oe-core/openembedded=
-core/meta/recipes-graphics/mesa/mesa.inc:107<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;,r100,r200,nouveau,i965,i915&quot;<br>
&gt; #=C2=A0 =C2=A0_append[x86-64_class-target] /OE/build/oe-core/openembed=
ded-core/meta/recipes-graphics/mesa/mesa.inc:108<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;,r100,r200,nouveau,i965,i915&quot;<br>
&gt; #=C2=A0 =C2=A0override[class-native]:set /OE/build/oe-core/openembedde=
d-core/meta/recipes-graphics/mesa/mesa.inc:105<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;nouveau&quot;<br>
&gt; #=C2=A0 =C2=A0override[class-nativesdk]:set /OE/build/oe-core/openembe=
dded-core/meta/recipes-graphics/mesa/mesa.inc:106<br>
&gt; #=C2=A0 =C2=A0 =C2=A0&quot;nouveau&quot;<br>
&gt; # pre-expansion value:<br>
&gt; #=C2=A0 =C2=A0&quot;,r100,r200,nouveau,i965,i915&quot;<br>
&gt; DRIDRIVERS=3D&quot;,r100,r200,nouveau,i965,i915&quot;<br>
&gt;<br>
&gt; Reverting Alex&#39;s upgrade to 21.0.0 allows to build mesa-gl again a=
nd it should surely pass AB build :).<br>
</blockquote></div>

--000000000000e636eb05befaa165--
