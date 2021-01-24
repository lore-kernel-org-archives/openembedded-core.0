Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.24490.1611511709064882840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 10:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CqTHHt2O;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id gx5so14759396ejb.7
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 10:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6CUVX6ONRM0t6nIciC12Ef3LsuA9ZrgWE3yW952vP0E=;
        b=CqTHHt2O+yT9wyEzEuYepsiwV+/2YpSchEYDEj8Zr3lJP3SBneF2Uwhhon8vGnlkev
         QJY91bljy1e9a6jU0eH95J9xwHA2x2hfdYUNyfoN66Gp9sOAKkyawbq5HU6dFtUywjZh
         BTK8rS1eGi6m34HQuX6U8HZibUWC7DmO+JMWOn2+/PwyG9HOozWQ9jduLSQHU1cYjKeg
         +xM8sR1hkAeGIFAgulDWbRtLdM1ggOpXeHje1XpmISlfcIM01Kx3Iy8gPJVHU6+LRjUJ
         lgTHvzzVRRhq6WfY4UE8D581vxrLeU5Ewmk3eaVu6zOM09FEPtwWpMs6oDZ7RhShGqOU
         8f0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6CUVX6ONRM0t6nIciC12Ef3LsuA9ZrgWE3yW952vP0E=;
        b=KuaD+QuFLl2yq3csYkSlpY7BSqzy6gOxOXf3Xnv8dE+eNoohfgNq81FoPSdAV+Cb/A
         1eVXlv3JQs1wlFHXiym6SzFuskjR1CmjKJe+YZDThEmlxKwD0S/PeR72GrIvDvWoEuwX
         V8/MFimP13kluF+6+J7UlUi/nqxar9WWmyUgVPd6kbMjjvzwjkNfs93OfJ7n6nDGVQAc
         xIdlZnVHomYCs1p1nC1c5qJAxfPlIKu8dvOcpdM6UUjVnTBD2sy5IRjvGEbLhl/gBWpP
         BNyoP1XrtGeIK4AqtKmk2X9TxbNB8qb5bT0M6m7k6y3q/HHXpXCvJZtDscLzp4cLRO0A
         gAkA==
X-Gm-Message-State: AOAM532zx9vaMRDWgpI6em7SCh6slzzKvhmBgDkD6zkPPl+peb5TX4OT
	lg36ta0CRSpqtaWinnCJOA+XLKgpMsZGkabPyN8X605HoEHz/w==
X-Google-Smtp-Source: ABdhPJwX5BVKee/Mqdq9x03qGyPz/EaBEuK34GuxnDTISj5eUz4RmWR3JXqQN9LJT6pOUXJAT3oyTlhje/Dq2bsNmKo=
X-Received: by 2002:a17:907:1b06:: with SMTP id mp6mr474647ejc.408.1611511707674;
 Sun, 24 Jan 2021 10:08:27 -0800 (PST)
MIME-Version: 1.0
References: <20210122093013.642421-1-quaresma.jose@gmail.com>
 <20210122093013.642421-2-quaresma.jose@gmail.com> <916e0ec9970e7c08588d7150c9a141e3cdff2f63.camel@linuxfoundation.org>
 <165C8BD8147EA2E5.12911@lists.openembedded.org>
In-Reply-To: <165C8BD8147EA2E5.12911@lists.openembedded.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Sun, 24 Jan 2021 18:08:16 +0000
Message-ID: <CANPvuRnV1=APakLG6XmkH76JfSE-YCie3nt_jRBJApFmdXe8bA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] glslang: upgrade 8.13.3743 -> 11.1.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e32c9305b9a94efb"

--000000000000e32c9305b9a94efb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have send a V4 with the fixes for the shaderc-natve.

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia sexta, 22/01/2021 =C3=A0=
(s)
11:55:

> Sorry for that!
>
> I need to look more deeply on that.
>
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> sexta, 22/01/2021 =C3=A0(s) 11:30:
>
>> On Fri, 2021-01-22 at 09:30 +0000, Jose Quaresma wrote:
>> > License-Update: Add additional licenses
>> >
>> > - [1] BSD-2-Clause & MIT & Apache-2.0
>> > - [2] GPL-3-with-bison-exception
>> >
>> > [1]
>> https://github.com/KhronosGroup/glslang/commit/2962be40baff69848fd786c6=
09289666b60741b8
>> > [2]
>> https://github.com/KhronosGroup/glslang/commit/14a2cfbc72f2bb2e060fdfe3=
fbe6a4d54e3817a8
>> >
>> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>> > ---
>> >  .../glslang/{glslang_8.13.3743.bb =3D> glslang_11.1.0.bb}   | 8 ++++=
----
>> >  1 file changed, 4 insertions(+), 4 deletions(-)
>> >  rename meta/recipes-graphics/glslang/{glslang_8.13.3743.bb =3D>
>> glslang_11.1.0.bb} (73%)
>>
>> I think this may be breaking shaderc-natve:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2982
>> and many more
>>
>> (see
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1776
>> )
>>
>> Cheers,
>>
>> Richard
>>
>>
>
> --
> best regards,
> Jos=C3=A9 Quaresma
>
>=20
>
>

--=20
best regards,
Jos=C3=A9 Quaresma

--000000000000e32c9305b9a94efb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have send a V4 with the fixes for the=C2=A0<span class=
=3D"gmail-il" style=3D"color:rgb(0,0,0)">shaderc</span><span style=3D"colo=
r:rgb(0,0,0)">-natve.</span></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a href=3D"m=
ailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a=
>&gt; escreveu no dia sexta, 22/01/2021 =C3=A0(s) 11:55:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Sorry for that!<d=
iv><br></div><div>I need to look more deeply on that.</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &=
lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">=
richard.purdie@linuxfoundation.org</a>&gt; escreveu no dia sexta, 22/01/202=
1 =C3=A0(s) 11:30:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Fri, 2021-01-22 at 09:30 +0000, Jose Quaresma wrote:<br>
&gt; License-Update: Add additional licenses<br>
&gt; <br>
&gt; - [1] BSD-2-Clause &amp; MIT &amp; Apache-2.0<br>
&gt; - [2] GPL-3-with-bison-exception<br>
&gt; <br>
&gt; [1] <a href=3D"https://github.com/KhronosGroup/glslang/commit/2962be4=
0baff69848fd786c609289666b60741b8" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/KhronosGroup/glslang/commit/2962be40baff69848fd786c60928966=
6b60741b8</a><br>
&gt; [2] <a href=3D"https://github.com/KhronosGroup/glslang/commit/14a2cfb=
c72f2bb2e060fdfe3fbe6a4d54e3817a8" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/KhronosGroup/glslang/commit/14a2cfbc72f2bb2e060fdfe3fbe6a4d=
54e3817a8</a><br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmai=
l.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../glslang/{<a href=3D"http://glslang_8.13.3743.bb" rel=3D"nor=
eferrer" target=3D"_blank">glslang_8.13.3743.bb</a> =3D&gt; <a href=3D"http=
://glslang_11.1.0.bb" rel=3D"noreferrer" target=3D"_blank">glslang_11.1.0.b=
b</a>}=C2=A0 =C2=A0| 8 ++++----<br>
&gt; =C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt; =C2=A0rename meta/recipes-graphics/glslang/{<a href=3D"http://glslang=
_8.13.3743.bb" rel=3D"noreferrer" target=3D"_blank">glslang_8.13.3743.bb</a=
> =3D&gt; <a href=3D"http://glslang_11.1.0.bb" rel=3D"noreferrer" target=3D=
"_blank">glslang_11.1.0.bb</a>} (73%)<br>
<br>
I think this may be breaking shaderc-natve:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/65/buil=
ds/2982" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/65/builds/2982</a><br>
and many more<br>
<br>
(see<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/buil=
ds/1776" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/typhoon/#/builders/83/builds/1776</a><br>
)<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
"><div dir=3D"ltr">best regards,<br>Jos=C3=A9 Quaresma</div></div>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr">best regards,<br>Jos=C3=A9 Qua=
resma</div></div>

--000000000000e32c9305b9a94efb--
