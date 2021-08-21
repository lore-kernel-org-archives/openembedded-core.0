Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.1363.1629569470050998671
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 11:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fObNS74V;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id b7so19059269edu.3
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 11:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D4sX/j7WjihBgzLfXKzoxGQJj5WYvGX7jg4e+wB4k+g=;
        b=fObNS74Vk47JgwkkSsKbS7siYZWRlLTW4QXxRNu9pPYUfDz3AFNSRiTKT1Kfm26pQi
         9iqeNqkk13gWSu/mPxKwa4Zgs2Awuth2S5Jj9v4yxkqE1s2Tp1m6Xa95T8dZa00ocAMc
         lV/kIdxOSpjXNbYP5WTFnP+VYjhveHLAZFg9ZWoOkC27C5tUIzMgNKFKV4GXji8lU7n8
         ziogEwD/ScEvGknc/yUDp6WK/7k7z6HxESMZYBYKv5R3d8weP+0TzJsrgeKK/Cb1zZUU
         WnXRzKiJBdZ2vmSrArFAFcGZVlEIaDkf2cRu4FezIO6PeMaokLAhlg3QFUneiupVMWR4
         S2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D4sX/j7WjihBgzLfXKzoxGQJj5WYvGX7jg4e+wB4k+g=;
        b=COldhTEvn5VsrsLOQ5Wtet3p3GyyNH3hESwkuz07nbJYkoAdVbEunnRg/a4JUG2jZs
         Z462sKkjxK2RB6wNXvJq4Di3NqNPhGfgz5pQWd45WAxeY9S6Bgal2GUjej94eQX1eUsJ
         Oqu2PzlXxMc6jTDHjSNr7QII1fH4b0zyA2QvhvIBAcjUezWSTjdvnyxEYpwm8+fhMfgj
         8vewQ0Ve+rwbXTG3JSp3hf66VXAFQse1++NVM0FSrdJOgMm6FykL9BHsXXyfhb3052sj
         AFuYbCA2di+XR+nTktJP50825QMvWW82DEqrkPF3ptQucuxO0TQ7V2r8qoYHzPP6VqE+
         GexQ==
X-Gm-Message-State: AOAM5323AyKFFxAN/ay0QQ1cwROXyUd5x2JkuMThYdlEq8nY+/G3S480
	UImyDptPYMfzZxJDy3t8Gh50tIvt+WitUwhH7Do=
X-Google-Smtp-Source: ABdhPJyjzvMyZ+GZ+/vmxaqXChNrTF1JCCOoXKiaf951r3onboujs6BM2c0x73Sxu4/46tyAUU3kM5hKkjmVijZrD6k=
X-Received: by 2002:a50:ff19:: with SMTP id a25mr27858826edu.311.1629569468214;
 Sat, 21 Aug 2021 11:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210818165033.3935964-1-richard.purdie@linuxfoundation.org>
 <20210818165033.3935964-5-richard.purdie@linuxfoundation.org>
 <CANNYZj9x++ScjHm8KsUrftkN4o4as25=YSws_Lemn2TKLOSRxA@mail.gmail.com>
 <db5afb6bf3b352bfc088a0fb91163e695102d14a.camel@linuxfoundation.org>
 <CANNYZj8R=FhyEZ9kqnDPb9x-NYYOJOiaFimR2EJN1uoP2wbFsw@mail.gmail.com> <1525a52d4968846b8a95e2db1ed2aa6230d448b9.camel@linuxfoundation.org>
In-Reply-To: <1525a52d4968846b8a95e2db1ed2aa6230d448b9.camel@linuxfoundation.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 21 Aug 2021 20:10:56 +0200
Message-ID: <CA+chaQfK0C2doGi_0qk17DWbrURmp8-E51Y5CborFxO3KHa5Ow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] elfutils: Fix ptest dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004a332505ca15b5d4"

--0000000000004a332505ca15b5d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> > I think there are enough examples on how to make gpl3 free images
> without it,
> > and mbition has a full infotainment build based on recent master with n=
o
> gpl3
> > and no meta-gpl2. It=E2=80=99s doable and highly overdue.
>
> That doesn't solve the bash issue. Yes, it works if you can remove any ba=
sh
> script from your target image.
>

FWIW in LGE we're using busybox/defconfig:CONFIG_BASH_IS_ASH=3Dy and then
replacing runtime dependency on bash (as /bin/bash rprovider) with busybox,
this is a bit PITA with many bbappends, but works.

https://github.com/webosose/meta-webosose/commit/d0b237b70264e269f75303a11c=
43b2eea25de991

--0000000000004a332505ca15b5d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">&gt; I think there are enough examples on how to make gp=
l3 free images without it,<br>
&gt; and mbition has a full infotainment build based on recent master with =
no gpl3<br>
&gt; and no meta-gpl2. It=E2=80=99s doable and highly overdue.<br>
<br>
That doesn&#39;t solve the bash issue. Yes, it works if you can remove any =
bash<br>
script from your target image.<br></blockquote><div><br></div><div>FWIW in =
LGE we&#39;re using busybox/defconfig:CONFIG_BASH_IS_ASH=3Dy and then repla=
cing runtime dependency on bash (as /bin/bash rprovider) with busybox, this=
 is a bit PITA with many bbappends, but works.</div><div><br></div><div><a =
href=3D"https://github.com/webosose/meta-webosose/commit/d0b237b70264e269f7=
5303a11c43b2eea25de991">https://github.com/webosose/meta-webosose/commit/d0=
b237b70264e269f75303a11c43b2eea25de991</a></div><div>=C2=A0</div></div></di=
v>

--0000000000004a332505ca15b5d4--
