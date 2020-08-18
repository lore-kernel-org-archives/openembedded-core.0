Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.70036.1597768495956212754
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 09:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bABAgl+l;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id l13so9815261qvt.10
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 09:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ESVvY1MZnvutXXroedhL7xj9pr1kZpNaWYuysB8li8=;
        b=bABAgl+lFBFAG+VFUh2ocG0kbWOHEp6e4/1orAQOtyhce2r4Vo2vdxYZf6DDsoZfQM
         tzJeSw39vqIoRqcg6m99gk6O+eycLKGo39A0GiHgdfdgR6p996Zsz2veyXin12C4xgCz
         kMPyog6fczelNJWYOBBj3z08m2WesQyiMK1IJ/3jI5BGDIhBB21JkeEMNI8nrnmcR9YY
         pzdzJCr2TrNdEXf5H7cDULeqK5ihmV9OiyR+k7uM3JgINHpT1+1gOTzqJq6pJJCpUAgc
         1e8rBzEqHvDyeYpptSXhSjOnG42kffxYkjo9rVRoVuEX+/WkV7aVOF6RQe5V9Xa3cAhu
         Dpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ESVvY1MZnvutXXroedhL7xj9pr1kZpNaWYuysB8li8=;
        b=K21a9uo96xaHzTdMuHw3tL5UkdNggX+psan6DDAl9/WeYNhGzv/hz2zKXQFXmnhDho
         lcWy/O0yki5bTlYjL7g+EABTR6ixDP/QWOFETwS8GhEKTTkO/XvaT4gnDVPAtuG91XL1
         Mmjk5taSlKW6kBNpSz7uber8SAgMNcTlr0GOcI+4f5+Z5HChCnkKoiEqw1j97jBx9Ryn
         zlN4/2G0qzioGD9bxxkTJseqZoUPlwZoyYoVw2wmxYc75+u+41CTh6asrRe//LoSpbbF
         YX9YyVYsOkXCUB2Cp7QwBuEz/dl4zErP7SmtcGZEQm4h/SG0B49KLEw3oQes74RJxtfX
         cqqQ==
X-Gm-Message-State: AOAM531MptbLCW/cVAMBBm3FxbnKBv/UO2u47UCCmqZNrPEKrHAyBLNg
	8DRSm0H5BB9kxuZjXz5vIuzfyI8xNKxqGxyLoyY=
X-Google-Smtp-Source: ABdhPJyVErkyB//J+vuyrXVpdm3gLsmoEZVZxrA6HfHKy65EI/32ZpsL/YfUrS8hjcrA3JT/QBOHJAzsfXBYpV+i/Pg=
X-Received: by 2002:ad4:4ea5:: with SMTP id ed5mr19838385qvb.130.1597768494862;
 Tue, 18 Aug 2020 09:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200804082019.76320-1-jacob.kroon@gmail.com> <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com> <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
 <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
 <22b4b3f49bd9ca309ffe4c5fac7a3431fc43ce4b.camel@linuxfoundation.org>
 <CAMKF1srCFjrVimzDWU69Z=SaGu5gayYG7qi34Wo7pEqAG06osA@mail.gmail.com>
 <CAMKF1so+KKNoOTWMB6zLak5ek6c2rN-FAUfv1_L-TWp9h71jWQ@mail.gmail.com>
 <61e5a6bd3ec8371b2e15742caf18f342b5465c91.camel@linuxfoundation.org>
 <CADkTA4OCH85UM8EH+bCOgHC5qh0Tw=1Rg6RPznNu=0y_pg4qyQ@mail.gmail.com>
 <a6f7694da55ae6f10cba9a5d216100e54d3c8808.camel@linuxfoundation.org>
 <CAMKF1spcEhgu0GE28h30uW60Qw8k+L_LO6qPD1YhSJ+69Pe18A@mail.gmail.com>
 <CA+chaQeE25GYJEv4z329B4XR5SgAAEgx+OptqszNQmQ-Lsvu2A@mail.gmail.com>
 <CADkTA4OREk8G=61vyufBT7vngCCc-iKSxJgMMDL-qg_GokE5ow@mail.gmail.com> <CA+chaQf5e3jtDD1BWR5=-79ms4+YaL90qx9Jn6FEB8FVeqNvyw@mail.gmail.com>
In-Reply-To: <CA+chaQf5e3jtDD1BWR5=-79ms4+YaL90qx9Jn6FEB8FVeqNvyw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 18 Aug 2020 09:34:28 -0700
Message-ID: <CAMKF1srseV+fRAB=t4Y_81G3dq8oBCud8E1k+ZbM5Zbr5swZiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Jacob Kroon <jacob.kroon@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 18, 2020 at 9:04 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> The perf issue with find and cflags concatenation is fixed in upstream by:
> https://github.com/torvalds/linux/commit/e4ffd066ff440a57097e9140fa9e16ceef905de8
>

this should fix it. thanks for nailing it,  I guess older kernels will
have tough time with gcc10

> Adding V=1 to perf's EXTRA_OEMAKE makes it easier to see, sending a patch now.
>
> On Tue, Aug 18, 2020 at 2:21 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>
>>
>>
>> On Tue, Aug 18, 2020 at 7:57 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>>>
>>> Yes, I'm seeing this weird concatenation with raspberrypi builds as well:
>>>
>>> find: unknown predicate `-mthumb/arch'
>>> arm-webos-linux-gnueabi-gcc: error: unrecognized command-line option '-mthumb/include/uapi/asm-generic/errno.h'
>>> arm-webos-linux-gnueabi-gcc: fatal error: no input files
>>> compilation terminated.
>>
>>
>> confirmed as the same with my beaglebone build that ran overnight.
>>
>> I'll have a closer look and send a fix (hopefully) .. but if anyone else is already doing this, please let me know and I'll work on something else!
>>
>> Cheers,
>>
>> Bruce
>>
>>
>>>
>>>
>>> But in this case it isn't fatal for the perf build, I've noticed it only because it was failing with 5.4.51 currently in meta-raspberrypi and after upgrade to 5.4.58 perf built OK, but this error message is still there in log.do_compile.
>>>
>>> On Mon, Aug 17, 2020 at 9:47 PM Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> On Mon, Aug 17, 2020 at 5:27 AM Richard Purdie
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> >
>>>> > On Sun, 2020-08-16 at 18:55 -0400, Bruce Ashfield wrote:
>>>> > >
>>>> > >
>>>> > > On Sun, Aug 16, 2020 at 9:47 AM Richard Purdie <
>>>> > > richard.purdie@linuxfoundation.org> wrote:
>>>> > > > On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:
>>>> > > > > Bruce,
>>>> > > > >
>>>> > > > > We need
>>>> > > > >
>>>> > > > https://github.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f36a
>>>> > > > > backported to 5.4 kernels for perf to build with -fno-common can
>>>> > > > you
>>>> > > > > queue this in your kernel updates as soon as you can ?
>>>> > > >
>>>> > > > I think we have other active kernels which will also need it as
>>>> > > > even
>>>> > > > with Khem's patch we still see failures:
>>>> > > >
>>>> > >
>>>> > > I've taken care of linux-yocto now, I don't think there are any
>>>> > > active use cases for those kernels that won't be covered.
>>>> >
>>>> > I bumped the meta-yocto BSPs with a quickly hacked up patch but we
>>>> > still see:
>>>> >
>>>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/2339
>>>> >
>>>> > so I think there may be another patch we need somewhere...
>>>> >
>>>> > (which matches what we saw with Khem's _append which also failed).
>>>> >
>>>>
>>>> there seems to be concaternation of compiler options without space
>>>>
>>>> | arm-poky-linux-gnueabi-gcc: error: unrecognized argument in option
>>>> '-mfpu=neon/include/uapi/asm-generic/errno.h'
>>>> | arm-poky-linux-gnueabi-gcc: note: valid arguments to '-mfpu=' are:
>>>> auto crypto-neon-fp-armv8 fp-armv8 fpv4-sp-d16 fpv5-d16 fpv5-sp-d16
>>>> neon neon-fp-armv8 neon-fp16 neon-vfpv3 neon-vfpv4 vfp vfp3 vfpv2
>>>> vfpv3 vfpv3-d16 vfpv3-d16-fp16 vfpv3-fp16 vfpv3xd vfpv3xd-fp16 vfpv4
>>>> vfpv4-d16
>>>> | arm-poky-linux-gnueabi-gcc: fatal error: no input files
>>>>
>>>> but it also showed up on x86_64 in one of your prior builds, so I
>>>> wonder if its something in kernel build system or is it processing
>>>> TUNE_CCARGS in special ways.
>>>>
>>>> > There is still some piece of this we're missing, maybe on non-IA.
>>>> >
>>>> > Cheers,
>>>> >
>>>> > Richard
>>>> >
>>>> 
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
