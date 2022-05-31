Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD935C433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 21:06:55 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web09.245.1654031206253518406
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 14:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FutFueo8;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id r1so25354qvz.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 14:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UFC85Qh7V4ayh1nUL+brJN7lW5rCnsCX6Dm2ZFc0a/o=;
        b=FutFueo8Nr9cDCOtkFGUFZ3Hfyj4GYq4c7RXQOmUBw1TdId6W0evcEffEaT0BSZCJO
         7tnh4flXQ/dJeEZf/I1nS/Emu5x6GoE8jbRQLyNJDfccRfOkMrBO+iRRIYNZpu33SPfw
         +blDHm5r0DkF7GKoUWFMtC4NqH3NfLWG+UW7UgrZiZKmoU6mWg6IfmsKjARb8S0LVKXL
         xef04dPP/B09O5K563zzidfiQmcQ7HMFtqHGzzQtcXkHY58cz2cdA/IPex+48PtVpNke
         gXLNAErGO7vVUeTiMIUO2TRsv77/cXS8bvHpjoq6+aOYOa4AsGxkTPoiha8vxhYy3fYS
         +6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UFC85Qh7V4ayh1nUL+brJN7lW5rCnsCX6Dm2ZFc0a/o=;
        b=28YmGYNV7N7dhQtyd70UM0sBYlPLii4wZuNo9PVMzEe2pam70PIeLM+3TQcpUAl0bm
         9KUbxahQFqBWyfNnOdwAql/gD8ZHaZuJg2JXPFxQcnAkIXn2cNmi0tYp+sGXR44QvKLw
         29g+3YiqGhMCAdk7/lwtZb+dlTWv6PCFCZgJcVus8o2+JR5k8OKjb5lMW2I1bpt8NCvA
         /kpdGijqSm1zgBo/k5/k3OdOAko7N6kpm9x9wdjs9URSBMgczLdmQiBCUA+rldqmkVcu
         OiEnRvgiVQbYK9E4IBYokTd6aO9AepOUtwi52XXvcOoY/o1ywASiSxvy8fBhcNpkH49J
         1A6A==
X-Gm-Message-State: AOAM533pnAaTU5BU1SnNAKXQr6xZm+ZkGppG3heJhObddWmVZVDPVUNI
	bc73NdwNSgl+GTlGCATAwoDu+EPZPtH1utRqqU8=
X-Google-Smtp-Source: 
 ABdhPJyDWKuONeHRKPFcgSTkbD/tXre8WXUgbJya6nzB4KLGNvp6Bu8tQow4/4haoxp/wGo3zJTpOmWq1HmIhPMEYy4=
X-Received: by 2002:a05:6214:4118:b0:462:e0c:897f with SMTP id
 kc24-20020a056214411800b004620e0c897fmr48715412qvb.63.1654031205276; Tue, 31
 May 2022 14:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220531190620.186764-1-f_l_k@t-online.de>
 <20220531190620.186764-4-f_l_k@t-online.de>
 <ee7da03f7988fdfb22e800182644de692adfa59c.camel@linuxfoundation.org>
In-Reply-To: 
 <ee7da03f7988fdfb22e800182644de692adfa59c.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 May 2022 14:06:34 -0700
Message-ID: 
 <CAMKF1sq7VsrFzzG=USH4vrivmVeFsk_QqaCNEXiVKDZp-7g6bA@mail.gmail.com>
Subject: Re: [oe-core][PATCH 4/4] libsdl2: dont mix opengl and gles backends
 for wayland
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000701f2805e055260e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 21:06:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166335

--000000000000701f2805e055260e
Content-Type: text/plain; charset="UTF-8"

On Tue, May 31, 2022 at 1:54 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2022-05-31 at 21:06 +0200, Markus Volk wrote:
> > This fixes "Could not initialize egl display" in libsdl2 apps for
> > wayland without DISTRO_FEATURE x11
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > ---
> >  meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> > index 8519e7f732..e057b5cbbc 100644
> > --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> > +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
> > @@ -56,14 +56,16 @@ EXTRA_OECMAKE = "-DSDL_OSS=OFF -DSDL_ESD=OFF
> -DSDL_ARTS=OFF \
> >
> >  # opengl packageconfig factored out to make it easy for distros
> >  # and BSP layers to pick either (desktop) opengl, gles2, or no GL
> > -PACKAGECONFIG_GL ?= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl',
> d)}"
> > +PACKAGECONFIG_GL ?= " \
> > +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '',
> d)} \
> > +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'gles2',
> '', d)} \
> > +"
> >
> >  PACKAGECONFIG:class-native = "x11 ${PACKAGECONFIG_GL}"
> >  PACKAGECONFIG:class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES',
> 'x11', d)} ${PACKAGECONFIG_GL}"
> >  PACKAGECONFIG ??= " \
> >      ${PACKAGECONFIG_GL} \
> > -    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio
> x11', d)} \
> > -    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2',
> '', d)} \
> > +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11
> wayland', d)} \
> >      ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
> >  "
> >  PACKAGECONFIG[alsa]       = "-DSDL_ALSA=ON,-DSDL_ALSA=OFF,alsa-lib,"
>
> If you have opengl, x11 and wayland in DISTRO_FEATURES, does that cause
> an issue? It would seem to change the config?


Right I think wayland + gles + no x11 is a config of its own
It should check that

>
>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166333):
> https://lists.openembedded.org/g/openembedded-core/message/166333
> Mute This Topic: https://lists.openembedded.org/mt/91458802/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000701f2805e055260e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, May 31, 2022 at 1:54 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 2022-=
05-31 at 21:06 +0200, Markus Volk wrote:<br>
&gt; This fixes &quot;Could not initialize egl display&quot; in libsdl2 app=
s for<br>
&gt; wayland without DISTRO_FEATURE x11<br>
&gt; <br>
&gt; Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" ta=
rget=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.22.b=
b" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.22.bb</a> | 8 +++++---<=
br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2=
.0.22.bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.22.bb</a> b/meta=
/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.22.bb" rel=3D"noref=
errer" target=3D"_blank">libsdl2_2.0.22.bb</a><br>
&gt; index 8519e7f732..e057b5cbbc 100644<br>
&gt; --- a/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.22.b=
b" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.22.bb</a><br>
&gt; +++ b/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.0.22.b=
b" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.0.22.bb</a><br>
&gt; @@ -56,14 +56,16 @@ EXTRA_OECMAKE =3D &quot;-DSDL_OSS=3DOFF -DSDL_ESD=
=3DOFF -DSDL_ARTS=3DOFF \<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # opengl packageconfig factored out to make it easy for distros<=
br>
&gt;=C2=A0 # and BSP layers to pick either (desktop) opengl, gles2, or no G=
L<br>
&gt; -PACKAGECONFIG_GL ?=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#=
39;, &#39;opengl&#39;, d)}&quot;<br>
&gt; +PACKAGECONFIG_GL ?=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x1=
1 opengl&#39;, &#39;opengl&#39;, &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;wa=
yland opengl&#39;, &#39;gles2&#39;, &#39;&#39;, d)} \<br>
&gt; +&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PACKAGECONFIG:class-native =3D &quot;x11 ${PACKAGECONFIG_GL}&quo=
t;<br>
&gt;=C2=A0 PACKAGECONFIG:class-nativesdk =3D &quot;${@bb.utils.filter(&#39;=
DISTRO_FEATURES&#39;, &#39;x11&#39;, d)} ${PACKAGECONFIG_GL}&quot;<br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${PACKAGECONFIG_GL} \<br>
&gt; -=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;alsa=
 directfb pulseaudio x11&#39;, d)} \<br>
&gt; -=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;wa=
yland&#39;, &#39;wayland gles2&#39;, &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;alsa=
 directfb pulseaudio x11 wayland&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&quot;TUNE_FEATURES&quot;, &q=
uot;neon&quot;,&quot;arm-neon&quot;,&quot;&quot;,d)} \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 PACKAGECONFIG[alsa]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;-DSDL_AL=
SA=3DON,-DSDL_ALSA=3DOFF,alsa-lib,&quot;<br>
<br>
If you have opengl, x11 and wayland in DISTRO_FEATURES, does that cause<br>
an issue? It would seem to change the config?</blockquote><div dir=3D"auto"=
><br></div><div dir=3D"auto">Right I think wayland + gles + no x11 is a con=
fig of its own</div><div dir=3D"auto">It should check that</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#166333): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/166333" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/166333</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91458802/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91458802/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000701f2805e055260e--

