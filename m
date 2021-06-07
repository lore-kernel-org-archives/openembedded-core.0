Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.37137.1623078640330421752
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jun 2021 08:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uuvveMZj;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id k11so15345610qkk.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jun 2021 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=05ew+R1U0YRO8hBHWW8FcHYOkiURTSLFIRZzPcCP+Go=;
        b=uuvveMZjM14uTokbA5BOhZMhPtYHl8Ad1ZoWOiK5XC7nhuZPiGQf7x5lmLooUV5DF1
         NzW5nFeH1QrMlhBUpVCC29EjH0/JEvsXUeO8q6g9T+rfu2risKPaMM+SZ4sRVxxbIG5w
         tl+yC6gIeUjCIipQeVq/V7bSRuhTUHo+GDu0w6v19CWRPGknDlWwSv6fi4PiXsdlUSUp
         UQFdc8ZkwqMjPmcC4GmiLXKwUTP04IKyWvX0zru+B4iCBekVrQSUXePGXKvFZ2Z/Faku
         XDeIPhN0tpp4l5KFwZfBQABtAb/5U+3tBJa6TghLNFQLKOpGl6Q7oGLm8ymBWc6kDw8i
         lzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=05ew+R1U0YRO8hBHWW8FcHYOkiURTSLFIRZzPcCP+Go=;
        b=f3fW4UGxYGS5reRdZZypd1l1T66ph2v9qUG2qiBeEYl4RBgrB72gai/VKCpixXeOug
         qZlK8NtTz7cyFYXPHlwgNvB5KqJL4GMYcNohGDmkoZDb+HYdeHvPkzLK3+vQnH53Sz83
         J+4tviu8V1ahfMUiTgoN+2sbxoT9yeS3zw6p/pB4gDOtwAZ/RDEUB3aaQdoOeuptRmAn
         5F4XNWjNBVz6dnEu48cbjA4haygp8KXS00ZrOGVZSS703AdIa7wRYm17X98EfjvbxGHE
         kWDJt+ka03rTUmZnGy9nnssPVH/ioGQCP61bAwnqc1YYks6Qiym+25SdZ+XmTRiH9J4a
         qnhQ==
X-Gm-Message-State: AOAM532WRozT5ZlDT/kfC0XpQz1uO+Y1H1IY2WlQBUq+e1/zVj3AWoNL
	NU+4PDWyUzE5a4HN04qFspJ+buoEofl7D0g4S40=
X-Google-Smtp-Source: ABdhPJz0ggVW2W/ptlHiPFIyqsYaQ6oeEvIkpBWwMuPZ5zMKBbfm9EPmfqaHyr1ZTE6/fGC/C5u2EUNTkaD+TuK/U5o=
X-Received: by 2002:a37:59c7:: with SMTP id n190mr17018605qkb.146.1623078639430;
 Mon, 07 Jun 2021 08:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
 <20210604091458.1381144-4-alex.kanavin@gmail.com> <1685B658849E960A.4717@lists.openembedded.org>
 <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
 <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com> <7e56d093ba6c1390cec71ef3a362abe84ce735bb.camel@linuxfoundation.org>
 <CANNYZj_ExBZwGzRrnG8Yb2nsNmzCKkZV09FqFuMbCdxAepNSkg@mail.gmail.com>
 <2ac70a7b01743192ae4ec42b2b1eee18becde25d.camel@linuxfoundation.org>
 <CANNYZj-dYu4Q9PBhBd2-msPaBSreycLCfCKmZ1zm8=z=Ht+MbA@mail.gmail.com>
 <CAMKF1srMGpi0fCdx0b=n0NCSMrkBUBN80srR1sMP9vZZbHf=tQ@mail.gmail.com>
 <CANNYZj9spx5kAGMZBTTYz_daHG=G17uAfx6rE3=0fe+CP8-p=A@mail.gmail.com>
 <CAMKF1sqWNP8G=DwthpeiXfV2niSygRBeNQACXDrVgT5NEds3vA@mail.gmail.com> <CANNYZj-iYbPjM7KKv+bPL_Tu2WZqG2sOCB5njjHHZ-5ou36rUg@mail.gmail.com>
In-Reply-To: <CANNYZj-iYbPjM7KKv+bPL_Tu2WZqG2sOCB5njjHHZ-5ou36rUg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 7 Jun 2021 08:10:28 -0700
Message-ID: <CAMKF1sobgTDj0Cf5TZ=DcO00tTGQb=q2yPiMuub57-PfAv058w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Michael Halstead <mhalstead@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000bef14105c42e71ff"

--000000000000bef14105c42e71ff
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 3:20 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Mon, 7 Jun 2021 at 00:19, Khem Raj <raj.khem@gmail.com> wrote:
>
>> here is a small testcase to excercise utimensat_time64
>>
>> https://raw.githubusercontent.com/xantares/test-seccomp-time64/master/test-time64.c
>>
>> gcc -m32 test-time64.c
>>
>> it will be good to check how the resulting binary behaves with centos
>> provided libc and sdk provided one.
>>
>
> Yes, testing the issue without involving the sdk would be good, but I
> can't build it in the host environment, and don't have rights to install
> missing 32 bit support packages (not sure what that would be):
>
> /usr/include/gnu/stubs.h:7:11: fatal error: gnu/stubs-32.h: No such file
> or directory
>  # include <gnu/stubs-32.h>
>

Yeah it needs 32bit development libc and compiler installed


>            ^~~~~~~~~~~~~~~~
>
> Alex
>

--000000000000bef14105c42e71ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jun 7, 2021 at 3:20 AM Alexander Kanavin &lt;<a hre=
f=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 7 Jun 2021 at 00:19, =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">here is a small testcase to excercise utimensat_time64<br>
<a href=3D"https://raw.githubusercontent.com/xantares/test-seccomp-time64/m=
aster/test-time64.c" rel=3D"noreferrer" target=3D"_blank">https://raw.githu=
busercontent.com/xantares/test-seccomp-time64/master/test-time64.c</a><br>
<br>
gcc -m32 test-time64.c<br>
<br>
it will be good to check how the resulting binary behaves with centos<br>
provided libc and sdk provided one.<br></blockquote><div><br></div><div>Yes=
, testing the issue without involving the sdk would be good, but I can&#39;=
t build it in the host environment, and don&#39;t have rights to install mi=
ssing 32 bit support packages (not sure what that would be):</div><div><br>=
</div><div>/usr/include/gnu/stubs.h:7:11: fatal error: gnu/stubs-32.h: No s=
uch file or directory<br>=C2=A0# include &lt;gnu/stubs-32.h&gt;</div></div>=
</div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah it ne=
eds 32bit development libc and compiler installed=C2=A0</div><div dir=3D"au=
to"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D=
"gmail_quote"><div dir=3D"auto"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^~~~~~~~~~~~~~~~</div><div><br></div><div>Alex<br> </div></div></div>
</blockquote></div></div>

--000000000000bef14105c42e71ff--
