Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.5956.1599048976935244184
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 05:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U9k7rumS;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id q21so4699702edv.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 05:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ds9jxxA9f7+HvL6HCR9o6WqRrZO6N89/Oq60KQlpqCg=;
        b=U9k7rumScLd5HFr9wiA/8OXszaImvq4QjO6oHJH+CD4bYsTLDcJjwksMRkKmFVMjR/
         0s6slTOcS3WxaJKsVbcbWyoDmUstWb50oWq8WRZVqIu9YhH/bsCD4Rp03sGBEhtV4s6c
         FLzs2/A25L320JcQ0zciTpNBcIlTzvHKAXFB8Id8SXnwbAGXH9yy9kJCYdgUzGG3GiXN
         /fF8ravI7OrR0e9MVK9mSiBahva8fStRebjppLH0zPadMboRH8y1oeoeiDE8DpruHg/I
         3kyD4ODCp7O5yFuJTqCldZA2TJDho0MDZAbiKsW0KtiqiRpxOGCX58qDmzE6MetIrky+
         uakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ds9jxxA9f7+HvL6HCR9o6WqRrZO6N89/Oq60KQlpqCg=;
        b=qA5+t8EUgym+EEWUkCKINt6flWi239zTi+DScVjnjc3EufgTDqkfRANbMvslWzRct3
         JB92Z2oDRgwcpi9UFErwDc79aK9A7u1PVCBMUKDotNLozYz+aHIRRsDLPs+kbC9erPWV
         UNFmjJefX5fqbWECEi1fBIk7dVrjdEWxXMTmX1yDIUCf1Sqer1NZZiseN9nK6N99Fl98
         Kdzv4UE60LZwYElX7GvkBFFQJJXP3WIpIf3Nyagjz72m0vvY4Dzz9kJLET2tEus9WlZj
         GDlqA3Xr8c2d8HPFs6NrRaXWBrFOHNTLRyxrR8Vfu8jGCgJ1n0wbj05k1j2Le8LEugYh
         GbEQ==
X-Gm-Message-State: AOAM532KK8YrNg58u8BUkl3Te5ek2yQJL/LNW0zfxodoE3pMHDX5ZQW8
	fz5W25XPF8d3EIMrr4oPt+tJSDoOdtizWR7H5P0=
X-Google-Smtp-Source: ABdhPJxSXU6X1vTttpcz0uOduVSB/dkGob5aGNrfnMOydIf+Crb+s45xLPDayCwGVubwQfgu/aHRFMfJtjnF6JBwfkc=
X-Received: by 2002:a50:bb26:: with SMTP id y35mr6410756ede.234.1599048973875;
 Wed, 02 Sep 2020 05:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <6e070a3d-a5f3-46bf-ac33-d7d6daf05b4f@embed.me.uk>
 <CADkTA4Ob=JpTsenFdNcKzB_5-8xQ+OGm_eQK_QPOPWeizz89QA@mail.gmail.com>
 <162F8C343CCB5CF7.17615@lists.openembedded.org> <ab4878e3-da65-2410-eb3a-d815483f085b@embed.me.uk>
 <162F9C3326351CDB.18810@lists.openembedded.org> <CADkTA4PRJxj5KdhouVV1h99maCCPwGRTNcaUw2WO4-awKkRD9Q@mail.gmail.com>
 <1a844286-9b72-95c9-56be-979b59d42266@linux.intel.com> <2da2a00d-13a5-1f3f-c541-ecc40cc27934@embed.me.uk>
In-Reply-To: <2da2a00d-13a5-1f3f-c541-ecc40cc27934@embed.me.uk>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 2 Sep 2020 08:14:19 -0400
Message-ID: <CADkTA4OarooZ4markDTDCGS8Lk_TYxqnwfumYni98MwB2aaAtg@mail.gmail.com>
Subject: Re: [OE-core] Linux v5.8 modules, exec format error
To: Jack Mitchell <ml@embed.me.uk>
Cc: Randy Witt <randy.e.witt@linux.intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 2, 2020 at 3:39 AM Jack Mitchell <ml@embed.me.uk> wrote:
>
>
>
> On 29/08/2020 20:13, Randy Witt wrote:
> > On 8/29/20 11:41 AM, Bruce Ashfield wrote:
> >> On Fri, Aug 28, 2020 at 10:28 PM Bruce Ashfield via
> >> lists.openembedded.org
> >> <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> >>>
> >>> On Fri, Aug 28, 2020 at 7:15 PM Jack Mitchell <jack@embed.me.uk> wrote:
> >>>>
> >>>> Quick update, I just did an armv7 build with exactly the same codebase
> >>>> and everything worked fine. Do you have an aarch64 build could test and
> >>>> confirm working?
> >>>
> >>> qemuarm64 was working fine here with -rc1. I've started a new build,
> >>> but it'll be several hours before I know more (so sometime saturday).
> >>>
> >
> > I saw this on linux-modules today,
> > https://lore.kernel.org/linux-modules/20200829100334.GK1362448@hirez.programming.kicks-ass.net/T/#t
> > which references
> > https://lore.kernel.org/lkml/20200808101222.5103093e@coco.lan/ saying it
> > is a bug in binutils.
> >
> > I haven't looked at it anymore other than seeing this email and that
> > issue are both exec format errors on arm. I have to leave and can't
> > investigate anymore, but figured this might be useful. If not feel free
> > to ignore, and sorry for the noise.
>
> Hi Randy,
>
> Thanks for the heads up, this was indeed was the issue. I'm not sure why
> it's not manifesting itself on Bruces builds. It seems to be arm64
> specific and directly correlated to the binutils version. There is a
> patch coming which will make it in before the release and I assume be
> backported to v5.8 stable which is also affected.

Are you seeing that out of the latest master SRCREVs ?

It isn't just me that isn't seeing this, it is our entire autobuilder
infrastructure, and everyone else using 5.8/ARM on master.

Cheers,

Bruce

>
> Cheers,
> Jack.
>
> >>
> >> still working here:
> >>
> >> qemuarm64 login: root
> >> root@qemuarm64:~# uname -a
> >> Linux qemuarm64 5.9.0-rc2-yoctodev-standard #1 SMP PREEMPT Sat Aug 29
> >> 14:26:30 UTC 2020 aarch64 aarch64 aarch64 GNU/Linux
> >> root@qemuarm64:~# lsmod
> >> Module                  Size  Used by
> >> sch_fq_codel           20480  1
> >> openvswitch           155648  0
> >> nsh                    16384  1 openvswitch
> >> nf_conncount           20480  1 openvswitch
> >> nf_nat                 40960  1 openvswitch
> >> nf_conntrack          110592  3 nf_nat,openvswitch,nf_conncount
> >> nf_defrag_ipv6         20480  2 nf_conntrack,openvswitch
> >> nf_defrag_ipv4         16384  1 nf_conntrack
> >> root@qemuarm64:~#
> >>
> >> Bruce
> >>
> >>> Cheers,
> >>>
> >>> Bruce
> >>>
> >>>>
> >>>> Regards,
> >>>> Jack.
> >>>>
> >>>> On 28/08/2020 22:35, Jack Mitchell wrote:
> >>>>> Hi Bruce,
> >>>>>
> >>>>> All built in-tree, the same recipe builds an armv7h kernel so I'll
> >>>>> try a
> >>>>> build for that and see if it's something aarch64 specific. All the
> >>>>> modules are failing to load so it's not something specific to g_ether.
> >>>>> Please see kernel recipe below for reference.
> >>>>>
> >>>>> LICENSE = "GPLv2"
> >>>>> LIC_FILES_CHKSUM =
> >>>>> "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
> >>>>>
> >>>>> inherit kernel
> >>>>>
> >>>>> S = "${WORKDIR}/git"
> >>>>>
> >>>>> SRCREV = "redacted"
> >>>>> KBRANCH = "v5.9-rc2"
> >>>>>
> >>>>> LINUX_VERSION ?= "${KBRANCH}-g${SRCREV}"
> >>>>> PV = "${LINUX_VERSION}"
> >>>>>
> >>>>> SRC_URI = " \
> >>>>>
> >>>>> git://git@github.com/redacted/linux.git;name=kernel;branch=${KBRANCH};protocol=ssh
> >>>>>
> >>>>> \
> >>>>> "
> >>>>>
> >>>>> do_configure_prepend() {
> >>>>>          if [ -n "${KBUILD_DEFCONFIG}" ] && [ -f
> >>>>> "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then
> >>>>>                  oe_runmake_call -C ${S} CC="${KERNEL_CC}"
> >>>>> LD="${KERNEL_LD}" O=${B} ${KBUILD_DEFCONFIG}
> >>>>>          fi
> >>>>> }
> >>>>>
> >>>>> Cheers,
> >>>>> Jack.
> >>>>>
> >>>>> On 28/08/2020 21:55, Bruce Ashfield wrote:
> >>>>>> On Fri, Aug 28, 2020 at 4:20 PM Jack Mitchell <ml@embed.me.uk> wrote:
> >>>>>>>
> >>>>>>> Having just upgraded my mainline kernel recipe to a v5.8/v5.9-rc2
> >>>>>>> kernel
> >>>>>>> from v5.5.8 I've found that modules have somehow broken. I've
> >>>>>>> flicked
> >>>>>>> between the two and confirmed that the old kernel build works,
> >>>>>>> and the
> >>>>>>> 5.8/5.9 build doesn't. I haven't changed anything bar the git commit
> >>>>>>> hash. It's a very simple kernel recipe basically just inheriting the
> >>>>>>> kernel bbclass and setting SRCREV. Running on current tip of master.
> >>>>>>>
> >>>>>>> I assume it's something symver related but wanted to ask if anybody
> >>>>>>> knows anything before I dig too deep.
> >>>>>>
> >>>>>> I can say that it is working for me on 5.8 and 5.9-rcX on the
> >>>>>> reference kernels.
> >>>>>>
> >>>>>> qemux86-64 login: root
> >>>>>> root@qemux86-64:~# uname -a
> >>>>>> Linux qemux86-64 5.8.4-yocto-standard #1 SMP PREEMPT Wed Aug 26
> >>>>>> 16:07:56 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
> >>>>>> root@qemux86-64:~# lsmod
> >>>>>> Module                  Size  Used by
> >>>>>> parport_pc             24576
> >>>>>> parport                28672  1 parport_pc
> >>>>>> ata_piix               36864  0
> >>>>>> floppy                 77824  0
> >>>>>> sch_fq_codel           20480  1
> >>>>>>
> >>>>>> my 5.9-rc is rebuilding right now, so I can double check it over
> >>>>>> the weekend.
> >>>>>>
> >>>>>> Not super useful, but there shouldn't be anything fundamentally
> >>>>>> broken, since we've been following along with the latest as usual.
> >>>>>>
> >>>>>> Is your g_ether built in-tree, or out of tree ?
> >>>>>>
> >>>>>> Bruce
> >>>>>>
> >>>>>>
> >>>>>>>
> >>>>>>> Cheers,
> >>>>>>> Jack.
> >>>>>>>
> >>>>>>> root@rk3399:~# uname  -a
> >>>>>>> Linux rk3399 5.9.0-rc2 #1 SMP PREEMPT Fri Aug 28 18:47:44 UTC 2020
> >>>>>>> aarch64 GNU/Linux
> >>>>>>>
> >>>>>>> root@rk3399:~# modprobe g_ether
> >>>>>>> modprobe: ERROR: could not insert 'g_ether': Exec format error
> >>>>>>>
> >>>>>>> root@rk3399:~# modinfo
> >>>>>>> /lib/modules/5.9.0-rc2/kernel/drivers/usb/gadget/legacy/g_ether.ko
> >>>>>>> filename:
> >>>>>>> /lib/modules/5.9.0-rc2/kernel/drivers/usb/gadget/legacy/g_ether.ko
> >>>>>>> license:        GPL
> >>>>>>> author:         David Brownell, Benedikt Spanger
> >>>>>>> description:    RNDIS/Ethernet Gadget
> >>>>>>> depends:        libcomposite,u_ether,usb_f_rndis
> >>>>>>> intree:         Y
> >>>>>>> name:           g_ether
> >>>>>>> vermagic:       5.9.0-rc2 SMP preempt mod_unload aarch64
> >>>>>>> parm:           idVendor:USB Vendor ID (ushort)
> >>>>>>> parm:           idProduct:USB Product ID (ushort)
> >>>>>>> parm:           bcdDevice:USB Device version (BCD) (ushort)
> >>>>>>> parm:           iSerialNumber:SerialNumber string (charp)
> >>>>>>> parm:           iManufacturer:USB Manufacturer string (charp)
> >>>>>>> parm:           iProduct:USB Product string (charp)
> >>>>>>> parm:           qmult:queue length multiplier at high/super speed
> >>>>>>> (uint)
> >>>>>>> parm:           dev_addr:Device Ethernet Address (charp)
> >>>>>>> parm:           host_addr:Host Ethernet Address (charp)
> >>>>>>> parm:           use_eem:use CDC EEM mode (bool)
> >>>>>>>
> >>>>>>> [jack@arch-corsair ~]$ file g_ether.ko
> >>>>>>> g_ether.ko: ELF 64-bit LSB relocatable, ARM aarch64, version 1
> >>>>>>> (SYSV),
> >>>>>>> BuildID[sha1]=375c0485cb8c4b013dc0694725457bd111899f8c, not stripped
> >>>>>>>
> >>>>>>
> >>>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>
> >>>
> >>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>> thee at its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>
> >>
> >>
> >>
> >>
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
