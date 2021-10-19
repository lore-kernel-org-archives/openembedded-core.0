Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882DDC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 02:40:25 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.4548.1634611224397263777
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 19:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZOCCfbT9;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id t16so6975277eds.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 19:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+wIjKSn46WpUms1469+en6IIeIj6viGQY9LP3pLnpAc=;
        b=ZOCCfbT93ySWo3LJzAIpjT8/No6Sl/NkybOXtW+ncng2InQyb3R7J/Bcix7cSFbwc/
         WIfbEet39RQVIGLs1KIjoRwjZw2IR/LH26FcbNa+fUsHYWWsBueNNnnJ7h8RILmVIH4K
         +LE6vd6ens2R6NXAFR53PGho4iN1JbET0WrycSUDERbtdExVcPkUPzcmlbSDIqNxGFGm
         WdKbM44577aGnoScgFSKtc5KfWgKntwx849KRKYStD2xzSSJRTM80H/XV2cNJfOKa1c0
         zx7sfP55MzWLnDAL3oeb41uXYOGFqC9SlWnz4uh5QCVWmhwTGsB+vb+XH5bAonmQpS4A
         6I/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+wIjKSn46WpUms1469+en6IIeIj6viGQY9LP3pLnpAc=;
        b=N0BQsqAd11+loRk7RiI7ZBIpBLRXhr2nHGNznqUJyAg8cbafAdbCW7Fkcyot95YrAh
         KCw4S5W0CUMYiND/XXJ5gyuM4AJ+bYIPrAtFgrM0BbaHXckrValbU1KDz2XwdDQ19ZTo
         BJ82aLV9M6se2sn8IesE8elXobS5lzF8aRzjHKoZ/S7acmHVho6TjcUe+uDeNqjhmnI3
         zH5oEv/uAopeiVWGLqpV4tSL5AWdpmDdWT2ReCQCgIJq2Yq7ybmnOV84pz6NU3p9M9Dm
         T1Y/t6lK7QaUp0kgvVGUQC3SIuYuBYpYBQyniIDZAocmx7dCVzEgFkunONfUhmXGRYop
         S4/g==
X-Gm-Message-State: AOAM530IQabJaqAmSaxq3ByFxuzp5L5DE+BAzUD5zctGNqaN79yzLaXG
	CaJzTEsA/4AUzGFtz7zj0S/UErWMeQ8vMfC8VNQ=
X-Google-Smtp-Source: 
 ABdhPJw2jnMSjLJhBGRvWkFxADrRxfSukdDzcoavKVFXgAKTgkPFZtUc4Q84+TZy2WMQTSwJUzsZy7quspyeidbePXY=
X-Received: by 2002:a17:906:314e:: with SMTP id
 e14mr33894633eje.165.1634611222608;
 Mon, 18 Oct 2021 19:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <16AE71B3ADB3BD09.11150@lists.openembedded.org>
 <086e00e6-0cd0-0304-8021-f25dcfeb7287@gmail.com>
 <CADkTA4PyZWTHrscZF7W7mVNKTs1+61rEDakfXex8Vv1=EQOxWQ@mail.gmail.com>
 <29fd6f53-b8fd-4c29-b547-41fa3dfee376@gmail.com>
In-Reply-To: <29fd6f53-b8fd-4c29-b547-41fa3dfee376@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 18 Oct 2021 22:40:11 -0400
Message-ID: 
 <CADkTA4NpxNMhCxb7V6O_u_r=JmW_ix=Tx+EZfLLXyeiFGz3wZA@mail.gmail.com>
Subject: Re: [OE-core] linux-yocto: Set CONFIG_ATA_PIIX=y by default
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Saul Wold <Saul.Wold@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 02:40:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157099

On Mon, Oct 18, 2021 at 2:39 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> On 10/17/21 15:32, Bruce Ashfield wrote:
> > On Sun, Oct 17, 2021 at 4:26 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
> >>
> >> Hi Bruce and Saul,
> >>
> >> On 10/16/21 09:18, Jacob Kroon via lists.openembedded.org wrote:
> >>> Hi Bruce,
> >>>
> >>> My Yocto images (which uses the linux-yocto kernel) stopped booting in
> >>> QEMU some time ago, and after some debugging it turns out this was
> >>> because the upstream Linux kernel removed the legacy IDE driver. Instead
> >>> one should use the libata driver. However, I don't think the linux-yocto
> >>> kernel has builtin support for the HW that is emulated by QEMU by
> >>> default (PIIX), instead it is built as a module, CONFIG_ATA_PIIX=m. If I
> >>> set CONFIG_ATA_PIIX=y, my images boot again.
> >>>
> >>> I did a "make ARCH=i386 defconfig" in Torvalds master linux tree, and
> >>> the .config has CONFIG_ATA_PIIX=y.
> >>>
> >>> Do you think it would make sense to have the support builtin in
> >>> linux-yocto aswell ?
> >>>
> >>
> >> I'm using KMACHINE = "common-pc". CC:ing Saul Wold, since I see that
> >> commit 0d4f5ed5dca41a48423ce738131e52f7863d8ca6 in yocto-kernel-cache did:
> >>
> >>> diff --git a/bsp/common-pc/common-pc-drivers.cfg b/bsp/common-pc/common-pc-drivers.cfg
> >>> index 71608433..0b821903 100644
> >>> --- a/bsp/common-pc/common-pc-drivers.cfg
> >>> +++ b/bsp/common-pc/common-pc-drivers.cfg
> >>> @@ -5,7 +5,8 @@ CONFIG_PCI_MSI=y
> >>>   CONFIG_ATA=y
> >>>   CONFIG_ATA_ACPI=y
> >>>   CONFIG_ATA_SFF=y
> >>> -CONFIG_ATA_PIIX=y
> >>> +CONFIG_ATA_BMDMA=y
> >>> +CONFIG_ATA_PIIX=m
> >>>
> >>>   CONFIG_INPUT=y
> >>>   CONFIG_INPUT_MOUSEDEV=y
> >>
> >> which changed ATA_PIIX from a builtin to a module. Maybe this wasn't
> >> intentional ?
> >
> > It was definitely intentional.
> >  > We try and keep the configuration space of the targets as small as
> > possible. In particular, this is exactly why qemux86* was created, so
> > we wouldn't have to enable options in either the h/w targets or the
> > emulated targets that are specific to a use case on one (and vice
> > versa). That being said, they still actually do share the same machine
> > definitions in the kernel-cache, since nothing significant has forced
> > me to use that namespace split.
> >
> > qemux86 doesn't need PIIX out of the box to boot, and the Kconfig
> > indicates "set it to N unless ...", and we do know the built-ins we
> > want, so it is set to 'm' as a middle ground.
> >
>
> When I start qemu-system-x86_64/qemu-system-i386 and type "info qtree"
> in the QEMU monitor (both version 5.2.0 and 6.1.0) I see "piix3-ide" for
> the IDE controller. Given that for older Yocto kernels the legacy IDE
> driver was builtin (CONFIG_BLK_DEV_PIIX=y), but is now removed in the
> kernel present on master, I'd figure ATA_PIIX=y would be required
> nowadays in order to get the kernels to boot in QEMU (since libata is
> replacing the old legacy IDE driver nowadays).

It all depends on how the boot media is wired into the qemu run.
The runqemu boots are using vda and virtio-blk to start up, with
an explicit kernel and image passed to qemu.

ATA_PIIX is loaded as a module after that, and is active (but not
used) .. and of course it is loaded since the piix is detected and
triggers the load.

Obviously we've been booting qemux86* all throughout the
development cycle :D Even after I cleaned up all the old
obsolete IDE options.

>
> > That being said, it isn't out of the question to enable it (slippery
> > slope to giant defconfig like beasts with everything and the kitchen
> > sink enabled notwithstanding .. not that this is much of a step down
> > that slope!) .. just let me ask a few more things first.
> >
>
> Yeah, the only reason I'm asking is because I think I'm using default
> QEMU emulated hardware, and I'm sure we want a Yocto kernel to boot in
> default QEMU hardware.

It's less about the h/w and more about what we want to enable
as boot media, and the boot process. If we were going through
an initramfs, etc, we could load the modules from rootfs and
have everything available as potential boot options.

>
> > You say you are using KMACHINE='common-pc', that's good. But what else
> > is at play ? What OE MACHINE are you building ? What image FStypes,
> > etc ?
> >
>
> It is a custom machine for
>
> https://www.compulab.com/products/computer-on-modules/cm-itc/
>
> machine/cm-itc.conf:
> ---
> IMAGE_FSTYPES ?= "ext4"
>
> require conf/machine/include/x86/tune-i686.inc
> require conf/machine/include/x86/x86-base.inc
>
> PREFERRED_PROVIDER_virtual/bootloader = "grub-efi"
> ---
>
> > I won't be able to do some build testing until Monday, but do you
> > happen to have the qemu command lines (via runqemu) and machine
> > definitions for qemux88 and your machine?  I'd like to look at them
> > and confirm exactly what image, and boot parameters are in play, since
> > one boots and the other doesn't.
> >
>
> I don't use the "runqemu"-script, I boot the images using Fedora 34 QEMU
> installation (QEMU version 5.2.0). Commandline is:
>
> > qemu-system-x86_64 -m 1G -enable-kvm -nic user,hostfwd=tcp::10022-:22 -cpu n270 -bios /usr/share/edk2/ovmf-ia32/OVMF_CODE.fd -drive format=raw,file=<path-to-image>
>

I obviously wasn't able to boot exactly like this, but it tells me enough
about what you are doing.

As I was saying before, enabling PIIX isn't much added size, doesn't
take us far down the slope of enabling too much 'just in case' .. and is
roughly equivalent to the old IDE PIIX.

I can turn it on for common-pc* in master, and it could be proposed
for backport to the impending release in a dot release.

Cheers,

Bruce

> I have the following bbappended in my yocto kernel recipe:
> KMACHINE:cm-itc ?= "common-pc"
> COMPATIBLE_MACHINE:cm-itc = "cm-itc"
>
> together with some custom kernel configuration.
>
> Regards Jacob



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

