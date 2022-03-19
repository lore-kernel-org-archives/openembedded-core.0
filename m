Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657FFC433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 19:07:50 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.10493.1647716869898426948
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 12:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FE8NeZma;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id y15so9220454qta.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 12:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AaOVYzwxmaTbHt0jIf0dd7lUqnLx5ER0TQaJBHWFFHs=;
        b=FE8NeZmavKN0vArbPqu2Cq4czI8MgSAon3BYBGZ69TegQhKaU1CWZm5a0IRyt0JtKb
         c7r+lpwgn09Y8Qq6itMR15wp2WbryIHmHnp4s/fg0Q/Y/1Us/9ghZS0nhCvbB87wc+VQ
         fGaMTelWjEcVPgzcuoXhVdEK3hHNql2R4BQEbYRbHWINTFeXnWHugwoB0kGoZENxtvnd
         urjGspDNhjNQ7XBRlhoeg5QSNR/iBLg74hMLv1Aip5oIG9SSekbQBJZt3PO1LRPeT0k9
         3FVOAfz0wsxwbFQH9+06rM5Rb0c/cqJbuueS3Aw72pTXrTdWbGVPvOHQwbpBH68gVDmx
         yKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AaOVYzwxmaTbHt0jIf0dd7lUqnLx5ER0TQaJBHWFFHs=;
        b=uulcVW8cW0FU7865V18yZIubPpdlP5NOWbUwaBjDDi5z9VS4j0sOIhBUEG8eaIktan
         +vOy9ZTAo5jMUIHH/T7o+lTJLfkAZALTH6Rec5fORo0A0FgATHj440q9M4QeMWRWepD/
         k8qKOORDCV599g3Q/4as9b8cx7x/KwpNvOx9iOVdaE/wLiiQvBIyIcaqZ2+drOLiHvRs
         vANg1O8d9DK5UkUOL+CUcmT2zJME0v8f4CuqGXJB/jZphb2pTZRK9UA3/yJAgpBK8g3K
         5pE6DX4pQHRC8YjLju2dcMi368uy+LU8Y2LwS7kuLW41fptypi3MCvPDvdMzV3gu86Pj
         nyvg==
X-Gm-Message-State: AOAM531QJgotQ6hzrcekzGm668KLdDGAVWl25khgEJJkx6CUSBC7aiVi
	gfsojMTIedYzsQkiFKM10JWp8NjR6QPh96cTVhc=
X-Google-Smtp-Source: 
 ABdhPJwS82rtzOJrP9LhFyzYYHV5nZ/40tyKtpskXm2TuvSVs4VtyZFAMrmq4Ps07COT2o/vb7A8pSW6ubxAF5lR8Oc=
X-Received: by 2002:ac8:5842:0:b0:2e1:aa10:e7cd with SMTP id
 h2-20020ac85842000000b002e1aa10e7cdmr11692299qth.330.1647716868995; Sat, 19
 Mar 2022 12:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220317180005.1009380-1-richard.purdie@linuxfoundation.org>
 <CAMKF1soE840jiaiuKZ3-zJKY+f5DWE8Ry_7HOhPFoK=hvZwBWw@mail.gmail.com>
 <9f00a3fe1b69e4c4e9fd34ae04effcee6229b929.camel@linuxfoundation.org>
 <CAMKF1sqUk9d-02+dnZ=Q9+PECwLNUdeOsEFrt2D=yZRRQuOuuQ@mail.gmail.com>
 <1916eb255426ba0a78fb960f876097195932c5f3.camel@linuxfoundation.org>
In-Reply-To: 
 <1916eb255426ba0a78fb960f876097195932c5f3.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Mar 2022 12:07:38 -0700
Message-ID: 
 <CAMKF1spk6UPfwzDn+R46jL5EExkV6aOODvgnGdBWS_7szEP9TA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libtool: Upgrade 2.4.6 -> 2.4.7
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000aabfc405da96fa32"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 19:07:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163475

--000000000000aabfc405da96fa32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 19, 2022 at 9:44 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2022-03-18 at 17:28 -0700, Khem Raj wrote:
> > On Fri, Mar 18, 2022 at 5:10 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Fri, 2022-03-18 at 17:06 -0700, Khem Raj wrote:
> > > > seeing these 3 failures with new libtool in meta-oe
> > > >
> > > > https://errors.yoctoproject.org/Errors/Build/142979/
> > > >
> > >
> > > Those are all libtool version mismatches. Might be a case of deleting
> the
> > > libtool m4 macros before reautoconf?
> >
> > i have not looked into details but perhaps it could be just that
> >
>
> I was going to have a look to see if I could help but saw you already hav=
e
> patches doing that! :)
>

Yes just wasn=E2=80=99t sure how deep the rathole will be but it turns out =
to be
not that bad and meta-oe build is green with libtool upgrade now


> Cheers,
>
> Richard
>
>
>
>

--000000000000aabfc405da96fa32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Mar 19, 2022 at 9:44 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 2022-=
03-18 at 17:28 -0700, Khem Raj wrote:<br>
&gt; On Fri, Mar 18, 2022 at 5:10 PM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; On Fri, 2022-03-18 at 17:06 -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; seeing these 3 failures with new libtool in meta-oe<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <a href=3D"https://errors.yoctoproject.org/Errors/Build/1429=
79/" rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/E=
rrors/Build/142979/</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Those are all libtool version mismatches. Might be a case of dele=
ting the<br>
&gt; &gt; libtool m4 macros before reautoconf?<br>
&gt; <br>
&gt; i have not looked into details but perhaps it could be just that<br>
&gt; <br>
<br>
I was going to have a look to see if I could help but saw you already have<=
br>
patches doing that! :)<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes just wasn=E2=
=80=99t sure how deep the rathole will be but it turns out to be not that b=
ad and meta-oe build is green with libtool upgrade now=C2=A0</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000aabfc405da96fa32--

