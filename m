Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBAAECAAD8
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 18:46:46 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.1437.1663094805491704292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BgfhKI5m;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-1278624b7c4so34657495fac.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FZeLVwIeIKZicDCYV7E1JHCX5k/2v1zkxgXbYc2t8RI=;
        b=BgfhKI5mxte2Z/4QE6Cd5ecn2biKPfizDiI2pZlrXImqOygaPM4UUxJZO6hgfh4a9s
         YaX9C6UZUUGbuG8gXjFUqK2kKx6GaWRYUx0rld3QOhqchl0RJ1/iTk7zslBKG5dkdz5u
         tJQzOwkKB8S39fUr0Z1A3+xXlguemH71EygPTQLhHQBNxJxoLwFLxK/dyx6WoVPSymkb
         OBuaxFgR2u8THBj8uTVzFcEJn9MOkCrVVe7zxMiFEaXOF7nMClCK/K5epRZ3d++GHdfq
         dajAcQE5ji61WupBjsymDGfzxR3ZqsZyCO7hKjbaq8FQ2QiwtC11tD13rwrVFfLZbDze
         drhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FZeLVwIeIKZicDCYV7E1JHCX5k/2v1zkxgXbYc2t8RI=;
        b=ziihP8AZGvhyZo0c+/td68SURJf7lWb8L2yiS8oVdf5ETOM+2kxgepFCzhmzJqGbBy
         vTIgTL0emZWPoWB/AD9tqONkuzpy0NUCpWKCi6x34T7SoSow5+X1uJohI6gYi08oOVlA
         jXcL1RVemYJtSKL8IfNoXFgC642DvB2143h1QAtcOGTZ6WUdVJ5vsOnFkOwaQ1T51uKF
         YXk4tVLL3T9xErmEUuyxA2ZFk4Df2B89BcbEOiibTsw/KWDMFHDhGBG7zlu4HzrIW2cY
         sKx/3kwMY6XZ668Ocjdn4+0Kxl++QcoEMx8rKBZFQxnDR74mwl8ktqJl55yW1228YCc3
         3ciw==
X-Gm-Message-State: ACgBeo0eu0y/c/ad7PTH6w/AslHI3I3QzaSnDcWF9A0nOMZGLzMQfFu8
	QgC1mWfDGFjH8oR7jVLdP4q+6ltoF6ZAdniQy6Y=
X-Google-Smtp-Source: 
 AA6agR5Nk8OZhOKeon7D57/WoulIJOWpT3xkO4iXFGzP/ZQZjrw96/PhXVhYauVdzboYdrMoJIfqeQVpY2t96aAYeCs=
X-Received: by 2002:a05:6808:17a6:b0:344:eaa9:24e8 with SMTP id
 bg38-20020a05680817a600b00344eaa924e8mr298460oib.55.1663094804582; Tue, 13
 Sep 2022 11:46:44 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMKF1sqUOiZSP0+NV9LOZ+B4v6tZ_qKmA81XrKTsKqYRtcskig@mail.gmail.com>
 <28994.1663062196921833526@lists.openembedded.org>
 <d96f949e-99f9-82e9-088e-d351327adba9@gmail.com>
 <7cd419c6-f3fc-6ebe-8dee-ee969d26e88a@windriver.com>
In-Reply-To: <7cd419c6-f3fc-6ebe-8dee-ee969d26e88a@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Sep 2022 11:46:18 -0700
Message-ID: 
 <CAMKF1sodC_QPspO2vSfTTjMu9Xen_KMkPaktR_MEZUVtfGWfuQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] binutils: stable 2.38 branch updates
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org,
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
 "steve@sakoman.com" <steve@sakoman.com>,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 18:46:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170606

On Tue, Sep 13, 2022 at 11:42 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2022-09-13 12:59, Khem Raj wrote:
> > On 9/13/22 2:43 AM, Sundeep KOKKONDA wrote:
> >> Hello,
> >> I am planning to take the gcc, glibc & binutils updates to Kirkstone.
> >> I found only the glibc-2.35 branch is having a few updates (given
> >> below).
> >> /f8ad66a4ca nscd: Fix netlink cache invalidation if epoll is used [BZ
> >> #29415]/
> >> /9e960717e1 Apply asm redirections in wchar.h before first use/
> >> /577c2fc7f3 elf: Call __libc_early_init for reused namespaces (bug
> >> 29528)/
> >> /83f1d9851e NEWS: Add entry for bug 28846/
> >> /cbd8685e82 socket: Check lengths before advancing pointer in
> >> CMSG_NXTHDR/
> >> /4bafc4001d alpha: Fix generic brk system call emulation in
> >> __brk_call (bug 29490)/
> >> /37fd2ac665 stdlib: Fixup mbstowcs NULL __dst handling. [BZ #29279]/
> >> /a1ec4157bc stdlib: Remove attr_write from mbstows if dst is NULL
> >> [BZ: 29265]/
> >> /813a8d0171 Update syscall lists for Linux 5.19/
> >> /e200127c6c riscv: Update rv64 libm test ulps/
> >> /8c172a6cb0 dlfcn: Pass caller pointer to static dlopen
> >> implementation (bug 29446)/
>
> Ideally you'd get that in this week since I think that 4.0.4 is being
> built on Monday, September 19th.
>
> CCing Steve in case he missed this thread.
>
>
> >> The binutils-2.38 has no new commits. And, gcc-11.x also not have any
> >> new release after 11.3.
>
> That's good to know. I was just wondering if there was going to be
> gcc-11.4 so this info is timely.

11.4 would be next sprint or early summer of 2023

>
>
> >> In /master/ branch gcc_12.2, glibc_2.36 & binutils_2.39 versions are
> >> used. Kirkstone will continue to use the old versions?
>
>
> To answer this more directly than Khem. ;-)
>
> The Kirkstone branch will NOT update to the versions shown above. Users
> want a stable version
>
> for the supported timeline of a release; some even may be surprised that
> we update from 11.2 to 11.3
> even if it's all bug fixes.
>
>
> >>
> >
> > the glibc fixes are good so go ahead bump the SRCREV to latest on 2.35
> > branch
>
> Agreed.
>
>
> >  major version backports are exceptions. We can consider doing mixin
> > layers if needed for say newer compiler.
>
>
> Answered above.
>
> Thanks Sundeep!
>
> ../Randy
>
>
> >
> >>
> >>
> >> Thanks,
> >> Sundeep K.
> >>
> >>
> >>
> >>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#170603): https://lists.openembedded.org/g/openembedded-core/message/170603
> > Mute This Topic: https://lists.openembedded.org/mt/92739561/3616765
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
> --
> # Randy MacLeod
> # Wind River Linux
>

