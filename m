Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5C2C32793
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 23:17:48 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.4857.1661296665192703590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 16:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: aehs29@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id j1so11682466qvv.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 16:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3wbudAjKfOKDwn739gvEQrXF9Pod1pCQlRxB0/ogdG4=;
        b=U1UgHgaJRgbLeda5ypp5kQR0w+nFxLDwwjBGqFynmOsVe+tLh+SOfRMnZGe6KBMkUh
         pKDpuI/DCW8+cgrG9+Y9Vp00mgmYxuvIi/RmFYOl9tsyonTH8OuEoc3tKYEgKBzTAvvr
         jkQL87eL4fEDS9ZrIcit5MVb3AnWgGx9Iqo9xT3xEJ8jfd0p3aOAxWCoMhr9fKrwgc8W
         WCX0guw26y2hmdS+CEqmbNKRxYZBcVIMSHbc/H9+kdT8bCzI1JZYEC2mAxyLpAPH2inu
         RDHgYXgspKqI9EiAT/Qp94+TzhXFBe31YkljsUVDfCuTlJDdN8t2vf1M0BF964ozGeCT
         iYZA==
X-Gm-Message-State: ACgBeo0yHyTTNRxo1FnWHRuoSCGKVW/FdEEGumLW/+YehmweVn1V+DIc
	ApoTM/zJ+JdUuXfa4vkqzMGynW7k5++K9A==
X-Google-Smtp-Source: 
 AA6agR6coXaM/4NQf7UKT2Z8Q05/235RZuV7ejW+V58pYLLq1fqLphjdOmVOyrg/HjZ8AIedC0fSeg==
X-Received: by 2002:a05:6214:20cb:b0:496:ae67:2121 with SMTP id
 11-20020a05621420cb00b00496ae672121mr22067189qve.95.1661296664005;
        Tue, 23 Aug 2022 16:17:44 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id
 ga10-20020a05622a590a00b003430589dd34sm12132899qtb.57.2022.08.23.16.17.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 16:17:43 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id g14so2017815qto.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 16:17:43 -0700 (PDT)
X-Received: by 2002:ac8:578f:0:b0:344:6aee:a465 with SMTP id
 v15-20020ac8578f000000b003446aeea465mr20949869qta.360.1661296663428; Tue, 23
 Aug 2022 16:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220823213124.4185070-1-alejandro@enedino.org>
 <d9d568b0796c77bd44ab82d4dbcc3ae01b0b8972.camel@linuxfoundation.org>
In-Reply-To: 
 <d9d568b0796c77bd44ab82d4dbcc3ae01b0b8972.camel@linuxfoundation.org>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Tue, 23 Aug 2022 17:17:32 -0600
X-Gmail-Original-Message-ID: 
 <CAHMutrYK_QM+degGp8Jz-ZSy1EKrODrt+gp_vmqzOG_WpyErLw@mail.gmail.com>
Message-ID: 
 <CAHMutrYK_QM+degGp8Jz-ZSy1EKrODrt+gp_vmqzOG_WpyErLw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] baremetal-image.bbclass: Emulate image.bbclass
 to handle new classes scope
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007d817e05e6f0c53f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 23:17:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169761

--0000000000007d817e05e6f0c53f
Content-Type: text/plain; charset="UTF-8"

We are!, however is not that simple since the baremetal helloworld app
needs to have the interactive functionality to perform the back and forth
communication that testimage is based on.

Hopefully I can add such functionality to a newlib-helloworld in this
release along with its own test case.

Alejandro

On Tue, Aug 23, 2022, 4:13 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2022-08-23 at 15:31 -0600, Alejandro Hernandez Samaniego wrote:
> > The new classes scope implemented on commit 7bd328f9d
> > made testimage.bbclass (and perhaps others) stop working
> > for baremetal-images, the expected way to run testimage
> > is no longer to use INHERIT but to use IMAGE_CLASSES
> > instead, however this functionality was not implemented in the
> > baremetal-image class until now.
> >
> > Emulate image.bbclass allowing the baremetal-image class to
> > use IMAGE_CLASSES to fix this issue.
> >
> > Set defaults for IMAGE_FEATURES to allow bitbake checks to
> > pass properly.
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > ---
> >  meta/classes-recipe/baremetal-image.bbclass | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/meta/classes-recipe/baremetal-image.bbclass
> b/meta/classes-recipe/baremetal-image.bbclass
> > index 3a979f2ed1..d3377a92fa 100644
> > --- a/meta/classes-recipe/baremetal-image.bbclass
> > +++ b/meta/classes-recipe/baremetal-image.bbclass
> > @@ -15,6 +15,15 @@
> >  #
> >  # See meta-skeleton for a working example.
> >
> > +## Emulate image.bbclass
> > +# Handle inherits of any of the image classes we need
> > +IMAGE_CLASSES ??= ""
> > +IMGCLASSES = " ${IMAGE_CLASSES}"
> > +inherit ${IMGCLASSES}
> > +# Set defaults to satisfy IMAGE_FEATURES check
> > +IMAGE_FEATURES ?= ""
> > +IMAGE_FEATURES[type] = "list"
> > +IMAGE_FEATURES[validitems] += ""
> >
> >  # Toolchain should be baremetal or newlib based.
> >  # TCLIBC="baremetal" or TCLIBC="newlib"
>
>
> I think we're missing a testcase!
>
> Cheers,
>
> Richard
>
>

--0000000000007d817e05e6f0c53f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">We are!, however is not that simple since the baremetal h=
elloworld app needs to have the interactive functionality to perform the ba=
ck and forth communication that testimage is based on.<div dir=3D"auto"><br=
></div><div dir=3D"auto">Hopefully I can add such functionality to a newlib=
-helloworld in this release along with its own test case.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Alejandro=C2=A0</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 23, 2022=
, 4:13 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Tue, 2022-08-23 at 15:31 -0600, Alejandro Hernand=
ez Samaniego wrote:<br>
&gt; The new classes scope implemented on commit 7bd328f9d<br>
&gt; made testimage.bbclass (and perhaps others) stop working<br>
&gt; for baremetal-images, the expected way to run testimage<br>
&gt; is no longer to use INHERIT but to use IMAGE_CLASSES<br>
&gt; instead, however this functionality was not implemented in the<br>
&gt; baremetal-image class until now.<br>
&gt; <br>
&gt; Emulate image.bbclass allowing the baremetal-image class to<br>
&gt; use IMAGE_CLASSES to fix this issue.<br>
&gt; <br>
&gt; Set defaults for IMAGE_FEATURES to allow bitbake checks to<br>
&gt; pass properly.<br>
&gt; <br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"ma=
ilto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alejandro@=
enedino.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/baremetal-image.bbclass | 9 +++++++++<br>
&gt;=C2=A0 1 file changed, 9 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classe=
s-recipe/baremetal-image.bbclass<br>
&gt; index 3a979f2ed1..d3377a92fa 100644<br>
&gt; --- a/meta/classes-recipe/baremetal-image.bbclass<br>
&gt; +++ b/meta/classes-recipe/baremetal-image.bbclass<br>
&gt; @@ -15,6 +15,15 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # See meta-skeleton for a working example.<br>
&gt;=C2=A0 <br>
&gt; +## Emulate image.bbclass<br>
&gt; +# Handle inherits of any of the image classes we need<br>
&gt; +IMAGE_CLASSES ??=3D &quot;&quot;<br>
&gt; +IMGCLASSES =3D &quot; ${IMAGE_CLASSES}&quot;<br>
&gt; +inherit ${IMGCLASSES}<br>
&gt; +# Set defaults to satisfy IMAGE_FEATURES check<br>
&gt; +IMAGE_FEATURES ?=3D &quot;&quot;<br>
&gt; +IMAGE_FEATURES[type] =3D &quot;list&quot;<br>
&gt; +IMAGE_FEATURES[validitems] +=3D &quot;&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Toolchain should be baremetal or newlib based.<br>
&gt;=C2=A0 # TCLIBC=3D&quot;baremetal&quot; or TCLIBC=3D&quot;newlib&quot;<=
br>
<br>
<br>
I think we&#39;re missing a testcase!<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--0000000000007d817e05e6f0c53f--

