Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web10.8586.1620146327998626478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 09:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bfmx1owM;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id x9so3249276uao.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 May 2021 09:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5A3zIp3UCnANfc7IrNbqkU44TOq5g6A2ic6Z/nCtyOY=;
        b=bfmx1owMA/6kV8Rd2dUJeNqpiVnOpLFHUfYU9pTDUKm59v206iFCGeh18rTUj8p3mM
         G2gb7A6mk1yn0fQYZLBOcq9PzjyxL1unZOtucwek4B+jVFSy3FGVd58+i3tn/N63SliU
         vur9VKWk46Jy5hdDqcMFaD0ijD+YvXYK2kYke/y7b88BUzOpMqbK1XIFuq7dgVVLbjAh
         qhuiJ/msCsKsNkCXDeOKpF+F5dP8m7BxtpGzn8rE1TkF3hAJ3Z4EepSa+oog/pfaoM6f
         oYU4dinLjhcEBxISDqYl/M+rcEA+pBawdUteOXxV4NSgavrpkredOsIaeyOF/lImGZo4
         Kh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5A3zIp3UCnANfc7IrNbqkU44TOq5g6A2ic6Z/nCtyOY=;
        b=SeLQae7S66unW2mA76VBcbZ8lmrOpyiO/7NtONag3g6kku3rEUrECOD4sazvYrHcGp
         OP5MAuXNnp6LWFdJfvHDwg7QAGK0oaMoSJVeMLn3+FfO4P7FpSxewMQAj2fRWaR/wkaA
         hAXmXsloKsmE+ou4fFuLgGnnBfYCOIoX1LYhSNPXFyzkGpdPbqFrHW1DaWNwJe7SJu77
         Na+76J+mjtH2zEf39vH2bP53T5vGt0Q2bomIUjABVMJSYTbpXm+F5aP7hWBUa6TSF3Tl
         lT335s8mCYbtKdazjC2nLxkcxJTyELFLXjKrteR1DtfO+LNIe55BtAiUn37BbU2FbOjO
         grhA==
X-Gm-Message-State: AOAM5303wOxLNkA13zlZEUw2WMTr8zyMRNpZ/fHUHB1qed6X7T1VgNI8
	rJagTHpE+F74n1YJs94wh2vk3J+uYf5b3cNcG3g=
X-Google-Smtp-Source: ABdhPJw9vdAxKHqTIwJZCfB0FKtaYiM/jTUUGc1Us+eMO8oNgtC0Dl2lS742DZXDESB773Us4QC+AOrSzZOKaxBAPvs=
X-Received: by 2002:a9f:2465:: with SMTP id 92mr21238658uaq.71.1620146327168;
 Tue, 04 May 2021 09:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <168601d740f4$44e42800$ceac7800$@gmail.com>
In-Reply-To: <168601d740f4$44e42800$ceac7800$@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 4 May 2021 18:38:35 +0200
Message-ID: <CANNYZj-agAhiswr-8qpsQPQ=hP0Orv5zdLtAEEqcVGTTjhWyPw@mail.gmail.com>
Subject: Re: [yocto] Yocto Project Status WW18`21
To: Stephen Jolley <sjolley.yp.pm@gmail.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000050ad6005c183b691"

--00000000000050ad6005c183b691
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 May 2021 at 16:46, Stephen Jolley <sjolley.yp.pm@gmail.com> wrote:

> We are pleased to announce that our April 2022 release (potentially 3.5)
> will be the next LTS as per our original two year schedule. If there are
> features desired in the next LTS, now is the time to get them submitted and
> stabilized ready.
>

What will happen to the current LTS at that point? Will support be cut off,
will there be a transition window, or is it currently undefined?

Alex

--00000000000050ad6005c183b691
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 4 May 2021 at 16:46, Stephen Jolley &lt;<a href=3D"mailto:sj=
olley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div style=3D"overflow-wrap: =
break-word;" lang=3D"EN-US"><div><span style=3D"font-family:&quot;Arial&quo=
t;,sans-serif">We are pleased to announce that our April 2022 release (pote=
ntially 3.5) will be the next LTS as per our original two year schedule. If=
 there are features desired in the next LTS, now is the time to get them su=
bmitted and stabilized ready.</span><br>
</div></div></blockquote><div><br></div><div>What will happen to the curren=
t LTS at that point? Will support be cut off, will there be a transition wi=
ndow, or is it currently undefined?</div><div><br></div><div>Alex<br></div>=
</div></div>

--00000000000050ad6005c183b691--
