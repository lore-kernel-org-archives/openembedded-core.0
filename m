Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web09.6295.1603964998034503094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 02:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eAGLxyFI;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id b129so1165842vsb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 02:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7BgdDdW3LElTrX87WUEbhqfvhitTmKTFC2pDHxC/nFQ=;
        b=eAGLxyFICCrFuIMJ+vlZibJSIQZklIzD+30Azo7tmhrN3amsH03P0jLsQkpijfrn5t
         eX9FdWSRNR1vjRydCYKCO5Y2/nPTRyr8PLeO/Z30JzaIcelUZDnj+VfgmtdhprZopY3+
         dzhEFG20cMnIUKjaSCM4KjyCqU/ldXhoc96TCcL2SQaXm4KCjXj3GOsAlxqEeM3/jbpr
         UvuTPUrhghIB3FZAL2869aFHB7C9ZTvpF31GRuZmxfhtvZdtkLFJ5eXMs+PXUEnqLV5V
         Em03jURoBo8xWbREZTa36cS3EcwL+yRBBRa2sc5eV+10tRTOiHukQNglKa3oChlxjff5
         AiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7BgdDdW3LElTrX87WUEbhqfvhitTmKTFC2pDHxC/nFQ=;
        b=ZrrZTpOeosjxlomMN01LFjM+dqPRWHpWfmY0Tl/gevYW2cOaxcKZ10HUX5VM8mxoOb
         SeBLj4n8pbWINJxDFgpP/aBUrWbUowtReLJkJ6nSC4umn+eRJF7WQUwyyrLF59dwcrlN
         xLfent/WZoSNwdXS4X32DhE4DWKx69NecZnQsOzhS4yolESpRAOIDHV7Em2DYiKP/gFv
         xOffji35cxKwVcpOy/vASMQBvoa8z5coCUc9jjdqk7nIqxgyAiuJWFSs9u1KPUlwxjn0
         i2GYWgLG7A6YLMoyyHKLnP//Qg1YbbkDZqT5oHa/hjUXkD7YBRBeWWevuvVaGXjPpNLj
         9xJA==
X-Gm-Message-State: AOAM530/+qdi1nXvF89W5xht6xEZwdXV0mRTitMYYcr3HvbIcx5x93E1
	eYrVJX6mxunK3Ce4YmdzburdQp9QbJWxZe80hYE=
X-Google-Smtp-Source: ABdhPJx6IlOo6uh/b7I4wZrYOyvkXn8PQPgv+k8shUYLFV946x+IyHJYWFzP3/ks+elcZceKM+LFiHtwZlFwgFM2mYA=
X-Received: by 2002:a67:1087:: with SMTP id 129mr2167350vsq.41.1603964997205;
 Thu, 29 Oct 2020 02:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
 <20201028210558.21070-25-alex.kanavin@gmail.com> <CAMKF1srtg4ML0FUCCqkQEZdz4xgvtd+9M0S5P1N6=eang+8Aow@mail.gmail.com>
In-Reply-To: <CAMKF1srtg4ML0FUCCqkQEZdz4xgvtd+9M0S5P1N6=eang+8Aow@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 29 Oct 2020 10:49:45 +0100
Message-ID: <CANNYZj9_z+aNMr-eNgA__Wcig_Fcx43zSr+iGX7PZUp71u0jTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 25/33] libhandy: upgrade 0.0.13 -> 1.0.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e403bb05b2cc3303"

--000000000000e403bb05b2cc3303
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2020 at 23:09, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Oct 28, 2020 at 2:06 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-gnome/libhandy/libhandy_git.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> perhaps rename the recipe to libhandy_1.0.0.bb and drop setting PV in
> recipe ?
>

Sure, I queued a followup patch to do this.

Alex

--000000000000e403bb05b2cc3303
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 28 Oct 2020 at 23:09, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, Oct 28, 2020 at 2:06 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-gnome/libhandy/<a href=3D"http://libhandy_git.bb" r=
el=3D"noreferrer" target=3D"_blank">libhandy_git.bb</a> | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
perhaps rename the recipe to <a href=3D"http://libhandy_1.0.0.bb" rel=3D"no=
referrer" target=3D"_blank">libhandy_1.0.0.bb</a> and drop setting PV in re=
cipe ?<br></blockquote><div><br></div><div>Sure, I queued a followup patch =
to do this.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000e403bb05b2cc3303--
