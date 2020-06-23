Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web12.16122.1592944356468900372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 13:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eckAQVEM;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id r5so97885vso.11
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 13:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aYiaUhykWmsTFGLLUDsfFW0zpjuZMUbbzRwBgk5WsQk=;
        b=eckAQVEMp7TfJ0pnEygJqjP2kygLECOJyLT7tBzSl4hZjfthUUirgZPSIkrw6ncaDm
         itUyvYlf05G9JwIwDYo+7JoESE8P/ALxU9xDGfIK1TSyN98tLO/15AulgvTeycWuCvnv
         35LjWg0pvOoWOz0h4c8sBsH5krUG0Ygu1F95iudg8gcMVwKKd+Bg/WSXtYU28gx4cjSm
         PVobhmCTsky6yUv6WSDvNgp5t+uudQUv9dQrHUj8jjB4JVPftlcrKTnoorWEdytWpwi2
         3n+WTZJ7742HY1wb2PorVa6tvsdkrDMO87l//mAph5OJgcFXsPCiI9anbknc96INH0xH
         8iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aYiaUhykWmsTFGLLUDsfFW0zpjuZMUbbzRwBgk5WsQk=;
        b=O+Yx9MeMfAl0IcjuA9Yyc7igE4uJurZA/ZIZgQWiFh3MQ5Nmeugh/GPfwVDzRy92Wv
         2sL+wjuGHQbEtCXW9WJrXQyJE/pKdkPQzulSddLy0phuiSpjLs81I5uQ1pGCkk1knLQ8
         OaU+FssNKzeJ0jvJydx/zWjwFgCLzTbBgVGnvfXf0TIMsswTIztzob8sW7m72pXwODkJ
         gv3QcI1vyd40m57dK36KOQvVuBmBGWsK5YppB1lCgQB1HSiETr7BMC/xLGSunw6ZdTQo
         wWWje5dAYNAyf8B3+ZgBZbkymUbtz6y7dr8m3xtoxrKInI6nEoHp7JP/Of0u6i0W3toq
         Izbw==
X-Gm-Message-State: AOAM533oU4IoM39lHzM7K93JsGPObfQo5pVnQrpFNXuLUe5QrJCQrR2y
	dvURhOPo0RDE27CEXJYcX53/aW5vn0eQP/F0+UY=
X-Google-Smtp-Source: ABdhPJzMQuN1HlExaBjjYQKzoNVT40RCg7iKcuf+VYUG1i0oeP1gXX1/1Mt+VXWoGwjB7kcieRbKxP6kpDRnBvUdGhE=
X-Received: by 2002:a05:6102:2438:: with SMTP id l24mr10262053vsi.83.1592944355565;
 Tue, 23 Jun 2020 13:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200623134150.603584-1-richard.purdie@linuxfoundation.org>
 <a9fe68d2-b2d0-4ba8-dca8-78dca19ebb6d@gmail.com> <CANNYZj834SO=HUDqHw+0JAY4VApZGUa8gXgEX6S0Po5SUNvqqg@mail.gmail.com>
 <826b33b3-268d-edfe-080e-8e02f5b344d1@gmail.com>
In-Reply-To: <826b33b3-268d-edfe-080e-8e02f5b344d1@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 23 Jun 2020 22:32:23 +0200
Message-ID: <CANNYZj8QONxyGGUBvxjWY0w3kM5UMOJYJUYEj_OeQKJUQjAd=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vulkan-headers: Fix upstream branch deletion issue
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000075ea2e05a8c642c0"

--00000000000075ea2e05a8c642c0
Content-Type: text/plain; charset="UTF-8"

https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/2062/steps/8/logs/step1b

Alex

On Tue, 23 Jun 2020 at 22:17, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 6/23/20 1:13 PM, Alexander Kanavin wrote:
> > Latest released gstreamer will fail to build with the latest vulkan, so
> > we have to defer that.
>
> I see, what errors do we get ?
>
> >
> > Alex
> >
> > On Tue, 23 Jun 2020 at 21:46, Khem Raj <raj.khem@gmail.com
> > <mailto:raj.khem@gmail.com>> wrote:
> >
> >
> >
> >     On 6/23/20 6:41 AM, Richard Purdie wrote:
> >      > The upstream branch was deleted but the commit is in master so
> >     reference
> >      > that instead.
> >      >
> >      > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> >     <mailto:richard.purdie@linuxfoundation.org>>
> >      > ---
> >      >   meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
> >     <http://vulkan-headers_1.2.135.0.bb> | 3 ++-
> >      >   1 file changed, 2 insertions(+), 1 deletion(-)
> >      >
> >      > diff --git
> >     a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
> >     <http://vulkan-headers_1.2.135.0.bb>
> >     b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
> >     <http://vulkan-headers_1.2.135.0.bb>
> >      > index 54cee96cce0..d21c3d62b90 100644
> >      > --- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
> >     <http://vulkan-headers_1.2.135.0.bb>
> >      > +++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
> >     <http://vulkan-headers_1.2.135.0.bb>
> >      > @@ -5,7 +5,8 @@ SECTION = "libs"
> >      >
> >      >   LICENSE = "Apache-2.0"
> >      >   LIC_FILES_CHKSUM =
> >     "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
> >      > -SRC_URI =
> >     "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=sdk-1.2.135
> >     <
> http://github.com/KhronosGroup/Vulkan-Headers.git;branch=sdk-1.2.135>"
> >      > +# was sdk-1.2.135 branch but it was removed upstream, commit is
> >     in master branch though
> >      > +SRC_URI =
> >     "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master
> >     <http://github.com/KhronosGroup/Vulkan-Headers.git;branch=master>"
> >      >
> >
> >     perhaps better to update to SHA of latest tag ?
> >     https://github.com/KhronosGroup/Vulkan-Headers/releases/tag/v1.2.145
> >
> >      >   SRCREV = "fb7f9c9bcd1d1544ea203a1f3d4253d0e90c5a90"
> >      >
> >      >
> >      >
> >      >
> >      >
> >     
> >
>

--00000000000075ea2e05a8c642c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><a href=3D"https://autobuilder.yoctoproject.org/typho=
on/#/builders/37/builds/2062/steps/8/logs/step1b">https://autobuilder.yocto=
project.org/typhoon/#/builders/37/builds/2062/steps/8/logs/step1b</a></div>=
<div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, 23 Jun 2020 at 22:17, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 6/23/20 1:13 PM, Alexander Kanavin wrote:<br>
&gt; Latest released gstreamer will fail to build with the latest vulkan, =
so <br>
&gt; we have to defer that.<br>
<br>
I see, what errors do we get ?<br>
<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt; On Tue, 23 Jun 2020 at 21:46, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">ra=
j.khem@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 6/23/20 6:41 AM, Richard Purdie wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; The upstream branch was deleted but the comm=
it is in master so<br>
&gt;=C2=A0 =C2=A0 =C2=A0reference<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; that instead.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Richard Purdie &lt;<a href=3D=
"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdi=
e@linuxfoundation.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0meta/recipes-graphics/vulkan/<a =
href=3D"http://vulkan-headers_1.2.135.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">vulkan-headers_1.2.135.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://vulkan-headers_1.2.135.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://vulkan-headers_1.2.135.0.bb</a=
>&gt; | 3 ++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A01 file changed, 2 insertions(+),=
 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-graphics/vulkan/<a href=3D"http://v=
ulkan-headers_1.2.135.0.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-hea=
ders_1.2.135.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://vulkan-headers_1.2.135.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://vulkan-headers_1.2.135.0.bb</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-graphics/vulkan/<a href=3D"http://v=
ulkan-headers_1.2.135.0.bb" rel=3D"noreferrer" target=3D"_blank">vulkan-hea=
ders_1.2.135.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://vulkan-headers_1.2.135.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://vulkan-headers_1.2.135.0.bb</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 54cee96cce0..d21c3d62b90 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/meta/recipes-graphics/vulkan/<a href=
=3D"http://vulkan-headers_1.2.135.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">vulkan-headers_1.2.135.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://vulkan-headers_1.2.135.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://vulkan-headers_1.2.135.0.bb</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/recipes-graphics/vulkan/<a href=
=3D"http://vulkan-headers_1.2.135.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">vulkan-headers_1.2.135.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://vulkan-headers_1.2.135.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">http://vulkan-headers_1.2.135.0.bb</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -5,7 +5,8 @@ SECTION =3D &quot;libs&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0LICENSE =3D &quot;Apache-2.0&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;file://LICENSE.txt;md5=3D3b83ef96387f14655fc=
854ddc3c6bd57&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;git://<a href=3D"http://github.com/KhronosGr=
oup/Vulkan-Headers.git;branch=3Dsdk-1.2.135" rel=3D"noreferrer" target=3D"_=
blank">github.com/KhronosGroup/Vulkan-Headers.git;branch=3Dsdk-1.2.135</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://github.com/KhronosGroup/Vulk=
an-Headers.git;branch=3Dsdk-1.2.135" rel=3D"noreferrer" target=3D"_blank">h=
ttp://github.com/KhronosGroup/Vulkan-Headers.git;branch=3Dsdk-1.2.135</a>&g=
t;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# was sdk-1.2.135 branch but it was removed=
 upstream, commit is<br>
&gt;=C2=A0 =C2=A0 =C2=A0in master branch though<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;git://<a href=3D"http://github.com/KhronosGr=
oup/Vulkan-Headers.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank=
">github.com/KhronosGroup/Vulkan-Headers.git;branch=3Dmaster</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://github.com/KhronosGroup/Vulk=
an-Headers.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">http:/=
/github.com/KhronosGroup/Vulkan-Headers.git;branch=3Dmaster</a>&gt;&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0perhaps better to update to SHA of latest tag ?<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/KhronosGroup/Vulkan-=
Headers/releases/tag/v1.2.145" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/KhronosGroup/Vulkan-Headers/releases/tag/v1.2.145</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0SRCREV =3D &quot;fb7f9c9bcd1d154=
4ea203a1f3d4253d0e90c5a90&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; <br>
</blockquote></div>

--00000000000075ea2e05a8c642c0--
