Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB64C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 14:32:38 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.29956.1704205956189006438
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 06:32:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JYteBAkH;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7b7f6caf047so450472539f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 06:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704205955; x=1704810755; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGXIQaCSMAMces/UmuqJfmeDwXcOQLyjYNYoCwNoHzY=;
        b=JYteBAkHOb2uX9WF4QluT5oLpbK1vwZT3J4gW1fpo1Dn03NLMmrmexjMt659CsM+wO
         AnJT3LR1pX0nsq2AvkVd2/+AVgxi6k9bjYyiNmLiu7nQF14/TVh/mm1D5JPLqvv3r4Cj
         c2qUCKmVG7OoeMA4Am9nqvKgP1Ty0jHOQ/sQe9BmxFTm6GgQZRtRUVb4E943sU+zsFVq
         7kg7Af8smr3BDbg8mEs0T1ukTGsnxsNIlB9RY2C6juYlGfPOzW72PZD80QA2YXNpUnT0
         sP/5tlkSFaOtDsqEqEyOOA6DztvslN9GhIrjjysuD20VwqGsZ5Rdc/Fxn9A2SCAuw97s
         F/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704205955; x=1704810755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGXIQaCSMAMces/UmuqJfmeDwXcOQLyjYNYoCwNoHzY=;
        b=pSc+u6rOCscrxRBij1MYeYEzCy+hNhEDXjiN+MKsS2FMVWOsXFWjpQ28AIxJeMmAja
         grHsMfVdvi0B2Z6CZ5U9y4NaehJVdQgWX53l0uTRVcoB9oo5mGmv3EhV6PRl8rRm+TYp
         mTTMLmkkR+3Q5pkUOkUDjYwQms3/uhnQ8AEo7hQ8/aVGfdT+juIvJ7SO21Fet1ugXlgw
         Kxci9KTZndK+6ZlNhn5WZuY2ikjo+A94TJJQXcWfgOqpC//+WZ56YAxek0q/B3Bz84jC
         49p614nDTWEMdEjRJECaeqLYYZDNByPzv5XwRo0yB0vSzRHxfuhyCtmx35lrrKix69N+
         VYvA==
X-Gm-Message-State: AOJu0YyDlLti2/m65KGcHIpsrOjXtMVvTTaAS05m5ajt38+RTVhW7yQa
	mmc2iFoUJu3MpjcbPHx52YIbUTwl6Kt2/E+bBCk=
X-Google-Smtp-Source: AGHT+IFsh0+Lwhz1iRnBPoSXK/E5YmTfGixl0eZLa2nZc20C1nuVztSBlBpLyB/0ah1L3Rk2F26sD+iCVlOzxdPZkbA=
X-Received: by 2002:a05:6602:42d0:b0:7bb:3:e7c4 with SMTP id
 ce16-20020a05660242d000b007bb0003e7c4mr12730954iob.24.1704205955100; Tue, 02
 Jan 2024 06:32:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704169585.git.bruce.ashfield@gmail.com> <20240102142440c632ce21@mail.local>
In-Reply-To: <20240102142440c632ce21@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 2 Jan 2024 09:32:24 -0500
Message-ID: <CADkTA4MJP7CABL_ka6TZC+bJGrVVfsdG_pAwc+O_YRqcW26JdA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] kernel: consolidated pull request
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 14:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193234

On Tue, Jan 2, 2024 at 9:24=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> This breaks meta-virt:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/2705/s=
teps/12/logs/stdio
>

6.6 kernel configs for meta-virt are on its master-next. I
unfortunately can't push that for a couple days yet, so this will have
to sit.

> and I believe this also causes:
>
> AssertionError: 2 !=3D 0 : Log: /home/pokybuild/yocto-worker/qa-extras2/b=
uild/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/target_logs/d=
mesg

Everything booted and passed my runtime tests, which is all I can do before
submitting.

Hopefully someone with x86 knowledge/interest can pick that up, otherwise
my suggestion is to add it to the allow list.

Bruce

> -----------------------
> Central error: [    0.455917] ACPI: _OSC evaluation for CPUs failed, tryi=
ng _PDC
> ***********************
> [    0.413863] raid6: sse2x2   gen() 14704 MB/s
> [    0.430863] raid6: sse2x1   gen() 11500 MB/s
> [    0.431830] raid6: using algorithm sse2x4 gen() 15109 MB/s
> [    0.448863] raid6: .... xor() 8116 MB/s, rmw enabled
> [    0.449864] raid6: using ssse3x2 recovery algorithm
> [    0.450948] ACPI: Added _OSI(Module Device)
> [    0.451846] ACPI: Added _OSI(Processor Device)
> [    0.451865] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.452865] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.454666] ACPI: 1 ACPI AML tables successfully acquired and loaded
> [    0.455917] ACPI: _OSC evaluation for CPUs failed, trying _PDC
> [    0.457035] ACPI: Interpreter enabled
> [    0.457889] ACPI: PM: (supports S0 S3 S5)
> [    0.458874] ACPI: Using IOAPIC for interrupt routing
> [    0.459924] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
> [    0.460865] PCI: Using E820 reservations for host bridge windows
> [    0.461998] ACPI: Enabled 2 GPEs in block 00 to 3F
> [    0.465281] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.465869] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cl=
ockPM Segments MSI HPX-Type3]
> [    0.466904] acpi PNP0A08:00: _OSC: platform does not support [LTR]
> [    0.467913] acpi PNP0A08:00: _OSC: OS now controls [PME PCIeCapability=
]
>
>
> On 01/01/2024 23:31:02-0500, Bruce Ashfield wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > As promised, I waited until the new year to send this update
> > to introduce the 6.6 kernel and libc-headers.
> >
> > I'll be sending patches to the appropriate lists to remove
> > 6.5 shortly and make 6.6 the default. Once we have the reference
> > boards updated to 6.6, the 6.1 kernel will also be removed.
> >
> > I've built 6.6 for all supported arches, core-image-* and have
> > also tested against musl.
> >
> > Patches to meta-oe have been sent, and the work done with
> > 6.6 as the -dev kernel means that the tightly coupled packages
> > already build against 6.6.
> >
> > I'm sure there will be issues .. as there always are, but at
> > this point, I need more eyes and test cycles to find those
> > issues.
> >
> > Bruce
> >
> >
> > The following changes since commit fe5d2f0b666c83e3336ea9962c8e2e4c3981=
6e21:
> >
> >   bitbake: lib/bb: Add workaround for libgcc issues with python 3.8 and=
 3.9 (2023-12-30 11:03:25 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.yoctoproject.org/poky-contrib zedd/kernel
> >   https://git.yoctoproject.org/poky-contrib/log/?h=3Dzedd/kernel
> >
> > Bruce Ashfield (7):
> >   linux-libc-headers: update to v6.6-lts
> >   linux-yocto: introduce 6.6 reference kernel
> >   linux-yocto/6.6: fix AB-INT: QEMU kernel panic: No irq handler for
> >     vector
> >   linux-yocto-rt/6.6: fix CVE exclusion include
> >   linux-yocto/6.6: update CVE exclusions
> >   linux-yocto/6.6: update to v6.6.8
> >   linux-yocto/6.1: update to v6.1.69
> >
> >  meta/conf/distro/include/tcmode-default.inc   |    2 +-
> >  ...aders_6.5.bb =3D> linux-libc-headers_6.6.bb} |    2 +-
> >  .../linux/cve-exclusion_6.6.inc               | 5172 +++++++++++++++++
> >  .../linux/linux-yocto-rt_6.1.bb               |    6 +-
> >  .../linux/linux-yocto-rt_6.6.bb               |   48 +
> >  .../linux/linux-yocto-tiny_6.1.bb             |    6 +-
> >  .../linux/linux-yocto-tiny_6.6.bb             |   33 +
> >  meta/recipes-kernel/linux/linux-yocto_6.1.bb  |   28 +-
> >  meta/recipes-kernel/linux/linux-yocto_6.6.bb  |   72 +
> >  9 files changed, 5347 insertions(+), 22 deletions(-)
> >  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.5.=
bb =3D> linux-libc-headers_6.6.bb} (83%)
> >  create mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.6.inc
> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> >  create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.6.bb
> >
> > --
> > 2.39.2
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#193196): https://lists.openembedded.org/g/openembed=
ded-core/message/193196
> > Mute This Topic: https://lists.openembedded.org/mt/103476582/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

