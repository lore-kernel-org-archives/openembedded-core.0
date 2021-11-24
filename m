Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821C0C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:30:59 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web08.3506.1637742658639919244
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:30:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O59cOPvr;
 spf=pass (domain: gmail.com, ip: 209.85.222.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id n6so3479537uak.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LVmasg0RSW8augnGlmCizOL3jOvCLaR+KV8RaO9NOzE=;
        b=O59cOPvrwe2I+7PwJ9NCgvVNeflMJVltqCGXReiyGZ77TL4wn9llTLDXIsw7mEsT9m
         vxqsxBihUDR5EW9Z8BCTwokr3fIoul5yhKhsgfnEdakm0YbYwptAQej5sv5WwfufD6dl
         XMObatCcIGaYiCHckSQLJ3ky9VeZjx9KaSL731Htx98jNqRIINdGTRe1WVBzz4bpYiS5
         +bcSE9kuNFh+s81VQF5pmfJTiyFF95tJl/HgGA9NU5ZTACKR78Mw69QeT6+itcHYKy2m
         WhxuB+B2f+H3aR7/U+M3Hlba5JGro6Ux0QrKJ2lcngEL7LOfstbiiYChrgZsbNk/WWoQ
         cEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LVmasg0RSW8augnGlmCizOL3jOvCLaR+KV8RaO9NOzE=;
        b=uFFOl7UBOgsiKUxgYbdIpAWGFAlHK2/VdhjxBZUpDQiIuJCtM23Fc1HG8AJyh7OKBz
         mVxx06Oe9I5mxTZwzST3yYyya6585t2sHKyGth6id7LSnnjdrFqT/8ROJdTmVsjRFXrX
         v9PZo44MHVqlVro5+W6iBU2cDh9oQ3VoxVLFE0kCIbSCyaHmL/0kMAF/j14TOl5aHqBn
         L3dhGMCFq2x87jweJ1wvkDAuztkCxumxnXw7uwvVIm6jb7AbBIBWyGj/+Z++LRorgp6N
         kqEOmer1UWDbVod/38wP1Kf4WfZdBvrOjVZcCNXJEyzz0v4Cc0+z0unXty/tI0j88gzf
         eFxg==
X-Gm-Message-State: AOAM5326+xgQO42rWrQWxL5eL33cmWm0imwzSWokUAwcI2yCkeZ3KFvW
	S1kLYwlcDtbQYwrsvgCWq4BRsAxc3JF8WU+Jzjk=
X-Google-Smtp-Source: 
 ABdhPJwc1m6bS5ifA7/VcBT73RFK7mV5+ONQ7RzX3Pq+tqDOeq36nggnVGiLCMtBmoIsICgrHdcu6e+laC/tHuEa5KQ=
X-Received: by 2002:a67:c511:: with SMTP id e17mr20726059vsk.40.1637742657829;
 Wed, 24 Nov 2021 00:30:57 -0800 (PST)
MIME-Version: 1.0
References: <20211124080828.530981-1-alex@linutronix.de>
 <20211124080828.530981-4-alex@linutronix.de>
 <AM9PR09MB464241613B5C4803BAFF9018A8619@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB464241613B5C4803BAFF9018A8619@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Nov 2021 09:30:46 +0100
Message-ID: 
 <CANNYZj-eOy=xucEVL64qiOoGOv7UOROeD=EQXpE+a1hBP6_8HQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/21] insane.bbclass: add a check that
 Upstream-Status patch tag is present and correctly formed
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005a7f6205d184ad9e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:30:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158680

--0000000000005a7f6205d184ad9e
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Nov 2021 at 09:19, Konrad Weihmann <kweihmann@outlook.com> wrote:

> > +       # skip patches not in oe-core
> > +       if '/meta/' not in fullpath:
> > +           continue
>
> Can we have that configurable please?
> This is somehow a hardcoded assumption I don't really like.
> Maybe it's worth a shot to match it against BBFILE_PATTERN_core...
>

Sure, I can adjust this.


> > +       if not match_strict:
> > +           if match_kinda:
> > +               bb.error("Malformed Upstream-Status in patch\n%s\nPlease
> correct according to %s :\n%s" % (fullpath, guidelines,
> match_kinda.group(0)))
> > +           else:
> > +               bb.error("Missing Upstream-Status in patch\n%s\nPlease
> add according to %s ." % (fullpath, guidelines))
>
> Why is there such a fuzzy (kinda) pattern? - IMO the strict pattern
> should be enough, stating Malformed or missing - both cases are equally
> wrong, aren't they?
>

It's to give a more precise diagnostic. If the line is present but
malformed, it helps to say that and print it; if it's missing, there is
nothing to print.

Alex

--0000000000005a7f6205d184ad9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 24 Nov 2021 at 09:19, Konrad Weihmann &lt;<a href=3D"mailto:=
kweihmann@outlook.com">kweihmann@outlook.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=
=A0# skip patches not in oe-core<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;/meta/&#39; not in fullpath:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
<br>
Can we have that configurable please?<br>
This is somehow a hardcoded assumption I don&#39;t really like.<br>
Maybe it&#39;s worth a shot to match it against BBFILE_PATTERN_core...<br><=
/blockquote><div><br></div><div>Sure, I can adjust this.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; +=C2=A0 =C2=
=A0 =C2=A0 =C2=A0if not match_strict:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if match_kinda:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.error(&quot=
;Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n=
%s&quot; % (fullpath, guidelines, match_kinda.group(0)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.error(&quot=
;Missing Upstream-Status in patch\n%s\nPlease add according to %s .&quot; %=
 (fullpath, guidelines))<br>
<br>
Why is there such a fuzzy (kinda) pattern? - IMO the strict pattern <br>
should be enough, stating Malformed or missing - both cases are equally <br=
>
wrong, aren&#39;t they?<br></blockquote><div><br></div><div>It&#39;s to giv=
e a more precise diagnostic. If the line is present but malformed, it helps=
 to say that and print it; if it&#39;s missing, there is nothing to print.<=
/div><div><br></div><div>Alex</div><br></div></div>

--0000000000005a7f6205d184ad9e--

