Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web10.35943.1601298125942339438
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 06:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=fay+seNa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.68, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f68.google.com with SMTP id g128so976410iof.11
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 06:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I+QWNdjXpnaOXyRPM0gXpGxJoWUy0ItqEImorATmcCM=;
        b=fay+seNaqAYKyBQt0VdS+iy/P1r9PVm69tM1O9mrxdaNjmFHCHjgyIr6tWOOjyL9Rc
         73PDjSg8GTJEutdmEMD1jSGbBUDuLdEhMiJpOp03WAg+1ia+PrlRJPpqKRft1ge37ebF
         YwcgicxyzHZe+6ORSBYZ+an3hss5MU9f5r/ZRRiuWDUXEoX5smwy3DxDsnY/XkjUNLoH
         k8eKmLKhV0JUC1RPo+w2ZyCe3dNposENbUKKFpHZZL6Q04Hbx0VyiM1psE4anC0b1Gle
         INH3f9IP2zeEjOzfve9XGK9+Akef7V0iiATeY3ygALpbTTo8VZb5i8e2eryFnZQHTiH6
         V+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I+QWNdjXpnaOXyRPM0gXpGxJoWUy0ItqEImorATmcCM=;
        b=ntvxRfRSAhIj2tXBsS5s9WBp2WYEKGe0mCE1Z/9XoEXScA02Pfi2LGsA+ZWbKNNcxp
         OvEiEdZtXImpbQRxZiE+qr08dxdv5vD3oqii88Ye+z33n2y/fNkBQnqofkoQpdSICouQ
         8F471iq3XcgNagHmkkng8L1Rm+59ZYrZ/9ax7SGEPVbZIeYekFFt/zm6ehBvBp14mxZF
         TnwKrW+wR98hltP13OHVN8jvYgpjnhrg/GOmwBJNqnV6PkoZIfWdtA//I8dY0wRzRh4e
         QjO7jrdV02kRTtZiPo3wCfnIDkuyMnvijna0ylEZqhtTkZkX+PqoV08IgPqT6VhV3r36
         VHFw==
X-Gm-Message-State: AOAM533lqGTshlZY2fZop2du5C6iPu9rr9yLzHBb8RJaFtEC3jyu2j0E
	qisYUDF4yuePsu0O0JuNuPCw1/LxdqeLRQ49iZViuQ==
X-Google-Smtp-Source: ABdhPJxf52/2oq6ydfx/Jaf9dy/jV5LuFkqkXgMM85E6czGAHJMD2L/oNgZOeb79xKCpdD7bGvqXGEDwdw/q2ZNROxA=
X-Received: by 2002:a02:605c:: with SMTP id d28mr1050738jaf.12.1601298124897;
 Mon, 28 Sep 2020 06:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200925192810.1372-1-jon.mason@arm.com> <20200925192810.1372-2-jon.mason@arm.com>
 <6a248843f00759ecac0785cea187d8724bd362aa.camel@linuxfoundation.org>
 <CAPoiz9zS8sXVb6iFh3Yndtej_toUXKNw4nOGdUx5WpaeevQADA@mail.gmail.com> <CA+chaQdk+xnnVMuc-MVmnKTBmtXA15av3Jv6zG6w2pNSHyjx8g@mail.gmail.com>
In-Reply-To: <CA+chaQdk+xnnVMuc-MVmnKTBmtXA15av3Jv6zG6w2pNSHyjx8g@mail.gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Mon, 28 Sep 2020 09:01:53 -0400
Message-ID: <CAPoiz9y71_fkJPOisLQmnTRtM0QyqfYiHxQ0pHQkcU8+qRjtWA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2 1/6] Space-comma Cleanups
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 27, 2020 at 10:11 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> The last one is a symlink and sed -i doesn't follow symlinks as you haven't used --follow-symlinks.

Yes, when I add that, then the errant files "go away".  Since I need
to do a v4, I'll change the commit message to reflect this additional
parameter (instead of removing by hand, which is a bit ugly).

Thanks,
Jon

>
> On Mon, Sep 28, 2020 at 3:48 AM Jon Mason <jdmason@kudzu.us> wrote:
>>
>> On Fri, Sep 25, 2020 at 5:29 PM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Fri, 2020-09-25 at 15:28 -0400, Jon Mason wrote:
>> > > Multiple files have " ," instead of ", " in expressions.  This
>> > > changes
>> > > them to conform to the way the rest of them are done.
>> > >
>> > > Found and corrected via:
>> > > git ls-files | xargs sed -i 's/ ,d/, d/g'
>> > >
>> > > Signed-off-by: Jon Mason <jon.mason@arm.com>
>> > > ---
>> > >  meta/classes/linuxloader.bbclass              |   2 +-
>> > >  meta/classes/rootfs_rpm.bbclass               |   2 +-
>> > >  meta/conf/machine/include/arm/arch-arm64.inc  |  10 +-
>> > >  meta/conf/machine/include/arm/arch-armv4.inc  |   2 +-
>> > >  meta/conf/machine/include/arm/arch-armv5.inc  |   2 +-
>> > >  meta/conf/machine/include/arm/arch-armv6.inc  |   2 +-
>> > >  meta/conf/machine/include/arm/arch-armv6m.inc |   2 +-
>> > >  meta/conf/machine/include/arm/arch-armv7a.inc |   2 +-
>> > >  .../conf/machine/include/arm/arch-armv7ve.inc |   2 +-
>> > >  .../machine/include/arm/arch-armv8-2a.inc     |   2 +-
>> > >  meta/conf/machine/include/arm/arch-armv8a.inc |   2 +-
>> > >  meta/conf/machine/include/mips/arch-mips.inc  |  16 +-
>> > >  .../conf/machine/include/tune-arm1136jf-s.inc |   2 +-
>> > >  .../conf/machine/include/tune-arm1176jz-s.inc |   2 +-
>> > >  meta/conf/machine/include/tune-arm920t.inc    |   2 +-
>> > >  meta/conf/machine/include/tune-arm926ejs.inc  |   2 +-
>> > >  meta/conf/machine/include/tune-arm9tdmi.inc   |   2 +-
>> > >  meta/conf/machine/include/tune-cortexa15.inc  |   2 +-
>> > >  meta/conf/machine/include/tune-cortexa17.inc  |   2 +-
>> > >  meta/conf/machine/include/tune-cortexa5.inc   |   2 +-
>> > >  .../include/tune-cortexa57-cortexa53.inc      |   2 +-
>> > >  meta/conf/machine/include/tune-cortexa7.inc   |   2 +-
>> > >  .../include/tune-cortexa72-cortexa53.inc      |   2 +-
>> > >  .../include/tune-cortexa73-cortexa53.inc      |   2 +-
>> > >  meta/conf/machine/include/tune-cortexa8.inc   |   2 +-
>> > >  meta/conf/machine/include/tune-cortexa9.inc   |   2 +-
>> > >  meta/conf/machine/include/tune-ep9312.inc     |   2 +-
>> > >  meta/conf/machine/include/tune-iwmmxt.inc     |   2 +-
>> > >  .../machine/include/tune-strongarm1100.inc    |   2 +-
>> > >  meta/conf/machine/include/tune-xscale.inc     |   2 +-
>> > >  meta/conf/machine/include/x86/arch-x86.inc    |  12 +-
>> > >  .../recipes-core/images/core-image-minimal.bb |   2 +-
>> > >  .../qemu/qemu-system-native_5.1.0.bb          |   2 +-
>> > >  meta/recipes-devtools/qemu/qemu_5.1.0.bb      |   4 +-
>> > >  .../vulkan/vulkan-demos_git.bb                |   2 +-
>> > >  meta/recipes-kernel/linux/linux-yocto-dev.bb  |   2 +-
>> > >  .../linux/linux-yocto-rt_5.4.bb               |   2 +-
>> > >  .../linux/linux-yocto-rt_5.8.bb               |   2 +-
>> > >  meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   4 +-
>> > >  meta/recipes-kernel/linux/linux-yocto_5.8.bb  |   4 +-
>> > >  .../libpng/libpng_1.6.37.bb                   |   2 +-
>> > >  scripts/pybootchartgui/pybootchartgui/main.py | 184
>> > > +++++++++++++++++-
>> >
>> > Cleanup is good but this last bit doesn't look quite right!
>>
>> I 100% agree, but it is from the the command I mentioned in the commit
>> message.  In fact, I ran it again just to be sure it wasn't an
>> accident.  I have no idea why that file is being so heavily modified
>> perhaps the sed regex is having some unforeseen side effect.  I'll
>> remove it by hand from the commit and push a v3.
>>
>> Thanks,
>> Jon
>>
>> >
>> > Cheers,
>> >
>> > Richard
>> >
>>
>> 
>>
