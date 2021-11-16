Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5960C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 11:14:51 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web08.8465.1637061290625768786
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M6TJWahJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.174,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id e7so27897917ljq.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CFybHFNPuLQRIl59cEbSv+7iHtB32+JPptM67uGyvps=;
        b=M6TJWahJEH0mUijeAeOUQL70eTpx8tPXVNCGdlrSUe9t3FRFVybAZv0neJFEuU9oIJ
         LVHv6gibXPcKYrLQW7FSWDoCzMEl/iHDruJv4AnjE1kSx3d9CObl6DqfIUSm14NKR/3A
         0HebHq8Lc0F5B5fm6+2TiH1a2kD5/sRL9zeHk71hJIApCamVxuuhaZKaEvZEuO794Ums
         Iv14OELNJg2M3z4jfq/seIxinavIBvg4IZvpmw+xKPsTza7sOuz9Qn+x8M8oRwet6YA1
         72Vxvo8BgcAUshGWaR6lMO0TuhTv0MRp0NJx9pX9mxGAdHbYDTR+mnDqcxEkYXpH5mY7
         /xRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CFybHFNPuLQRIl59cEbSv+7iHtB32+JPptM67uGyvps=;
        b=kVPLA4On+qqJ84ZzpQ4enQGJWcnBtYhQI7DJ/vutrn0ebTx2z9VmvKGca+ylk0egPL
         ACZ7lUBVnK+MAGkEA1IhMyyR6P2dG0UGlyRtHg5WKZxLDwD6c/pNrfbYF5Fqq5jm9ave
         5fPlMxsvGcvpjuV+cfaUG4yBgLFNcUhxe/IExuvLfEneKvEMr4HqlFEpw1JscxkPY5Xv
         zEKQ1/QyZD7yht0gog/zXy3/8sQ998Zg/UzT3GEQ9znyZfum5SlhzM16RZQJNHwtKLDi
         Q9LYSpwi9z3nafhROUpXcnspliLRhHl+aOcdIt7qTPsDc+H6zCBQ+iYck2vqCRBxwwPZ
         jH7w==
X-Gm-Message-State: AOAM533wrYxP+s0nxAW27MDy7vlZKu1p61N5Qg5bTScKiHPzBwirNMQz
	7cdPRXT9ekVlSAs/HtIiWHnC7X8POMLswdeKXC8=
X-Google-Smtp-Source: 
 ABdhPJy3YF0Rrlwyp0o7HE+hnHTZp0jcL1yEfJxDGK9vDJOvAbJez5W869XJ5QwFTTXpIdYEj++Q7mYnrGYxJGTIaXI=
X-Received: by 2002:a2e:9510:: with SMTP id f16mr6309130ljh.409.1637061288773;
 Tue, 16 Nov 2021 03:14:48 -0800 (PST)
MIME-Version: 1.0
References: <20211027013050.137364-1-saul.wold@windriver.com>
 <89232e41-ac8b-def5-94b9-22d08b7e01d3@gmail.com>
 <9c6aa6d7-ddb5-0bab-8639-063e71379101@windriver.com>
 <3381838.aeNJFYEL58@linc>
In-Reply-To: <3381838.aeNJFYEL58@linc>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 16 Nov 2021 11:14:37 +0000
Message-ID: 
 <CANPvuR=q-vByPm=fz-1L3o6T=y1UFtEFSn_ZPO=kUV0EqBK+UA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] SPDX: Add annotations to relationship
To: Paul Eggleton <bluelightning@bluelightning.org>
Cc: Joshua Watt <jpewhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Steve Sakoman <sakoman@gmail.com>, Saul Wold <Saul.Wold@windriver.com>,
	Andres Beltran <abeltran@linux.microsoft.com>
Content-Type: multipart/alternative; boundary="00000000000097ca0205d0e6085f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 11:14:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158343

--00000000000097ca0205d0e6085f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Great to hear it.

I think the SPDX/SBOM will be useful for a bunch of users/companies that
currently use the yocto LTS dunfell.
It will be an awesome improvement if we have the SPDX/SBOM supported and
even more given that the dunfel
branch support has been extended for more than 2 years, until Apr. 2024.

I would be very happy if I could help in any way.

Jose

Paul Eggleton <bluelightning@bluelightning.org> escreveu no dia segunda,
15/11/2021 =C3=A0(s) 22:44:

> On Tuesday, 9 November 2021 08:01:38 NZDT Saul Wold wrote:
> > On 11/4/21 2:20 PM, Joshua Watt wrote:
> > > On 11/4/21 3:50 PM, Richard Purdie wrote:
> > >> On Thu, 2021-11-04 at 15:45 -0500, Joshua Watt wrote:
> > >>> On 11/4/21 3:43 PM, Richard Purdie wrote:
> > >>>> On Thu, 2021-11-04 at 20:00 +0000, Jose Quaresma wrote:
> > >>>>> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no
> dia
> > >>>>> quinta,
> > >>>>>
> > >>>>> 28/10/2021 =C3=A0(s) 21:58:
> > >>>>>> On Thu, 2021-10-28 at 08:47 -1000, Steve Sakoman wrote:
> > >>>>>>> On Tue, Oct 26, 2021 at 10:41 PM Jose Quaresma
> > >>>>>>> <quaresma.jose@gmail.com>
> > >>>>>>
> > >>>>>> wrote:
> > >>>>>>>> Hi all,
> > >>>>>>>>
> > >>>>>>>> There are any plans or is it possible to backport the SBOM/SPD=
X
> > >>>>>>>> to the
> > >>>>>>
> > >>>>>> dunfell branch?
> > >>>>>>
> > >>>>>>> I'm going to yield to Saul as to whether he thinks this is
> > >>>>>>> desirable/possible or not.
> > >>>>>>
> > >>>>>> The packagedata changes are pretty invasive unfortunately and
> > >>>>>> likely not
> > >>>>>> something you're going to want in dunfell sadly.
> > >>>>>
> > >>>>> Thanks for the clarification.
> > >>>>
> > >>>> I have been thinking a bit more about this. I did wonder if we
> > >>>> should consider a
> > >>>> mixin layer of some kind for it that could work with dunfell?
> > >>>>
> > >>>> We could host it, it is just a question of writing the mixin layer
> and
> > >>>> maintaining it.
> > >>>
> > >>> I don't think it's going to be possible with a pure mixin layer,
> since
> > >>> it relies on the extended package data?
> > >>
> > >> I suspect that could perhaps be patched in through a layer though? Y=
ou
> > >> might
> > >> choose to drop the compression piece or do it differently for the
> > >> backport?
> > >
> > > I'm not sure if a layer could hook in well enough to get the data
> > > needed...  maybe worth an experiment though
> >
> > Yeah, I am not sure an mixin could track the changes for package.bbclas=
s
> >
> > > With a backport, I would probably either use GZip compression or no
> > > compression. The zstd compression was designed as a drop in replaceme=
nt
> > > for Gzip if we wanted to go that route.
> >
> > I will say that we did something similar with Hardknott for WRLinux, bu=
t
> > did not propose it upstream as Hardknott was knot going to be supported
> > longer term.
> >
> > Having the spdx class standalone with the correctly backported changes
> > seems to be working
>
> FYI Andres and I have done this backport to dunfell - should I post it?
> That
> said, I did just take the hit on some of the invasive parts (e.g. LICENSE
> value changes). I think given regulatory requirements this is important
> for
> lots of folks, so we probably need to do something here. Happy to be part
> of
> it.
>
> Cheers
> Paul
>
>
>
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000097ca0205d0e6085f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Paul,<div><br></div><div>Great to=C2=A0hear it.</div><d=
iv><br>I think the SPDX/SBOM will be useful=C2=A0for a bunch of users/compa=
nies that currently use the yocto LTS dunfell.</div><div><div>It will be an=
 awesome improvement if we have the SPDX/SBOM supported and even more given=
 that the dunfel</div><div>branch support has been extended for more than 2=
 years, until Apr. 2024.</div></div><div><br></div><div>I would be very hap=
py if I could help in any way.<br></div><div><br></div><div>Jose</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Paul =
Eggleton &lt;<a href=3D"mailto:bluelightning@bluelightning.org">bluelightni=
ng@bluelightning.org</a>&gt; escreveu no dia segunda, 15/11/2021 =C3=A0(s) =
22:44:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tuesda=
y, 9 November 2021 08:01:38 NZDT Saul Wold wrote:<br>
&gt; On 11/4/21 2:20 PM, Joshua Watt wrote:<br>
&gt; &gt; On 11/4/21 3:50 PM, Richard Purdie wrote:<br>
&gt; &gt;&gt; On Thu, 2021-11-04 at 15:45 -0500, Joshua Watt wrote:<br>
&gt; &gt;&gt;&gt; On 11/4/21 3:43 PM, Richard Purdie wrote:<br>
&gt; &gt;&gt;&gt;&gt; On Thu, 2021-11-04 at 20:00 +0000, Jose Quaresma wrot=
e:<br>
&gt; &gt;&gt;&gt;&gt;&gt; Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.or=
g</a>&gt; escreveu no dia<br>
&gt; &gt;&gt;&gt;&gt;&gt; quinta,<br>
&gt; &gt;&gt;&gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt;&gt;&gt; 28/10/2021 =C3=A0(s) 21:58:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; On Thu, 2021-10-28 at 08:47 -1000, Steve Sako=
man wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; On Tue, Oct 26, 2021 at 10:41 PM Jose Qua=
resma<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Hi all,<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; There are any plans or is it possible=
 to backport the SBOM/SPDX<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; to the<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; dunfell branch?<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; I&#39;m going to yield to Saul as to whet=
her he thinks this is<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; desirable/possible or not.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; The packagedata changes are pretty invasive u=
nfortunately and<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; likely not<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; something you&#39;re going to want in dunfell=
 sadly.<br>
&gt; &gt;&gt;&gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt;&gt;&gt; Thanks for the clarification.<br>
&gt; &gt;&gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt;&gt; I have been thinking a bit more about this. I did won=
der if we<br>
&gt; &gt;&gt;&gt;&gt; should consider a<br>
&gt; &gt;&gt;&gt;&gt; mixin layer of some kind for it that could work with =
dunfell?<br>
&gt; &gt;&gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt;&gt; We could host it, it is just a question of writing th=
e mixin layer and<br>
&gt; &gt;&gt;&gt;&gt; maintaining it.<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; I don&#39;t think it&#39;s going to be possible with a pu=
re mixin layer, since<br>
&gt; &gt;&gt;&gt; it relies on the extended package data?<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; I suspect that could perhaps be patched in through a layer th=
ough? You<br>
&gt; &gt;&gt; might<br>
&gt; &gt;&gt; choose to drop the compression piece or do it differently for=
 the<br>
&gt; &gt;&gt; backport?<br>
&gt; &gt; <br>
&gt; &gt; I&#39;m not sure if a layer could hook in well enough to get the =
data<br>
&gt; &gt; needed...=C2=A0 maybe worth an experiment though<br>
&gt; <br>
&gt; Yeah, I am not sure an mixin could track the changes for package.bbcla=
ss<br>
&gt; <br>
&gt; &gt; With a backport, I would probably either use GZip compression or =
no<br>
&gt; &gt; compression. The zstd compression was designed as a drop in repla=
cement<br>
&gt; &gt; for Gzip if we wanted to go that route.<br>
&gt; <br>
&gt; I will say that we did something similar with Hardknott for WRLinux, b=
ut<br>
&gt; did not propose it upstream as Hardknott was knot going to be supporte=
d<br>
&gt; longer term.<br>
&gt; <br>
&gt; Having the spdx class standalone with the correctly backported changes=
<br>
&gt; seems to be working<br>
<br>
FYI Andres and I have done this backport to dunfell - should I post it? Tha=
t <br>
said, I did just take the hit on some of the invasive parts (e.g. LICENSE <=
br>
value changes). I think given regulatory requirements this is important for=
 <br>
lots of folks, so we probably need to do something here. Happy to be part o=
f <br>
it.<br>
<br>
Cheers<br>
Paul<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--00000000000097ca0205d0e6085f--

