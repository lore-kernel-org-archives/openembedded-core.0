Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web10.27165.1601257689462398297
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2020 18:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=umcekPXp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.68, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f68.google.com with SMTP id g128so9350043iof.11
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2020 18:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YiWgz7nbNVQdv9UWVhyfBaxzYI+B5jMBz8Sa4L1ODoY=;
        b=umcekPXpz+kWQ6smFUixOxYvnnrOrWx4Rk/Naba8LvaU3uptCW4Rn36krEkqCxysi6
         JeuHbKYRRXVC5soDoI65A7V/5OFv7lOjr4ekcZagE9IGXHvXViKU/M6aUqEdk19eK0j8
         St9B3y0KHr8AplCF0+k8KTr2svAdgz75eTV1fZvGH00BeZwDyBjpN/pIav7Hl6uV0+9O
         /S2SKIZ9842ADRJrxwY74or19qkxjwnShWMMHD/i/zQk9D8punzbxaieTgbxAe0BqrSf
         ap4JwGhvEaR7oNNMFx0VmGHYDx5uX9G4N7RkuEOsxB0NbKGuTRtNTT8DsfkN6TvVBuJz
         10xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YiWgz7nbNVQdv9UWVhyfBaxzYI+B5jMBz8Sa4L1ODoY=;
        b=XC4LMN0j7On5gkdjV257OWokNyHQ0KEbL+A3fuz7+HHg2FarSZARfn2Yp3MgrXCwvx
         S7QarZp92o1HrN0Z8qyDEt7vrJHujdg/wRw2W3v14BvuKh6FdOznUpC3eYsnBFrWY9XQ
         lb9UgLX70+ld92mKVQvUnmMBYMFhwy4bgSu371n7DbxoNMI+apidFRh4V9yJY6TY5C2C
         OndYXtOut+k+C9SffK36+Nemq0PVLXW74KqAd0F1Zpopo4qaBN7RLKrYO05AuVM8CCtC
         AwVpVgTGvaNxM3A5jsceFceby/Ddd/+PQyrDtDhC0P6i8Bor3+V/RwZotH1QxrO/PJ5W
         +S/g==
X-Gm-Message-State: AOAM530NZMfF8krg9cIHigWi3BD7GARs+Ds10Sd/tA3Gs4q6gi8fwOz1
	EfQK+T6wsoUZ6Df5wA0j3tnpgCKloCEM2KT/Ly9B/A==
X-Google-Smtp-Source: ABdhPJzifRiwrDg1OXuk+B3o332tnumlgdik/cw/kxtPx1z/2tYjL23Bb5U+vG7m0ny5D95xQ5YOMd5NIrdPOVOeHN0=
X-Received: by 2002:a5d:984f:: with SMTP id p15mr5609967ios.70.1601257688599;
 Sun, 27 Sep 2020 18:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200925192810.1372-1-jon.mason@arm.com> <20200925192810.1372-2-jon.mason@arm.com>
 <6a248843f00759ecac0785cea187d8724bd362aa.camel@linuxfoundation.org>
In-Reply-To: <6a248843f00759ecac0785cea187d8724bd362aa.camel@linuxfoundation.org>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Sun, 27 Sep 2020 21:47:56 -0400
Message-ID: <CAPoiz9zS8sXVb6iFh3Yndtej_toUXKNw4nOGdUx5WpaeevQADA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2 1/6] Space-comma Cleanups
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 25, 2020 at 5:29 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-09-25 at 15:28 -0400, Jon Mason wrote:
> > Multiple files have " ," instead of ", " in expressions.  This
> > changes
> > them to conform to the way the rest of them are done.
> >
> > Found and corrected via:
> > git ls-files | xargs sed -i 's/ ,d/, d/g'
> >
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  meta/classes/linuxloader.bbclass              |   2 +-
> >  meta/classes/rootfs_rpm.bbclass               |   2 +-
> >  meta/conf/machine/include/arm/arch-arm64.inc  |  10 +-
> >  meta/conf/machine/include/arm/arch-armv4.inc  |   2 +-
> >  meta/conf/machine/include/arm/arch-armv5.inc  |   2 +-
> >  meta/conf/machine/include/arm/arch-armv6.inc  |   2 +-
> >  meta/conf/machine/include/arm/arch-armv6m.inc |   2 +-
> >  meta/conf/machine/include/arm/arch-armv7a.inc |   2 +-
> >  .../conf/machine/include/arm/arch-armv7ve.inc |   2 +-
> >  .../machine/include/arm/arch-armv8-2a.inc     |   2 +-
> >  meta/conf/machine/include/arm/arch-armv8a.inc |   2 +-
> >  meta/conf/machine/include/mips/arch-mips.inc  |  16 +-
> >  .../conf/machine/include/tune-arm1136jf-s.inc |   2 +-
> >  .../conf/machine/include/tune-arm1176jz-s.inc |   2 +-
> >  meta/conf/machine/include/tune-arm920t.inc    |   2 +-
> >  meta/conf/machine/include/tune-arm926ejs.inc  |   2 +-
> >  meta/conf/machine/include/tune-arm9tdmi.inc   |   2 +-
> >  meta/conf/machine/include/tune-cortexa15.inc  |   2 +-
> >  meta/conf/machine/include/tune-cortexa17.inc  |   2 +-
> >  meta/conf/machine/include/tune-cortexa5.inc   |   2 +-
> >  .../include/tune-cortexa57-cortexa53.inc      |   2 +-
> >  meta/conf/machine/include/tune-cortexa7.inc   |   2 +-
> >  .../include/tune-cortexa72-cortexa53.inc      |   2 +-
> >  .../include/tune-cortexa73-cortexa53.inc      |   2 +-
> >  meta/conf/machine/include/tune-cortexa8.inc   |   2 +-
> >  meta/conf/machine/include/tune-cortexa9.inc   |   2 +-
> >  meta/conf/machine/include/tune-ep9312.inc     |   2 +-
> >  meta/conf/machine/include/tune-iwmmxt.inc     |   2 +-
> >  .../machine/include/tune-strongarm1100.inc    |   2 +-
> >  meta/conf/machine/include/tune-xscale.inc     |   2 +-
> >  meta/conf/machine/include/x86/arch-x86.inc    |  12 +-
> >  .../recipes-core/images/core-image-minimal.bb |   2 +-
> >  .../qemu/qemu-system-native_5.1.0.bb          |   2 +-
> >  meta/recipes-devtools/qemu/qemu_5.1.0.bb      |   4 +-
> >  .../vulkan/vulkan-demos_git.bb                |   2 +-
> >  meta/recipes-kernel/linux/linux-yocto-dev.bb  |   2 +-
> >  .../linux/linux-yocto-rt_5.4.bb               |   2 +-
> >  .../linux/linux-yocto-rt_5.8.bb               |   2 +-
> >  meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   4 +-
> >  meta/recipes-kernel/linux/linux-yocto_5.8.bb  |   4 +-
> >  .../libpng/libpng_1.6.37.bb                   |   2 +-
> >  scripts/pybootchartgui/pybootchartgui/main.py | 184
> > +++++++++++++++++-
>
> Cleanup is good but this last bit doesn't look quite right!

I 100% agree, but it is from the the command I mentioned in the commit
message.  In fact, I ran it again just to be sure it wasn't an
accident.  I have no idea why that file is being so heavily modified
perhaps the sed regex is having some unforeseen side effect.  I'll
remove it by hand from the commit and push a v3.

Thanks,
Jon

>
> Cheers,
>
> Richard
>
