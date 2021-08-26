Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web11.28864.1629976253349640872
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 04:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sgd4chdB;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id l21so719469vkd.10
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 04:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yC+A8a7gDTEQDDEwp6owqtFUUWAKMAS0yDdn/PnTkQA=;
        b=Sgd4chdBUFOZZMWjHLDWf+r7CxXJRqVzNh19hSIEuDNScfy3FPJN1pnzMEvjBP90+j
         hQqMg4DauWHBpOjkZJ2FdWZzZ9DsWMqrQCNWBvj2X8Y/rODhOr1Hh4KvwI9q7g4XDJiC
         +RXY/nCON0+aurd+QJoDZZo3vcM/GMnbIl6nq3yKxyJVFOIyuGy3U+EWgeYHy8ybRMwl
         9//SjdcPuEG2eE/iy3VyrCNasY6imVI6rgLyQPIiwGZaXKMbsN9mBinz81zNDSP9YF1L
         jIrgY4Ipgv36Ui8hPd2BovQqoKSw8uKjJ/QCgzPQ/PX6ouYceDNPRSIPL+EoA5l/i/OE
         XVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yC+A8a7gDTEQDDEwp6owqtFUUWAKMAS0yDdn/PnTkQA=;
        b=LYNMLL3bpcExwaT5sUsoSdIvSPcc9p7FgC72bdb8Zrjqw98hzjt5fN9ttlkDlL9A4y
         6l1fCYDuI6FOsHVsYsLJkEH2ISUc8tXMCZrkiQIH5ZdltyIWXt704dpau9QD3V8PKIjl
         gmi5q8jp9+IspAeZpb0d7keuD+OE7TEhROtr8BpzZWbNtzTZy0pfdelnKrv2YCQlH4Bb
         r0w3Z+TILvQTqJTcvELso8ov7/QtRv/goC2qJ5k9WLwTlPvffH9YNvMCwW4esrpKgt3I
         qYmgjXmsLRLk+NESYHeU7slTA0lsLcpeG7Y+h2Jsxm3LaKd6WeDrHeF09UDYXAGwdvtJ
         7p2g==
X-Gm-Message-State: AOAM531vTH4C4+iOGMYTAtOoFyjEUZmSQ5acfBV811Eg8RuQccAdCA4K
	Ub3q4rFpkBBZCwqDRhgQvKy33jaVXeI/dgsAHDE=
X-Google-Smtp-Source: ABdhPJxA3YzvCl4ePwbbi5o/AKBSMQjs0EogON0WZ45gPjziTpqoiDG3tUk6w5uze6mMsMeOU1GrlgPi8AM/7TbFx3k=
X-Received: by 2002:a05:6122:734:: with SMTP id 52mr721529vki.8.1629976252431;
 Thu, 26 Aug 2021 04:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210825223552.802130-1-alex.kanavin@gmail.com>
 <8a31a69ce20c28685294a1e3c6b289f6f5c38629.camel@linuxfoundation.org>
 <CANNYZj8SadPjAYW=tUNwsA-TV3vyJNGcD+2WoiXu_vGTKn-G1A@mail.gmail.com> <72bd8d1222282938f5f4166a803dae1e087ace52.camel@linuxfoundation.org>
In-Reply-To: <72bd8d1222282938f5f4166a803dae1e087ace52.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 26 Aug 2021 13:10:41 +0200
Message-ID: <CANNYZj_g4ZuRwVXDJD+7ydeEf3W=BbzFEpp+F3df2O4Hi_uzNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemurunner.py: print output from runqemu/qemu-system in stop()
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000084bf5105ca746bb3"

--00000000000084bf5105ca746bb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please tweak,  I will separately confirm that the original issue (virgl
headless fail on Ubuntu 20.04) would be still including this directly in ab
output. Replying from a sushi restaurant :)

Alex

On Thu 26. Aug 2021 at 13.01, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2021-08-26 at 12:45 +0200, Alexander Kanavin wrote:
> > It=E2=80=99s not a real warning, just that the print itself is issued a=
s a
> warning. I
> > think it just needs to be issued as info instead.
>
> Agreed, I realised that after replying to the patch. The current build is
> going
> rather orange! Will you send a v2 or should I tweak this one?
>
> Cheers,
>
> Richard
>
>

--00000000000084bf5105ca746bb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please tweak, =C2=A0I will separately confirm that the or=
iginal issue (virgl headless fail on Ubuntu 20.04) would be still including=
 this directly in ab output. Replying from a sushi restaurant :)</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu 26. Aug 2021 at 13=
.01, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1p=
x;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,20=
4)">On Thu, 2021-08-26 at 12:45 +0200, Alexander Kanavin wrote:<br>
&gt; It=E2=80=99s not a real warning, just that the print itself is issued =
as a warning. I<br>
&gt; think it just needs to be issued as info instead.<br>
<br>
Agreed, I realised that after replying to the patch. The current build is g=
oing<br>
rather orange! Will you send a v2 or should I tweak this one?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--00000000000084bf5105ca746bb3--
