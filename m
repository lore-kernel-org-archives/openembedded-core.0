Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C4CEC7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 14:08:59 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.14300.1686319730715808224
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 07:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=oOdn6nhb;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-77865f63473so74546939f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 07:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686319730; x=1688911730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Rty05+vgRGvCjJcp55F594zFKEx+soOS9dW4+99U6I=;
        b=oOdn6nhb0M4XeJPz2nL0oHw0g1ur36zQxaQ2XCZigBL++p3hMc02PkDgTOPpbiwhmr
         2whYQdaYPczkU3+DCGGwTDPvBobordUixfp9tE6M7cs0vH+ILYM2LCbP0ISnoO8N6bw2
         PtZMaNmJ1QYAk7g4+YYAXCCEzdXAtP1FZAxeMFa9NUeW0bGwqxFBTH1DLuIcD+g3KO//
         ABuoYXcKRcTHgtGE3qBrQTkGXU+AUm6Gy1+VkDI1MAeTDzTQceCiYtFaEx7Tw94e4U78
         U/qBMK/a82KHMyp/neHgqOjeTV8RSGe4OfCalJVAHII2QjUTCko+PWyP1kHtU72CV3DR
         YPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686319730; x=1688911730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Rty05+vgRGvCjJcp55F594zFKEx+soOS9dW4+99U6I=;
        b=McG3+CTucDrE743MJCG74OzY5Y4jYzLhM2uaqBCyHYL5Mcjb2LC9ML0rTVVKSwSYqT
         OIqrZZpLP7WbYHrHCjPICom9noGQY8SRiVPsuBGACvVutveG5M+tQ9zylxam4REzi0b8
         SGE9qMz+a4VaRZydQedP95rm9uX7xLIGU/f/GgiSZwbGAjJ58Qd/nRPmRlv0CTpV7/35
         CtrMch/c9PykVA2nBdMNUuhjj8MdRYjk+wkBw6+ltIZ7VHHrh7tSLiEFY+p7xxMIhIDF
         5vyz2EEaHkrOEfdNtexlbDePuHkU5e0EUs7IOuBUr2FuKz+8TUAsB7XqZqr2VVe3pkU6
         GyHQ==
X-Gm-Message-State: AC+VfDzx2PH1xyBsDtN9XClWYl1bg1rqi+YncqUZi0/BGfVd0sSpv34a
	CTIYe3E7lNhqLnHlug0exeFXJW/wyw8bpyE4pOg=
X-Google-Smtp-Source: ACHHUZ65WmkjpX9fgfbnNiMl9kdueOfHP7v/6pETZMx1kHampMbQNzsA0WO648+1NV/8+IyLw3t6xmsoxnKtAtBO+8g=
X-Received: by 2002:a6b:da0e:0:b0:76d:7522:2658 with SMTP id
 x14-20020a6bda0e000000b0076d75222658mr1729163iob.9.1686319729855; Fri, 09 Jun
 2023 07:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230608193901.363242-1-bruce.ashfield@gmail.com> <3871317432553f8027c3c0d6aabcc186d6f32b07.camel@linuxfoundation.org>
In-Reply-To: <3871317432553f8027c3c0d6aabcc186d6f32b07.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 9 Jun 2023 10:08:49 -0400
Message-ID: <CADkTA4OGDBUgFhmeV9BkHoWv8aPu9Y6A2B2iPRBTEhB3ny0eSw@mail.gmail.com>
Subject: Re: [PATCH 1/2] qemux86/conf: TEST ONLY. Drop smp boot
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Paul Gortmaker <paul.gortmaker@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 14:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182550

On Fri, Jun 9, 2023 at 2:06=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-06-08 at 19:39 +0000, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > We are seeing intermittent boot hangs with x86. Once of the last
> > messages in failing logs is secondary cpu startup.
> >
> > Dropping us down to smp for testing to see if the hangs start to
> > go away with smp removed.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/conf/machine/include/x86/qemuboot-x86.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf=
/machine/include/x86/qemuboot-x86.inc
> > index 6ae03633ae..54a12119a7 100644
> > --- a/meta/conf/machine/include/x86/qemuboot-x86.inc
> > +++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
> > @@ -1,6 +1,6 @@
> >  # For runqemu
> >  IMAGE_CLASSES +=3D "qemuboot"
> > -QB_SMP ?=3D "-smp 4"
> > +QB_SMP ?=3D ""
> >  QB_CPU:x86 ?=3D "-cpu IvyBridge -machine q35,i8042=3Doff"
> >  QB_CPU_KVM:x86 ?=3D "-cpu IvyBridge -machine q35,i8042=3Doff"
> >
> >
>
> FWIW, this patch didn't change much. With it applied we still see:


ok. so at least we can rule out it being specific to secondary cpu startup.

Bruce


>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5168/st=
eps/12/logs/stdio
>
> [    0.634735] Freeing SMP alternatives memory: 52K
> [   12.275510] smpboot: CPU0: Intel Xeon E3-12xx v2 (Ivy Bridge) (family:=
 0x6, model: 0x3a, stepping: 0x9)
> [274491.955544] cblist_init_generic: Setting adjustable number of callbac=
k queues.
> [274492.008510] cblist_init_generic: Setting shift to 0 and lim to 1.
> [279820.791509] cblist_init_generic: Setting shift to 0 and lim to 1.
> [282104.735510] cblist_init_generic: Setting shift to 0 and lim to 1.
> [386831.154510] Performance Events: unsupported p6 CPU model 58 no PMU dr=
iver, software events only.
> [386850.632510] rcu: Hierarchical SRCU implementation.
> [386850.668510] rcu:    Max phase no-delay instances is 400.
> [386852.898509] smp: Bringing up secondary CPUs ...
> [386852.946510] smp: Brought up 1 node, 1 CPU
> [386852.992510] smpboot: Max logical packages: 1
> [386853.018509] smpboot: Total of 1 processors activated (5199.99 BogoMIP=
S)
> [386855.257509] devtmpfs: initialized
> [386857.982509] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffff=
ffff, max_idle_ns: 1911260446275000 ns
> [386858.041510] futex hash table entries: 256 (order: 2, 16384 bytes, lin=
ear)
> [386858.691509] pinctrl core: initialized pinctrl subsystem
> [386862.836510] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [386864.720510] thermal_sys: Registered thermal governor 'step_wise'
> [386864.725509] thermal_sys: Registered thermal governor 'user_space'
> [386864.864510] cpuidle: using governor menu
> [386865.662509] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xb0000=
000-0xbfffffff] (base 0xb0000000)
> [386865.693510] PCI: MMCONFIG at [mem 0xb0000000-0xbfffffff] reserved in =
E820
> [386865.900509] PCI: Using configuration type 1 for base access
> [386878.550509] kprobes: kprobe jump-optimization is enabled. All kprobes=
 are optimized if possible.
>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

