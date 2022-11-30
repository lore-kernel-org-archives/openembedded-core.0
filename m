Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC78BC4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 16:10:04 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.15461.1669824599744880559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 08:09:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nz3pJ/xB;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id j6-20020a4ab1c6000000b004809a59818cso2693200ooo.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 08:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zWtYy/ziGDVjTPEgmu3vU2pvFWvQAnjFu0k+4sJusO4=;
        b=Nz3pJ/xBjfmQcr9DwKus+WqcxidX4QXUKQhj5MNny047xm9OBZ7dZPBz9tjL358Kxe
         u7a/yrMVGPRLx5byNJtOMDdnXU9yqu1L04krB8ve+vhNGN+4uOJzfplBe1d9nX04O9JZ
         bQeOwDtP6I4KosSU6xmr2spRKA0uv9tC+i7IedHXmvUjwKoMBQw45aeF/Dt61ocW+6Ti
         JmHcFxiKoJutifHer1LZg4eGzD5XmycLUPk32Ov9bik/qER6RZMWl4SOpLnNUJDMItnl
         iJ9awqxTbk2AKdqEY1fEgE6F67FL4V+xjzVoIMJUHf+P/W1IbKY84GRY+WwtqwOpS9xi
         e7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWtYy/ziGDVjTPEgmu3vU2pvFWvQAnjFu0k+4sJusO4=;
        b=PAY9DzS2SM9BCZN2ErlGr9PUuV4xoLKmj6T1Cw/tmtY6YqPi7cl9dFAAanaIy+aymB
         DaK5z0Os8weftxTC6DBHPEW2UY5cMKYClbVcgWDg6IEpy1DTRKG6q+xhR5x89/DmCFwA
         XK8pt0+OT8Xnn9Bx1jjeS2zCpmNCNsZzP74adGntWzJf6ZN9NW/XuWCsICRRgh6S4xwT
         DgFnBDGoNb1nwGb3EpVirnfEsibTns+VfwWF0PhFOUwD+a/U8ShPvRYlMSz4V2Vhs3q3
         2CX24csQmm+OW2ddnhhnRf2CrqLclRcZ+qlZBnOMBpNtgc/27EJkvRj07Zxd0oywBBdU
         PvUw==
X-Gm-Message-State: ANoB5pkh4/eJUHWwbGu4o8Ml80yDlOc1hz36hl1oWYFvlVbUODevL8fs
	L0uuY8YsUOFrWvVQF8MVHzHSYQf8CadsQZ0AykFBMj1c
X-Google-Smtp-Source: AA0mqf6Q3i14sOg+xq8R+ZqirJE9AcrwQmeKEMNTWR9yCy604rodF58sjfjB/VYjdF7xCuhjb+Q36B1TGTlU/iZSfSw=
X-Received: by 2002:a4a:e8c9:0:b0:4a0:4db7:fabe with SMTP id
 h9-20020a4ae8c9000000b004a04db7fabemr7883181ooe.73.1669824598805; Wed, 30 Nov
 2022 08:09:58 -0800 (PST)
MIME-Version: 1.0
References: <20221128191804.51591-1-raj.khem@gmail.com> <Y4dtUJH7tdNLey9w@mail.local>
In-Reply-To: <Y4dtUJH7tdNLey9w@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Nov 2022 08:09:32 -0800
Message-ID: <CAMKF1soUobg9v3bY0J_NZOJ1UUEFoRX5RxmexsH121ou0xoTpg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] musl: Update to latest on tip of trunk
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 16:10:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174022

On Wed, Nov 30, 2022 at 6:48 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> This broke a few recipes:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/6247/steps/12/logs/stdio
>
> I guess this is dues to the LFS64 changes

yes indeed. I have some WIP on yoe/mut branch. Lets wait for some time
until fixing these packages.

>
> On 28/11/2022 11:18:04-0800, Khem Raj wrote:
> > Brings following changes
> >
> > * 8f925945 fix return value of gethostby{name[2],addr} with no result but no error
> > * 63402be2 clean up dns_parse_callback
> > * 0a7b4323 dns response handling: don't treat too many addresses as an error
> > * 41603c77 dns response handling: ignore presence of wrong-type RRs
> > * cf76df0e fix missing synchronization of pthread TSD keys with MT-fork
> > * 5ff3eea9 fgets: avoid arithmetic overflow when n==INT_MIN is passed
> > * d8f35e29 fix AS-safety of close when aio is in use and fd map is expanded
> > * 26c76a90 fix use of uninitialized dummy_fut in aio_suspend
> > * aebd6a36 fix potential deadlock between multithreaded fork and aio
> > * d64148a8 fix potential unsynchronized access to killlock state at thread exit
> > * 36b72cd6 fix potential deadlock in dlerror buffer handling at thread exit
> > * 833a4691 configure: disable TBAA optimization because most compilers are buggy
> > * e6e82132 disable MADV_FREE usage in mallocng
> > * 25e6fee2 remove LFS64 programming interfaces (macro-only) from _GNU_SOURCE
> > * 246f1c81 remove LFS64 symbol aliases; replace with dynamic linker remapping
> > * dec8f0a4 dns query core: detect udp truncation at recv time
> > * 8c408937 getaddrinfo dns lookup: use larger answer buffer to handle long CNAMEs
> > * 759bf785 arpa/nameser.h: update RR types list
> > * 51d4669f dns: implement tcp fallback in __res_msend query core
> > * e2e95176 res_send: use a temp buffer if caller's buffer is under 512 bytes
> > * c87d75f2 adapt res_msend DNS query core for working with multiple sockets
> > * 85050ac5 getaddrinfo: add EAI_NODATA error code to distinguish NODATA vs NxDomain
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/musl/musl_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> > index a72d87ea6f..29abd17771 100644
> > --- a/meta/recipes-core/musl/musl_git.bb
> > +++ b/meta/recipes-core/musl/musl_git.bb
> > @@ -4,7 +4,7 @@
> >  require musl.inc
> >  inherit linuxloader
> >
> > -SRCREV = "dc9285ad1dc19349c407072cc48ba70dab86de45"
> > +SRCREV = "8f9259450aa43a6fd539e428e61e2961b725fbae"
> >
> >  BASEVER = "1.2.3"
> >
> > --
> > 2.38.1
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#173942): https://lists.openembedded.org/g/openembedded-core/message/173942
> > Mute This Topic: https://lists.openembedded.org/mt/95318179/3617179
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

