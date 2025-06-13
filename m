Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93095C71148
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 18:55:37 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.4744.1749840937013205545
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 11:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=AwnLyida;
 spf=pass (domain: limonsoftware.com, ip: 209.85.128.172, mailfrom: anibal@limonsoftware.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-710e344bbf9so22267127b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 11:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1749840936; x=1750445736; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mzCKu61foJZ9wYGBhkj9IeRokuED9mqm2U9BoLCL4Zk=;
        b=AwnLyidaugml+7mzN5a1BtCvwLCeOTy1FE3tOoMbsRZuC8NuqkhGOaxDJVYjBlTwzP
         Eo9Q4EPAFM2L00jKjGyCW6NpqegERKHQf5q6blGackcD5kIY3Q0nZAK0HFfJpmWZDSBZ
         1uEFqIWKoxQZRWa+jol54AoclvI6mm/oDWd1L5QaQqOqv5TQGbO1VvVh3htqmP+iZ7EV
         qGw8OZ24RwLejJVEFA+LLctuWjWoJoHwEvzrXJjADKcZutqO0XPNH0h0wpzvE+hXpF/S
         5pX+7XijoISnfZ8HWCWFmFwdZlY1UjXEPzfDPDjiV/Uio726QnjBEssOj4Klz2T0Fnq1
         UeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749840936; x=1750445736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzCKu61foJZ9wYGBhkj9IeRokuED9mqm2U9BoLCL4Zk=;
        b=qxH0ss2lv2/Dp6RPCK9fZcCoGCliAy4QgP9xqNXT/aI4eiIZ0dg9mETV+mEZbx55Wr
         NJiq0487ucJBuZ3pEpT5UK49xFSwyeZKHoCbHHoN4IEjToV0Jc1ieu1I1Hyu1IslOEtV
         E7gwyD5o0ekNnwoIveCOqWrRDsUe8b4ZRpkEMq8jEQRRdHGMtBU3SpGYe87BibK8lkv+
         fTWienA+8LbfVUOKUgTtxsLyhy+Ky/nT3x3e2vS1CaeW/eGqLD07BjFJ3MCE9VmXFNMJ
         osnZY617LTrfzY2LfmRdVdXumPO55LrydUdF1+Gbhlp56b/UQllhPqukro/WsOP4BqEB
         yGyQ==
X-Gm-Message-State: AOJu0YyrxE2fJA5x8UorD7olA7k5wvAMl7RNWXeDXdpYLizwnDbEB+h6
	VnX0XrBZyeN+nDNPSAvVvDpog9ET2TqRa5RTRNJpaodZH3ijp2MVfIOa4qrDBk5l4huf0wdSLVw
	xgDHw8Qro8ypCLlp/ZRa1Sjre6rcOfz3MeHoCidwvpQ==
X-Gm-Gg: ASbGncvPT5gT7vjXNlFnjRik4mPeJBjDa/n/FfdEJjqg41iH5B0nJf1laz5ti+8UqN4
	17/pANvg4Wz+Ys58TKx2Rsgt9cqCkhgwZ+XYMnb7NHo4lvSlBXMVkMOkCvpuxS4ntMWZSGHjfcY
	h1/CS+4JMCl8Gyci0hdHZNOEh+0p8KlE/mpehZpc3qGuXMyQ==
X-Google-Smtp-Source: AGHT+IEj7pnGQewHsNyK81z9fz2VFF2J2f4im+xoatEIg6QSPi6l6eDO25rHG3bwRIhT/T0fH3EtvUY4kASCoUg8BkY=
X-Received: by 2002:a05:690c:6f91:b0:70f:84c8:311a with SMTP id
 00721157ae682-7117537b4d0mr8791627b3.5.1749840936214; Fri, 13 Jun 2025
 11:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250611153319.54778-1-anibal@limonsoftware.com> <b3c7b67408f7279eb75766f8d4f9430b273059ec.camel@linuxfoundation.org>
In-Reply-To: <b3c7b67408f7279eb75766f8d4f9430b273059ec.camel@linuxfoundation.org>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Fri, 13 Jun 2025 12:55:25 -0600
X-Gm-Features: AX0GCFtj0FJUR9Mg0FVb2gWt2feO9sR1l1jJ8p7nqZQs9rrH5sR6Ye6c9ivBILw
Message-ID: <CAOU5ZMtJSH_DkTO-12Z=A8a7XZOP-d3oEXX5e29NkxCq=xNC4Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] wic: pluginbase workaround on invalid module filenames
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com, 
	bruce.ashfield@gmail.com, Trevor Woerner <twoerner@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006ab71006377897ac"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 18:55:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218623

--0000000000006ab71006377897ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 10:49=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2025-06-11 at 15:33 +0000, Anibal Limon wrote:
> > Apply a workaround on invalid identifiers replace '-' to '_' to load
> > the module with valid identifier.
> >
> > Let the user know (warning) about plugin doesn't has a valid module
> > identifier to encourage fix, it gives time before rename oe-core wic
> > plugins and drop workaround.
> >
> > Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
> > ---
> >  scripts/lib/wic/pluginbase.py | 25 +++++++++++++++++++++----
> >  1 file changed, 21 insertions(+), 4 deletions(-)
>
> I think there was a bit of a misunderstanding about what Ross/I were
> suggesting. I've sent out an alternative patch showing what I was
> thinking of, basically just renaming the plugin names passed in into
> the correct format.
>

Hey, so yeah looks fine to me, better patch then!, :).
 I will give a look and do my test case for extension.

Thanks!,
Anibal

>
> We could put warnings in the code about old naming too, I've not done
> that but perhaps we should, maybe as a function alongside
> get_plugins().
>
> Cheers,
>
> Richard
>

--0000000000006ab71006377897ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 13,=
 2025 at 10:49=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2025-06-1=
1 at 15:33 +0000, Anibal Limon wrote:<br>
&gt; Apply a workaround on invalid identifiers replace &#39;-&#39; to &#39;=
_&#39; to load<br>
&gt; the module with valid identifier.<br>
&gt; <br>
&gt; Let the user know (warning) about plugin doesn&#39;t has a valid modul=
e<br>
&gt; identifier to encourage fix, it gives time before rename oe-core wic<b=
r>
&gt; plugins and drop workaround.<br>
&gt; <br>
&gt; Signed-off-by: Anibal Limon &lt;<a href=3D"mailto:anibal@limonsoftware=
.com" target=3D"_blank">anibal@limonsoftware.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0scripts/lib/wic/pluginbase.py | 25 +++++++++++++++++++++----<br>
&gt; =C2=A01 file changed, 21 insertions(+), 4 deletions(-)<br>
<br>
I think there was a bit of a misunderstanding about what Ross/I were<br>
suggesting. I&#39;ve sent out an alternative patch showing what I was<br>
thinking of, basically just renaming the plugin names passed in into<br>
the correct format.<br></blockquote><div><br></div><div>Hey, so yeah looks =
fine to me, better patch then!, :).</div><div>=C2=A0I will give a look and =
do my test case for extension.</div><div><br></div><div>Thanks!,</div><div>=
Anibal</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
We could put warnings in the code about old naming too, I&#39;ve not done<b=
r>
that but perhaps we should, maybe as a function alongside<br>
get_plugins().<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000006ab71006377897ac--

