Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.10965.1616514666912570235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 08:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q/kIE1C1;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id b16so24039881eds.7
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 08:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yYKbXKcxWtmEgFEoidTzPyxdFAfk3NGDmxoeXS6GrR8=;
        b=q/kIE1C1FAQC6FVfIwTjvYAqKpXL2Kd/QYIQxyewwjsFElzw476XIyrlPG/pt4BwBb
         zP+sufTq2y6KHV2r5O0b4N7oRveeyjo3ZYlG6pWojBzKiYhRSE3HypCoH5Atjwx8PWCc
         jN9wXL1Ctkmgm/UbAYH9WdKMP1HjlWtU6XyaF+guFS1aN4LxLdmsQtapJNY8BTKTwP0D
         qWb0B1ZuVWi79u6OrK6khj8OisD/kkHEaM8h+49mV/iJUxVnRcOsTntwiWkGLNL9h6CJ
         k6ZAfQnYUBiilxbo8h2WagwiDXZBN70PQr6tdH9g9n0L7fufPp2yIecWxYUoCza86y15
         1ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yYKbXKcxWtmEgFEoidTzPyxdFAfk3NGDmxoeXS6GrR8=;
        b=komf25MpsqA2fZWKYa1YRV3FXD2CeFgrUnI/R8Gzcth9WgL1SbxxdwkA4ICvzKo47u
         g1Ag+soex7qFmB0q48LrBmSrfggtNhQtJCuwGBk0adsritc+vSuJPYZvl8aBQPUb89eV
         v4elxMcNFx/oUncdfkvf5hv7lZ2Q9HHYicr3YzODyU47U+KsnZXQ5OGieWpkdiia4FtZ
         ZA81Lf4Xua8fLGsDqllSqrpPR7BcVL8FjRJEjbPW9U6xIIllYfULsUA+rwZeS7DL78T9
         CO2Jl/BjVh18Dc8E526DdJErc8XqcPFfyinyQvRpzBCJQf8FER/C0y+sFsbUZwth/BUT
         UgnA==
X-Gm-Message-State: AOAM532fCSTAdQadRb/Y9dkUTeKjVUHaTuCnN008MUayODv05IWPi5bI
	prpHpIPmcA1AQYXAgBbcAMkKPHV2aa0nsvXSKZg=
X-Google-Smtp-Source: ABdhPJxcDCt8Y0tiC2aFnjJYde4Y0bDbnjfMJFsvrYUBMPKkRehLOg04LM7uCRUVyzyklPobokseggp3Es0q7fRbsmU=
X-Received: by 2002:a05:6402:27d3:: with SMTP id c19mr5249427ede.129.1616514665060;
 Tue, 23 Mar 2021 08:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210322184455.35623-1-bruce.ashfield@gmail.com>
 <c9c62fdd-4dcd-5451-b4fd-3576c275d9ca@gmail.com> <CADkTA4M4mUO6ceWOqma+eSNazPUxZKnT5wqxGMRKayebrcVK+Q@mail.gmail.com>
 <1b1ccb2e-3cd9-cb04-a7c6-94ed6cbf917f@gmail.com>
In-Reply-To: <1b1ccb2e-3cd9-cb04-a7c6-94ed6cbf917f@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 23 Mar 2021 11:50:53 -0400
Message-ID: <CADkTA4PEHoswYsq+AVGgAs1jMpTt987kH0nbdaHa99iomvuxNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto/5.10: update qemuriscv32 v5.10.23
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 23, 2021 at 11:48 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 3/23/21 5:16 AM, Bruce Ashfield wrote:
> > On Tue, Mar 23, 2021 at 12:29 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>
> >>
> >> On 3/22/21 11:44 AM, Bruce Ashfield wrote:
> >>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>>
> >>> The kernel SRCREV updates were missing riscv32, so stayed back on
> >>> 5.10.21, which causes build issues as PV is out of sync with the
> >>> actual kernel version.
> >>>
> >>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>> ---
> >>>    meta/recipes-kernel/linux/linux-yocto_5.10.bb | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> >>> index 9c122832f4..83e70d01d1 100644
> >>> --- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> >>> +++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> >>> @@ -18,7 +18,7 @@ SRCREV_machine_qemuarm64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> >>>    SRCREV_machine_qemumips ?= "68527a50a2f5b0992ba85255325d76a9f187c237"
> >>>    SRCREV_machine_qemuppc ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> >>>    SRCREV_machine_qemuriscv64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> >>> -SRCREV_machine_qemuriscv32 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
> >>> +SRCREV_machine_qemuriscv32 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> >>>    SRCREV_machine_qemux86 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> >>>    SRCREV_machine_qemux86-64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
> >>>    SRCREV_machine_qemumips64 ?= "c19b50af1e3680ff6050a0cce8dcd888accafd9b"
> >>>
> >>
> >> I wonder if we really need to lock the machines using tip of
> >> v5.10/standard/base e.g. x86/x86_64/ppc64/rv64/rv32
> >
> > I'm not sure I understand the question / comment.
>
> SRCREV for the machines are said is same and perhaps branch too. So I
> was saying if this perhaps is not required to set the SRCREV per machine
> for such machines.

It's automatic once in my update scripts (which it is now), and I'd
rather be explicit on these, since the machine overrides are both
flexible and self-documentation.

There won't be any future individual bumps of this, it'll just be done
along with everything else.

Cheers,

Bruce

>
> >
> > They are on the tip of that branch now, but still must be separately
> > specified so we have the individual control as needed.
> >
> > But they all do need to walk forward at the same pace. Every -stable
> > goes to all BSP branches. Supporting them on different versions just
> > isn't sane.
> >
> > Cheers,
> >
> > Bruce
> >
> >>>
> >>>
> >>> 
> >>>
> >
> >
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
