Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web10.29245.1595772163567580599
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 07:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YW74ssul;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id b14so11253851qkn.4
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2020 07:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J07BQs7kyLBDY/plIattpvYl1XYWKhoX666pC87NtO4=;
        b=YW74ssul+QGrLJQM96E6HsIHfljXV0QGINl2evcxIbmZtupUOPWhHZ/yM6bSwucbqZ
         +2l2jgW5nGihsyGRHH7WKChyEmYqnYY93JUJEZhZzyykoR/fyZgKqcsf5WV3Z2vdQR0M
         t8oIgFdV/m82HQanS7+JWMc7SjqNFaLGJe6yizKoKVpcMkWzRU+3m74D0exnnIRwkMVp
         fgM6B3abN0ZkH+E42tFv80aYe4QspsmrNnQvA4qZp0VMzeB+7i9CVYXIPnxzQ8uWe2tr
         YcuGoP0cCzfHVJd5vXtbUNg9rXvTJL0dLJ9N3l8C9CPF8Dc9TbqKlNK78dg3yBrdI7Ca
         PafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J07BQs7kyLBDY/plIattpvYl1XYWKhoX666pC87NtO4=;
        b=PqloBlOCruKI408DySiXvFM/KWxC6+fuK1BRhSZjp6+kUdMonQoCVE7GI9gxZldj9R
         A7zUeYjpVgIlTnvZNblnnkBdKc2OISOsqmUHXWrGI8BGfFGHjdoe2YnqA4pt5GU7albp
         kQAczi4gjtZfWlsKWW0E7VcD7dr6CsWtZJtskSdPpWU3QeXOzFX098QMChDW29gmW/Tp
         Csj5YTEY2JbF1V8pL2GORd5X2KsH7EugirCz1PzANG6RNfCRaOdHUzWzAvmmXdXA32KR
         0Ai+Y3Tgj+N1hWGMgAuYfhWhRKeZ5FV/lLAroCI1OOCiug1oDhqZZAWxDkLBVds/zFEI
         3xKw==
X-Gm-Message-State: AOAM5325Ri74FqOhaCO14r7wXStBXVT6ZidljoxGXUpeWX9iCmP0hkc4
	L4DS+oSKXTSml2WQvMl8urShYtsytlcqE07HMxdN8nhp
X-Google-Smtp-Source: ABdhPJxxvvEU4cTx67YaRJzwVE38wAJTJSBmXymgwXdJWt0y+R5t7jd56zu8AzAnIWvw5djD5SpNAKgZSnTq9QaZnSg=
X-Received: by 2002:a05:620a:209b:: with SMTP id e27mr18589297qka.431.1595772162428;
 Sun, 26 Jul 2020 07:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200724171205.9871-1-andrei@gherzan.ro> <CAMKF1sohCE3ez-r8xssCvsmTk_2WHGe+UiX_uqzrD28z7r4+uw@mail.gmail.com>
 <CAK18fxFaqyRQ-UrO19_m9sSatZFvjB6==vKZYQPFppkAphXkaw@mail.gmail.com>
In-Reply-To: <CAK18fxFaqyRQ-UrO19_m9sSatZFvjB6==vKZYQPFppkAphXkaw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 26 Jul 2020 07:02:31 -0700
Message-ID: <CAMKF1squLebyRXxNmLSEow-sRwVsR6KWaFLXtW=6qZryHCHE4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] initscripts: Fix various shellcheck warnings in populate-volatile.sh
To: Andrei Gherzan <andrei@gherzan.ro>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e2512205ab58a86e"

--000000000000e2512205ab58a86e
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 25, 2020 at 5:08 AM Andrei Gherzan <andrei@gherzan.ro> wrote:

>
> On Sat, Jul 25, 2020 at 6:14 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>> What all shells has it been tested for ?
>>
>
> I've used shellcheck for static analysis and tested at runtime with
> busybox shell.
>

Thanks if it works with busybox ash I am happy with the patch

>
> Andrei
>

--000000000000e2512205ab58a86e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Jul 25, 2020 at 5:08 AM Andrei Gherzan &lt;<a href=
=3D"mailto:andrei@gherzan.ro">andrei@gherzan.ro</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 2=
5, 2020 at 6:14 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targe=
t=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div><div dir=3D"auto">What all shells has=
 it been tested for ?</div></div></blockquote><div><br></div><div>I&#39;ve =
used shellcheck for static analysis and tested at runtime with busybox shel=
l.</div></div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"au=
to">Thanks if it works with busybox ash I am happy with the patch=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><div></div></div></div><div dir=3D"ltr"><div class=3D"gmail_quote"><div><=
br></div><div>Andrei<br></div></div></div>
</blockquote></div></div>

--000000000000e2512205ab58a86e--
