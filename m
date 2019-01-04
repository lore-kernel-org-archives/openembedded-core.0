Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 38D4079F39
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 01:05:48 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id g11-v6so31200269ljk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 17:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dS0/gfmFCPMxtIakIFVrpEbaJfBX0ZV6flR2QcbAvsI=;
	b=YGRl3+rJUkBJgMkd+JgK95daIJnHrb/FbZADOOJ7vFtRfhufXHsipgYn3rJGvbaZmN
	ktkdccUFZYK4V/Xw+Z1TyumR+aXHys8zocslWI4uORHnrrxhGe/EHRQXtEuc4BwqdmUa
	3jzQGRyrRuNpV7yNRDDnLuIwbO8KKBsm0rAkffK27f4oqPCxgnarFYsqlJJTtoTmVRdb
	jzokr/zPMM9C0W/McOiweYpupBvdWxC74aAlCR3XSDpwWK+np/gaI1VDJcH6udfp+oC5
	gSx1NeiCc5FlK2zk9Iyt8dHaxylbC9s64hFjeXPIb4cV3dBOkzswTvP+OFopIEwa353I
	FaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dS0/gfmFCPMxtIakIFVrpEbaJfBX0ZV6flR2QcbAvsI=;
	b=EQ7u0SS6DybAG8mZH1nQ0HJ8SYBdffDqgCw3LOevEBrV/IGjuGbj+t8wKB//kZSi7D
	m7PZZbhjbkQmjy0/oCJE5HphhxjsaVVcWabK7vSaS5FeQp2bi9nIXbmw0gCe/9ju/FzZ
	vXmdR8HAC+Zwv3RitbhsgjqGHHyLMsTJ0h+3WUFEKBpS0lY5uFVVxhN3WIj7AJ3T4tL3
	7YbFK1xkXHWg+MiZ7pm/ObgW5ZVQ8Mz+maP8TgC29C9/mrBaikw7C7hbUs799RvNreyn
	RpzvLsFhAMn0W4DDTAmB+RcLzdlqM5UplcZwgbOS3kLa2CVmi7agHSwCbAadUG1GZr2S
	vjgw==
X-Gm-Message-State: AJcUukcIYIoYHtHm26v01hhDr/wyM7L57mGtUVKLauHfimdDxv5sztp4
	GnJsNz3gRWFhmV2eStgwB0HszVBpu7xyXi7uuWo=
X-Google-Smtp-Source: ALg8bN6LwGw3uJ3Yx+KZ96UYVIUxbOJSAIjRTE0AOlPpk4OQKzHwgtUSK9e4LBRu0stL+pHjvygzGpJvnOggCLEmvgc=
X-Received: by 2002:a2e:9059:: with SMTP id
	n25-v6mr20613826ljg.155.1546563948411; 
	Thu, 03 Jan 2019 17:05:48 -0800 (PST)
MIME-Version: 1.0
References: <20180614194507.93168-1-alistair.francis@wdc.com>
	<20180614194507.93168-3-alistair.francis@wdc.com>
	<CADkTA4PJuHARyOg7zU4vNktpniz+OFg_1iU7_nUQYWmM2uhxoA@mail.gmail.com>
	<CAKmqyKPVc3iTwU8aU=r=q45FeYdtegw-ZMMs=6pZ1KmL1S+ofQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPVc3iTwU8aU=r=q45FeYdtegw-ZMMs=6pZ1KmL1S+ofQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 3 Jan 2019 20:05:37 -0500
Message-ID: <CADkTA4O=mG-nqD0rxnwDoTc1GG0F+6v_pp-FZ5ADfo42fEyrug@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] recipes-kernel/linux: Add RISC-V support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jan 2019 01:05:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 3, 2019 at 7:15 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, Jun 14, 2018 at 3:12 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> >
> >
> > On Thu, Jun 14, 2018 at 3:45 PM, Alistair Francis <alistair.francis@wdc.com> wrote:
> >>
> >> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >> ---
> >>  meta/recipes-kernel/linux/linux-yocto.inc     | 4 ++++
> >>  meta/recipes-kernel/linux/linux-yocto_4.15.bb | 5 ++++-
> >>  2 files changed, 8 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> >> index 95ec2a2b41..70a13cdd1e 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> >> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> >> @@ -26,6 +26,10 @@ DEPENDS_append_nios2 = " libgcc"
> >>  KERNEL_CC_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
> >>  KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
> >>
> >> +DEPENDS_append_riscv64 = " libgcc"
> >> +KERNEL_CC_append_riscv64 = " ${TOOLCHAIN_OPTIONS} ${SECURITY_NOPIE_CFLAGS}"
> >> +KERNEL_LD_append_riscv64 = " -no-pie"
> >> +
> >>  KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
> >>
> >>  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
> >> index 693670c613..4ea368a011 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
> >> @@ -36,7 +36,10 @@ KCONF_BSP_AUDIT_LEVEL = "2"
> >>
> >>  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> >>
> >> -COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> >> +KBUILD_DEFCONFIG_qemuriscv64 = "defconfig"
> >> +KCONFIG_MODE_qemuriscv64 = "--alldefconfig"
> >
> >
> > This doesn't belong in linux-yocto.
> >
> > We use defined BSP and configuration fraagments, not in-tree defconfigs
> >
> > I'm happy to add a BSP definition to the kernel-cache, but this isn't the way to add configuration support for the linux-yocto trees
>
> Hey Bruce,
>
> I'm looking at this again as the 4.19 kernel now has full working
> RISC-V support.
>
> How can I add a BSP definition to the kernel-cache?
>

See the examples that are already in the kernel-cache, follow one of
them and send a patch to the linux-yocto mailing list.

What ends up in the BSP definition are only the options related to h/w
on the board. General / software options are defined by the
common/included fragments in the configuration repo.

> Also, what is the reason for not using the in-tree defconfigs?

Because we maintain our own reference configurations, and they are
largely consistent across machines and architectures. That is not the
case for in tree defconfigs. People are free to use them for their own
purposes, but that's not what we do for the reference BSPs.

Cheers,

Bruce

>
> Alistair
>
> >
> > Cheers,
> >
> > Bruce
> >
> >>
> >> +
> >> +COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemurisc532|qemuriscv64"
> >>
> >>  # Functionality flags
> >>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end"
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

