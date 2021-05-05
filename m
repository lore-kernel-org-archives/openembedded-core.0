Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web08.819.1620254903934786631
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 15:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SgCbaP4E;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id o5so3302167qkb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 15:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vL5FyUzjiCYOC5NL9z1UEpVU5xq7nnsEQnBIZaNBoPk=;
        b=SgCbaP4EWEGagacqdyoUWyVZbRHvoQMWnNvVv/pNT3FvxUWceeTUIOJ9ZPAvON6jtW
         2plsKUq814YxrBl1busHiBi4dzGuvz+UthSF5n+maFmXKYQsi0m+6rWXrssvSmZvUzxy
         +AVVwRQ/WdMf6aXyUuYNFelP0Z5393N6j1ihfuVZkd8Z8L/sSbXqmRkA6MM9WAvZ0x22
         ZPOLIMlONuHNpPYG3SSmDTboVVEgXFK+bZ1z8gbIGyg24WWRT69nSkR7nAXNe83zDTnq
         McjkPYf4YRDfUOgvjdWRz0wUHw3ztTf+e612ocGFj6/JW0+3r+xHMcvwD2AxHEfqOE+y
         HVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vL5FyUzjiCYOC5NL9z1UEpVU5xq7nnsEQnBIZaNBoPk=;
        b=ii6Ld9Oxh2yshwrE7LAnPwmo8X+iwIAnXt83tuJi+yshn8BsB97GvwXcIZhGaeS07s
         7AKnauEwT8aeP8HJzQu+49ysysWg9GLzv3QWkkpNJcgRfWU5xSoqAgPkK/6WCylIZiCp
         LDeh1y7iI/W2kZ7yAyYcGiz9KYOzJWx71POVMgK9MUvHLw7DyinnVQ786oEHzthmOn8G
         ALGMsYOXbmZEF/o8NYT7aPrxr+jRRm5ItH2Zlpemsbz2X2jaMBd1TpGHA3aPj5mBpA4v
         y30YxU6m2gGl+xZVTwq8sYosU1D37I6eUTIWSlPpXyoZa0Kt7j6Rks6kgHK7ZBEUY/Uq
         +Qww==
X-Gm-Message-State: AOAM5329J+LouikbUOV8lHNDeGZ6rqhGaKjq4SDX473Ia0aHnDihuc6R
	seCMbWmu65fuuWvlszWvgiy/rddtU2EkFP+gd7U=
X-Google-Smtp-Source: ABdhPJwynHUK6nKqHEIqDOKwv7tyAqCSTN1IIv758NQ8k6zdOz5sLDRj2uYFPLY/NUZ4kkn9fVs25h0279RaTGlUwTE=
X-Received: by 2002:a05:620a:9c8:: with SMTP id y8mr1103909qky.125.1620254903112;
 Wed, 05 May 2021 15:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-23-alex.kanavin@gmail.com> <CAMKF1srGBpzk-BiFnSM_+1pEoCByUkcPrJo2VDmSRUwGgbn18Q@mail.gmail.com>
 <CANNYZj8Q7GLF_6oLZQ9oZYO3nMKkThZnj7CZGL=duS1u_wQicA@mail.gmail.com>
 <46ffd119-9523-cb0f-d582-ced91ccccef6@gmail.com> <CANNYZj8iZrEC0kc5GGJSb6ddBH77Tz_pN+pFzuD0Hhbdjhpjbw@mail.gmail.com>
 <CAMKF1sozSbDLB08dWLOTnSAFFpgp3j7rkoQ-7NGe5fYF7f+ceQ@mail.gmail.com>
 <CANNYZj85oAj0YAZVo7J4=5d1Zti=aLmaT+-_gftA-ZWdg8JYxQ@mail.gmail.com>
 <CAMKF1spJ3sJnhT59PGeaGwfsoSbS1QuZEqFdgY0bxBVbES=fVQ@mail.gmail.com> <CANNYZj_-boTZn5hxaEZvdfQmGauNpZ6LFkm=GLo78Uzgz7zSaA@mail.gmail.com>
In-Reply-To: <CANNYZj_-boTZn5hxaEZvdfQmGauNpZ6LFkm=GLo78Uzgz7zSaA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 May 2021 15:48:12 -0700
Message-ID: <CAMKF1sp4thJWt9J9kyjLOVbaw4pN8-rFE20t541Hf8WwUKfHeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 23/61] powertop: update 2.13 -> 2.14
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f21c0c05c19cfd74"

--000000000000f21c0c05c19cfd74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 5, 2021 at 3:21 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Thu, 6 May 2021 at 00:02, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>> order is, look for ncursesw first so this sed operation removes ncursesw
>> from search paths.
>> and this commits mentions this change was intentional
>>
>> https://git.openembedded.org/openembedded-core/commit/?id=3D188862de64b
>>
>> so why should it be dropped without understanding the repercussions of i=
t?
>>
>
> PKG_CHECK_MODULES does not check for things in order listed (first second
> or whatever), it checks for all of them as a set, or it errors out
> otherwise if anything in the set is not available.
>

Right and it means if widechars support in ncurses is disabled then it
won=E2=80=99t build I know that defaults is to enable it in ncurses so auto=
builder
won=E2=80=99t see such failures but many minimal distro did explicitly disa=
ble it
in past



>
> Besides, you're asking the question backwards. It should be: why should w=
e
> change the upstream choice if we don't understand the repercussions of
> doing that?
>



> Alex
>

--000000000000f21c0c05c19cfd74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, May 5, 2021 at 3:21 PM Alexander Kanavin &lt;<a hre=
f=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 6 May 2021 at 00:02, =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><br><div style=3D"f=
ont-family:monospace,monospace">order is, look for ncursesw first so this s=
ed operation removes ncursesw from search paths.</div><div style=3D"font-fa=
mily:monospace,monospace">and this commits mentions this change was intenti=
onal</div><div style=3D"font-family:monospace,monospace"><br></div><div sty=
le=3D"font-family:monospace,monospace"><a href=3D"https://git.openembedded.=
org/openembedded-core/commit/?id=3D188862de64b" target=3D"_blank">https://g=
it.openembedded.org/openembedded-core/commit/?id=3D188862de64b</a><br></div=
><div style=3D"font-family:monospace,monospace"><br></div><div style=3D"fon=
t-family:monospace,monospace">so why should it be dropped without understan=
ding the repercussions=C2=A0of it?</div></div></div></blockquote><div><br><=
/div>PKG_CHECK_MODULES does not check for things in order listed (first sec=
ond or whatever), it checks for all of them as a set, or it errors out othe=
rwise if anything in the set is not available. </div></div></blockquote><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Right and it means if widechars =
support in ncurses is disabled then it won=E2=80=99t build I know that defa=
ults is to enable it in ncurses so autobuilder won=E2=80=99t see such failu=
res but many minimal distro did explicitly disable it in past=C2=A0</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote" dir=3D"auto"><br></di=
v><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Besides, =
you&#39;re asking the question backwards. It should be: why should we chang=
e the upstream choice if we don&#39;t understand the repercussions of doing=
 that?</div><div class=3D"gmail_quote"></div></div></blockquote><div dir=3D=
"auto"><br></div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div dir=3D"ltr"><div class=3D"gmail_quote"><br></div><div class=3D"gmail_=
quote"></div><div class=3D"gmail_quote">Alex<br></div></div>
</blockquote></div></div>

--000000000000f21c0c05c19cfd74--
