Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com [209.85.219.193])
 by mx.groups.io with SMTP id smtpd.web09.12591.1604059656849059743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 05:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.ro header.s=google header.b=TcEBmlY9;
 spf=none, err=SPF record not found (domain: gherzan.ro, ip: 209.85.219.193, mailfrom: andrei@gherzan.ro)
Received: by mail-yb1-f193.google.com with SMTP id f6so4951563ybr.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 05:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gherzan.ro; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zjZVZ8iwCjHOG/JOZeUdNOaZp4moQfH6jMiG76Gd3mg=;
        b=TcEBmlY948Ohjf5MWeZifvXJDL8JA/qtIoB1C8myNiIFT2tFmGdDrFD3hiNdBwthEn
         MdCrnJ6wpdJlrnPfQnklDtek5IoynAXaHnl0V2JyLr2NgiYjiNPvB58jqqiIh/Iu8woE
         9/9h9oXHISTCe1kd/NlmUNBbpw//vUXNjfgBW9zVrECfMMXOTeTXaJOOcg2+r2KGIxMF
         9itcU0cvQa/btPGH9i1v7UzMbmPMZMVj4En71D1pmyg8ABGesIHM+XVyPFp/hWioTso0
         kC97J3Fbmbq3FZU0yZlX4RcKTbCAZoNhuhEB8hJuzPKl/jxRxzZzuL6SPYRzvPsd1STS
         yI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zjZVZ8iwCjHOG/JOZeUdNOaZp4moQfH6jMiG76Gd3mg=;
        b=LtFuNDOQeuZXOnJtt4/3Ro3HCY4VtXkA54hDCPrBlDq0WsCxtNjHv+qi/pEZAipl9G
         l5Y3C8gfWlVUDIRmYbmZVAXEnyOKWGNeHVZHbx/10MsSuRQQ3DUvCKhPX36n+6BzzVYy
         dvHAAfLPrIBTMTUqfM586RClY2cK1jfU0d1HOAsEpIzQNA/K5iQfumOh4JCTL8XxSton
         TG+RREKxYffw4eZEWNvR6NNLuePDn4nZBV5INQmXaP/Q1vrmZSYySVuZ48PBENEVDn2m
         /uCgfNdNo78y5vLxETAx7ZVPlVHZokpDX9kRzaLi+YslvwdShMWgd+TZECaiPzT2yzyF
         mLHA==
X-Gm-Message-State: AOAM530Q6uK6Wgl7QWAua+F0akqBiymYagjc49b22DfqU3Nv+RLYA3SI
	SEGEFltsAJdJgkikKl+CZDLQUaLk4i7IXzVlczVPmg==
X-Google-Smtp-Source: ABdhPJwnqk1Pg6DheLkoZeFLkmT7WVUDniNIAp4bArSMnFB2sYycoqnvXci6kiVohxjDPLNzrCtMA6AZI44cxDcSQpw=
X-Received: by 2002:a25:32c3:: with SMTP id y186mr3198389yby.71.1604059656017;
 Fri, 30 Oct 2020 05:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201030054703.422319-1-raj.khem@gmail.com>
In-Reply-To: <20201030054703.422319-1-raj.khem@gmail.com>
From: "Andrei Gherzan" <andrei@gherzan.ro>
Date: Fri, 30 Oct 2020 12:07:00 +0000
Message-ID: <CAK18fxHc0AObD7MFbvrY6teGr5VqoFkTck=NBfCbj2V47dZYxg@mail.gmail.com>
Subject: Re: [PATCH] musl: Add .file directive in crt assembly files
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ff071e05b2e23db6"

--000000000000ff071e05b2e23db6
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 30, 2020 at 5:47 AM Khem Raj <raj.khem@gmail.com> wrote:

> This helps linker to noot emit absolute paths into .debug_line sections
> of liked binaries and libraries and therefore make them reproducible
>
> Reported-by: Andrei Gherzan <andrei@gherzan.ro>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../musl/0001-crt-Add-.file-directive.patch   | 300 ++++++++++++++++++
>  meta/recipes-core/musl/musl_git.bb            |   1 +
>  2 files changed, 301 insertions(+)
>  create mode 100644
> meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch
>

Tested - works as expected. One small NIT to maintain consistency with the
Glibc fix: ".S" vs ".s".

--
Andrei Gherzan

--000000000000ff071e05b2e23db6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Fri, Oct 30, 2020 at 5:47 AM Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">This helps linker to noot emit absolut=
e paths into .debug_line sections<br>
of liked binaries and libraries and therefore make them reproducible<br>
<br>
Reported-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro" target=
=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../musl/0001-crt-Add-.file-directive.patch=C2=A0 =C2=A0| 300 +++++++=
+++++++++++<br>
=C2=A0meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"noreferr=
er" target=3D"_blank">musl_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 301 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/musl/musl/0001-crt-Add-.file-dir=
ective.patch<br></blockquote><div><br></div><div>Tested - works as expected=
. One small NIT to maintain consistency with the Glibc fix: &quot;.S&quot; =
vs &quot;.s&quot;.</div><div><br clear=3D"all"></div><div><div><div dir=3D"=
ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
--</div>Andrei Gherzan</div></div></div></div></div></div></div></div>

--000000000000ff071e05b2e23db6--
