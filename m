Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE228C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 22:24:48 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web11.443.1645827888191141368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 14:24:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aej4ljzV;
 spf=pass (domain: gmail.com, ip: 209.85.217.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id g20so6978618vsb.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 14:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=42oZmZ2mpChDfLFdjTbecFOWKh6iXP6DOpn8SePz3b4=;
        b=aej4ljzV+UvgG/ITzDWNPT6qgyCjouhhOal6Ox81AVhRjKKJktq0EC1mWt4h5OrvUJ
         cd1FGctInHYbY9gZVOZKfn3y7pSBpzf3u2ARRLBMmlMoqFByA8Lr4FHugPyeyPxiOVXZ
         CeZDBY1aYEdVXx9lWb+tar4uKcPnaR17Pj0EWVXGrxtBxlEVkihjRdbMvpE97kDy31ZM
         vIYFRV5m9VY0exHwTm4F+zMBiSa67gMeLlpPKvqzV+GEVVSiVWVKpJmpa0WdckdSH1sN
         1+4f3xPz9szCY/ivwH09CQ/cz8VSp9o5ZNISFe1USKtKzSt3t6yss/Irm5Q7XOZyTVxB
         Npbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=42oZmZ2mpChDfLFdjTbecFOWKh6iXP6DOpn8SePz3b4=;
        b=6k9LTP1ohVNEna/EnkQlm2Iq+cZd4Okh2sVhUIITzt+PG1Nm+zetM0qK1zUa74NqaF
         09AC66MtYD6cLiyHFiwstve+Xnkh9vOqfxIkqncC/QcI4P8Sy15OFDtalEd8ifkjGaQU
         bL05IwqO18Hu0cIZrCPlPR1yv54yjzj6jB4Zb5SP6pfy2PgwzTp21ik6IkpSoxj6hnOk
         o/WFE5w9fRmrAMA+RfGDZ1SWJI20v2ipZ6aXGlYxZNu3GBCMEdcY5AaeR1AGVwU1zSXS
         1Bv/RcM9mEmmipbOd9xxcw1hMtq/icqNbfDrBn93p8OFQOtFbtD40tX5NWSCX24L7AV5
         mvdQ==
X-Gm-Message-State: AOAM531tyAC0MNATtBxWpXih+iyykVbi7791l/z9CTfyYVHCte4U3Z4b
	bPaxU6C39UBEtDNDFW+bwwRxLHqJml+DSuzVyWo=
X-Google-Smtp-Source: 
 ABdhPJyZNSFFZkNVWmB84dVt66xjCiSMeVW/oworicLqoVAnD2hvjBzze0PrQQNjiHR9L86oLzMSL58NDZ58nFCEyRw=
X-Received: by 2002:a05:6102:20d1:b0:30e:dfe6:de1a with SMTP id
 i17-20020a05610220d100b0030edfe6de1amr4397187vsr.73.1645827887277; Fri, 25
 Feb 2022 14:24:47 -0800 (PST)
MIME-Version: 1.0
References: <20220225195251.2433615-1-alex@linutronix.de>
 <20220225195251.2433615-2-alex@linutronix.de>
 <63129c4bef7fbd014cf7563d5cd056ffb757c378.camel@linuxfoundation.org>
In-Reply-To: 
 <63129c4bef7fbd014cf7563d5cd056ffb757c378.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Feb 2022 23:24:36 +0100
Message-ID: 
 <CANNYZj83jSifmia4Vp2FWPzmSNNADbZo95_ge0Y96riMGE8QGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] OELAYOUT_ABI: bump, avoid tmp/ breakage by
 removing old cross manifests
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex@linutronix.de>,
 openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000095296105d8df2a6f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 22:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162412

--00000000000095296105d8df2a6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99m=E2=80=A6 confused :) Do I need to change something? This partic=
ular combination
of arches is only used for cross manifests, so it shouldn=E2=80=99t touch o=
ther
things?

Ale

On Fri 25. Feb 2022 at 22.19, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2022-02-25 at 20:52 +0100, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/classes/sanity.bbclass | 22 +++++++++++++++++++++-
> >  meta/conf/abi_version.conf  |  2 +-
> >  2 files changed, 22 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > index 773902e619..9dd829512a 100644
> > --- a/meta/classes/sanity.bbclass
> > +++ b/meta/classes/sanity.bbclass
> > @@ -559,6 +559,23 @@ def sanity_check_conffiles(d):
> >                  bb.fatal(str(e))
> >              d.setVar("BB_INVALIDCONF", True)
> >
> > +def drop_v14_cross_builds(d):
> > +    i =3D
> d.expand("${SSTATE_MANIFESTS}/index-${BUILD_ARCH}_${TARGET_ARCH}")
>
> This is nearly there but there is one further small tweak needed.
>
> This will convert the current TARGET_ARCH but we probably need to glob th=
e
> other
> possible options in case there are other things in the TMPDIR. I'm a bit
> worried
> that might match some other things (such as crosssdk) however if it
> removes too
> much, it would restore it from sstate so it might not matter.
>
> Cheers,
>
> Richard
>
>
>
>

--00000000000095296105d8df2a6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I=E2=80=99m=E2=80=A6 confused :) Do I need to change some=
thing? This particular combination of arches is only used for cross manifes=
ts, so it shouldn=E2=80=99t touch other things?</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Ale=C2=A0</div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri 25. Feb 2022 at 22.19, Richard=
 Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.p=
urdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Fri, =
2022-02-25 at 20:52 +0100, Alexander Kanavin wrote:<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/sanity.bbclass | 22 +++++++++++++++++++++-<br>
&gt;=C2=A0 meta/conf/abi_version.conf=C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 2 files changed, 22 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass=
<br>
&gt; index 773902e619..9dd829512a 100644<br>
&gt; --- a/meta/classes/sanity.bbclass<br>
&gt; +++ b/meta/classes/sanity.bbclass<br>
&gt; @@ -559,6 +559,23 @@ def sanity_check_conffiles(d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal=
(str(e))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;BB_INVA=
LIDCONF&quot;, True)<br>
&gt;=C2=A0 <br>
&gt; +def drop_v14_cross_builds(d):<br>
&gt; +=C2=A0 =C2=A0 i =3D d.expand(&quot;${SSTATE_MANIFESTS}/index-${BUILD_=
ARCH}_${TARGET_ARCH}&quot;)<br>
<br>
This is nearly there but there is one further small tweak needed.<br>
<br>
This will convert the current TARGET_ARCH but we probably need to glob the =
other<br>
possible options in case there are other things in the TMPDIR. I&#39;m a bi=
t worried<br>
that might match some other things (such as crosssdk) however if it removes=
 too<br>
much, it would restore it from sstate so it might not matter.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000095296105d8df2a6f--

