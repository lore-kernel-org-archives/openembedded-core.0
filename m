Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1240C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 16:45:13 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web12.9645.1637167512877462266
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 08:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YB/UbPaK;
 spf=pass (domain: gmail.com, ip: 209.85.222.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id az37so7201685uab.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 08:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pudm+Wu2TkTmNYU6czt4pyF3eqP+XuPK1j0RogCyhc8=;
        b=YB/UbPaKJZmPEM+4yNsvGmo4eCm+Gy747owmDJ8gGIdeinSS/AUuweCdLNEu+uVISd
         6Nazuq61KrFB+BVHAfXXFJxadw7DQcL0y96UMzTQx5NqFka3PRFCO9QbP/OdlMty8dx2
         W9S2uaiNiUjWSaIWOxRv4txnCLwdPe7sHAXNEf1matUs3xKz5MGsX8VOHSDDknTTdu4y
         Wh8u1JIvgGISIMWHyljxWB9ztbyVVURu6dx0qcJ0kDQu48NVBQiZONxkCUnw0aFBKOWa
         08SZw03qo5zWx1HAXXfIlQDVyE+AOghjac9tH5IFts7Xpewl7cua0o9dqjzsx1MGKK8X
         5sQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pudm+Wu2TkTmNYU6czt4pyF3eqP+XuPK1j0RogCyhc8=;
        b=F4pHkvlImUADAmToxeErJ6x2ES8jWb7AQBfDaxgqL2MY+fCVNzXX0i/2rBE1mP9w9d
         FTDWhAC5UOvG1uR2sWJBAYhVrLwBVlhNfXSeHMboFs17RUKgRjYibFfGBH91XCHtT3tQ
         1Mk6Wabgsw8eAOS4+0YDOYqNLv0vUR9DFsAz4mvejvrqqnDwoaMZ0FvBNqHTZBb+Mrsm
         l8YyoP6vIsRZs/gC+EEk+wd3zZi7Jjknzq4mEVDG58C5VJjGgiEMMcwsW1yyRfF+ffLx
         Q3yXyYrAWcbKCH+4dWY1KQPpyHTl7FKT1KzTN1wwhfhW5Io7usdBtJQyrQWkzJiEtWAA
         pvTg==
X-Gm-Message-State: AOAM531RK5aBh1qfj7v84XyPyQdauvE9VrvpeIix+oBLC6L4D3r+UBth
	y2DVtDLhk8cPrA87IIkZWYuqOhrWRweIhVQ3XUc=
X-Google-Smtp-Source: 
 ABdhPJzB6cpHXfjoiu/rKv1PQC5cAKd6RE09Bv8W4py+oAUfv28TXAm7fhEddr/klS0fBcxcPy3TeNDEj60FkyqMz1c=
X-Received: by 2002:a05:6102:b13:: with SMTP id
 b19mr71126091vst.1.1637167511918;
 Wed, 17 Nov 2021 08:45:11 -0800 (PST)
MIME-Version: 1.0
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
 <CANNYZj-tjH20-ocHq_7DWC6qaPA0XhKfk4cGXMPNbs-_YXp8jg@mail.gmail.com>
 <510650712bc36f761fc9c43d47a1761bc4d60366.camel@gmail.com>
 <CANNYZj_1r4Gj_CwBE7Rrr3NedxH9saVQeEuu1mpBFx9A=stDGQ@mail.gmail.com>
 <fe49ca32907173d954160ead0c714eaa654a3ae5.camel@gmail.com>
In-Reply-To: <fe49ca32907173d954160ead0c714eaa654a3ae5.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Nov 2021 17:44:59 +0100
Message-ID: 
 <CANNYZj9BTbgsZznvdiP3Fhcc9Wwmb_5F3AnZ1gGyS0TKnv6gqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/8] systemd: allow building for nativesdk
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 paul.eggleton@microsoft.com
Content-Type: multipart/alternative; boundary="000000000000fc5bcd05d0fec3f8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 16:45:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158433

--000000000000fc5bcd05d0fec3f8
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Nov 2021 at 17:11, Luca Boccassi <luca.boccassi@gmail.com> wrote:

> > What I'm trying to say is running those systemd analyzers should be
> > enabled in regular yocto builds first before it's enabled in SDKs.
> > It's not a good idea to have a feature that is available in SDKs but
> > not available in direct use of bitbake to build recipes.
> >
> > Alex
>
> But it is already available? And it has been for a long time:
>
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/systemd/systemd_249.5.bb#n411


This is packaging the tool for the target images; what I propose is that
it's built and used natively.

Alex

--000000000000fc5bcd05d0fec3f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 17 Nov 2021 at 17:11, Luca Boccassi &lt;<a href=3D"mailto:lu=
ca.boccassi@gmail.com">luca.boccassi@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">&gt; What I&#39;m trying to s=
ay is running those systemd analyzers should be<br>
&gt; enabled in regular yocto builds first before it&#39;s enabled in SDKs.=
<br>
&gt; It&#39;s not a good idea to have a feature that is available in SDKs b=
ut<br>
&gt; not available in direct use of bitbake to build recipes.<br>
&gt; <br>
&gt; Alex<br>
<br>
But it is already available? And it has been for a long time:<br>
<br>
<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/recipes=
-core/systemd/systemd_249.5.bb#n411" rel=3D"noreferrer" target=3D"_blank">h=
ttps://git.openembedded.org/openembedded-core/tree/meta/recipes-core/system=
d/systemd_249.5.bb#n411</a></blockquote></div><div class=3D"gmail_quote"><b=
r></div><div class=3D"gmail_quote">This is packaging the tool for the targe=
t images; what I propose is that it&#39;s built and used natively.</div><di=
v class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div>=
</div>

--000000000000fc5bcd05d0fec3f8--

