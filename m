Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.4124.1598668135713180767
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2020 19:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=flqCM4SM;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id i17so720863edx.12
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2020 19:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5hp+AhS1QqYofzC+SXQbS8+aXqBhXcSkkiEPbSR0Tbs=;
        b=flqCM4SM/l71gHt8f7pRxfVvfQGchtBNP0uhb3dF3889+z/1IkYv+bNj115yoQcrlg
         BvvkotdHXlLBtO/jPDPjTDzv45fT5ySHp6PSFuMrIH53ONwqidrI+PWOfCRdNaVXXfF4
         dLQ/du8w2qde78qtkEcuAfvl17pnwHvVvF5P+8OsCTh+qcGjubzc2CJaEFh78ucTAtX9
         ++H4RTYOIc0iAzXn9Z8ArT1knO5SUzhrvutBQgaaEqHL7Y4hRYnA27oEJ4xkLjFHe5xy
         oBWJIz3zNcDE1GQzKUCbtxMPRoOi5kG8MsvSJFl7PQSRSoEP6PwfVJ46Dugg3Ls9/NRF
         pSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5hp+AhS1QqYofzC+SXQbS8+aXqBhXcSkkiEPbSR0Tbs=;
        b=bMRG7GWIzoudz0tyvehFG5bG2wKhOZOfd0j6QC3RMDbNNOdaj4/uTgHi4Yu9o9Y3GI
         ieLgXJQS4XjkPtO0BxAfJG/0MTnMLTUiYhOqpY156g2SQB6GdW2XkkUyENx13g8eiSnU
         2/g00RuHPR/XJBYAD39jNsTI+sKlCFbhWjyrK1B0fJxgDslv7TqpbQSnBMQ4se4oADWy
         kMKsQas31iLpiZI44G9WmRcwuPpEOfHaUxEba8Tp83ipZQ2W1rgRnTg+RKfMmnLfnZ3h
         p7YHB+hMNwiDs/Z1DaPae156dJFvWWpw78GtuxWr6w2VwywJV+zBkLaICw6tQR8SFbQT
         lvxg==
X-Gm-Message-State: AOAM53396JCunPXfHtkLW3/X3VEVohSeBgIRWdfXYGDkIu3hwYm2Fg23
	3KMxUHzrN0hTB/RceJYN50pMCrgLTDGHx2xctAM=
X-Google-Smtp-Source: ABdhPJxtTWfAG6NJqxWft9I8G79wY077KccMj50x9HPSiSaakMmVFWb4bGXSlZguzYJZHi09uf7uS70XV+WG+zpwqJo=
X-Received: by 2002:a05:6402:70a:: with SMTP id w10mr1576484edx.129.1598668134000;
 Fri, 28 Aug 2020 19:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <6e070a3d-a5f3-46bf-ac33-d7d6daf05b4f@embed.me.uk>
 <CADkTA4Ob=JpTsenFdNcKzB_5-8xQ+OGm_eQK_QPOPWeizz89QA@mail.gmail.com>
 <162F8C343CCB5CF7.17615@lists.openembedded.org> <ab4878e3-da65-2410-eb3a-d815483f085b@embed.me.uk>
In-Reply-To: <ab4878e3-da65-2410-eb3a-d815483f085b@embed.me.uk>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 28 Aug 2020 22:26:51 -0400
Message-ID: <CADkTA4OpMSd8yPBdCA+MJv32xh7Jzr7CJymP6wg3tGEnqHOA3Q@mail.gmail.com>
Subject: Re: [OE-core] Linux v5.8 modules, exec format error
To: Jack Mitchell <jack@embed.me.uk>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 28, 2020 at 7:15 PM Jack Mitchell <jack@embed.me.uk> wrote:
>
> Quick update, I just did an armv7 build with exactly the same codebase
> and everything worked fine. Do you have an aarch64 build could test and
> confirm working?

qemuarm64 was working fine here with -rc1. I've started a new build,
but it'll be several hours before I know more (so sometime saturday).

Cheers,

Bruce

>
> Regards,
> Jack.
>
> On 28/08/2020 22:35, Jack Mitchell wrote:
> > Hi Bruce,
> >
> > All built in-tree, the same recipe builds an armv7h kernel so I'll try a
> > build for that and see if it's something aarch64 specific. All the
> > modules are failing to load so it's not something specific to g_ether.
> > Please see kernel recipe below for reference.
> >
> > LICENSE = "GPLv2"
> > LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> >
> > inherit kernel
> >
> > S = "${WORKDIR}/git"
> >
> > SRCREV = "redacted"
> > KBRANCH = "v5.9-rc2"
> >
> > LINUX_VERSION ?= "${KBRANCH}-g${SRCREV}"
> > PV = "${LINUX_VERSION}"
> >
> > SRC_URI = " \
> >
> > git://git@github.com/redacted/linux.git;name=kernel;branch=${KBRANCH};protocol=ssh
> > \
> > "
> >
> > do_configure_prepend() {
> >         if [ -n "${KBUILD_DEFCONFIG}" ] && [ -f
> > "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then
> >                 oe_runmake_call -C ${S} CC="${KERNEL_CC}"
> > LD="${KERNEL_LD}" O=${B} ${KBUILD_DEFCONFIG}
> >         fi
> > }
> >
> > Cheers,
> > Jack.
> >
> > On 28/08/2020 21:55, Bruce Ashfield wrote:
> >> On Fri, Aug 28, 2020 at 4:20 PM Jack Mitchell <ml@embed.me.uk> wrote:
> >>>
> >>> Having just upgraded my mainline kernel recipe to a v5.8/v5.9-rc2 kernel
> >>> from v5.5.8 I've found that modules have somehow broken. I've flicked
> >>> between the two and confirmed that the old kernel build works, and the
> >>> 5.8/5.9 build doesn't. I haven't changed anything bar the git commit
> >>> hash. It's a very simple kernel recipe basically just inheriting the
> >>> kernel bbclass and setting SRCREV. Running on current tip of master.
> >>>
> >>> I assume it's something symver related but wanted to ask if anybody
> >>> knows anything before I dig too deep.
> >>
> >> I can say that it is working for me on 5.8 and 5.9-rcX on the reference kernels.
> >>
> >> qemux86-64 login: root
> >> root@qemux86-64:~# uname -a
> >> Linux qemux86-64 5.8.4-yocto-standard #1 SMP PREEMPT Wed Aug 26
> >> 16:07:56 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
> >> root@qemux86-64:~# lsmod
> >> Module                  Size  Used by
> >> parport_pc             24576
> >> parport                28672  1 parport_pc
> >> ata_piix               36864  0
> >> floppy                 77824  0
> >> sch_fq_codel           20480  1
> >>
> >> my 5.9-rc is rebuilding right now, so I can double check it over the weekend.
> >>
> >> Not super useful, but there shouldn't be anything fundamentally
> >> broken, since we've been following along with the latest as usual.
> >>
> >> Is your g_ether built in-tree, or out of tree ?
> >>
> >> Bruce
> >>
> >>
> >>>
> >>> Cheers,
> >>> Jack.
> >>>
> >>> root@rk3399:~# uname  -a
> >>> Linux rk3399 5.9.0-rc2 #1 SMP PREEMPT Fri Aug 28 18:47:44 UTC 2020
> >>> aarch64 GNU/Linux
> >>>
> >>> root@rk3399:~# modprobe g_ether
> >>> modprobe: ERROR: could not insert 'g_ether': Exec format error
> >>>
> >>> root@rk3399:~# modinfo
> >>> /lib/modules/5.9.0-rc2/kernel/drivers/usb/gadget/legacy/g_ether.ko
> >>> filename:
> >>> /lib/modules/5.9.0-rc2/kernel/drivers/usb/gadget/legacy/g_ether.ko
> >>> license:        GPL
> >>> author:         David Brownell, Benedikt Spanger
> >>> description:    RNDIS/Ethernet Gadget
> >>> depends:        libcomposite,u_ether,usb_f_rndis
> >>> intree:         Y
> >>> name:           g_ether
> >>> vermagic:       5.9.0-rc2 SMP preempt mod_unload aarch64
> >>> parm:           idVendor:USB Vendor ID (ushort)
> >>> parm:           idProduct:USB Product ID (ushort)
> >>> parm:           bcdDevice:USB Device version (BCD) (ushort)
> >>> parm:           iSerialNumber:SerialNumber string (charp)
> >>> parm:           iManufacturer:USB Manufacturer string (charp)
> >>> parm:           iProduct:USB Product string (charp)
> >>> parm:           qmult:queue length multiplier at high/super speed (uint)
> >>> parm:           dev_addr:Device Ethernet Address (charp)
> >>> parm:           host_addr:Host Ethernet Address (charp)
> >>> parm:           use_eem:use CDC EEM mode (bool)
> >>>
> >>> [jack@arch-corsair ~]$ file g_ether.ko
> >>> g_ether.ko: ELF 64-bit LSB relocatable, ARM aarch64, version 1 (SYSV),
> >>> BuildID[sha1]=375c0485cb8c4b013dc0694725457bd111899f8c, not stripped
> >>>
> >>
> >>
> >
> >
> > 
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
