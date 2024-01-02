Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757F1C47074
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 15:28:28 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web11.31275.1704209299139493985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 07:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iLYrjaL3;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-36017ab9760so21731035ab.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 07:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704209298; x=1704814098; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PktOeBBduzI3S4jSaavSMkZXqMGB9jd9bmlH2TUYCrw=;
        b=iLYrjaL35PUIYAlu0gA5txiybFuhVL2saNkh9VHcu4dsnUzzXS8RNiFo6Pp4notaG6
         rkwheSgwzQsWyoT28xKexUiENQLH57+c4dZCSpy/m/yrf9OPBxooyyssZSwAjv8lyIXv
         3760r3RJIKLcA7MQsCejFhIQxjIphZtIxcjs7WEz+Gq/Y/j2X9CZEZ6mQdtqxz1PdNCY
         pzyJSLZtEZIziftpp+Dd/GleXZJVFnkLnV9/ywXdhOYOXirvYdeNYjdWF8I4cmeb70Oc
         9vrY01Lzy/Kx6/YupscJgzbARX7Nx1/ugM5kPj1+Qh5rOeideFedipOdBBevIpdpi+w4
         15zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704209298; x=1704814098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PktOeBBduzI3S4jSaavSMkZXqMGB9jd9bmlH2TUYCrw=;
        b=ma+So9XLKCXdqtD4hGFjkmS/No1GCYi70IEFucRqnZ3sixqnUvX1kUA6ZhOUa1oJWe
         GUl9iGuTYxtT3WV7cUZfnF7HUpje30oVTzx8M8W6bFVYyiLoQM7cIhwIMch3tXBk/muG
         MvH/u3ig+QBW0Yy59NUs9yTiS/HK+ENsgK6dpg6kVpDAuoOUCppl3gG9kJJm2ASeY97b
         JQ9UTZR6v3gATMDSlBKScRrg+51QtMuiKEDvlCkxZGv9rzr6hp8hz4WAFnFy9biRcNyp
         sWfEzCOw3/NA+F3xFQ7DMZ5vSIH9RGE7r7Det4HB6WhV6u7w1U/q3RwZARbAmfynIBrF
         c4Gw==
X-Gm-Message-State: AOJu0YyZhlkB5Ly0IcnLWAL7BgBb0ZH2fJ4LMrPsMce/0nHf34j7Xpyv
	N3MTV+hDyO3XHd5w7XxjwgxCva+gA48LMnuABPk=
X-Google-Smtp-Source: AGHT+IEZQnwyij+cLurRsLZoSXsorrHzUPPQMuKDE3CH7kgkRAjvvLR2b+/GbfDakQC1I6KXuh0Z0aGxBtiyWxxKfRg=
X-Received: by 2002:a05:6e02:168a:b0:35f:bcc8:d578 with SMTP id
 f10-20020a056e02168a00b0035fbcc8d578mr23434285ila.27.1704209298274; Tue, 02
 Jan 2024 07:28:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704169585.git.bruce.ashfield@gmail.com>
 <20240102142440c632ce21@mail.local> <17A68E49BCC9F6B2.19587@lists.openembedded.org>
In-Reply-To: <17A68E49BCC9F6B2.19587@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 2 Jan 2024 10:28:07 -0500
Message-ID: <CADkTA4O9rmcWZCJOBZQuuWwV3ygEtkg8Y2n9nriC9Tfm2cU5zQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] kernel: consolidated pull request
To: bruce.ashfield@gmail.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 15:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193240

On Tue, Jan 2, 2024 at 9:32=E2=80=AFAM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Tue, Jan 2, 2024 at 9:24=E2=80=AFAM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hello,
> >
> > This breaks meta-virt:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/2705=
/steps/12/logs/stdio
> >
>
> 6.6 kernel configs for meta-virt are on its master-next. I
> unfortunately can't push that for a couple days yet, so this will have
> to sit.
>
> > and I believe this also causes:
> >
> > AssertionError: 2 !=3D 0 : Log: /home/pokybuild/yocto-worker/qa-extras2=
/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/target_logs=
/dmesg
>
> Everything booted and passed my runtime tests, which is all I can do befo=
re
> submitting.
>
> Hopefully someone with x86 knowledge/interest can pick that up, otherwise
> my suggestion is to add it to the allow list.

I was able to find the commit that tweaked the message, and I can
confirm that it is just information and not an issue/error/warning.

I'll try to locate the allow lists, and tweak them appropriately.

Bruce

>
> Bruce
>
> > -----------------------
> > Central error: [    0.455917] ACPI: _OSC evaluation for CPUs failed, tr=
ying _PDC
> > ***********************
> > [    0.413863] raid6: sse2x2   gen() 14704 MB/s
> > [    0.430863] raid6: sse2x1   gen() 11500 MB/s
> > [    0.431830] raid6: using algorithm sse2x4 gen() 15109 MB/s
> > [    0.448863] raid6: .... xor() 8116 MB/s, rmw enabled
> > [    0.449864] raid6: using ssse3x2 recovery algorithm
> > [    0.450948] ACPI: Added _OSI(Module Device)
> > [    0.451846] ACPI: Added _OSI(Processor Device)
> > [    0.451865] ACPI: Added _OSI(3.0 _SCP Extensions)
> > [    0.452865] ACPI: Added _OSI(Processor Aggregator Device)
> > [    0.454666] ACPI: 1 ACPI AML tables successfully acquired and loaded
> > [    0.455917] ACPI: _OSC evaluation for CPUs failed, trying _PDC
> > [    0.457035] ACPI: Interpreter enabled
> > [    0.457889] ACPI: PM: (supports S0 S3 S5)
> > [    0.458874] ACPI: Using IOAPIC for interrupt routing
> > [    0.459924] PCI: Using host bridge windows from ACPI; if necessary, =
use "pci=3Dnocrs" and report a bug
> > [    0.460865] PCI: Using E820 reservations for host bridge windows
> > [    0.461998] ACPI: Enabled 2 GPEs in block 00 to 3F
> > [    0.465281] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> > [    0.465869] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM =
ClockPM Segments MSI HPX-Type3]
> > [    0.466904] acpi PNP0A08:00: _OSC: platform does not support [LTR]
> > [    0.467913] acpi PNP0A08:00: _OSC: OS now controls [PME PCIeCapabili=
ty]
> >
> >
> > On 01/01/2024 23:31:02-0500, Bruce Ashfield wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Richard,
> > >
> > > As promised, I waited until the new year to send this update
> > > to introduce the 6.6 kernel and libc-headers.
> > >
> > > I'll be sending patches to the appropriate lists to remove
> > > 6.5 shortly and make 6.6 the default. Once we have the reference
> > > boards updated to 6.6, the 6.1 kernel will also be removed.
> > >
> > > I've built 6.6 for all supported arches, core-image-* and have
> > > also tested against musl.
> > >
> > > Patches to meta-oe have been sent, and the work done with
> > > 6.6 as the -dev kernel means that the tightly coupled packages
> > > already build against 6.6.
> > >
> > > I'm sure there will be issues .. as there always are, but at
> > > this point, I need more eyes and test cycles to find those
> > > issues.
> > >
> > > Bruce
> > >
> > >
> > > The following changes since commit fe5d2f0b666c83e3336ea9962c8e2e4c39=
816e21:
> > >
> > >   bitbake: lib/bb: Add workaround for libgcc issues with python 3.8 a=
nd 3.9 (2023-12-30 11:03:25 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://git.yoctoproject.org/poky-contrib zedd/kernel
> > >   https://git.yoctoproject.org/poky-contrib/log/?h=3Dzedd/kernel
> > >
> > > Bruce Ashfield (7):
> > >   linux-libc-headers: update to v6.6-lts
> > >   linux-yocto: introduce 6.6 reference kernel
> > >   linux-yocto/6.6: fix AB-INT: QEMU kernel panic: No irq handler for
> > >     vector
> > >   linux-yocto-rt/6.6: fix CVE exclusion include
> > >   linux-yocto/6.6: update CVE exclusions
> > >   linux-yocto/6.6: update to v6.6.8
> > >   linux-yocto/6.1: update to v6.1.69
> > >
> > >  meta/conf/distro/include/tcmode-default.inc   |    2 +-
> > >  ...aders_6.5.bb =3D> linux-libc-headers_6.6.bb} |    2 +-
> > >  .../linux/cve-exclusion_6.6.inc               | 5172 +++++++++++++++=
++
> > >  .../linux/linux-yocto-rt_6.1.bb               |    6 +-
> > >  .../linux/linux-yocto-rt_6.6.bb               |   48 +
> > >  .../linux/linux-yocto-tiny_6.1.bb             |    6 +-
> > >  .../linux/linux-yocto-tiny_6.6.bb             |   33 +
> > >  meta/recipes-kernel/linux/linux-yocto_6.1.bb  |   28 +-
> > >  meta/recipes-kernel/linux/linux-yocto_6.6.bb  |   72 +
> > >  9 files changed, 5347 insertions(+), 22 deletions(-)
> > >  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.=
5.bb =3D> linux-libc-headers_6.6.bb} (83%)
> > >  create mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.6.inc
> > >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > >  create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > >
> > > --
> > > 2.39.2
> > >
> >
> > >
> > >
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193234): https://lists.openembedded.org/g/openembedde=
d-core/message/193234
> Mute This Topic: https://lists.openembedded.org/mt/103476582/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

