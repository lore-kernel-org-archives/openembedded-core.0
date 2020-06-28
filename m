Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web10.3457.1593372642437955002
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 12:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JxR/bc/t;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id z9so3540295uai.6
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2020 12:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8KNffrsLzlRPBGJpQ/ikxrWvySnInmZ7QetJ+GtBDZs=;
        b=JxR/bc/tUNFBvf1S77D/tCh6d4HFBU82za3UUxLRfsGGqsr7KImWx3ITKnarJoBbkf
         LyBpO/BBThToR4r59IsYI/0guo1VRnDL6Vn6tvExiLoaF1AHkjgvalJs97giAB0eGgXb
         wRJ8LKBgQzU2KMQRS9ruk6n4icMQ7RK01Jl5Vpq0cc+0hV1hcl0/yv3Ba1MV7t5MLVlw
         Hjm3BTPNsHsWa51Wf5NEIOa6ibayKuw+YXBy4eS4kFS/mQlal9/JNQG14K5AfW7/9QAk
         q1jd2AJZj/zYHd7JFM7qakBufxCocXpcLuJlXpBDnSfjz/axRlTXPT0mHdVHrRLlTWAc
         7bmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8KNffrsLzlRPBGJpQ/ikxrWvySnInmZ7QetJ+GtBDZs=;
        b=eZzigxa6gIzxEGYQ8a7Berm3ctlhrhCp1j5oI4+TndXcpbYsb5t6GWpBHYB5aPjezT
         aIzMl2agkSiuYjsJ366D8l2zlLv4zSLxhhgdL0HL3w/i+7hwR7jFy8ERkpFNLPNkw453
         Zwp/4s/EHuLW8mcPQpotcJgkFVWSL0Wd+tUmaCcmHbpUIP5A8J5CLyfLFLxKC6qnQ1yb
         MB9eGUFE6Ly2WCbQVaEtS22KGWYNB/crXJGnXzBgXobfYVb0WPhGFzpS7mxSKSf4z3DX
         ixbP4OKvja+aL4J6XVtJJYVl+5r3moUt7DvMpXUyyFzdbxmCwJ64n+8nix64g/PoBajO
         ZDjg==
X-Gm-Message-State: AOAM530HjBmyheuNxbtOPj9y0HUuSM8dL+Muguj56Yd1RkcABFyjqGlU
	c3zSiNvpgvwravKpafVVX7Kb4GKrGMwyjXRmjWw=
X-Google-Smtp-Source: ABdhPJy2i5OAaJLB/TOXy1Vn33TzwTaRvBfm1c144n+5DspS9HqgIQ0ut/5wQMHJ6H7HLipibSaJEqxl4tLArgobOy4=
X-Received: by 2002:ab0:15ca:: with SMTP id j10mr8352796uae.71.1593372641583;
 Sun, 28 Jun 2020 12:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <e5Dw.1593365236614554114.mV8j@lists.openembedded.org>
In-Reply-To: <e5Dw.1593365236614554114.mV8j@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 28 Jun 2020 21:30:30 +0200
Message-ID: <CANNYZj8ondQew3MqtyLr1k-EyBLG52KfT_wu3mRabZRpjecQEg@mail.gmail.com>
Subject: Re: [OE-core] git do_unpack
To: John Klug <john.klug@multitech.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004be4e005a929fa6d"

--0000000000004be4e005a929fa6d
Content-Type: text/plain; charset="UTF-8"

It would help if you can:

a) provide log.do_unpack that shows that network access is indeed happening;

b) demonstrate the behavior with oe-core master, as morty is soon eligible
for retro computing museum, and hardly anyone wants to look into that :)

Alex

On Sun, 28 Jun 2020 at 19:27, John Klug <john.klug@multitech.com> wrote:

> Recently it has come to my attention that in morty, and maybe later,
> do_unpack for git does not use the downloads directory, and attempts to
> contact the git server.
>
> This is unfortunate, as we often do bitbake -c fetchall and give tarballs
> of our workspace to customers, thinking it would save something, but it
> appears the savings are limited, and now I have a customer complaint about
> this, since I have one recipe that uses a private repository.
>
> What is the logic of not using the downloads directory for the source of
> the unpack?
>
> I recently fixed a recipe by writing an unpack that does not use
> networking and does a clone of the downloads directory to get around this.
> Why is this not done by openembedded-core?
>
> Thanks.
> 
>

--0000000000004be4e005a929fa6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It would help if you can:</div><div><br></div><div>a)=
 provide log.do_unpack that shows that network access is indeed happening;<=
/div><div><br></div><div>b) demonstrate the behavior with oe-core master, a=
s morty is soon eligible for retro computing museum, and hardly anyone want=
s to look into that :)</div><div><br></div><div>Alex<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 28 Ju=
n 2020 at 19:27, John Klug &lt;<a href=3D"mailto:john.klug@multitech.com">j=
ohn.klug@multitech.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Recently it has come to my attention that in morty, a=
nd maybe later, do_unpack for git does not use the downloads directory, and=
 attempts to contact the git server.<br><br>This is unfortunate, as we ofte=
n do bitbake -c fetchall and give tarballs of our workspace to customers, t=
hinking it would save something, but it appears the savings are limited, an=
d now I have a customer complaint about this, since I have one recipe that =
uses a private repository.<br><br>What is the logic of not using the downlo=
ads directory for the source of the unpack?<br><br>I recently fixed a recip=
e by writing an unpack that does not use networking and does a clone of the=
 downloads directory to get around this.=C2=A0 Why is this not done by open=
embedded-core?<br><br>Thanks.<br>
<br>
</blockquote></div>

--0000000000004be4e005a929fa6d--
