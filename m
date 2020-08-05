Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.1517.1596607236641391382
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2020 23:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R+m9j81F;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id m7so8550306qki.12
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2020 23:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UnEvEisWsvp2LObF3hwApJK3azWMZwmj+CzL0gUW/Rc=;
        b=R+m9j81FMVtZSDskycfwVf51SLFC6gw7AwHZzToaOEZTZzQ1V4qYBGaHI1e8whA4MA
         XYoNDNqQp3XzJIaJAPhGEtiGHaa32P/NeJjrWKzXbAhFHv+g/370M/QeLKvofRG0qihp
         q4YfzT4aOr9htnk5XZMQWdBNin7Ykz7JnmWEMUWKNtCVYg9HbqEIG0rJQN1q1MFt6iZg
         pu/q528xC+5TDqfOfiNa08NeNT6ahhi1mnKP4k7xBiFTFVzzblz0UBXlwNXCt4KcIPom
         U7VwlnVh4+fY936xK5HUaz8THMh8DSF73zjUcNQ6qh/j07QtZqX7gPoTWGHPcbcuGd7k
         7cRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UnEvEisWsvp2LObF3hwApJK3azWMZwmj+CzL0gUW/Rc=;
        b=JKHSwtUY/MssCid0vbIrTl2H/3+DfaraI7+i8zEz4wFwyRUrbESofTPSY3uc86iEiA
         VByVVnGh+EQYYAtbWor3BSIDq38+6WKMsVhzddc09Qh+b+NERnHhZy0DIgpbcJIJyU9p
         g3WUgviiHB8hxMXJZAsV5C/IZOmxToIfX2HR5YS0+QM4RKBTyxsN6oNl9U+iMG4hIu6r
         Mzzr8JA2PBIlN9i1gRWkBnq4hrhzUCqDT3PAWlyqbC8EHFskLq60J69591vz0KqIdS5A
         tOuRMkXH2mT9QnhMbX+pi0+cs1LxHhEQfE5XwgEzXUcWx0ngH3Q3su76kGPxNYf69LG+
         ws+g==
X-Gm-Message-State: AOAM531DlJOqwP+R42IHM+JD+2wt0KtPjf+ixfVYEsZaq3S1HE+KhYZT
	LeTgF0NyV2zr9qmkqKdu+4p7PTgpzSSXO/n9Vl4=
X-Google-Smtp-Source: ABdhPJwmPulIK17kd5fudWH3F5nK6tK6EYMnWKpdRnZsEBvH3NU6IFlIP5z8moISPMDzs2A//ErkZgr3xNhO7BinPCY=
X-Received: by 2002:a05:620a:565:: with SMTP id p5mr1833520qkp.215.1596607235580;
 Tue, 04 Aug 2020 23:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200804082019.76320-1-jacob.kroon@gmail.com> <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com>
In-Reply-To: <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 4 Aug 2020 23:00:24 -0700
Message-ID: <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001f69dd05ac1b175b"

--0000000000001f69dd05ac1b175b
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 4, 2020 at 10:05 PM Jacob Kroon <jacob.kroon@gmail.com> wrote:

> On 8/5/20 2:14 AM, Khem Raj wrote:
> > On Tue, Aug 4, 2020 at 1:20 AM Jacob Kroon <jacob.kroon@gmail.com>
> wrote:
> >>
> >> It has been almost 3 months since the upgrade to gcc 10. Switch back to
> >> relying on gcc default configuration (-fno-common).
> >>
> >
> > have you done a world build with this? In core+meta-oe I still see 70+
> > recipes failing
> > what will be good is if people start sending fixes before switching
> > the defaults.
> >
>
> Ah, that I haven't, only the images I use. Is there a list of failing
> recipes available somewhere ?


I think I posted the list when I submitted the gcc10 upgrade but this patch
is already in master-next so Richard will soon share the Oe-core list
atleast

>
>
> Jacob
>

--0000000000001f69dd05ac1b175b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Aug 4, 2020 at 10:05 PM Jacob Kroon &lt;<a href=3D"=
mailto:jacob.kroon@gmail.com">jacob.kroon@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)">On 8/5/20 2:14 AM, Khem Raj wrote:<br>
&gt; On Tue, Aug 4, 2020 at 1:20 AM Jacob Kroon &lt;<a href=3D"mailto:jacob=
.kroon@gmail.com" target=3D"_blank">jacob.kroon@gmail.com</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt; It has been almost 3 months since the upgrade to gcc 10. Switch ba=
ck to<br>
&gt;&gt; relying on gcc default configuration (-fno-common).<br>
&gt;&gt;<br>
&gt; <br>
&gt; have you done a world build with this? In core+meta-oe I still see 70+=
<br>
&gt; recipes failing<br>
&gt; what will be good is if people start sending fixes before switching<br=
>
&gt; the defaults.<br>
&gt; <br>
<br>
Ah, that I haven&#39;t, only the images I use. Is there a list of failing <=
br>
recipes available somewhere ?</blockquote><div dir=3D"auto"><br></div><div =
dir=3D"auto">I think I posted the list when I submitted the gcc10 upgrade b=
ut this patch is already in master-next so Richard will soon share the Oe-c=
ore list atleast=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-=
left:1ex;border-left-color:rgb(204,204,204)"><br>
<br>
Jacob<br>
</blockquote></div></div>

--0000000000001f69dd05ac1b175b--
