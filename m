Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D05C433F5
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 16:27:20 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.21344.1640190439273111211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 08:27:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CKLvrmQJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id v7so5937493wrv.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 08:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/XcmNmjKP0dopLg5XgPKLbJe1nzanff9FbAj5w2eZXQ=;
        b=CKLvrmQJtr0FD3Ez+/9evsUivyqeGfY3qUQi192IUwq7tH/aeDwvh7WQM6kFW5oFNn
         yBE12JD9sj1fnptl38ZHw54494gQCplO633VShV/ssY+CNLfatMOnsaNMR3kSgD+K9db
         mP3Q6+18/FLKVAHi30UxAAL4XmHcC1zRlzuvlaNr5dVDXN3XFooZ6qIxNsr1FcgDga3I
         DUydAgzeUb7qy+WZ6/BjYTDUyvPGhNMhNU+Ph0Q0x2UOUKqB1iKGHGSPqUCYR7i/sn+f
         oXe2Mh+gQ/CMID+LTipLN2UZO7aDudqQ7rX5bYDs6LQkUcQikYOhcK6DJ3PBitovcWiT
         iA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/XcmNmjKP0dopLg5XgPKLbJe1nzanff9FbAj5w2eZXQ=;
        b=kVPHf+ZeHLxek+ctN3nS9Sr6cL5sbtR/qOzU+XkR2WqylqH/Omdm8MfwRGtX0EXw85
         YW9s1fP72dKdnGNV7o8F2EPj2PngWhpp3lh7FVetUYkH+skoc1xB3SOCqM4MauGza213
         ogg2AutLjhTA7CCRG/DVG0A8r8f7h0/Nu8Rgbdt4rFshr+Z+pwEyxy0jkM2SGJvObzV/
         idjo+OgarUEFprh0/T8zpZ2NKAhrgXUlPDBw5CpXB0ZU4/KHtSZ8DlZyPC72mV1SAOct
         9VdH0GF2GFW9lry5JxPVoeOYFVpxcOHAubfrA/dbGXllO4OBGnJVfijxMmPcxPAd8eke
         0Y1w==
X-Gm-Message-State: AOAM533Mn3ppXBsMbCkewGyaU7Qmkt2K+/zdETky3rZ4U4jyWNxZx/C/
	ih2m2lLaQO+sjZZcm+3/EkblgjS8DzpoOoybqsw=
X-Google-Smtp-Source: 
 ABdhPJyNBenmqV4xkmoqESIkxk5UcX0dqsMZLuNK8iFFA9+ow8b0fWJuAx9PaEl1tprgbqkmZdfxLmANMelxcvj/Wxs=
X-Received: by 2002:a5d:58c5:: with SMTP id o5mr2531242wrf.15.1640190436713;
 Wed, 22 Dec 2021 08:27:16 -0800 (PST)
MIME-Version: 1.0
References: <20211220150347.13577-1-rybczynska@gmail.com>
 <CAAnfSTuhHstDi2jqPxxL5qF0ktUhoiq9roxs5V2h8ZmmzrYhxA@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTuhHstDi2jqPxxL5qF0ktUhoiq9roxs5V2h8ZmmzrYhxA@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 22 Dec 2021 17:27:05 +0100
Message-ID: 
 <CAApg2=TVz0s-f+fd5r3s5KnvnZORAVQSqL6KETs30R_t4u0cQg@mail.gmail.com>
Subject: Re: [oe-core][PATCH v2] cve-check: add coverage statistics on recipes
 without CVEs
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: multipart/alternative; boundary="0000000000005828b805d3be98cb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 16:27:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159962

--0000000000005828b805d3be98cb
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 22, 2021 at 11:04 AM Ross Burton <ross@burtonini.com> wrote:

> On Mon, 20 Dec 2021 at 15:04, Marta Rybczynska <rybczynska@gmail.com>
> wrote:
> > An example entry:
> > LAYER: meta
> > PACKAGE NAME: libsdl2-native
> > PACKAGE VERSION: 2.0.14
> > CVES FOUND IN RECIPE: Yes
> >     PRODUCT: simple_directmedia_layer (Yes)
> >     PRODUCT: sdl (No)
>
> Is this meant to be human-readable or machine-readable?  Currently its
> hard for a human to read (uppercase field names, key/value pairs) but
> would also be hard to trivially parse.
>
> I'd actually prefer to see an actual machine-readable report (JSON,
> for example) that can be extended over time and contains all of the
> information available as the current reports are also that half-way
> between human and machine readable which is hard for everyone to read.
>

Hello Ross,
This version is human readable, keeping it as similar to the current
cve-check
result as possible. Our next step is to convert both logs (this format and
the
traditional cve-check) to machine readable format, and we're aiming at JSON.
I think it makes sense to submit this one first, as the format conversion
will
include important refactoring...

What do you think?

Kind regards,
Marta

--0000000000005828b805d3be98cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 22, 2021 at 11:04 AM Ross=
 Burton &lt;<a href=3D"mailto:ross@burtonini.com">ross@burtonini.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon,=
 20 Dec 2021 at 15:04, Marta Rybczynska &lt;<a href=3D"mailto:rybczynska@gm=
ail.com" target=3D"_blank">rybczynska@gmail.com</a>&gt; wrote:<br>
&gt; An example entry:<br>
&gt; LAYER: meta<br>
&gt; PACKAGE NAME: libsdl2-native<br>
&gt; PACKAGE VERSION: 2.0.14<br>
&gt; CVES FOUND IN RECIPE: Yes<br>
&gt;=C2=A0 =C2=A0 =C2=A0PRODUCT: simple_directmedia_layer (Yes)<br>
&gt;=C2=A0 =C2=A0 =C2=A0PRODUCT: sdl (No)<br>
<br>
Is this meant to be human-readable or machine-readable?=C2=A0 Currently its=
<br>
hard for a human to read (uppercase field names, key/value pairs) but<br>
would also be hard to trivially parse.<br>
<br>
I&#39;d actually prefer to see an actual machine-readable report (JSON,<br>
for example) that can be extended over time and contains all of the<br>
information available as the current reports are also that half-way<br>
between human and machine readable which is hard for everyone to read.<br><=
/blockquote><div><br></div><div>Hello Ross,</div><div>This version is human=
 readable, keeping it as similar to the current cve-check</div><div>result =
as possible. Our next step is to convert both logs (this format and the <br=
></div><div>traditional cve-check) to machine readable format, and we&#39;r=
e aiming at JSON.</div><div>I think it makes sense to submit this one first=
, as the format conversion will</div><div>include important refactoring...<=
/div><div><br></div><div>What do you think?</div><div><br></div><div>Kind r=
egards,</div><div>Marta<br></div></div></div>

--0000000000005828b805d3be98cb--

