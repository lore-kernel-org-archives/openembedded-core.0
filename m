Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CB3C433F5
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 12:45:13 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.22581.1634474699484399068
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 05:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ki2+7QaF;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id j190so6479772pgd.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 05:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Skf5+yOdBk8PNlio31IVjtEjjggycjCMZpfNCfntRGg=;
        b=ki2+7QaFe8jy8AS4kEAkrZV+sUcsERLc0wmrFtYl0Z7FlnBRBvnEn7uz7Lu4PA4nwj
         LTrKY4r7H1vKLors1cFxK/JKhALIh+N7k11IiJif39GewZYCRW/LYT7zGM22wS0YobFi
         zk880tuzCYSrxayerlEnYTtoKmIpLb/ip4djSCn3ZYb8lxMHb5nOv56kjuvZlHdu5aV+
         X736d2iQsuDMhU36IaisHWSHPBrssoPcPc/itjZh4h53LwJIf2PomahuQ1RXxTsVipVT
         OgCPxWv1b/6ANx/AtMf8Tj5qEV7TPsbXsmK/tVuEDdp0Lqx8pv9eQKpXs6x9ywXd4EQU
         4+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Skf5+yOdBk8PNlio31IVjtEjjggycjCMZpfNCfntRGg=;
        b=y+cr67pwVrLrYQHF465L7ZlhWhtAFCbXQ4DgZaLZVt9QI2FRWYTEym9fiwJQZZynCL
         o6kBNQiwAiBbFjHliO43vUZgsjryrjF0kEhwDvZ9RLOtxp9GzYeroQUqmE5NItQVpYwn
         w5KO1RT9+0/9eyONr0QkkzcLXpPEMdUwQw0ZG7Xhplyt95PHPDvJb21ch0d42EcyRgMg
         N4yBrwapuR1KjKC7/SPl5IXtNmUluYYWr9as1ZkYSVBImZks0cLZ4EVIOWvkIOF9lqgb
         DoVkl8HHcxHDFzEOLI7nkvnU8+oMV7cvRh7ewfNTrFNW7Tn6+02bbvc+gHphbkFm0lQ4
         +cWQ==
X-Gm-Message-State: AOAM532x+wNDEfCHpBEVQLS38QPU9JIylEyD0CBRAO0/MARmpaKMCFDx
	ska1URTemrHBhZVl1EwpuQ0nzU4YdqeQGBVu55Y=
X-Google-Smtp-Source: 
 ABdhPJxe6MyNcLARcgEm1i5WHJLN7TyhIyOwHOZtAb4K1O3GTy0Td4j6TZT7oHNW4vbPCHYni45A798bHxocw7Pw2zw=
X-Received: by 2002:a63:7102:: with SMTP id m2mr8509138pgc.100.1634474698929;
 Sun, 17 Oct 2021 05:44:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211017115703.3801301-1-schnitzeltony@gmail.com>
 <e4e32689f8bddb5de2f34b156620cd9cef488cdf.camel@linuxfoundation.org>
In-Reply-To: 
 <e4e32689f8bddb5de2f34b156620cd9cef488cdf.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 17 Oct 2021 14:44:47 +0200
Message-ID: 
 <CA+chaQcpcNw-b_eFWopQeBOjPq=Y22-PimLWBEk8NHJCfh7DTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: add gperf-native to DEPENDS to fix
 build
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d2fbce05ce8bcbf3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 12:45:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157038

--000000000000d2fbce05ce8bcbf3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 17, 2021 at 2:03 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2021-10-17 at 13:57 +0200, Andreas M=C3=BCller wrote:
> > >   Could NOT find Gperf (missing: GPERF_EXECUTABLE) (Required is at
> least
> > >   version "3.0.1")
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  meta/recipes-sato/webkit/webkitgtk_2.34.0.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> b/meta/recipes-
> > sato/webkit/webkitgtk_2.34.0.bb
> > index 25e1d422cc..a8e067147c 100644
> > --- a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> > +++ b/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
> > @@ -32,6 +32,7 @@ CVE_PRODUCT =3D "webkitgtk webkitgtk\+"
> >
> >  DEPENDS =3D " \
> >            ruby-native \
> > +          gperf-native \
> >            cairo \
> >            harfbuzz \
> >            jpeg \
>
> Out of interest, why are you seeing that and the automated testing isn't?
>

FWIW: I'm also seeing webkitgtk failures since last upgrade, but for me it
isn't because of gperf, but:

| CMake Error at Source/cmake/OptionsGTK.cmake:353 (message):
|   Either GLX or EGL is needed.
| Call Stack (most recent call first):
|   Source/cmake/WebKitCommon.cmake:220 (include)
|   CMakeLists.txt:20 (include)

possibly because the default setup in oe-core doesn't have opengl in
DISTRO_FEATUES while all builds on autobuilder have opengl enabled with
poky?

--000000000000d2fbce05ce8bcbf3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Oct 17, 2021 at 2:03 PM Richard P=
urdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pur=
die@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 2021-10-17 at 13:=
57 +0200, Andreas M=C3=BCller wrote:<br>
&gt; &gt; =C2=A0=C2=A0Could NOT find Gperf (missing: GPERF_EXECUTABLE) (Req=
uired is at least<br>
&gt; &gt; =C2=A0=C2=A0version &quot;3.0.1&quot;)<br>
&gt; <br>
&gt; Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony=
@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.34.0.bb" =
rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0.bb</a> | 1 +<br>
&gt; =C2=A01 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.34=
.0.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0.bb</a> b/meta/=
recipes-<br>
&gt; sato/webkit/<a href=3D"http://webkitgtk_2.34.0.bb" rel=3D"noreferrer" =
target=3D"_blank">webkitgtk_2.34.0.bb</a><br>
&gt; index 25e1d422cc..a8e067147c 100644<br>
&gt; --- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.34.0.bb" =
rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0.bb</a><br>
&gt; +++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.34.0.bb" =
rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.34.0.bb</a><br>
&gt; @@ -32,6 +32,7 @@ CVE_PRODUCT =3D &quot;webkitgtk webkitgtk\+&quot;<br=
>
&gt; =C2=A0<br>
&gt; =C2=A0DEPENDS =3D &quot; \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ruby=
-native \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gperf-native \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cair=
o \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0harf=
buzz \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0jpeg=
 \<br>
<br>
Out of interest, why are you seeing that and the automated testing isn&#39;=
t?<br></blockquote><div><br></div><div>FWIW: I&#39;m also seeing webkitgtk =
failures since last upgrade, but for me it isn&#39;t because of gperf, but:=
</div><div><br></div><div>| CMake Error at Source/cmake/OptionsGTK.cmake:35=
3 (message):<br>| =C2=A0 Either GLX or EGL is needed.<br>| Call Stack (most=
 recent call first):<br>| =C2=A0 Source/cmake/WebKitCommon.cmake:220 (inclu=
de)<br>| =C2=A0 CMakeLists.txt:20 (include)<br></div><div><br></div><div>po=
ssibly because the default setup in oe-core doesn&#39;t have opengl in DIST=
RO_FEATUES while all builds on autobuilder have opengl enabled with poky?</=
div></div></div>

--000000000000d2fbce05ce8bcbf3--

