Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9185EE49A4
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 17:15:40 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.40444.1694366138737240882
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 10:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=AlXAuaKH;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1a28de15c8aso2967291fac.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 10:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694366138; x=1694970938; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gKER9FpV/XOErRHjFGHAh991A1o01GGGrPmf8fDMBQQ=;
        b=AlXAuaKHV6S4jBpNYc+wIDa3ZtvHosF9VycsUEx4p6TvmkP+jShTxbUO793DNaAIK7
         B9uDd4LsJSXiIubuaTFEWsuVm3dMRa/5aGRY7zO5eaIRqmmIxmsuaEWBFUg2eMts33fj
         E/TB6WJNrdWve4AVGMjuRX0zR16iW+7J7m6Th+zuGy4vtIWr41M+lHH3i+vTt10tBq23
         A2aDGskl8mOBZ5yjUJxfuzzlf7yEfLTXphkJicUu6DXhR57vZaSMX/uT5/fKTLewagHL
         aTJoKK7t/7SUdxOoZCuX9jS0MmixYWpeBXPaNSH0Xzc2qPmTJzVxDaKv0ky0J4DPXir0
         XUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694366138; x=1694970938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gKER9FpV/XOErRHjFGHAh991A1o01GGGrPmf8fDMBQQ=;
        b=uThn67cFk7W4QufxqXS2sxTUkuDe7P35x6IqLggNt842N8Vn/R3xVOQ1ZVkdg++bP8
         YxsDGn0kbGQQcr3XPAR5YIDdv9FxMbtzRXNVnfXexUDZRxpoJAvmKMiUDLCFrDDRgTjB
         AhnmP/2suE3amL3pl73KxvHip6qr4H9pLXqge22sLgVvazlRjn0MezxlGN6COfjk+xpj
         FDPJxl9Y42Fw98aaIW86pv6jWimX25/XnqkrMVXNU8j39gZ0D8FavXJEsj1I998V+Jvn
         tJ+4zv2N4gMRdXkwi+8daGVcFWDpIu8MnOJsz0p4foJqXk85NYO0H21W7mbFOfwEQ3JW
         bgLA==
X-Gm-Message-State: AOJu0YwnEqail7lduaOK2cDhh25r6eo9eav9F5jVJnyegV2p4d1pOrfX
	AdOSM9Y1nTdpIppgLCYOwqKMe3zkkQdDvBKRn7o=
X-Google-Smtp-Source: AGHT+IFi4RPY5DSr4LeF6sDoQQbGP0SiqqKp1blg6u5xJoumuRU2p7jx5oOUV+wSyLUaw0pUZUwceIOhtJSP68DA1ag=
X-Received: by 2002:a05:6871:e06:b0:1d5:a452:489f with SMTP id
 vj6-20020a0568710e0600b001d5a452489fmr2718781oab.22.1694366137883; Sun, 10
 Sep 2023 10:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230910111820.F2D05106AA0@builder.sakoman.com>
 <CAMKF1sp14CrQ=0CntN6wJ6Va+rCBtVY8Je0AQAx8cxQwS1Yg7w@mail.gmail.com> <CAApg2=TLfbpr_kdms0ONi5Ji8BGm+2hS4xXx=C-5eUbqJxryCw@mail.gmail.com>
In-Reply-To: <CAApg2=TLfbpr_kdms0ONi5Ji8BGm+2hS4xXx=C-5eUbqJxryCw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Sep 2023 10:15:26 -0700
Message-ID: <CAMKF1sobSFfBYWSHcoDzZ+eA=8uQz5oMY=FtXWRwqQvF0SaCuw@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 10 Sep 2023
 01:00:01 AM HST
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>, yocto-security@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c4a12e0605045bf9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 17:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187471

--000000000000c4a12e0605045bf9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 10, 2023 at 8:54 AM Marta Rybczynska <rybczynska@gmail.com>
wrote:

>
>
> On Sun, 10 Sept 2023, 17:14 Khem Raj, <raj.khem@gmail.com> wrote:
>
>> On Sun, Sep 10, 2023 at 4:18=E2=80=AFAM Steve Sakoman <steve@sakoman.com=
> wrote:
>> >
>> > Branch: master
>> >
>> > New this week: 10 CVEs
>> > CVE-2022-3563 (CVSS3: 5.7 MEDIUM): bluez5
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3563 *
>> > CVE-2022-3637 (CVSS3: 5.5 MEDIUM): bluez5
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3637 *
>>
>> These two are addressed in the 5.69 release which is already in
>> master. So I wonder how the CVE scanner missed it.
>
>
> The NVD entry does not include any version numbers, so all bluez versions
> are matched as vulnerable. Have you mailed them? Can do it if you haven't=
.
>

I have not so please go ahead


> Kind regards,
> Marta
>

--000000000000c4a12e0605045bf9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Sep 10, 2023 at 8:54 AM Marta Rybczynska &lt;<a hre=
f=3D"mailto:rybczynska@gmail.com">rybczynska@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div><br><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 10 Sept 202=
3, 17:14 Khem Raj, &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bla=
nk">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">On Sun, Sep 10, 2023 at 4:18=E2=80=AFAM Steve Sakoman &lt;<a href=3D"mai=
lto:steve@sakoman.com" rel=3D"noreferrer" target=3D"_blank">steve@sakoman.c=
om</a>&gt; wrote:<br>
&gt;<br>
&gt; Branch: master<br>
&gt;<br>
&gt; New this week: 10 CVEs<br>
&gt; CVE-2022-3563 (CVSS3: 5.7 MEDIUM): bluez5 <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-3563" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2022-3563</a> *<br>
&gt; CVE-2022-3637 (CVSS3: 5.5 MEDIUM): bluez5 <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-3637" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2022-3637</a> *<br>
<br>
These two are addressed in the 5.69 release which is already in<br>
master. So I wonder how the CVE scanner missed it.</blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">The NVD entry does not includ=
e any version numbers, so all bluez versions are matched as vulnerable. Hav=
e you mailed them? Can do it if you haven&#39;t.</div></div></blockquote><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">I have not so please go ahead=
=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 dir=3D"auto"><div dir=3D"auto"></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Kind regards,</div><div dir=3D"auto">Marta</div><div dir=3D"auto"=
></div></div>
</blockquote></div></div>

--000000000000c4a12e0605045bf9--

