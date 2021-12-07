Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05EBC433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 09:49:25 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web12.65004.1638870564289760153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 01:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OoPHS20K;
 spf=pass (domain: linaro.org, ip: 209.85.208.47,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f47.google.com with SMTP id r11so54318885edd.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 01:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2nge3mvVmF5wQdSLwa2wh4ptFna1KGjj3SQz5xBJ1a8=;
        b=OoPHS20KtIM/pEW/baU0n/bYjpEFscwa3mMoNJlSyg8fs/itYVWNvPGhKsFKXb3kLc
         N048aYhbyjv0P1LSvPNMnrzzT7ed55l3NHlb2VQUe5sNjaZkiXVbXZgbRFNO7ECT2zYr
         uOj+1LTqXaWkDvMmKU6LriOg57TaXjnemeAuA1awfBgf/W6d5wav/QXcMrb+Wqax91by
         GNYDokeZa5RkZ1tOVfz5fazSY18PGGlges3ol5T5rT1WOF44ocmGFpQAic4KaG/kbN8g
         RT0UZU/krGc5clX9XNzHeLpUGFgdjdDNQRUoAT4gFZzZ/PWDhUDJhluyIQVOUGKMOuUT
         a2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2nge3mvVmF5wQdSLwa2wh4ptFna1KGjj3SQz5xBJ1a8=;
        b=RKwoancsbHWkOaU1yxYR5kM5MX/Y38YerwaJrMRqf0WOH7OJQjGdjhVpJFslFomfFQ
         l6w+KL9xMyaG5cYWLg8HKj8cWk4UQDz2cn3CAGa/ydUI6wzTREhv9x2YdgbQS/WKF1F7
         ZbRBRtvgPX6SX8MMKmYvaCUoVbY5zX9I9vf+tJuplUitNt5B4q1AK0plDpOhdvj6rASX
         OHuITSrRbLNEO4HzQsI/a9bfL5xKNz7YzSol7ib/BJQmPrQnjZPfQACo6HVwy9AdUfB0
         cDaLx5krDjg+2JC69r63uvdllgsTNJGa5iYKYO1PiqTkFUJm3CP4wlewgw+Dj+IIWmfT
         tEWg==
X-Gm-Message-State: AOAM530/aPtn8AZ8tNyhEjZtrrnICdT4GSyjB7iIff9JJ+oferL7SDKp
	Ia0aNe79lBAvvg5DWZZ8DerNcspYf5lEV250Ys6otA==
X-Google-Smtp-Source: 
 ABdhPJxXvjrQxhEWExSx8y0hynjgXaVCX4fM8kL6uK366ZTRvMSkAoA9B1UaxTPRUgsX4u0dahPEkYO3MpHQbdy6SZs=
X-Received: by 2002:a17:907:6d07:: with SMTP id
 sa7mr53161727ejc.339.1638870562438;
 Tue, 07 Dec 2021 01:49:22 -0800 (PST)
MIME-Version: 1.0
References: <20211201203407.218692-1-bhupesh.sharma@linaro.org>
 <CADkTA4NV0ix0S4rc8HqJuJJr=Os299bx5UZrQEBnx9MBW-DCzw@mail.gmail.com>
 <d1a94fdcacca208555f96846beecb853c14dbc24.camel@linuxfoundation.org>
In-Reply-To: 
 <d1a94fdcacca208555f96846beecb853c14dbc24.camel@linuxfoundation.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 7 Dec 2021 10:49:11 +0100
Message-ID: 
 <CAP71WjxMLE8CXMGDhdhU6Dgmkije7cKh7SW_bmpeDBSXPMVdpQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH 00/14] Backport mandatory dtschema
 handling for device trees built through the kernel.
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, bhupesh.linux@gmail.com
Content-Type: multipart/alternative; boundary="000000000000b5176205d28b49e6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 09:49:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159284

--000000000000b5176205d28b49e6
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 1, 2021 at 10:39 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2021-12-01 at 16:33 -0500, Bruce Ashfield wrote:
> > On Wed, Dec 1, 2021 at 3:34 PM Bhupesh Sharma <bhupesh.sharma@linaro.org>
> wrote:
> > >
> > > This is a backport request for dunfell, while picking up only the
> > > skeletal support for allowing mandatory dtschema handling for
> > > device trees built through the kernel, introduced from kernel
> > > version 5.16 onwards.
> >
> > The problem with adding this support to dunfell, is obvious in the
> > number of patches involved.  We've also said/known that at some point
> > that we won't be able to support all new kernel versions with the LTS
> > release. This may be the start of drawing that line.
> >
> > Also, we've had to do some license tweaks in master just today for one
> > of the added packages (idna), so that would be needed as well.
> >
> > The validation isn't absolutely critical, I'd suggest that just the
> > wrappers and pkg-config fixes would be a smaller footprint to allow
> > the kernel to build, without the new package/feature additions to the
> > dunfell release. The new packages (and full validation) could still
> > possibly be done through a secondary or mixin layer.
> >
> > I'm not sure which way to go on this, but I thought I'd offer those
> > points for discussion.
>
> I think this needs to be done in a mixin layer for dunfell.
>

ok.. what about honister? would you consider a backport of these patches
for this more recent release?


>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159062):
> https://lists.openembedded.org/g/openembedded-core/message/159062
> Mute This Topic: https://lists.openembedded.org/mt/87439224/1279857
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> nicolas.dechesne@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b5176205d28b49e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 1, 2021 at 10:39 PM Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Wed, 2021-12-01 at 16:33 -0500, Bruce Ashfiel=
d wrote:<br>
&gt; On Wed, Dec 1, 2021 at 3:34 PM Bhupesh Sharma &lt;<a href=3D"mailto:bh=
upesh.sharma@linaro.org" target=3D"_blank">bhupesh.sharma@linaro.org</a>&gt=
; wrote:<br>
&gt; &gt; <br>
&gt; &gt; This is a backport request for dunfell, while picking up only the=
<br>
&gt; &gt; skeletal support for allowing mandatory dtschema handling for<br>
&gt; &gt; device trees built through the kernel, introduced from kernel<br>
&gt; &gt; version 5.16 onwards.<br>
&gt; <br>
&gt; The problem with adding this support to dunfell, is obvious in the<br>
&gt; number of patches involved.=C2=A0 We&#39;ve also said/known that at so=
me point<br>
&gt; that we won&#39;t be able to support all new kernel versions with the =
LTS<br>
&gt; release. This may be the start of drawing that line.<br>
&gt; <br>
&gt; Also, we&#39;ve had to do some license tweaks in master just today for=
 one<br>
&gt; of the added packages (idna), so that would be needed as well.<br>
&gt; <br>
&gt; The validation isn&#39;t absolutely critical, I&#39;d suggest that jus=
t the<br>
&gt; wrappers and pkg-config fixes would be a smaller footprint to allow<br=
>
&gt; the kernel to build, without the new package/feature additions to the<=
br>
&gt; dunfell release. The new packages (and full validation) could still<br=
>
&gt; possibly be done through a secondary or mixin layer.<br>
&gt; <br>
&gt; I&#39;m not sure which way to go on this, but I thought I&#39;d offer =
those<br>
&gt; points for discussion.<br>
<br>
I think this needs to be done in a mixin layer for dunfell.<br></blockquote=
><div><br></div><div>ok.. what about honister? would you consider a backpor=
t of these patches for this more recent release?</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159062): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159062" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159062</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87439224/1279=
857" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87439224/1279857</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:nicolas.dechesne@linaro.or=
g" target=3D"_blank">nicolas.dechesne@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000b5176205d28b49e6--

