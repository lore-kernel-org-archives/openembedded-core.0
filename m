Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.26.1616515677824386954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 09:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DR6QUlEg;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id c4so14868212qkg.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h8U/HhQecbsVYaVA1xFRJAKTcg1wLmpl2UadrpRwR5s=;
        b=DR6QUlEgOnEAsZqigmichjB0X++ePwJs8Cy9HsXqzI6k/SAcJ8mT9VufRgn6PbBw3j
         hgrcRPCqSQCBbcPqpc0dO27mcjpialCPpZYQZ4mHp4uH/XPj/bDki/ejlBupEgoD7NeJ
         IpNChZMFOJVUMZI0+B2pQSnP/I4qe4ZOlX9oy/QuqO91TggSnmPEy8CKSLdxw/EHS1eG
         DqHh9/zqKE0HSOP7maaYL7+mMATfa4ou0aekFNOedGk6pZQLo4m+81JK2kz77WrmIxh6
         RoVBWDv1wamsHlFpNn4ulw8holZzbdL2Oyty4rTgA3n1r4JuLSv2anzfWzemqmsKqTv9
         fwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h8U/HhQecbsVYaVA1xFRJAKTcg1wLmpl2UadrpRwR5s=;
        b=QxcjMzYPngOL2hXInlRJUyrNBWQkkHW+xBhUkKYmHuc+U8E0zunZ35r/m6UHf3LJIY
         CThFlKup7lpOYTU3vDM0o1vkOVNvTHSNZrlOCXSrXhs4TB3CjT51J80QPgZThzLVq5Ly
         QiJ+xxprKc5CfD9M8HGDxCX5SKzsEBAfQ95uJtgHmHW1NibsUFfNdh/fuOfbTe6Stt7o
         3iHZ6rqrrLVho+10qAWfQhf+MrCoX1hSKImk5QfvFPdpEz/KVVGJ7eNIHAZujB2O+QvH
         kB9lGJ+YplIeIBHSjg8I21ugzBLspmocBGET8TR59Dcu4oXQYSFDEBq83/YsalNACXBT
         ylsA==
X-Gm-Message-State: AOAM53286k424klxicnBQpJLML+ebNpVGLvRvEC1CkNxGQ7/MYVg67Yj
	YfOetM0I5cPaLbmPCrQN1fktdE2ieeH48se8pGo=
X-Google-Smtp-Source: ABdhPJwb6N+zDEzKTMXI4w7+uFDzBBpmKadkdf6cz3hfKsCiHs0ogI9YrXxWEmzJ7feqTaO1Zdt/vGohhfiwnPPus5w=
X-Received: by 2002:a05:620a:12ae:: with SMTP id x14mr6218879qki.25.1616515676763;
 Tue, 23 Mar 2021 09:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210322184455.35623-1-bruce.ashfield@gmail.com>
 <c9c62fdd-4dcd-5451-b4fd-3576c275d9ca@gmail.com> <CADkTA4M4mUO6ceWOqma+eSNazPUxZKnT5wqxGMRKayebrcVK+Q@mail.gmail.com>
 <1b1ccb2e-3cd9-cb04-a7c6-94ed6cbf917f@gmail.com> <CADkTA4PEHoswYsq+AVGgAs1jMpTt987kH0nbdaHa99iomvuxNA@mail.gmail.com>
In-Reply-To: <CADkTA4PEHoswYsq+AVGgAs1jMpTt987kH0nbdaHa99iomvuxNA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 23 Mar 2021 09:07:30 -0700
Message-ID: <CAMKF1sqSh3QGf5H-fRWqH4cYbofXuWAytqLcDgAtgmhED5DOAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto/5.10: update qemuriscv32 v5.10.23
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 23, 2021 at 8:51 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Tue, Mar 23, 2021 at 11:48 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On 3/23/21 5:16 AM, Bruce Ashfield wrote:
> > > On Tue, Mar 23, 2021 at 12:29 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >>
> > >>
> > >>
> > >> On 3/22/21 11:44 AM, Bruce Ashfield wrote:
> > >>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >>>
> > >>> The kernel SRCREV updates were missing riscv32, so stayed back on
> > >>> 5.10.21, which causes build issues as PV is out of sync with the
> > >>> actual kernel version.
> > >>>
> > >>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >>> ---
> > >>>    meta/recipes-kernel/linux/linux-yocto_5.10.bb | 2 +-
> > >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> > >>>
> > >>> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> > >>> index 9c122832f4..83e70d01d1 100644
> > >>> --- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> > >>> +++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> > >>> @@ -18,7 +18,7 @@ SRCREV_machine_qemuarm64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> > >>>    SRCREV_machine_qemumips ?= "68527a50a2f5b0992ba85255325d76a9f187c237"
> > >>>    SRCREV_machine_qemuppc ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> > >>>    SRCREV_machine_qemuriscv64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> > >>> -SRCREV_machine_qemuriscv32 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
> > >>> +SRCREV_machine_qemuriscv32 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> > >>>    SRCREV_machine_qemux86 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> > >>>    SRCREV_machine_qemux86-64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> > >>>    SRCREV_machine_qemumips64 ?= "c19b50af1e3680ff6050a0cce8dcd888accafd9b"
> > >>>
> > >>
> > >> I wonder if we really need to lock the machines using tip of
> > >> v5.10/standard/base e.g. x86/x86_64/ppc64/rv64/rv32
> > >
> > > I'm not sure I understand the question / comment.
> >
> > SRCREV for the machines are said is same and perhaps branch too. So I
> > was saying if this perhaps is not required to set the SRCREV per machine
> > for such machines.
>
> It's automatic once in my update scripts (which it is now), and I'd
> rather be explicit on these, since the machine overrides are both
> flexible and self-documentation.
>
> There won't be any future individual bumps of this, it'll just be done
> along with everything else.

Totally fine.
Yeah explicit is better, I was just suggesting if it was not an
automated process
as it can add another manual error point.

>
> Cheers,
>
> Bruce
>
> >
> > >
> > > They are on the tip of that branch now, but still must be separately
> > > specified so we have the individual control as needed.
> > >
> > > But they all do need to walk forward at the same pace. Every -stable
> > > goes to all BSP branches. Supporting them on different versions just
> > > isn't sane.
> > >
> > > Cheers,
> > >
> > > Bruce
> > >
> > >>>
> > >>>
> > >>> 
> > >>>
> > >
> > >
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
