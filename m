Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.3294.1632452423737275797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 20:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fz4wPGfz;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id s17so11852566edd.8
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 20:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ynrceBnMts6ANRPfNSstUW0pFofYJcHAjjJhaQ4TuuY=;
        b=fz4wPGfzInQAsqZbBxtgXClIdtcOhh+0KLzjkCa8NSDwYcRZ85jth7Yq0ha9s3jAAO
         4zLngC0tFZ9W2+66vXKhE9XYYw3uIOWiBsH7MztIAkAitwuzrycSg+wUsp64AFk/ZqPA
         FYOCNaytBclfD3KOBfNF+e+5F03YqdvkHc27WmrMK1jWDtuYI1kOCplVEP9fRdHIAem/
         /QPmeS+CSC6USwP0UvQSl2z79hLR9DTG387PPdtWygnD8jlBO06T9q935tlV79t3aKaj
         UdK2tV8UjWNBbsj3AF0iMimFAKrvZ1tXoUs4Y+WLuRKX5FX8pfXM7L/RWe7cfIXKvvwx
         I9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ynrceBnMts6ANRPfNSstUW0pFofYJcHAjjJhaQ4TuuY=;
        b=HJ+DTPoFKwoOqCOyqMWhENeVXBs3tb/33yxHXB8RdKXH9GLyislkX/A7IZ7KZIA+BR
         Hw2E0Ps4ohbNVM3nfB0lRO+BsrKBOag9nQal2fdCCak0xvGwWdLBZyxEsb0ZdzwYGF81
         7n0T/t5M5lB4+o/YwNpepcpRSE7FumuyLct/7PdrkQ1eF8ZD1zlVYmwGzqOeWBMaVVYK
         scgBq0h1V+LuzEDA7TMvCT4EWscNC91DG4JZuf9pR6qX6gieQk3kqbN6Jk8hWh5pwvPg
         3sQSEOzYD5KDTBE/x0ezcjVa80fUuV1HluX5TuZ3+eUlZYvVyc2eEr0ifxdoVryAbdVt
         kLQQ==
X-Gm-Message-State: AOAM530H8BVbm4G2OQRqDny7RqRbEHcKTVFVyug/reYWjBEGMaF8qM80
	52bdDlL6uuta+5pLROuekTC+tS/APuk9j4yYMhM=
X-Google-Smtp-Source: ABdhPJwn6muyap5pvq6vbZe20H9k0ySdE4iSJiqgUkOhWO0JlkS+tqVsgYlXEwn91F3kjsKnV7C2Ik9OkBu4EtCxZTU=
X-Received: by 2002:a17:906:314e:: with SMTP id e14mr8799436eje.165.1632452422216;
 Thu, 23 Sep 2021 20:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1632332981.git.bruce.ashfield@gmail.com>
 <c3ed9c094566be74c852af8bc58212c3d7d612e3.1632332981.git.bruce.ashfield@gmail.com>
 <CAMKF1srUCZRhBh0N1Gnb3yp2+-h8t+0WXLHRw10BmBEEjSvrjQ@mail.gmail.com>
In-Reply-To: <CAMKF1srUCZRhBh0N1Gnb3yp2+-h8t+0WXLHRw10BmBEEjSvrjQ@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 23 Sep 2021 23:00:11 -0400
Message-ID: <CADkTA4OQZUUn5PMY59oi6nYnns9os480HV44taknKOe6EGpBQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] conf/machine: bump qemu preferred versions to 5.14
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 23, 2021 at 1:01 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> 5.14 does break fio and bvoxdrivers recipes, and upgrade of fio took
> care of build issues but vboxdrivers still needs fixing.
>

I managed to tease out the 5.14 fixes from virtual box's SVN repository.

A patch will be incoming shortly.

Bruce

> see
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1564
>
> On Wed, Sep 22, 2021 at 10:54 AM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > 5.14 is the latest reference kernel, so let's make it the
> > default.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/conf/machine/include/x86/x86-base.inc | 2 +-
> >  meta/conf/machine/qemuarmv5.conf           | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/conf/machine/include/x86/x86-base.inc b/meta/conf/machine/include/x86/x86-base.inc
> > index 958b3490e8..44e4b4ec46 100644
> > --- a/meta/conf/machine/include/x86/x86-base.inc
> > +++ b/meta/conf/machine/include/x86/x86-base.inc
> > @@ -18,7 +18,7 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
> >  # kernel-related variables
> >  #
> >  PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
> > -PREFERRED_VERSION_linux-yocto ??= "5.13%"
> > +PREFERRED_VERSION_linux-yocto ??= "5.14%"
> >
> >  #
> >  # XSERVER subcomponents, used to build the XSERVER variable
> > diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
> > index 252d6286d8..3c2c4997b9 100644
> > --- a/meta/conf/machine/qemuarmv5.conf
> > +++ b/meta/conf/machine/qemuarmv5.conf
> > @@ -15,7 +15,7 @@ QB_MACHINE = "-machine versatilepb"
> >  QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
> >  QB_GRAPHICS = "-device virtio-gpu-pci"
> >  QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
> > -PREFERRED_VERSION_linux-yocto ??= "5.13%"
> > +PREFERRED_VERSION_linux-yocto ??= "5.14%"
> >  QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
> >
> >  KMACHINE:qemuarmv5 = "qemuarm"
> > --
> > 2.19.1
> >
> >
> > 
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
