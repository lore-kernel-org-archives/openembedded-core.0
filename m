Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE69C38145
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 14:54:20 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.7519.1662130450718831277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 07:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: aehs29@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id x14so1582419qvr.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 07:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=m2AfixKAq1TsvCBC4xaEVj8+v0amN3JaZRCogLlF9VM=;
        b=Nq9E5mdIGiU25Z2QmAcPFGNGh06bFKhudor/7lnlrxsX4GAf1ZLKbF/X4mu2f2ua5A
         NF0HLcK5gQNG1CVsyC19oed4wgxiEYV8YTm1v50EHtAMNa3+ycXI1u1VPpEjt89Vzd3s
         pTGIftuVPTytehxjWMwbvtlKzAJ4pUaG8kkHpAdFgqlUZNDmQK5/v/84sINts/xzKeim
         12pn8+fj1crgEHmp285mx1eDy2ckfPL7BM/JymlS9I+UYrckDEFbj24oY81nad4iQxFG
         YWcYcEBM0i9aAkpMETdUxtMimj16iSeWiSRuyeGj352DaIL2lWMgLAeD0yJjCcC1YaRV
         v4iA==
X-Gm-Message-State: ACgBeo1jljCX8s38oE0pYMh2qQestOugUlCB5MMV92Cfpn33MJbLTtPA
	xJr9ZoEMhEIBVDZlJgL+smNd+B+70HFI6gXn
X-Google-Smtp-Source: 
 AA6agR4U/HZWmRiNArOKwUFtwRXGiMZZggzVrGoGkV2toB9lpLbRMRlbsWdPhFBul8hCvs4D5GFaDQ==
X-Received: by 2002:a05:6214:e65:b0:498:fe8d:10fe with SMTP id
 jz5-20020a0562140e6500b00498fe8d10femr23241438qvb.43.1662130449539;
        Fri, 02 Sep 2022 07:54:09 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com.
 [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id
 n7-20020ac81e07000000b0031eb5648b86sm1169978qtl.41.2022.09.02.07.54.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Sep 2022 07:54:09 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id g21so1883024qka.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 07:54:09 -0700 (PDT)
X-Received: by 2002:a05:620a:27c6:b0:6bb:2802:21b with SMTP id
 i6-20020a05620a27c600b006bb2802021bmr22943851qkp.20.1662130449158; Fri, 02
 Sep 2022 07:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220901234206.419429-1-alejandro@enedino.org>
 <ce837e16269eae046f24845d5b353b8a98210294.camel@linuxfoundation.org>
In-Reply-To: 
 <ce837e16269eae046f24845d5b353b8a98210294.camel@linuxfoundation.org>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Fri, 2 Sep 2022 09:53:57 -0500
X-Gmail-Original-Message-ID: 
 <CAHMutrbiWa0ezWeuH8mV9ZhGLqvAPVxpuEh1-JhCWEkks5OFxw@mail.gmail.com>
Message-ID: 
 <CAHMutrbiWa0ezWeuH8mV9ZhGLqvAPVxpuEh1-JhCWEkks5OFxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] baremetal-image.bbclass: avoid inheriting
 incompatible IMAGE_CLASSES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fe18d805e7b2e6d2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 14:54:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170252

--000000000000fe18d805e7b2e6d2
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022, 9:47 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2022-09-01 at 17:42 -0600, Alejandro Hernandez Samaniego wrote:
> > There could be IMAGE_CLASSES designed to work on images which arent
> > necessarily compatible with baremetal-images, one example is the
> > license_image class which relies on the package managers functionality
> > during do_rootfs, for baremetal images no rootfs is created hence the
> > package manager shouldnt be invoked, we need to avoid inheriting such
> > class to fix this behavior.
> >
> > inherit BAREMETAL_IMAGE_CLASSES for baremetal images but set the default
> > to IMAGE_CLASSES, whilst removing undesired classes in an intermediate
> > step to avoid incompatibilities.
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > ---
> >  meta/classes-recipe/baremetal-image.bbclass | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/baremetal-image.bbclass
> b/meta/classes-recipe/baremetal-image.bbclass
> > index d3377a92fa..2f07dec4ac 100644
> > --- a/meta/classes-recipe/baremetal-image.bbclass
> > +++ b/meta/classes-recipe/baremetal-image.bbclass
> > @@ -18,8 +18,15 @@
> >  ## Emulate image.bbclass
> >  # Handle inherits of any of the image classes we need
> >  IMAGE_CLASSES ??= ""
> > -IMGCLASSES = " ${IMAGE_CLASSES}"
> > +BAREMETAL_IMAGE_CLASSES ?= " ${IMAGE_CLASSES}"
> > +
> > +# The license_image class relies on package managers used on do_rootfs
> > +# these dont exist for baremetal images since no rootfs is created.
> > +BAREMETAL_IMAGE_CLASSES:remove = "license_image"
> > +
> > +IMGCLASSES = " ${BAREMETAL_IMAGE_CLASSES}"
> >  inherit ${IMGCLASSES}
> > +
> >  # Set defaults to satisfy IMAGE_FEATURES check
> >  IMAGE_FEATURES ?= ""
> >  IMAGE_FEATURES[type] = "list"
>
> This is going to become a usability nightmare. Can we patch
> license_image to just silently do nothing for baremetal?
>

I think we can, but we'd have to do that on every class that is
incompatible (I don't expect many to be, but I tried to generate a more
generic solution and use BAREMETAL_, IMAGE_CLASSES as a gate), with that in
mind, Is that still better than this?



> Cheers,
>
> Richard


>
>

--000000000000fe18d805e7b2e6d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Sep 2, 2022, 9:47 AM Richard Purdie &lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank" rel=3D"no=
referrer">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On Thu, 2022-09-01 at 17:42 -0600, Alejandro Herna=
ndez Samaniego wrote:<br>
&gt; There could be IMAGE_CLASSES designed to work on images which arent<br=
>
&gt; necessarily compatible with baremetal-images, one example is the<br>
&gt; license_image class which relies on the package managers functionality=
<br>
&gt; during do_rootfs, for baremetal images no rootfs is created hence the<=
br>
&gt; package manager shouldnt be invoked, we need to avoid inheriting such<=
br>
&gt; class to fix this behavior.<br>
&gt; <br>
&gt; inherit BAREMETAL_IMAGE_CLASSES for baremetal images but set the defau=
lt<br>
&gt; to IMAGE_CLASSES, whilst removing undesired classes in an intermediate=
<br>
&gt; step to avoid incompatibilities.<br>
&gt; <br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"ma=
ilto:alejandro@enedino.org" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>alejandro@enedino.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/baremetal-image.bbclass | 9 ++++++++-<br>
&gt;=C2=A0 1 file changed, 8 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classe=
s-recipe/baremetal-image.bbclass<br>
&gt; index d3377a92fa..2f07dec4ac 100644<br>
&gt; --- a/meta/classes-recipe/baremetal-image.bbclass<br>
&gt; +++ b/meta/classes-recipe/baremetal-image.bbclass<br>
&gt; @@ -18,8 +18,15 @@<br>
&gt;=C2=A0 ## Emulate image.bbclass<br>
&gt;=C2=A0 # Handle inherits of any of the image classes we need<br>
&gt;=C2=A0 IMAGE_CLASSES ??=3D &quot;&quot;<br>
&gt; -IMGCLASSES =3D &quot; ${IMAGE_CLASSES}&quot;<br>
&gt; +BAREMETAL_IMAGE_CLASSES ?=3D &quot; ${IMAGE_CLASSES}&quot;<br>
&gt; +<br>
&gt; +# The license_image class relies on package managers used on do_rootf=
s<br>
&gt; +# these dont exist for baremetal images since no rootfs is created.<b=
r>
&gt; +BAREMETAL_IMAGE_CLASSES:remove =3D &quot;license_image&quot;<br>
&gt; +<br>
&gt; +IMGCLASSES =3D &quot; ${BAREMETAL_IMAGE_CLASSES}&quot;<br>
&gt;=C2=A0 inherit ${IMGCLASSES}<br>
&gt; +<br>
&gt;=C2=A0 # Set defaults to satisfy IMAGE_FEATURES check<br>
&gt;=C2=A0 IMAGE_FEATURES ?=3D &quot;&quot;<br>
&gt;=C2=A0 IMAGE_FEATURES[type] =3D &quot;list&quot;<br>
<br>
This is going to become a usability nightmare. Can we patch<br>
license_image to just silently do nothing for baremetal?<br></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I think we can, but=
 we&#39;d have to do that on every class that is incompatible (I don&#39;t =
expect many to be, but I tried to generate a more generic solution and use =
BAREMETAL_, IMAGE_CLASSES as a gate), with that in mind, Is that still bett=
er than this?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
<br>
Cheers,<br>
<br>
Richard</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br></blockquote><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<br>
</blockquote></div></div></div>

--000000000000fe18d805e7b2e6d2--

