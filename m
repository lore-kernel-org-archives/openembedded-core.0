Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.7850.1616501813171631733
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 05:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BqzyhYWL;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id l4so26702702ejc.10
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 05:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7UZ+q5p7fJ8Vv51YITDYnT84+/q49t2xvliY5Kwilpc=;
        b=BqzyhYWLRdiaonOdsIraRIMKiSFutZDbYAjB5vgaNAT6GapBo9/QHW9yZjo6v/mc4M
         Uyy9Y+EOJgM5Ff6lPgCV/YNynJdpzFzaGp1FcC49R6fyj8C+sQMZuQqQ5qm1vnG+jNNX
         nywQh9tJh2YNCe5JVGgG5ja3k58t/1xtDR7iOBP0NJgLgWaD/1Bc0p5c0Mr9UJYVauhK
         k60IEaBisLUOtwwtQMXbmAh0DuKzu9+lMtRTRKnZPk+R07zOMqOsKaemu9tK7XxyaQ4a
         6qxp9tvOvZyGfmJjh34W8Nq3DvbEY0TwnuPxbMZPPdbg5mEKig5ElFsL6Xdu5rblPq0A
         g1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7UZ+q5p7fJ8Vv51YITDYnT84+/q49t2xvliY5Kwilpc=;
        b=jtoV15uJKanHL/S7+afH5ekQQr6pjJAfdHJOUzzDgmRlAqRxKhA5ZmQsoO5s38BEQt
         s0Ka8sHf1DRudifcdKrFCmQ1iv5nmyONUKdKxJAy6sRXXt8dEXgLCH/oqeHp6IeEFjbr
         XCUTMpOF9YicVaVZH8rQKCEC83U1pMaYKuuKkPUY/PUB2ciGoH4QD1lIWNT9BnFn80gP
         WML9U+5e5SqK8nzH8BNiCQS0s4KEam8QoLLZLpOz8MtSXKsaVNvVOnUX6qEnNKqNbIm1
         jj9/xQmmnhewxzLtMXjGRKjG5c6H5M6rcwsTsPr/11jaHA3ukw0/avhoAvzA6XssjQae
         WwCA==
X-Gm-Message-State: AOAM532WyRNEoa/gPQdMPaw7QFwkvDat/hzTDHNswN6oT2RNQrZCxVso
	4Wi21Dss+x5HLUbjvr7sKMjwJa52CmBl+wKFOV8=
X-Google-Smtp-Source: ABdhPJxWB1trLbTysATfnBaz4UjBZ+olwdbs3xVsupfUlmrGmJJOKwY1h4+qWro/vfdi9twc94HMTWQgG40W4/zLs3E=
X-Received: by 2002:a17:906:110d:: with SMTP id h13mr4677165eja.357.1616501811525;
 Tue, 23 Mar 2021 05:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210322184455.35623-1-bruce.ashfield@gmail.com> <c9c62fdd-4dcd-5451-b4fd-3576c275d9ca@gmail.com>
In-Reply-To: <c9c62fdd-4dcd-5451-b4fd-3576c275d9ca@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 23 Mar 2021 08:16:40 -0400
Message-ID: <CADkTA4M4mUO6ceWOqma+eSNazPUxZKnT5wqxGMRKayebrcVK+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto/5.10: update qemuriscv32 v5.10.23
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 23, 2021 at 12:29 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 3/22/21 11:44 AM, Bruce Ashfield wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > The kernel SRCREV updates were missing riscv32, so stayed back on
> > 5.10.21, which causes build issues as PV is out of sync with the
> > actual kernel version.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >   meta/recipes-kernel/linux/linux-yocto_5.10.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> > index 9c122832f4..83e70d01d1 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> > @@ -18,7 +18,7 @@ SRCREV_machine_qemuarm64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> >   SRCREV_machine_qemumips ?= "68527a50a2f5b0992ba85255325d76a9f187c237"
> >   SRCREV_machine_qemuppc ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> >   SRCREV_machine_qemuriscv64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> > -SRCREV_machine_qemuriscv32 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
> > +SRCREV_machine_qemuriscv32 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> >   SRCREV_machine_qemux86 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> >   SRCREV_machine_qemux86-64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> >   SRCREV_machine_qemumips64 ?= "c19b50af1e3680ff6050a0cce8dcd888accafd9b"
> >
>
> I wonder if we really need to lock the machines using tip of
> v5.10/standard/base e.g. x86/x86_64/ppc64/rv64/rv32

I'm not sure I understand the question / comment.

They are on the tip of that branch now, but still must be separately
specified so we have the individual control as needed.

But they all do need to walk forward at the same pace. Every -stable
goes to all BSP branches. Supporting them on different versions just
isn't sane.

Cheers,

Bruce

> >
> >
> > 
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
