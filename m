Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A3FC64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 16:43:49 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.28748.1677602627478629919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 08:43:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K+0lNfV3;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-172094e10e3so11483384fac.10
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 08:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GoIJ7DYh1oCe443VGadKqiVYkV+iSaoFYfx8aZ4fcUM=;
        b=K+0lNfV30Nkn0t2VrckdKQA6Xw6ZCqz9qmrVC5I7CStGqZAPuyzVPegH3a4/FdDWRR
         proajJjVLPwzZEsAPz/dqbu5buTMdiEWbbBO/A58V1dbg7N3sX1e9epMb1/NmzoTRgmw
         2qqUmPe12VSIHbqb/AAA7+ShfBtRhglPy07ci+o86CW1B0+AUI8pKvqPDeUTkAGxFDjp
         4FQP4YSO3Qq/csTuNoSMGuZwudKMkN40i5reXCdIoYkwB1K89FQArZZ8jdJjm9CdZRih
         87dZn8TBYVm0mAmyDl5IaIRcXSEsaY4RT4f1KoSr0C8EbLGUmnrpuCLsstwsxb+EbBpf
         anyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoIJ7DYh1oCe443VGadKqiVYkV+iSaoFYfx8aZ4fcUM=;
        b=m5Y4mPvF1F2a5ov97eI36N/Es4+r3owC+dRnJN6Pz83APOL4R+piFvdzOj4DJaXCem
         SLGvr0ujDiamVLeoP0naLsHjg4cZmTK/2j4N/3Qqf1CBq0nAl0TghI7lFvrRk2IIq05N
         3jGfbXUXFxJGLA1ewjBzSz8fZ0mEelZozUoNZYVDmvJ0hNSp+0gXZNMun+ZzUS+7zUeX
         d4tyqXdQV/77ehp/o9wGAqqeDBpLLd4op1i1UbiLLCR1kMVYp3eHwV+wGgzXO3xLbR0J
         Ix9bzpXpcXCX62siRMbyxDwk59p7AgZNtVn8+OALbpAZDMbt/lHPDgx5avJgo0HI9G6w
         M0Lw==
X-Gm-Message-State: AO0yUKXfQWDREYJNf0lxwQVdWpca21Mi9867BGYk+xrZI89uEBrE0sgT
	CxcJaZ1Ad3JKV4I/wJa0hY5I2K6tbjBEIScDZNRk9jud
X-Google-Smtp-Source: AK7set8UYZXn5zBOQjPUAJhpjhnD7A6RY7Wk7JeW0K2JxBdiEEXMaFRI+Otf76AgRPi2OWmUYVyIkzpy+CLU9zC/mFQ=
X-Received: by 2002:a05:6870:bf05:b0:172:7220:6905 with SMTP id
 qh5-20020a056870bf0500b0017272206905mr5845757oab.0.1677602626494; Tue, 28 Feb
 2023 08:43:46 -0800 (PST)
MIME-Version: 1.0
References: <20230223065816.3151823-1-raj.khem@gmail.com> <Y/4pZDsT0R9iSH+m@mail.local>
In-Reply-To: <Y/4pZDsT0R9iSH+m@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Feb 2023 08:43:20 -0800
Message-ID: <CAMKF1sqGofMPYDJXC55N3Cy+H2q7N__KNHw6NWn8YkfD8ePkPA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Enable --enable-new-dtags
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 16:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177845

On Tue, Feb 28, 2023 at 8:18 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Khem,
>
> As discussed I gave it a go again and got this:
>
> | /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/hosttools/ld: linux-tdep.o: in function `linux_corefile_thread(thread_info*, linux_corefile_thread_data*)':
> | linux-tdep.c:(.text+0x13ac): undefined reference to `gcore_elf_build_thread_register_notes(gdbarch*, thread_info*, gdb_signal, bfd*, std::unique_ptr<char, gdb::xfree_deleter<char> >*, int*)'
> | /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/hosttools/ld: linux-tdep.o: in function `linux_make_corefile_notes(gdbarch*, bfd*, int*)':
> | linux-tdep.c:(.text+0x49d7): undefined reference to `gcore_elf_make_tdesc_note(bfd*, std::unique_ptr<char, gdb::xfree_deleter<char> >*, int*)'
> | collect2: error: ld returned 1 exit status
> | make[2]: *** [Makefile:2149: gdb] Error 1
> | make[2]: Leaving directory '/home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/x86_64-linux/gdb-cross-arm/13.1-r0/build-arm-poky-linux-gnueabi/gdb'
> | make[1]: *** [Makefile:11122: all-gdb] Error 2
> | make[1]: Leaving directory '/home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/x86_64-linux/gdb-cross-arm/13.1-r0/build-arm-poky-linux-gnueabi'
> | make: *** [Makefile:1005: all] Error 2
> | ERROR: oe_runmake failed

Is this host running updated buildtools tarball after the binutils ld
search path fix ?

>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/6741/steps/14/logs/stdio
>
> I already reported it on the gdb upgrade:
>
> https://lists.openembedded.org/g/openembedded-core/topic/97152035#177576
>
>
> On 22/02/2023 22:58:16-0800, Khem Raj wrote:
> > Use DT_RUNPATH over DT_RPATH. If DT_RUNPATH is present, LD_LIBRARY_PATH is searched before
> > DT_RUNPATH, Search order is DT_RPATH then LD_LIBRARY_PATH then
> > DT_RUNPATH, this order ensures that injecting
> > malicious shared objects is way harder with DT_RUNPATH.
> >
> > This is now default on major linux distributions already
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/binutils/binutils.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> > index b2dbf241df..c69d29448f 100644
> > --- a/meta/recipes-devtools/binutils/binutils.inc
> > +++ b/meta/recipes-devtools/binutils/binutils.inc
> > @@ -96,6 +96,7 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
> >                  --disable-werror \
> >                  --enable-deterministic-archives \
> >                  --enable-plugins \
> > +                --enable-new-dtags \
> >                  --disable-gdb \
> >                  --disable-gdbserver \
> >                  --disable-libdecnumber \
> > --
> > 2.39.2
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#177602): https://lists.openembedded.org/g/openembedded-core/message/177602
> > Mute This Topic: https://lists.openembedded.org/mt/97178429/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

