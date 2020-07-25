Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web10.8461.1595678940243220286
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jul 2020 05:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.ro header.s=google header.b=CtsbN4d+;
 spf=none, err=SPF record not found (domain: gherzan.ro, ip: 209.85.222.42, mailfrom: andrei@gherzan.ro)
Received: by mail-ua1-f42.google.com with SMTP id n4so3784528uae.5
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2020 05:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gherzan.ro; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u6XpcZ9Zko5NfUU9sE2lESjP7gtmLd0XaBIvr2SoMQ4=;
        b=CtsbN4d+oJvKKTeEH0/GUsPsD/7vsyy/K7CLXkbPI/0Ubmpp4z5n4n0TE86NDON572
         XaxNztraBbYnWl775z57dhS8dspzjpM7GGycxgY34xwOnE4NfJodkJMAGdkk8W8pC7yU
         eJL2o1sV0tqVYWvEj1COYH6R3YxbantFSVmFZMMJpvSiPGOtExOgmSHUEUCAzSp/z8c7
         BaIPzYRkMvp+L18C+suzMdJV0V62c0B+a9fkapLUiu9FX3uzzVpXezIoFmekQ5yEiu0e
         gF20rwDHkobSxoTa3jt8eYd5Wtj3YVluNtuv5LKD8darL5RmbUT5N6tya693wfoTqN6R
         qM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u6XpcZ9Zko5NfUU9sE2lESjP7gtmLd0XaBIvr2SoMQ4=;
        b=ffT+HIHxQbfGSZzm/6ahFQPsXp2GyYQWNcuYvUPwuzcMxKclFHW0kHOvWx6Zjfb9Kw
         sJchsgm61P25UMqmCFJlkP9IBzpETSFvk3aC8pfdAqE4r5JdR8xaKRikrt4NaIE4zpCi
         kHpAxF5PYngV4kDie/Joi7FIlVPhvvVMt7X7G8zSBQii0i7Ds/e5O141WHoyc+wyrXbb
         ipk+emLgQT1GZI+KjP0e24mEIr27XtnFwzDraGNT+pMYkBMozMNH+qbNol4wegftPPj3
         Ij8BOAMIGiG1hrhB4CTlus0IrLTn54C00OXlBROk9EgeM7Fgwj99LUiTVAIARJ5rPIH4
         UGrA==
X-Gm-Message-State: AOAM530dMvGzTZVGp1oKLhbmqZi9fyydqmrgkWhNmLpNfqkjPggUupCy
	d2sN3AFs/mPZ4Q8AS66Xqw41Yj9Jgg58J8Bb57zfHg==
X-Google-Smtp-Source: ABdhPJwvYujnIe/WsStm3K/1Sosu6NwFIUAI3mDKe6saqImcGjcoIBHZkDGEaBI7reLjouLesBDf2XpF7o6LtBKjAIs=
X-Received: by 2002:a67:c007:: with SMTP id v7mr3992225vsi.147.1595678939290;
 Sat, 25 Jul 2020 05:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200724171205.9871-1-andrei@gherzan.ro> <CAMKF1sohCE3ez-r8xssCvsmTk_2WHGe+UiX_uqzrD28z7r4+uw@mail.gmail.com>
In-Reply-To: <CAMKF1sohCE3ez-r8xssCvsmTk_2WHGe+UiX_uqzrD28z7r4+uw@mail.gmail.com>
From: "Andrei Gherzan" <andrei@gherzan.ro>
Date: Sat, 25 Jul 2020 13:08:23 +0100
Message-ID: <CAK18fxFaqyRQ-UrO19_m9sSatZFvjB6==vKZYQPFppkAphXkaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] initscripts: Fix various shellcheck warnings in populate-volatile.sh
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005a36e105ab42f4fa"

--0000000000005a36e105ab42f4fa
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 25, 2020 at 6:14 AM Khem Raj <raj.khem@gmail.com> wrote:

> What all shells has it been tested for ?
>

I've used shellcheck for static analysis and tested at runtime with busybox
shell.

Andrei

--0000000000005a36e105ab42f4fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 25, 2020 at 6:14 AM Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div dir=
=3D"auto">What all shells has it been tested for ?</div></div></blockquote>=
<div><br></div><div>I&#39;ve used shellcheck for static analysis and tested=
 at runtime with busybox shell.</div><div><br></div><div>Andrei<br></div></=
div></div>

--0000000000005a36e105ab42f4fa--
