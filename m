Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web08.19825.1617384867255459900
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Apr 2021 10:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XHNrN9QG;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id v23so1633573uaq.13
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Apr 2021 10:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XV6IPSXc4CO15hD+SfAlGi6ZYaIzwH6Y9SBAkeTTnJ8=;
        b=XHNrN9QGonPROc8EVcPoC/vESbP6TEI0PH6wIDMQ68CU2u0B+QHUzpghcpwkExRiC8
         qLKLPTifLNUTqLqefP462arpbYo/72l32KUGTNd4EhL522bHLIVR6gukBk7JOLt9Xl2K
         dP7VppQAFABmeFVRgO4515cCyj4J57VJltLPLXqIu154DhPhNBxShJfnU1RY3kgTftrr
         HKOw0oL21ZqOAMEYQuT5Gi0ncP+gxoJ6+EjcEY2584vNcJFN1sxmgOMrD24dGsvWbdJT
         OBXq9L921fQIYGkXoN8xwLLEwOJ5hoHq3Ui3Qa/8Vca+UoWQR/GPJ5k0rWluf02ftf1E
         y/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XV6IPSXc4CO15hD+SfAlGi6ZYaIzwH6Y9SBAkeTTnJ8=;
        b=gNurW5CW0B/kGfhe/5p/iqb181MpgcOfPFWPReBrmoxL3440+nmMXwLhqDftpUzH7j
         bCLpVdM80i/tPY1OkCPrS87UqzPilUYJrF22u61nMjxJrQCH3VNbfSUWe0hrwagYYGaI
         uavSB3Rofy5ZrDe9+ejTrhAevO6QIUOn+gMR8v8P7bfKvSe4ZouleKH0rxP7IetVQIrC
         2yq6U6dYU9dMKq9Cb3D5pwJ9R0H8Y7GAxHGZzpIUe+u7t1jaLbzXj6b7enHk/92fmTad
         W6c24gQXWa4wgaC+4zKcw4B0vkYPjQnsEiQ7lb3hQ2N5jR6PqkqiqnQ1FRBbMDTIxVso
         ENMA==
X-Gm-Message-State: AOAM531Vo/WwxxO/tiCELz25ne73PkIx85KmrO25MD4PCAtZmSAbysg7
	C4JNLM5/YVnauKGybxsesLPiHpxBdlVCN+yuy5o=
X-Google-Smtp-Source: ABdhPJzCN2rZrBwKTmGH4k7nvUpxYGWYazbFqpn+09UUE/WmIGPLN2GeQFt0tza2SZU9bvmnDKAxGrNNGIEuhk8DubM=
X-Received: by 2002:ab0:2a92:: with SMTP id h18mr9094585uar.22.1617384866372;
 Fri, 02 Apr 2021 10:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210331225051.3823769-1-raj.khem@gmail.com> <20210401101908.qsyswliokyze37tm@jama>
 <CAMKF1srP43Xoew=7=R7XDJsDX5-dHp6z0UXPbPJ6-GSogDdxmg@mail.gmail.com>
 <CA+chaQd7XR9rY9Yz3dJrtJC2Lg2DjJYugGXQdkGEqjjqaQUKSw@mail.gmail.com>
 <CAMKF1srEkJwqGU2ydh8DREiTmtC0+VLRUziMKRJftVN+75-1qA@mail.gmail.com> <CANNYZj_ca+FqWYKk-2-Kd3rAR4eb3bOfdn-TigQu-VCeKpp1yw@mail.gmail.com>
In-Reply-To: <CANNYZj_ca+FqWYKk-2-Kd3rAR4eb3bOfdn-TigQu-VCeKpp1yw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 2 Apr 2021 19:34:14 +0200
Message-ID: <CANNYZj96LMBpdABsmv2Xf+sGW1nn+SZi547XU3JOEAjPMKr_yw@mail.gmail.com>
Subject: Re: [PATCH] mesa-gl: Use swrast gallium driver
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, Ross Burton <ross@burtonini.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006cddbc05bf00c2fb"

--0000000000006cddbc05bf00c2fb
Content-Type: text/plain; charset="UTF-8"

Link: https://lists.freedesktop.org/archives/mesa-dev/2021-March/224984.html

Alex

On Fri, 2 Apr 2021 at 19:32, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> I think we should actually disable dri (non-gallium) drivers altogether.
> They're only useful for ancient x86 hardware, and upstream is talking about
> removing them from mainline branch and onto a legacy branch in 21.2
> timeframe.
>
> Alex
>
> On Fri, 2 Apr 2021 at 19:30, Khem Raj <raj.khem@gmail.com> wrote:
>
>> yeah we need to start using nouveau dri driver perhaps instead of swrast
>>
>> On Fri, Apr 2, 2021 at 3:15 AM Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> >
>> > Unfortunately it still fails the same for qemux86* with this change.
>> >
>> > Enabling wayland PACKAGECONFIG doesn't help as well.
>> >
>> > Building for qemuarm with empty DRIDRIVERS does pass the do_configure
>> with:
>> > EXTRA_OEMESON="     -Dshared-glapi=enabled
>>  -Dgallium-opencl=disabled     -Dglx-read-only-text=true
>>  -Dplatforms='wayland'   -Ddri-drivers=  -Ddri3=disabled  -Degl=disabled
>> -Delf-tls=false -Dgallium-drivers=swrast,swrast  -Dllvm=disabled
>> -Dgbm=disabled  -D
>> > gles1=disabled -Dgles2=disabled -Dopengl=true -Dosmesa=true
>> -Dlibunwind=disabled -Dgallium-va=disabled -Dgallium-vdpau=disabled
>> -Dvulkan-drivers='' -Dglx=disabled  -Dgallium-xa=disabled
>> -Dgallium-xvmc=disabled"
>> >
>> > which is a bit surprising as mesa-gl_21.0.0.bb comment says:
>> > # When NOT using X11, we need to make sure we have at least one driver
>> enabled
>> > and now the only build which isn't broken by the 21 upgrade is the one
>> without any driver.
>> >
>> > and x86 and x86-64 always enable some DRIDRIVERS in mesa.inc:
>> > DRIDRIVERS_class-native = "nouveau"
>> > DRIDRIVERS_class-nativesdk = "nouveau"
>> > DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
>> > DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
>> >
>> > Maybe this upgrade to development version 21.0.0 should be reverted and
>> 21.0.1 should be merged after this meta-gl breakage is resolved somehow?
>> >
>> > On Thu, Apr 1, 2021 at 3:58 PM Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> On Thu, Apr 1, 2021 at 3:19 AM Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> >> >
>> >> > On Wed, Mar 31, 2021 at 03:50:51PM -0700, Khem Raj wrote:
>> >> > > Fixes
>> >> > > ../mesa-21.0.0/meson.build:21:0: ERROR: Options "swrast" are not
>> in allowed choices: "auto, i915, i965, r100, r200, nouveau"
>> >> > >
>> >> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> > > Cc: Martin Jansa <Martin.Jansa@gmail.com>
>> >> > > ---
>> >> > >  meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb | 2 +-
>> >> > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >> > >
>> >> > > diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>> b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>> >> > > index e50782be1c..fc8b4f7504 100644
>> >> > > --- a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>> >> > > +++ b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>> >> > > @@ -12,4 +12,4 @@ PACKAGECONFIG ??= "opengl dri
>> ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x1
>> >> > >  PACKAGECONFIG_class-target = "opengl dri
>> ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
>> >> > >
>> >> > >  # When NOT using X11, we need to make sure we have swrast
>> available.
>> >> > > -DRIDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES',
>> 'x11', '', ',swrast', d)}"
>> >> > > +GALLIUMDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES',
>> 'x11', '', ',swrast', d)}"
>> >> >
>> >> > With:
>> >> > DISTRO_FEATURES_remove = "x11"
>> >> > PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
>> >> > PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
>> >> > in local.conf this is unfortunately still failing, now with:
>> >> >
>> >> > ../mesa-21.0.0/meson.build:519:4: ERROR: Problem encountered:
>> building dri drivers require at least one windowing system
>> >> >
>> >> > whole log:
>> >> > http://errors.yoctoproject.org/Errors/Details/575265/
>> >> >
>> >> > adding nouveau to DRIDRIVERS like normal mesa doesn't help in this
>> case,
>> >> > because I was building for qemux86-64 which already has bunch of
>> >> > DRIDRIVERS added by default (but adding at least one DRIDRIVER might
>> be still
>> >> > needed for other architectures).
>> >> >
>> >>
>> >> classic OSMesa is removed and swrast gallium drivers are needed for
>> osmsa to run
>> >> could you also add below patch and try. ?
>> >>
>> >>
>> >> diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>> >> b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>> >> index fc8b4f7504..47b14fb97f 100644
>> >> --- a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>> >> +++ b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
>> >> @@ -8,8 +8,8 @@ S = "${WORKDIR}/mesa-${PV}"
>> >>
>> >> # At least one DRI rendering engine is required to build mesa.
>> >> # When no X11 is available, use osmesa for the rendering engine.
>> >> -PACKAGECONFIG ??= "opengl dri ${@bb.utils.contains('DISTRO_FEATURES',
>> >> 'x11', 'x11', 'osmesa', d)}"
>> >> -PACKAGECONFIG_class-target = "opengl dri
>> >> ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
>> >> +PACKAGECONFIG ??= "opengl dri ${@bb.utils.contains('DISTRO_FEATURES',
>> >> 'x11', 'x11', 'osmesa gallium', d)}"
>> >> +PACKAGECONFIG_class-target = "opengl dri
>> >> ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa
>> >> gallium', d)}"
>> >>
>> >> # When NOT using X11, we need to make sure we have swrast available.
>> >> GALLIUMDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES',
>> >> 'x11', '', ',swrast', d)}"
>> >>
>> >>
>> >> > # $DRIDRIVERS [4 operations]
>> >> > #   _append[x86_class-target]
>> /OE/build/oe-core/openembedded-core/meta/recipes-graphics/mesa/mesa.inc:107
>> >> > #     ",r100,r200,nouveau,i965,i915"
>> >> > #   _append[x86-64_class-target]
>> /OE/build/oe-core/openembedded-core/meta/recipes-graphics/mesa/mesa.inc:108
>> >> > #     ",r100,r200,nouveau,i965,i915"
>> >> > #   override[class-native]:set
>> /OE/build/oe-core/openembedded-core/meta/recipes-graphics/mesa/mesa.inc:105
>> >> > #     "nouveau"
>> >> > #   override[class-nativesdk]:set
>> /OE/build/oe-core/openembedded-core/meta/recipes-graphics/mesa/mesa.inc:106
>> >> > #     "nouveau"
>> >> > # pre-expansion value:
>> >> > #   ",r100,r200,nouveau,i965,i915"
>> >> > DRIDRIVERS=",r100,r200,nouveau,i965,i915"
>> >> >
>> >> > Reverting Alex's upgrade to 21.0.0 allows to build mesa-gl again and
>> it should surely pass AB build :).
>>
>

--0000000000006cddbc05bf00c2fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Link: <a href=3D"https://lists.freedesktop.org/archiv=
es/mesa-dev/2021-March/224984.html">https://lists.freedesktop.org/archives/=
mesa-dev/2021-March/224984.html</a></div><div><br></div><div>Alex<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Fri, 2 Apr 2021 at 19:32, Alexander Kanavin &lt;<a href=3D"mailto:alex.k=
anavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>I think we sh=
ould actually disable dri (non-gallium) drivers altogether. They&#39;re onl=
y useful for ancient x86 hardware, and upstream is talking about removing t=
hem from mainline branch and onto a legacy branch in 21.2 timeframe.</div><=
div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, 2 Apr 2021 at 19:30, Khem Raj &lt;=
<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">y=
eah we need to start using nouveau dri driver perhaps instead of swrast<br>
<br>
On Fri, Apr 2, 2021 at 3:15 AM Martin Jansa &lt;<a href=3D"mailto:martin.ja=
nsa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Unfortunately it still fails the same for qemux86* with this change.<b=
r>
&gt;<br>
&gt; Enabling wayland PACKAGECONFIG doesn&#39;t help as well.<br>
&gt;<br>
&gt; Building for qemuarm with empty DRIDRIVERS does pass the do_configure =
with:<br>
&gt; EXTRA_OEMESON=3D&quot;=C2=A0 =C2=A0 =C2=A0-Dshared-glapi=3Denabled=C2=
=A0 =C2=A0 =C2=A0-Dgallium-opencl=3Ddisabled=C2=A0 =C2=A0 =C2=A0-Dglx-read-=
only-text=3Dtrue=C2=A0 =C2=A0 =C2=A0-Dplatforms=3D&#39;wayland&#39;=C2=A0 =
=C2=A0-Ddri-drivers=3D=C2=A0 -Ddri3=3Ddisabled=C2=A0 -Degl=3Ddisabled=C2=A0=
 -Delf-tls=3Dfalse -Dgallium-drivers=3Dswrast,swrast=C2=A0 -Dllvm=3Ddisable=
d -Dgbm=3Ddisabled=C2=A0 -D<br>
&gt; gles1=3Ddisabled -Dgles2=3Ddisabled -Dopengl=3Dtrue -Dosmesa=3Dtrue -D=
libunwind=3Ddisabled -Dgallium-va=3Ddisabled -Dgallium-vdpau=3Ddisabled=C2=
=A0 -Dvulkan-drivers=3D&#39;&#39; -Dglx=3Ddisabled=C2=A0 -Dgallium-xa=3Ddis=
abled -Dgallium-xvmc=3Ddisabled&quot;<br>
&gt;<br>
&gt; which is a bit surprising as <a href=3D"http://mesa-gl_21.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a> comment says:<br>
&gt; # When NOT using X11, we need to make sure we have at least one driver=
 enabled<br>
&gt; and now the only build which isn&#39;t broken by the 21 upgrade is the=
 one without any driver.<br>
&gt;<br>
&gt; and x86 and x86-64 always enable some DRIDRIVERS in mesa.inc:<br>
&gt; DRIDRIVERS_class-native =3D &quot;nouveau&quot;<br>
&gt; DRIDRIVERS_class-nativesdk =3D &quot;nouveau&quot;<br>
&gt; DRIDRIVERS_append_x86_class-target =3D &quot;,r100,r200,nouveau,i965,i=
915&quot;<br>
&gt; DRIDRIVERS_append_x86-64_class-target =3D &quot;,r100,r200,nouveau,i96=
5,i915&quot;<br>
&gt;<br>
&gt; Maybe this upgrade to development version 21.0.0 should be reverted an=
d 21.0.1 should be merged after this meta-gl breakage is resolved somehow?<=
br>
&gt;<br>
&gt; On Thu, Apr 1, 2021 at 3:58 PM Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Apr 1, 2021 at 3:19 AM Martin Jansa &lt;<a href=3D"mailto:=
martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wr=
ote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Wed, Mar 31, 2021 at 03:50:51PM -0700, Khem Raj wrote:<br>
&gt;&gt; &gt; &gt; Fixes<br>
&gt;&gt; &gt; &gt; ../mesa-21.0.0/meson.build:21:0: ERROR: Options &quot;sw=
rast&quot; are not in allowed choices: &quot;auto, i915, i965, r100, r200, =
nouveau&quot;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; &gt; Cc: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmai=
l.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt;&gt; &gt; &gt; ---<br>
&gt;&gt; &gt; &gt;=C2=A0 meta/recipes-graphics/mesa/<a href=3D"http://mesa-=
gl_21.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a> | =
2 +-<br>
&gt;&gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http:=
//mesa-gl_21.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb=
</a> b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
&gt;&gt; &gt; &gt; index e50782be1c..fc8b4f7504 100644<br>
&gt;&gt; &gt; &gt; --- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-=
gl_21.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br=
>
&gt;&gt; &gt; &gt; +++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-=
gl_21.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br=
>
&gt;&gt; &gt; &gt; @@ -12,4 +12,4 @@ PACKAGECONFIG ??=3D &quot;opengl dri $=
{@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x1<br>
&gt;&gt; &gt; &gt;=C2=A0 PACKAGECONFIG_class-target =3D &quot;opengl dri ${=
@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x11&#39;,=
 &#39;osmesa&#39;, d)}&quot;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;=C2=A0 # When NOT using X11, we need to make sure we have=
 swrast available.<br>
&gt;&gt; &gt; &gt; -DRIDRIVERS_append =3D &quot;${@bb.utils.contains(&#39;D=
ISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;&#39;, &#39;,swrast&#39;, d)}&quot=
;<br>
&gt;&gt; &gt; &gt; +GALLIUMDRIVERS_append =3D &quot;${@bb.utils.contains(&#=
39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;&#39;, &#39;,swrast&#39;, d)}&=
quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; With:<br>
&gt;&gt; &gt; DISTRO_FEATURES_remove =3D &quot;x11&quot;<br>
&gt;&gt; &gt; PREFERRED_PROVIDER_virtual/libgl =3D &quot;mesa-gl&quot;<br>
&gt;&gt; &gt; PREFERRED_PROVIDER_virtual/mesa =3D &quot;mesa-gl&quot;<br>
&gt;&gt; &gt; in local.conf this is unfortunately still failing, now with:<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ../mesa-21.0.0/meson.build:519:4: ERROR: Problem encountered:=
 building dri drivers require at least one windowing system<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; whole log:<br>
&gt;&gt; &gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/5752=
65/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Er=
rors/Details/575265/</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; adding nouveau to DRIDRIVERS like normal mesa doesn&#39;t hel=
p in this case,<br>
&gt;&gt; &gt; because I was building for qemux86-64 which already has bunch=
 of<br>
&gt;&gt; &gt; DRIDRIVERS added by default (but adding at least one DRIDRIVE=
R might be still<br>
&gt;&gt; &gt; needed for other architectures).<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; classic OSMesa is removed and swrast gallium drivers are needed fo=
r osmsa to run<br>
&gt;&gt; could you also add below patch and try. ?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_=
21.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
&gt;&gt; b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0.bb" =
rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
&gt;&gt; index fc8b4f7504..47b14fb97f 100644<br>
&gt;&gt; --- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
&gt;&gt; +++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
&gt;&gt; @@ -8,8 +8,8 @@ S =3D &quot;${WORKDIR}/mesa-${PV}&quot;<br>
&gt;&gt;<br>
&gt;&gt; # At least one DRI rendering engine is required to build mesa.<br>
&gt;&gt; # When no X11 is available, use osmesa for the rendering engine.<b=
r>
&gt;&gt; -PACKAGECONFIG ??=3D &quot;opengl dri ${@bb.utils.contains(&#39;DI=
STRO_FEATURES&#39;,<br>
&gt;&gt; &#39;x11&#39;, &#39;x11&#39;, &#39;osmesa&#39;, d)}&quot;<br>
&gt;&gt; -PACKAGECONFIG_class-target =3D &quot;opengl dri<br>
&gt;&gt; ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#3=
9;x11&#39;, &#39;osmesa&#39;, d)}&quot;<br>
&gt;&gt; +PACKAGECONFIG ??=3D &quot;opengl dri ${@bb.utils.contains(&#39;DI=
STRO_FEATURES&#39;,<br>
&gt;&gt; &#39;x11&#39;, &#39;x11&#39;, &#39;osmesa gallium&#39;, d)}&quot;<=
br>
&gt;&gt; +PACKAGECONFIG_class-target =3D &quot;opengl dri<br>
&gt;&gt; ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#3=
9;x11&#39;, &#39;osmesa<br>
&gt;&gt; gallium&#39;, d)}&quot;<br>
&gt;&gt;<br>
&gt;&gt; # When NOT using X11, we need to make sure we have swrast availabl=
e.<br>
&gt;&gt; GALLIUMDRIVERS_append =3D &quot;${@bb.utils.contains(&#39;DISTRO_F=
EATURES&#39;,<br>
&gt;&gt; &#39;x11&#39;, &#39;&#39;, &#39;,swrast&#39;, d)}&quot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; # $DRIDRIVERS [4 operations]<br>
&gt;&gt; &gt; #=C2=A0 =C2=A0_append[x86_class-target] /OE/build/oe-core/ope=
nembedded-core/meta/recipes-graphics/mesa/mesa.inc:107<br>
&gt;&gt; &gt; #=C2=A0 =C2=A0 =C2=A0&quot;,r100,r200,nouveau,i965,i915&quot;=
<br>
&gt;&gt; &gt; #=C2=A0 =C2=A0_append[x86-64_class-target] /OE/build/oe-core/=
openembedded-core/meta/recipes-graphics/mesa/mesa.inc:108<br>
&gt;&gt; &gt; #=C2=A0 =C2=A0 =C2=A0&quot;,r100,r200,nouveau,i965,i915&quot;=
<br>
&gt;&gt; &gt; #=C2=A0 =C2=A0override[class-native]:set /OE/build/oe-core/op=
enembedded-core/meta/recipes-graphics/mesa/mesa.inc:105<br>
&gt;&gt; &gt; #=C2=A0 =C2=A0 =C2=A0&quot;nouveau&quot;<br>
&gt;&gt; &gt; #=C2=A0 =C2=A0override[class-nativesdk]:set /OE/build/oe-core=
/openembedded-core/meta/recipes-graphics/mesa/mesa.inc:106<br>
&gt;&gt; &gt; #=C2=A0 =C2=A0 =C2=A0&quot;nouveau&quot;<br>
&gt;&gt; &gt; # pre-expansion value:<br>
&gt;&gt; &gt; #=C2=A0 =C2=A0&quot;,r100,r200,nouveau,i965,i915&quot;<br>
&gt;&gt; &gt; DRIDRIVERS=3D&quot;,r100,r200,nouveau,i965,i915&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Reverting Alex&#39;s upgrade to 21.0.0 allows to build mesa-g=
l again and it should surely pass AB build :).<br>
</blockquote></div>
</blockquote></div>

--0000000000006cddbc05bf00c2fb--
