Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1739C433FE
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 19:20:14 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web12.6950.1665256814023393708
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 12:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pdp4VS+8;
 spf=pass (domain: gmail.com, ip: 209.85.166.181,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id 8so4015517ilj.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 12:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JqNJQ1uW9anfp30z2+mB0YglnJ88RDq3V2eXFjh9yVo=;
        b=pdp4VS+8GjCy0IEdbf6b2xOklRtFhVNgjGokJjvzD1dmZgS97O2W+5ffGQ9m3vuziB
         vHEega46iF7VQYeWG4JhrwK7Y1fpBCLYAklir0akwwPmMk9lC3+IVhfbkg4bl9t7nV1E
         uR3+cNyS8lvB3kk2Vgk7iQNoC87WYiGZP3vxuRIhvq1/NM/Ue7CFt8ca8j7/CvgVedH6
         Pq98nayeQfyywGrCV/7R3UoR64hpJmIn9By/RgE6hi5my+BxCZ+4sfm4OUzzROPIu6tk
         rQfH9743kEYzuxH8HS/X6Uwn8/3kS/hZ2Ft42qCwYA+xUNEXpQvNtE1GHdQaORYmOoKU
         jrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqNJQ1uW9anfp30z2+mB0YglnJ88RDq3V2eXFjh9yVo=;
        b=G+tEcVAp4GYK3fHZZtbFf+2zFNDCiUtxoJnkbYdvVmfIlTeBOnhOVZnpQgmqe3Uuta
         XC+ROjCXOhihJc72pSVhs2kUgUwzX0hb044pEvTW5UF1XCY+0dT5jpHgfKkHYccppRTg
         w4ADIxrpdCpa+KXGtZkw5Y4u3oY5Fx+MZfT6fBh/mmG/Siey8N9guG9ho686B35lTHaG
         QlWO4oHXzNktEiVeU9VY6H6XQzSjE9sIY2FzVaENbhYpKXh65Ub7yNfEx2DL0aYJVAJR
         DenXstJ7DnoKmR0IRwlcYa5/zPQfhlLnjP/yewWdgLmdXl7rC5FuPIx0q60dJR6elrs2
         nHuw==
X-Gm-Message-State: ACrzQf3WDqAK6xa5twmNpIcqkB2Y9wx54mzLxZlCkOigJDD7ougAwUos
	PQmqqZvb/jE1yzEpge24jV4B9cJW4+5yBuHbQASLu5gq
X-Google-Smtp-Source: 
 AMsMyM4DiCAB3xrOL+ze6mFWQBxT6+bkDLPvxAhyC1lOP6+1XxHgjiyKy61TQqFs3SPW5mKAbc8RhPF0EMAFm2RQs1A=
X-Received: by 2002:a05:6e02:2141:b0:2fa:c219:6158 with SMTP id
 d1-20020a056e02214100b002fac2196158mr4243513ilv.48.1665256813352; Sat, 08 Oct
 2022 12:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221007164640.17471-1-alex.kiernan@gmail.com>
 <20221007164640.17471-2-alex.kiernan@gmail.com>
 <CAP9ODKqO1ONyXNE=yL4dOhwUALjSdcTd-NoevQq3vyNYuN3VoQ@mail.gmail.com>
In-Reply-To: 
 <CAP9ODKqO1ONyXNE=yL4dOhwUALjSdcTd-NoevQq3vyNYuN3VoQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 8 Oct 2022 20:20:04 +0100
Message-ID: 
 <CAO5Uq5SrLpjUWZtwWARFh5W9XPWbPgJE5M9d24mP_c3RtJ7VrA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 2/2] u-boot: Add savedefconfig task
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d1dc5f05ea8ad0e2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Oct 2022 19:20:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171536

--000000000000d1dc5f05ea8ad0e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That was my other thought... this was basically a cut and paste from the
kernel...

Happy to redo like that!


On Sat, 8 Oct 2022, 20:01 Otavio Salvador, <otavio.salvador@ossystems.com.b=
r>
wrote:

>
>
> Em sex., 7 de out. de 2022 =C3=A0s 13:47, Alex Kiernan <alex.kiernan@gmai=
l.com>
> escreveu:
>
>> Add savedefconfig task which U-Boot supports (unfortunately not all
>> consumers of cml1 support this).
>>
>> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>>
>
> Kernel also does, so might be nice to add it to a specific class and reus=
e.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>

--000000000000d1dc5f05ea8ad0e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">That was my other thought... this was basically a cut and=
 paste from the kernel...<div dir=3D"auto"><br></div><div dir=3D"auto">Happ=
y to redo like that!</div><br><br><div class=3D"gmail_quote" dir=3D"auto"><=
div dir=3D"ltr" class=3D"gmail_attr">On Sat, 8 Oct 2022, 20:01 Otavio Salva=
dor, &lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br">otavio.salvado=
r@ossystems.com.br</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">Em sex., 7 de out. de 2022 =C3=A0s 13:=
47, Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" target=3D"_b=
lank" rel=3D"noreferrer">alex.kiernan@gmail.com</a>&gt; escreveu:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Add savedefconfig task wh=
ich U-Boot supports (unfortunately not all<br>
consumers of cml1 support this).<br>
<br>
Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">alex.kiernan@gmail.com</a>&gt;<br></blo=
ckquote><div><br></div><div>Kernel also does, so might be nice to add it to=
 a specific class and reuse.</div><div>=C2=A0</div></div>-- <br><div dir=3D=
"ltr">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"ht=
tp://www.ossystems.com.br" target=3D"_blank" rel=3D"noreferrer">http://www.=
ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossy=
stems.com.br" target=3D"_blank" rel=3D"noreferrer">http://code.ossystems.co=
m.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
Mobile: +1 (347) 903-9750</div></div>
</blockquote></div></div>

--000000000000d1dc5f05ea8ad0e2--

