Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA7BC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:15:44 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.10887.1639401343212102190
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:15:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WPXeehgs;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id o1so29090287uap.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c3sxv3LPWFAOif7emajdra18wa/nNRkUafrqgDHHfuY=;
        b=WPXeehgsC22kgGnG1N/vjtXf7qy6i9HAL/PW5txiSUjCtzSRcxk4b6oLOHkwbDMA0L
         6MDRBHZp5C8LhcQvJ68BSpHAfaxwXWoQt/ZhMRvwlroCY39SUVo6B2OKSrR+96WAOXjV
         ejjcqq3X2ZlGuVuGjYi68jQihpfy2KOlIVyz2/EJA7xE3I/Jef5z5vRqa5qafU6e+Lmv
         BK6DrSsJFZlkjN6fHv1hMzZ4ZmFU9fZ40FR0Z6IUmk9LEd2rgTQumUMFIYPrQxo8Jusu
         hostDd5U2BwYwJQc1OL99iMCZrYj/mWQULMx2ojlWP5plxOQqIHUWKBXvINVRGA7tMKy
         BiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c3sxv3LPWFAOif7emajdra18wa/nNRkUafrqgDHHfuY=;
        b=HDcSiMnZ2MMyiKrLrx92r2CcDXSlR+/kni7Im/Z8vJU+z2vpfRkYKG5DgFrffb+zYn
         h99iJUZfjftM5kk1Aq83lPzCqzIZ9P9EKnHDFyVrDGhQxCRvi3/zWKXTtgJQImQil+nU
         yvdW1jtPN8q1AOYD/bnz9vxU3/aZuteNu36xheQwNIbDONcgE1z9uGxJaREUyzsbw6lI
         8ZzGiSSimc8xl1NYtO2VIvL2iXfr8yPCeVgqjL5vtpGsXYW97F48ZIN7Y7jLkoLSgOHO
         X0nqzDlIm0XL4gElI+i5A8HsYvAGeHc0++ub2OtAArZtBJBAhQqPbFthcxAVw4kznavU
         +/kg==
X-Gm-Message-State: AOAM530EqF6NvMI+lsI67Fsi6c0rhwrd+wCZOhoDAKGHXGEv9o855KbX
	ca1hXx/wuMDOS5NSvZZsA+jTbMlYbwv60aD/QM0=
X-Google-Smtp-Source: 
 ABdhPJyBlG+E8BKBNY8meljkwcQnOdC/l3TnyZCK0aJijCzFEdo8PwJGFqHjKw1iGllN3tJZCAVFYtk7rvimQTvuBtU=
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr40028480uai.89.1639401342258;
 Mon, 13 Dec 2021 05:15:42 -0800 (PST)
MIME-Version: 1.0
References: 
 <20211213123826.31605-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj_Kr9ziC4TLcgTZ_cGzaFy1-6uDD_V0geAEJnt1p7cEWg@mail.gmail.com>
 <16C0520074644916.18377@lists.openembedded.org>
 <f8505299-9e6b-8579-858a-906f00fe0b10@weidmueller.com>
In-Reply-To: <f8505299-9e6b-8579-858a-906f00fe0b10@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Dec 2021 14:15:31 +0100
Message-ID: 
 <CANNYZj9uy1Q+S_o-EDHS=t-R8Rgx3DH_JOyuU-7G1e1DuQs11g@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/3] recipetool: Separate licenses with &
 operator
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000a6509a05d306dee7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 13:15:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159626

--000000000000a6509a05d306dee7
Content-Type: text/plain; charset="UTF-8"

I mean that by reading the patch and the commit message it is not clear
what problem is being fixed. It needs to be explained by showing what
happens when there is no patch, and what happens when there is.

Alex

On Mon, 13 Dec 2021 at 14:01, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> Am 13.12.2021 um 14:00 schrieb Stefan Herbrechtsmeier via
> lists.openembedded.org:
> >
> >
> > Am 13.12.2021 um 13:57 schrieb Alexander Kanavin:
> >> On Mon, 13 Dec 2021 at 13:38, Stefan Herbrechtsmeier
> >> <stefan.herbrechtsmeier-oss@weidmueller.com
> >> <mailto:stefan.herbrechtsmeier-oss@weidmueller.com>> wrote:
> >>
> >>     From: Stefan Herbrechtsmeier <
> stefan.herbrechtsmeier@weidmueller.com
> >>     <mailto:stefan.herbrechtsmeier@weidmueller.com>>
> >>
> >>     Separate licenses with & operator since it should be satisfied
> >> most use
> >>     cases and it is a reasonable assumption that all the licenses apply.
> >>     Furthermore flat, split and sort the licenses to minimize license
> >> string
> >>     changes.
> >>
> >>
> >> I think this is better explained with an example. What did not work
> >> before, and what works with this change?
> >
> > Do you mean something like:
> >
> > -LICENSE = "MIT ISC Unknown"
> > +LICENSE = "BSD-3-Clause & ISC & MIT & Unknown"
>
> Sorry I mean:
>
> -LICENSE = "MIT ISC Unknown"
> +LICENSE = "ISC & MIT & Unknown"
>

--000000000000a6509a05d306dee7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I mean that by reading the patch and the commit messa=
ge it is not clear what problem is being fixed. It needs to be explained by=
 showing what happens when there is no patch, and what happens when there i=
s.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 13 Dec 2021 at 14:01, Ste=
fan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsmeier-oss@weidmu=
eller.com">stefan.herbrechtsmeier-oss@weidmueller.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Am 13.12.2021 um 14:00=
 schrieb Stefan Herbrechtsmeier via <br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a>:<br>
&gt; <br>
&gt; <br>
&gt; Am 13.12.2021 um 13:57 schrieb Alexander Kanavin:<br>
&gt;&gt; On Mon, 13 Dec 2021 at 13:38, Stefan Herbrechtsmeier <br>
&gt;&gt; &lt;<a href=3D"mailto:stefan.herbrechtsmeier-oss@weidmueller.com" =
target=3D"_blank">stefan.herbrechtsmeier-oss@weidmueller.com</a> <br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:stefan.herbrechtsmeier-oss@weidmuelle=
r.com" target=3D"_blank">stefan.herbrechtsmeier-oss@weidmueller.com</a>&gt;=
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 From: Stefan Herbrechtsmeier &lt;<a href=3D"mai=
lto:stefan.herbrechtsmeier@weidmueller.com" target=3D"_blank">stefan.herbre=
chtsmeier@weidmueller.com</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;mailto:<a href=3D"mailto:stefan.herbrechtsm=
eier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmueller.=
com</a>&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Separate licenses with &amp; operator since it =
should be satisfied <br>
&gt;&gt; most use<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 cases and it is a reasonable assumption that al=
l the licenses apply.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Furthermore flat, split and sort the licenses t=
o minimize license <br>
&gt;&gt; string<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 changes.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I think this is better explained with an example. What did not wor=
k <br>
&gt;&gt; before, and what works with this change?<br>
&gt; <br>
&gt; Do you mean something like:<br>
&gt; <br>
&gt; -LICENSE =3D &quot;MIT ISC Unknown&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause &amp; ISC &amp; MIT &amp; Unknown&quot=
;<br>
<br>
Sorry I mean:<br>
<br>
-LICENSE =3D &quot;MIT ISC Unknown&quot;<br>
+LICENSE =3D &quot;ISC &amp; MIT &amp; Unknown&quot;<br>
</blockquote></div>

--000000000000a6509a05d306dee7--

