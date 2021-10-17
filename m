Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174DBC433EF
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 13:33:04 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.22832.1634477582618801036
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 06:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A1hskJl0;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id r18so59531984edv.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 06:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Li/qq/WppQjRP5IlHiwT218oFfDsS0F+94dTpWEszZE=;
        b=A1hskJl05O3v/zbwaibrnFhGUWv3gFaJhoBJnm1vyfoV1bjAWKzbMEYd2Q9jAKr9a5
         dqOiRU6WoseK5/7bsurrvFcY2pztZnYE5/z4R0Q44bBew2OStXPBp8XDZugMkes58fGr
         XqCRJ3KrOSK/hyEr3/Lgo41vdLVBGktq5CJ1cL4pI9uQYk9+Dbh6N545QYndWtw5BW+7
         p7ZJQdjPwQBhppCDNAv9mI3gxKpJ+MFSP+xKnvukXkFoGijV/aZty2gsnrnS7LAZ5Yms
         xPQDDPZaxrnCI+T9I5SptEjh1UA8uyJ9M79CDFLXxrt/le36AoYb9W/5hQXsfyFmjZVZ
         rTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Li/qq/WppQjRP5IlHiwT218oFfDsS0F+94dTpWEszZE=;
        b=RnxFDuBw/3wjfhg9Ct8uPCRyVteE0OiFGTqf20rJYjWrFNPXQL0RROuvnTg6RIbSbw
         +tsMH2AzVpEdBK1wRHm8W3Lz9yd1Fs406rQkrCQ1kJR15uozP5TBPgUtrOhPaUapsSxX
         tkUjnvlzJXGIjH2eo/MUHKMkMxt9Ef1BXo5/vRWofuBJhV595WN6N9jPbQ9QCGNCFQB6
         TViu3cBiqzBtbckw/Z4fHu0wY7XUmOGcZSzDlyCjIdUu/zl50sqNJQFnQd5bUyXnMEYy
         XS1C11qS9jZ1fI8emhIeEW/Ooa6M5/zkPL341efWrNYYrqgOiQJf7OgafhoCHqWVoAkq
         HECg==
X-Gm-Message-State: AOAM533CtaTjE57z1WSGN8v01SrGe3tqEWUeT6UTcnrNrEirfe0jErHh
	HUxx3lUhu3DONxmsIJ3iJ8aTGSUgu+YBP6qeYIE=
X-Google-Smtp-Source: 
 ABdhPJw4gKMOdG2a9ZDUyWyHYWFm1D03+LYW29x9gTDb4SYOb/DSfYj1oU/usYEVhkv28wtOv2hdDDlRK95sjoS/SoU=
X-Received: by 2002:a50:be81:: with SMTP id b1mr36283676edk.59.1634477581009;
 Sun, 17 Oct 2021 06:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <16AE71B3ADB3BD09.11150@lists.openembedded.org>
 <086e00e6-0cd0-0304-8021-f25dcfeb7287@gmail.com>
In-Reply-To: <086e00e6-0cd0-0304-8021-f25dcfeb7287@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 17 Oct 2021 09:32:49 -0400
Message-ID: 
 <CADkTA4PyZWTHrscZF7W7mVNKTs1+61rEDakfXex8Vv1=EQOxWQ@mail.gmail.com>
Subject: Re: [OE-core] linux-yocto: Set CONFIG_ATA_PIIX=y by default
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Saul Wold <Saul.Wold@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 13:33:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157039

On Sun, Oct 17, 2021 at 4:26 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> Hi Bruce and Saul,
>
> On 10/16/21 09:18, Jacob Kroon via lists.openembedded.org wrote:
> > Hi Bruce,
> >
> > My Yocto images (which uses the linux-yocto kernel) stopped booting in
> > QEMU some time ago, and after some debugging it turns out this was
> > because the upstream Linux kernel removed the legacy IDE driver. Instead
> > one should use the libata driver. However, I don't think the linux-yocto
> > kernel has builtin support for the HW that is emulated by QEMU by
> > default (PIIX), instead it is built as a module, CONFIG_ATA_PIIX=m. If I
> > set CONFIG_ATA_PIIX=y, my images boot again.
> >
> > I did a "make ARCH=i386 defconfig" in Torvalds master linux tree, and
> > the .config has CONFIG_ATA_PIIX=y.
> >
> > Do you think it would make sense to have the support builtin in
> > linux-yocto aswell ?
> >
>
> I'm using KMACHINE = "common-pc". CC:ing Saul Wold, since I see that
> commit 0d4f5ed5dca41a48423ce738131e52f7863d8ca6 in yocto-kernel-cache did:
>
> > diff --git a/bsp/common-pc/common-pc-drivers.cfg b/bsp/common-pc/common-pc-drivers.cfg
> > index 71608433..0b821903 100644
> > --- a/bsp/common-pc/common-pc-drivers.cfg
> > +++ b/bsp/common-pc/common-pc-drivers.cfg
> > @@ -5,7 +5,8 @@ CONFIG_PCI_MSI=y
> >  CONFIG_ATA=y
> >  CONFIG_ATA_ACPI=y
> >  CONFIG_ATA_SFF=y
> > -CONFIG_ATA_PIIX=y
> > +CONFIG_ATA_BMDMA=y
> > +CONFIG_ATA_PIIX=m
> >
> >  CONFIG_INPUT=y
> >  CONFIG_INPUT_MOUSEDEV=y
>
> which changed ATA_PIIX from a builtin to a module. Maybe this wasn't
> intentional ?

It was definitely intentional.

We try and keep the configuration space of the targets as small as
possible. In particular, this is exactly why qemux86* was created, so
we wouldn't have to enable options in either the h/w targets or the
emulated targets that are specific to a use case on one (and vice
versa). That being said, they still actually do share the same machine
definitions in the kernel-cache, since nothing significant has forced
me to use that namespace split.

qemux86 doesn't need PIIX out of the box to boot, and the Kconfig
indicates "set it to N unless ...", and we do know the built-ins we
want, so it is set to 'm' as a middle ground.

That being said, it isn't out of the question to enable it (slippery
slope to giant defconfig like beasts with everything and the kitchen
sink enabled notwithstanding .. not that this is much of a step down
that slope!) .. just let me ask a few more things first.

You say you are using KMACHINE='common-pc', that's good. But what else
is at play ? What OE MACHINE are you building ? What image FStypes,
etc ?

I won't be able to do some build testing until Monday, but do you
happen to have the qemu command lines (via runqemu) and machine
definitions for qemux88 and your machine?  I'd like to look at them
and confirm exactly what image, and boot parameters are in play, since
one boots and the other doesn't.

Cheers,

Bruce

>
> Regards Jacob



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

