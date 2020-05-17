Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.22648.1589723793361866235
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 06:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ViZ3wkTW;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id i16so1729456edv.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2020 06:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IC2wQiIU60I92qqpxekv4wcmTu8udm51W0ZU2T9+t4g=;
        b=ViZ3wkTWmGX2pYDeLt8iM7Xe1E13fNveAuep4WH4d7qsz70t4MHbLSPnl7MmhnZe90
         MCO8WhCrWjrwyXr5gMfTdqumed0gdJ4UlAmB4TOy2GzOvyuywvHwJ1Z8O7oqEmxzJukp
         aw4KGW8b6ri1pqCIIily2rq3a6sd5KE9Y1/rP3gPtm40M5SRESQvtHVpR4v2VgEDfUi3
         8Nd/0dO1YXHOvEjkJb4vAPbDrovRDXx5te3KKGUQJ577LySKg8GGgsmBHNEqN2Vq2Gl1
         bK84kbnkeTDFGAhdlzYemRizznataPjwFgltT5qv52mrBVpNh2g86cSYNt6L5fklJUzg
         UVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IC2wQiIU60I92qqpxekv4wcmTu8udm51W0ZU2T9+t4g=;
        b=thqCm/zn35E+9U2+uKS0skqg6jFgnn0hyMjPG2qzcyv229+3AtqkHJU9s1JJGJgwvC
         BqpKmNkkL43acGdTNGeydSHZgRWLzdHwDgHJFTjuacaTjXIshoovGWsqdxuReoKTLbo3
         VfOU6+/BovbNRKQwzh3nCwbK/1xe6wgARC1gMFGzu2vp50k/atdn6NzCHeMwUv3VNmfc
         0kQ0chWGratuPz4xYipYVKvp1MUKiedTRKmEtPqDRCmpi1prMKbkhdwE8/lbzj6zOnpM
         wqQSYfaPQ83M1HeEwf4Wv7bIoeMWpdnFeMLalhN7+gInewdgeHfxxrnjjO77kWxnh47m
         54bg==
X-Gm-Message-State: AOAM531ks1cZMLjEGOMBpukBKfnAi7VqVeGDL1WiQueoF8TqLQzcKbk/
	Sv/UO3LUsdoWBGaVdNKwigbfKGKP3afDFvoSEAU=
X-Google-Smtp-Source: ABdhPJyZ9+3uXSNq02PxpokJJ/Q6/Bn2yHPcFDSxR6kh/Yj1mnRPjNfplEdIAWg7B1J7RwxG/phImWfZX9X0U8Lh/YQ=
X-Received: by 2002:a50:eb8e:: with SMTP id y14mr9807776edr.270.1589723791811;
 Sun, 17 May 2020 06:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200514210458.33543-1-JPEWhacker@gmail.com> <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost> <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
 <20200516200957.GA8056@localhost> <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
 <20200517132245.GA9940@localhost>
In-Reply-To: <20200517132245.GA9940@localhost>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sun, 17 May 2020 15:56:20 +0200
Message-ID: <CA+chaQeoVSY1HqivTCVkDixgJZOzxYchZ83FvRhgKuADwKJcFg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
To: Adrian Bunk <bunk@stusta.de>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Steve Sakoman <sakoman@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Denys Dmytriyenko <denis@denix.org>, Joshua Watt <jpewhacker@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"jdmason@kudzu.us" <jdmason@kudzu.us>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e6eab305a5d8698b"

--000000000000e6eab305a5d8698b
Content-Type: text/plain; charset="UTF-8"

On Sun, May 17, 2020 at 3:22 PM Adrian Bunk <bunk@stusta.de> wrote:

> > That I believe would be a terrible mistake when people opt-in to take
> > a layer, but never care about updating it... :(
>
> The typical Yocto user starts with whatever prehistoric Yocto release
> came with the BSP distribution for the reference hardware, and then
> develops a new product on top of that.
>
> I would not be surprised if someone will have the initial Yocto 2.7
> release, but uses the latest from the corresponding  meta-openembedded
> branch on top.
>

And should these people really block us doing changes which require update
in multiple layers at "the same time"?

If they are using the prehistory revision of given Yocto release and not
even the latest revision in given branch, then they are already missing
much more than 3 python recipes migrated from meta-oe and they should learn
to update the layers they are using, I think we have relatively good track
of not breaking stable branches with incompatible changes, so upgrading
from e.g. initial release revision of dunfell to latest in oe-core together
with all other layers, shouldn't cause (m)any issues after 5 years when
someone will be looking at this BSP which got released with prehistory
dunfell release.

Point releases are nice, but people should really use whatever is latest
revisions in the branches they use and that's IMHO the recommendation from
Yocto Project itself as well (IIRC we discussed it in OE TSC when talking
about tags for point releases).

Regards,

--000000000000e6eab305a5d8698b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, May 17, 2020 at 3:22 PM Adrian Bu=
nk &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br><=
/div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">&gt; That I believe would be a terrible mistake when people opt-in t=
o take<br>
&gt; a layer, but never care about updating it... :(<br>
<br>
The typical Yocto user starts with whatever prehistoric Yocto release <br>
came with the BSP distribution for the reference hardware, and then <br>
develops a new product on top of that.<br>
<br>
I would not be surprised if someone will have the initial Yocto 2.7<br>
release, but uses the latest from the corresponding=C2=A0 meta-openembedded=
 <br>
branch on top.<br></blockquote><div><br></div><div>And should these people =
really block us doing changes which require update in multiple layers at &q=
uot;the same time&quot;?</div><div><br></div><div>If they are using the pre=
history revision of given Yocto release and not even the latest revision in=
 given branch, then they are already missing much more than 3 python recipe=
s migrated from meta-oe and they should learn to update the layers they are=
 using, I think we have relatively good track of not breaking stable branch=
es with incompatible changes, so upgrading from e.g. initial release revisi=
on of dunfell to latest in oe-core together with all other layers, shouldn&=
#39;t cause (m)any issues after 5 years when someone will be looking at thi=
s BSP which got released with prehistory dunfell release.</div><div><br></d=
iv><div>Point releases are nice, but people should really use whatever is l=
atest revisions in the branches they use and that&#39;s IMHO the recommenda=
tion from Yocto Project itself as well (IIRC we discussed it in OE TSC when=
 talking about tags for point releases).</div><div><br></div><div>Regards,<=
/div><div>=C2=A0</div></div></div>

--000000000000e6eab305a5d8698b--
