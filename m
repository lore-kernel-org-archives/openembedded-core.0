Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.7673.1611316526376406147
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jan 2021 03:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=msGs77k0;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id c2so5960509edr.11
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Jan 2021 03:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NtoXxF7jLThzBVBoNma/HT8Ufqeu/bDSGOKwoUGjWaw=;
        b=msGs77k0eRt3yPusEjUnTTtLDXy5xr5npRi5ZuqqQm3OesvSRM/tH1H4CS+oR0obRD
         XSxAhOZwZ7UeWDxhB+DVJ6LAX0mUGdwjrBRAcwmbVmcCJHtTUvNZg8mY2BgPJ8KMSJIo
         Hm6Ubxdxhy+jdt8zzGp2DQpMa9P9VLDnbOWrl5eBDJ5bgeAHwzVCRrwqDVE06cfynqzZ
         hISVRWY9tyVmTEh90u1WC1Av4vNEDaPIE/C4AQb40ULfLUCK+EsXEA4CLxtkGhjp/T7t
         /a07dO7sCBMPsRq7W19OSRdjUSWRynYLEVFGJ1cm8LlYuIIoZ+9Ky+Y6FVI4+7UzJwBa
         Arqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NtoXxF7jLThzBVBoNma/HT8Ufqeu/bDSGOKwoUGjWaw=;
        b=L54aUxi/2ew4qmeKSzdQ/8+8SD5+cMGLv8T9W4T8by0CWITSJ4GLadMnGKIAvIXZ5t
         Xr5HI09NkG02RvHGSg5qa956t6i8vl0abFLdgbVKBr8Ux+k5Y9FPdbzPcKj3qDxpZpbe
         dCThlqAvcIv6kG+5tk2HLJMZa1Z3tM8d1H9wlbWqVD4y7ebl7N+QMh1BuY11bjwErZb0
         6c3yyYpiIei++d9U1DtXcI1SPTl5DHvbpJPy9eqH6ODg7PUGB3MSwC6PSo1bZSIaGiki
         h8r1k+7hrd7egfn6akuSah2NKWggFHe09wghPz3d8sgIiBB+SqH863lDyvCzmwZ214Jk
         PlZQ==
X-Gm-Message-State: AOAM532ZmYQQjK+pQIN5bkDQBW7sYmY/5E3S4oLCSBlqhdluytb+1m8S
	sSR6CnXC5vC2UeEGCIh17RUm+e9xjlLLYoHY9zQ=
X-Google-Smtp-Source: ABdhPJxq/qAhmKTBLRswI6Yjw8Qp1GXNYr7tLOR8AzK9vbDBwAXdWTcjy5ibkoFGy3cBhxpCibUDttQ1+42auoIZHdQ=
X-Received: by 2002:a05:6402:1bcd:: with SMTP id ch13mr2866653edb.31.1611316524931;
 Fri, 22 Jan 2021 03:55:24 -0800 (PST)
MIME-Version: 1.0
References: <20210122093013.642421-1-quaresma.jose@gmail.com>
 <20210122093013.642421-2-quaresma.jose@gmail.com> <916e0ec9970e7c08588d7150c9a141e3cdff2f63.camel@linuxfoundation.org>
In-Reply-To: <916e0ec9970e7c08588d7150c9a141e3cdff2f63.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Fri, 22 Jan 2021 11:55:24 +0000
Message-ID: <CANPvuR=k_C5bUZyna5X3ud3NEzU6UyK8upzvacgN+=fUbYPzyg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] glslang: upgrade 8.13.3743 -> 11.1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000016dd5c05b97bdd2b"

--00000000000016dd5c05b97bdd2b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for that!

I need to look more deeply on that.

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia sexta,
22/01/2021 =C3=A0(s) 11:30:

> On Fri, 2021-01-22 at 09:30 +0000, Jose Quaresma wrote:
> > License-Update: Add additional licenses
> >
> > - [1] BSD-2-Clause & MIT & Apache-2.0
> > - [2] GPL-3-with-bison-exception
> >
> > [1]
> https://github.com/KhronosGroup/glslang/commit/2962be40baff69848fd786c609=
289666b60741b8
> > [2]
> https://github.com/KhronosGroup/glslang/commit/14a2cfbc72f2bb2e060fdfe3fb=
e6a4d54e3817a8
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  .../glslang/{glslang_8.13.3743.bb =3D> glslang_11.1.0.bb}   | 8 ++++--=
--
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >  rename meta/recipes-graphics/glslang/{glslang_8.13.3743.bb =3D>
> glslang_11.1.0.bb} (73%)
>
> I think this may be breaking shaderc-natve:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2982
> and many more
>
> (see
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1776
> )
>
> Cheers,
>
> Richard
>
>

--=20
best regards,
Jos=C3=A9 Quaresma

--00000000000016dd5c05b97bdd2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry for that!<div><br></div><div>I need to look more dee=
ply on that.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linux=
foundation.org">richard.purdie@linuxfoundation.org</a>&gt; escreveu no dia =
sexta, 22/01/2021 =C3=A0(s) 11:30:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Fri, 2021-01-22 at 09:30 +0000, Jose Quaresma wrote:<=
br>
&gt; License-Update: Add additional licenses<br>
&gt; <br>
&gt; - [1] BSD-2-Clause &amp; MIT &amp; Apache-2.0<br>
&gt; - [2] GPL-3-with-bison-exception<br>
&gt; <br>
&gt; [1] <a href=3D"https://github.com/KhronosGroup/glslang/commit/2962be40=
baff69848fd786c609289666b60741b8" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/KhronosGroup/glslang/commit/2962be40baff69848fd786c609289666=
b60741b8</a><br>
&gt; [2] <a href=3D"https://github.com/KhronosGroup/glslang/commit/14a2cfbc=
72f2bb2e060fdfe3fbe6a4d54e3817a8" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/KhronosGroup/glslang/commit/14a2cfbc72f2bb2e060fdfe3fbe6a4d5=
4e3817a8</a><br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../glslang/{<a href=3D"http://glslang_8.13.3743.bb" rel=3D"nore=
ferrer" target=3D"_blank">glslang_8.13.3743.bb</a> =3D&gt; <a href=3D"http:=
//glslang_11.1.0.bb" rel=3D"noreferrer" target=3D"_blank">glslang_11.1.0.bb=
</a>}=C2=A0 =C2=A0| 8 ++++----<br>
&gt; =C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt; =C2=A0rename meta/recipes-graphics/glslang/{<a href=3D"http://glslang_=
8.13.3743.bb" rel=3D"noreferrer" target=3D"_blank">glslang_8.13.3743.bb</a>=
 =3D&gt; <a href=3D"http://glslang_11.1.0.bb" rel=3D"noreferrer" target=3D"=
_blank">glslang_11.1.0.bb</a>} (73%)<br>
<br>
I think this may be breaking shaderc-natve:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/65/build=
s/2982" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/65/builds/2982</a><br>
and many more<br>
<br>
(see<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/1776" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/83/builds/1776</a><br>
)<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">best regards,<br>Jos=C3=A9 Quar=
esma</div></div>

--00000000000016dd5c05b97bdd2b--
