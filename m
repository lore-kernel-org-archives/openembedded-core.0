Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web12.54114.1612280826899196227
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 07:47:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LcMLH0aY;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id r20so11650232qtm.3
        for <Openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 07:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oSNaP2XIjtUJiasfxPfbMZCe92N4UjjT5DZheBzxuas=;
        b=LcMLH0aYyqKWFrMMP+f6EAhNhuGc4J3BwaoVoIHElu1ipGYiOdOjSuETzRKulvXnoM
         mCCBfcRwSNiEWwAd/nfOUJ6rHA1h6gZP11bT2Kt0DwAqR9UJJdE8q/i9XCdFSWd3MghN
         SP2EastAJTDNxFY9T6i7tflYijZ+WN5I22nkJc5Thc1vWcmiRME80iekwcQu3GeKm41Z
         A7Ny8v++uS9NlJEvT8ZUVjwiMSPGqj8DmiEnu+WuVqTat1dz3RPjqQPNyLz4uq9fcT9Z
         dQRi2Ir8irNQgo24q8v2Z/pGBcwNFkP2Mzc5mXjkj8Z3rKkokQ7eOMW5pkLtuN0QjWdq
         N4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oSNaP2XIjtUJiasfxPfbMZCe92N4UjjT5DZheBzxuas=;
        b=bDY8b7vCNHsZag7uINNlVtQOOi23AXvyqVqYr0vv+7bRYHsh3eeo0jgtRfgLcISGHS
         Msio52zGxwVZ/HLESeQLyWIpg5ackzqsfZoJK51/uxEUDcMGW2yGxRv3jReta+qdwTV7
         b0knywA6T54nIIVu8OySwCbjb+BXZvUCGjoxFDNDI0ks0gGpbcOzx9TfjwRPGnN3+o31
         xxmKWttAStj9+u8xg97GJ57QnLMXcKHILdunq03RvdZ46OJ3ort2w5VQ6qP5mtttl5KQ
         c+m4c+tp51POhzR4F7kMaf4AdO6dVtpUHorGZWAkbrjqxISSGdP5d9DTxogb4pmAgQwp
         Ob6A==
X-Gm-Message-State: AOAM530N6XLtnBTxNd9/qoloO1oUg9/ands+VkkCaLv2EkmR3qJxlXTp
	QZbRNxNaax8rUxfQ+V3eMHKfEDYqCtTY4/n894E=
X-Google-Smtp-Source: ABdhPJztc6TAe8nxJCEx4G56ldFfemMhth8m5BK4t9MbIDJ4+8Jc+2VbtLU2YhKGs89dO2L4yWbRPaY6QvlLYjOg8H8=
X-Received: by 2002:ac8:1283:: with SMTP id y3mr11027764qti.328.1612280825846;
 Tue, 02 Feb 2021 07:47:05 -0800 (PST)
MIME-Version: 1.0
References: <CANUMPcWEyL1rKt35_UYvSmjTsLVVOvPhd=Magc8w3isovOLE8g@mail.gmail.com>
 <bf33f16b3853d4d02e37ffc9e5327501dbb117a9.camel@linuxfoundation.org>
In-Reply-To: <bf33f16b3853d4d02e37ffc9e5327501dbb117a9.camel@linuxfoundation.org>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Tue, 2 Feb 2021 21:16:54 +0530
Message-ID: <CANUMPcWefWXPjAePzOsWjNPwWDnhaiA3x_tqbzZ61DayoSNKuQ@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest for systemEmulated does not work.
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Randy MacLeod <rwmacleod@gmail.com>, umesh kalappa0 <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Thanks for the quick reply.
After setting tap0 through  "sudo
/home/vinay/reference-poky/poky-master/scripts/runqemu-ifup 1000 1000
/extra/build-master-st/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin"
  and triggering oe-selftest for gcc is working.

Regards,
Vinay

On Tue, Feb 2, 2021 at 6:24 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2021-02-02 at 18:18 +0530, Vinay Kumar wrote:
> > Hi,
> >
> > Could not run oe-selftest for gcc using qemu image using below command,
> > $oe-selftest -r gcc.GccCrossSelfTestSystemEmulated.test_cross_gcc
> >
> > getting qemu boot errors as follows,
> > ERROR: Qemu pid didn't appear in 120 seconds (02/01/21 19:23:28)
> > ERROR: Status information, poll status: None, pidfile exists: False,
> > pidfile contents None, proc pid exists False
> >
> > The boot uses the tap0 interface. And also observed that the pid file
> > is not generating when the qemu boot  command is triggered.
> >
> > The launchcmd for qemu boot is,
> > runqemu snapshot nographic qemuarm
> > /extra/build-master-2/tmp/deploy/images/qemuarm/core-image-minimal-qemuarm.ext4
> > tcpserial=51301:51487 bootparams="console=tty1 console=ttyS0,115200n8
> > printk.time=1" qemuparams="-pidfile pidfile_8153"
> >
> > Also attached GccCrossSelfTestSystemEmulated.log
> > (build-dir/tmp/work/qemuarm-poky-linux-gnueabi/core-image-minimal/1.0-r0/testimage/qemurunner_log)
> > for reference.
> >
> > Additional info :
> > The oe-selftest execution is tried using latest poky-master.
>
> Looking at the logs, I think its sitting trying to execute:
>
> sudo /home/vinay/reference-poky/poky-master/scripts/runqemu-ifup 1000 1000 /extra/build-master-st/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin
>
> to setup the networking device, perhaps waiting on a password.
>
> You could try running runqemu-gen-tapdevs instead to setup those
> devices in advance, or give it permission to run that command without a
> password.
>
> Cheers,
>
> Richard
>
