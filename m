Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web12.20434.1585163072061225240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 12:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lWKSJUIK;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id z125so2216166vsb.13
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2020 12:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dip71I3W/jPb1hMmVJuiKzylFU2hsQcq82ItPOGeMas=;
        b=lWKSJUIKNiAR3jI7cFDyJGZ19//J1ryrYTfQm8aNlmHcxTw9niEtrjyMbQZ2dxdfuf
         4jeuA3McaVrQqLokA1NC0jOI8qOXRlx/MHlzjUW/UufNpWailmo5RYBgLWn9NwxSDGEJ
         KoJsJHcLS7tsV+N5D+cU9vQV8+O8kC0upPkrtwwokCXEQtdjA/KvqyTzV5rmhxLEnv9j
         SsEF0kxEoilUXSmHzrm92b0J9zFjDrxoOMeieXSSfGxsMxoGqvyy/CZOji9Q52Szv0y0
         hSP2Avl4IA2luvtFeft3keJyt5HlURUF+IP3o53NfTa78gElW/XskB75zzO0wSGsRdfn
         d60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dip71I3W/jPb1hMmVJuiKzylFU2hsQcq82ItPOGeMas=;
        b=oR4FLCHiQgaf2Z1IgZgeHhLGnwlZLufHhpPPlYfn7PDPerirV4G00W2/8arzO+edNr
         8u1+WD8d9e0psqz4O+FttP1OFj3OMXHKV/4HdF5+pDn4Ywg1LqFDnBpII4xiI1AUaQKz
         oAYe3BiCblQdhv9OQwZf8g3U2jLwXcbim1l+niidwAr7TbAU6urH8tkcSx3ulTpBirUR
         Ylk5VD6ACkmXGKKAk+gvn5oS86dsVDHRyh2N/Q2Cx0VWRw2KcTiI2Tot7T1QSqrUIVJE
         i9SVLYKjehK3sKcLiyFSGHhJS9iKdAxTpQ5yR90rnJsbyWDB8CwBi36ZBWyhDOgwP1fb
         Sx1g==
X-Gm-Message-State: ANhLgQ3pJztdAVs3D4OVUZuW0i532ZYuDrmhynpgCwAW0NqbrHwap1L9
	/Ca6DuilCt//Z6S+uVfGmfWlLr1DB+HglMeuafE=
X-Google-Smtp-Source: ADFU+vuSjFlYms9m0io+S9KUMFrGwMN9JN6cWmLixDhThmW0X1kX8oiPp4vYhu4vVF/zmxLQt5W3Rdnt4gRMyLswtF4=
X-Received: by 2002:a67:ffc6:: with SMTP id w6mr3726138vsq.94.1585163071198;
 Wed, 25 Mar 2020 12:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200325181447.14750-1-mark.hatle@kernel.crashing.org>
 <20200325182129.GD1578@denix.org> <11151.149.199.62.130.1585161676.squirrel@gate.crashing.org>
In-Reply-To: <11151.149.199.62.130.1585161676.squirrel@gate.crashing.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 25 Mar 2020 20:04:19 +0100
Message-ID: <CANNYZj_s6yG2qRnEMv_PrFc6ut2mOfJFNFpBd4EzdhUHe8Xxyw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa-gl: The purpose of mesa-gl is to provide for X11 usage
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Denys Dmytriyenko <denis@denix.org>, "Burton, Ross" <ross.burton@intel.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c51d7e05a1b2895d"

--000000000000c51d7e05a1b2895d
Content-Type: text/plain; charset="UTF-8"

To be honest, I would just take the entire recipe out. It's causing trouble
during updates, isn't being tested neither for builds nor at runtime, and
is supposed to provide some specific configuration which as this discussion
makes clear, nobody seems to quite understand.

Alex

On Wed, 25 Mar 2020 at 19:42, Mark Hatle <mark.hatle@kernel.crashing.org>
wrote:

> > On Wed, Mar 25, 2020 at 01:14:47PM -0500, Mark Hatle wrote:
> >> Trying to build mesa-gl without X11 enabled, results in numerous errors
> >> about being incorrectly configured, such as:
> >>
> >>   ERROR: Problem encountered: building dri drivers require at least one
> >> windowing system or classic osmesa
> >>
> >> After consulting with the author of this recipe, it was clear that it
> >> was only intended for the X11 use-case, so requring X11 should avoid the
> >> error message above.
> >
> > Hmm. That's not good. There are embedded devices that provide EGL/GLES
> > support
> > through own stack, but fall back on MESA for full desktop GL support.
> > That's
> > been working to some extent even with Wayland and w/o X11. With your
> > change
> > that won't be possible any more...
>
>
> Have you tried any of these?  This hasn't been working since Zeus with an
> external libmali and non-X11 configuration.  It returns the error listed
> in the commit message "ERROR: Problem encountered: building dri drivers
> require at least one windowing system or classic osmesa" during
> configuration.
>
> Ross and I talked about it and he said this was specific to X11
> implementation and wasn't meant to work for other implementations.
> (fbdev/QT/etc.)
>
> If Wayland is supposed to work, then someone needs to go in and adjust the
> configuration to also support Wayland.  I don't have any Wayland systems
> to even know what the right configuration COULD be.
>
> The specific configuration I'm running has "OpenGL" in the DISTRO_FEATURE,
> but does NOT have X11 or Wayland".
>
> DISTRO_FEATURES_append = " opengl"
> DISTRO_FEATURES_remove = "x11 wayland"
>
> --Mark
>
> > --
> > Denys
> >
> >
> >> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> >> ---
> >>  meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb | 6 ++++--
> >>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> >> b/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> >> index d4b1c1c454..5674c6b1fe 100644
> >> --- a/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> >> +++ b/meta/recipes-graphics/mesa/mesa-gl_20.0.1.bb
> >> @@ -6,5 +6,7 @@ PROVIDES = "virtual/libgl virtual/mesa"
> >>
> >>  S = "${WORKDIR}/mesa-${PV}"
> >>
> >> -PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES',
> >> 'x11', d)}"
> >> -PACKAGECONFIG_class-target = "opengl dri
> >> ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> >> +REQUIRED_DISTRO_FEATURE = "x11"
> >> +
> >> +PACKAGECONFIG ??= "opengl dri x11"
> >> +PACKAGECONFIG_class-target = "opengl dri x11"
> >> --
> >> 2.17.1
> >>
> >
> >>
> >
>
> 
>

--000000000000c51d7e05a1b2895d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>To be honest, I would just take the entire recipe out=
. It&#39;s causing trouble during updates, isn&#39;t being tested neither f=
or builds nor at runtime, and is supposed to provide some specific configur=
ation which as this discussion makes clear, nobody seems to quite understan=
d.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 25 Mar 2020 at 19:42, Mar=
k Hatle &lt;<a href=3D"mailto:mark.hatle@kernel.crashing.org">mark.hatle@ke=
rnel.crashing.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">&gt; On Wed, Mar 25, 2020 at 01:14:47PM -0500, Mark Hatle =
wrote:<br>
&gt;&gt; Trying to build mesa-gl without X11 enabled, results in numerous =
errors<br>
&gt;&gt; about being incorrectly configured, such as:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0ERROR: Problem encountered: building dri drivers requ=
ire at least one<br>
&gt;&gt; windowing system or classic osmesa<br>
&gt;&gt;<br>
&gt;&gt; After consulting with the author of this recipe, it was clear tha=
t it<br>
&gt;&gt; was only intended for the X11 use-case, so requring X11 should av=
oid the<br>
&gt;&gt; error message above.<br>
&gt;<br>
&gt; Hmm. That&#39;s not good. There are embedded devices that provide EGL=
/GLES<br>
&gt; support<br>
&gt; through own stack, but fall back on MESA for full desktop GL support.=
<br>
&gt; That&#39;s<br>
&gt; been working to some extent even with Wayland and w/o X11. With your<=
br>
&gt; change<br>
&gt; that won&#39;t be possible any more...<br>
<br>
<br>
Have you tried any of these?=C2=A0 This hasn&#39;t been working since Zeus=
 with an<br>
external libmali and non-X11 configuration.=C2=A0 It returns the error lis=
ted<br>
in the commit message &quot;ERROR: Problem encountered: building dri drive=
rs<br>
require at least one windowing system or classic osmesa&quot; during<br>
configuration.<br>
<br>
Ross and I talked about it and he said this was specific to X11<br>
implementation and wasn&#39;t meant to work for other implementations. <br=
>
(fbdev/QT/etc.)<br>
<br>
If Wayland is supposed to work, then someone needs to go in and adjust the=
<br>
configuration to also support Wayland.=C2=A0 I don&#39;t have any Wayland =
systems<br>
to even know what the right configuration COULD be.<br>
<br>
The specific configuration I&#39;m running has &quot;OpenGL&quot; in the D=
ISTRO_FEATURE,<br>
but does NOT have X11 or Wayland&quot;.<br>
<br>
DISTRO_FEATURES_append =3D &quot; opengl&quot;<br>
DISTRO_FEATURES_remove =3D &quot;x11 wayland&quot;<br>
<br>
--Mark<br>
<br>
&gt; --<br>
&gt; Denys<br>
&gt;<br>
&gt;<br>
&gt;&gt; Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@kernel=
.crashing.org" target=3D"_blank">mark.hatle@kernel.crashing.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_20.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_20.0.1.bb</a> | 6 ++++--<=
br>
&gt;&gt;=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl=
_20.0.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_20.0.1.bb</a><br>
&gt;&gt; b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_20.0.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">mesa-gl_20.0.1.bb</a><br>
&gt;&gt; index d4b1c1c454..5674c6b1fe 100644<br>
&gt;&gt; --- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_20.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_20.0.1.bb</a><br>
&gt;&gt; +++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_20.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_20.0.1.bb</a><br>
&gt;&gt; @@ -6,5 +6,7 @@ PROVIDES =3D &quot;virtual/libgl virtual/mesa&quo=
t;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 S =3D &quot;${WORKDIR}/mesa-${PV}&quot;<br>
&gt;&gt;<br>
&gt;&gt; -PACKAGECONFIG ??=3D &quot;opengl dri ${@bb.utils.filter(&#39;DIS=
TRO_FEATURES&#39;,<br>
&gt;&gt; &#39;x11&#39;, d)}&quot;<br>
&gt;&gt; -PACKAGECONFIG_class-target =3D &quot;opengl dri<br>
&gt;&gt; ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, d)}&=
quot;<br>
&gt;&gt; +REQUIRED_DISTRO_FEATURE =3D &quot;x11&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +PACKAGECONFIG ??=3D &quot;opengl dri x11&quot;<br>
&gt;&gt; +PACKAGECONFIG_class-target =3D &quot;opengl dri x11&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.17.1<br>
&gt;&gt;<br>
&gt;<br>
&gt;&gt; <br>
&gt;<br>
<br>
<br>
</blockquote></div>

--000000000000c51d7e05a1b2895d--
