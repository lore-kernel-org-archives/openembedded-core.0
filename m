Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.1929.1626998577302189219
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 17:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ePkDm0CY;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id j184so7144052qkd.6
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 17:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qEGs7UBGSkMeIw/soTgKRmJbzoPf8g6bjbUyjD5L9ds=;
        b=ePkDm0CYYQVtBWfAHvMW25gX6cuL1yfjA2mSUtydNJuVpXw5dLxUIs6+3Wf/6yzGX9
         mB8rY4AVZkilVdX1sGRQXQ2kUoe06kK6EtYZQPTdNTnsXbw1FflKcV8RZJBEtwJPJKNF
         iMiSxW2jSZGxBQtvybdIzXR1q8tvvXPJCaUQtDTSnYPPCfqotKo1bf/U2UWxbwxuyGbx
         oy+4S/Ag2pi2DdUSlI8D7ULH668rvKRqN8o29mUlS7j6RvSdJGFtCGw4XDKziWT1zaF2
         Zv7fVcI/mOaCLCg39cxOlyOL7fnzFpP8X9ehEoCdLvtP3sA1vlEYIFFqlTogxpvMviiw
         IPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qEGs7UBGSkMeIw/soTgKRmJbzoPf8g6bjbUyjD5L9ds=;
        b=cRduI0roj+Qrwtmc3TGLsT5p12qVqgsir5lVziq9r2JwH2aBwrf+igGK22gAToxC6l
         MKy72hco5qbBQSBFDej6M0nBUWjyhu3i3NDIDGLgVmuZ6bwECwGtWNHQuCvj1IWZkh+6
         gB8FJ0Jn/c/UjfCNlMfvLbI+uuuRWMS9U7Hqqnq3f4nNm60X9FrsI28YSumq6cRkJ2cg
         l17yodDnv0iEH91P/fJLApUfT7axESmpXxKNedTLy4X45dE3rcBXk5Cl0B8BtpbQV8RM
         4TcGfYpvFUn6FQTKsiurMcikW5mpiJxWXdUqyCUG39afuq8B45/bVpd6gkoQbhkwTaRb
         ZMgw==
X-Gm-Message-State: AOAM5325Aaf34eknag6LEuK5tM6rA8utOyotP1U60syxGlYoSZmbX3gJ
	/LszIf2Z9tCThRsHLYluovsVHyx0MNr0S38pXac=
X-Google-Smtp-Source: ABdhPJxDBKUDjghEFqZb6SgqJvz2uvXpi4goU/0hHpM2TCnYWXeyX5koC+JI5HJ1HR5SvMNqgmV/DrPViRQWBmqzNJc=
X-Received: by 2002:a37:5d3:: with SMTP id 202mr2323377qkf.125.1626998576484;
 Thu, 22 Jul 2021 17:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210704210740.581650-1-raj.khem@gmail.com> <CAMKF1sqg7QMojTsPo=GSjzpEEb-QwmF8_GNXXj8SaC45wtJ73Q@mail.gmail.com>
 <CAMKF1sr0M_Tz066uNr55jGW5pOvDh_i+W9vYor50zB83rHK3Bg@mail.gmail.com> <9d9b8223b1a9c83889ad934a97b83864630cca5c.camel@linuxfoundation.org>
In-Reply-To: <9d9b8223b1a9c83889ad934a97b83864630cca5c.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 22 Jul 2021 17:02:45 -0700
Message-ID: <CAMKF1so4K9dwQDLmvq988td0a4rA0yO=FsmWmtR9uk=3-SSJzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libubootenv: Disable for ppc/ppc64 qemu machines
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003394af05c7bf207c"

--0000000000003394af05c7bf207c
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 22, 2021 at 1:14 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2021-07-22 at 12:34 -0700, Khem Raj wrote:
> > ping^2
> >
> > Is there any issue with this patch ? If so please let me know
>
> There was an ongoing discussion about whether a patch triggering some of
> these
> issues should be reverted or not. I was hoping we'd figure that issue
> out...


Sadly the revert does not help here this patch is still needed

>
>
> Cheers,
>
> Richard
>
>

--0000000000003394af05c7bf207c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jul 22, 2021 at 1:14 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 2021-=
07-22 at 12:34 -0700, Khem Raj wrote:<br>
&gt; ping^2<br>
&gt; <br>
&gt; Is there any issue with this patch ? If so please let me know<br>
<br>
There was an ongoing discussion about whether a patch triggering some of th=
ese=C2=A0<br>
issues should be reverted or not. I was hoping we&#39;d figure that issue o=
ut...</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Sadly the r=
evert does not help here this patch is still needed=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--0000000000003394af05c7bf207c--
