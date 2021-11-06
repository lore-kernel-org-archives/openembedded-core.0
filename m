Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FB6C433EF
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 00:54:18 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.13946.1636160056911298600
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 17:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iBiqUwA8;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id bl12so10248236qkb.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 17:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SM32kzD4XjeBjGQE/CLKzP0d4rgqhdfDrgdU76NJM3A=;
        b=iBiqUwA8wCWtRju8Iwu4zJhQXkxCZRkT0XqvMv1kJ0p9W0dLwWw3DDNR32M5jwULZT
         8dT3f8rcl32ZKPP/n/3b78eXaE+5zSTIj2vqUmnXnyA+Kcha6cHfhAiJVebN4zBBx9Mw
         fPiYxt/JrdOk5XXp7R3Up6Gr0w3lL0uIVG71UYKXnWNCesQkXulojHwai4KxIO7imzZ5
         f2DOQp3RAdw6yaMqZFfqidGMGbahyUqlkAEgEJI68oVtG13o31Y6wjIko5knkaV4s/Lp
         7MXrWeXx5WHD4GARWr4NZlqGxCiodR5OsdbYRmJzeSvP6hIGz94R50GYCkYsDXM90Dix
         X8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SM32kzD4XjeBjGQE/CLKzP0d4rgqhdfDrgdU76NJM3A=;
        b=DU0GMNO3zC0/Hm+TChv8Zb7B5yJFbV2Wc/LQCHCaKNWVel34v0GU5afZsz5LijFE4z
         PdZK7+zap0AWMbgS9MS4MfXmzto6d2/B5Mf60pNJmPhpW9Uhv/SS6YerNi1e1SY2fFEc
         gw/8IL47Rux1Mb5ihwHhaeu77EoKfEXi0RKzvfRffj4bGgvoWqbV2GATJaO08ax9Vj6W
         +T+CdjkdC+kkfcPvQxMrS0oHgblZfXsZJoHAhw/6pvetnCcZ4iefqe73cEMZCFU8+nAV
         dc3scmBjPyXpf8l1egWtxQ+XaFTu43W36rzOAG0p5MsXfJ8sgR1Xlk1CsIn+iBw6ZQ3e
         2Lfw==
X-Gm-Message-State: AOAM531luqS9B4J8kUSkQxcUU8A2j5JtfczB2zmtXvi/47IqWEjLqJlK
	aGXwKEVnWn4agsC3zyLZtyTptXiCQUUhI8Dq5IXCb4OsL+E=
X-Google-Smtp-Source: 
 ABdhPJy6bAdutIuuFf0/IAj3sAae5nHM87LavykFx5PbIc1VnJTuiFl8rF27xSrC7ByIC8eQJLzG1hrDx+TTTa+KqSE=
X-Received: by 2002:ae9:eb91:: with SMTP id
 b139mr10650075qkg.98.1636160055860;
 Fri, 05 Nov 2021 17:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211104013024.3517635-1-raj.khem@gmail.com>
 <4f0010a081d65b32d7f883aa1c04fb696884200c.camel@linuxfoundation.org>
 <CAMKF1sppVQ1R56qR03UkqGzz8QWhevX-1CJ=tpWzPEDtK+ZXJA@mail.gmail.com>
 <47e38a73464f82ce9aacfe6d772886a2e335be30.camel@linuxfoundation.org>
In-Reply-To: 
 <47e38a73464f82ce9aacfe6d772886a2e335be30.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Nov 2021 17:53:50 -0700
Message-ID: 
 <CAMKF1sqTAU76suuf6ncW4OVUPaq58HwjFx5+37jZ6Hf2pSFQ4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] gdb: Upgrade to 11.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Joshua Watt <JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Nov 2021 00:54:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157932

On Fri, Nov 5, 2021 at 12:57 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2021-11-05 at 09:51 -0700, Khem Raj wrote:
> > On Fri, Nov 5, 2021 at 4:19 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Wed, 2021-11-03 at 18:30 -0700, Khem Raj wrote:
> > > > Drop backported patches
> > > > Changes are here [1]
> > > >
> > > > [1] https://sourceware.org/pipermail/gdb-announce/2021/000129.html
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/conf/distro/include/tcmode-default.inc   |   2 +-
> > > >  .../gdb/{gdb-10.2.inc => gdb-11.1.inc}        |  14 +-
> > > >  ...ian_10.2.bb => gdb-cross-canadian_11.1.bb} |   0
> > > >  .../{gdb-cross_10.2.bb => gdb-cross_11.1.bb}  |   0
> > > >  ...make-man-install-relative-to-DESTDIR.patch |  20 +-
> > > >  ...ux-nat-Define-_ABIO32-if-not-defined.patch |   8 +-
> > > >  ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  10 +-
> > > >  ...port-for-Renesas-SH-sh4-architecture.patch |  39 +-
> > > >  ...readline.a-when-using-disable-static.patch |  12 +-
> > > >  .../gdb/gdb/0006-use-asm-sgidefs.h.patch      |   8 +-
> > > >  ...atch => 0007-Change-order-of-CFLAGS.patch} |  12 +-
> > > >  ...8-resolve-restrict-keyword-conflict.patch} |   8 +-
> > > >  ...> 0009-Fix-invalid-sigprocmask-call.patch} |   8 +-
> > > >  ...h => 0010-gdbserver-ctrl-c-handling.patch} |  10 +-
> > > >  ...-arc-Add-support-for-signal-handlers.patch | 218 ---------
> > > >  ...-for-signal-frames-for-Linux-targets.patch | 232 ----------
> > > >  ...count-the-REGNUM-in-supply-collect-g.patch | 104 -----
> > > >  ...-native-support-for-ARC-in-GNU-Linux.patch | 414 ------------------
> > > >  .../gdb/{gdb_10.2.bb => gdb_11.1.bb}          |   0
> > > >  19 files changed, 74 insertions(+), 1045 deletions(-)
> > > >  rename meta/recipes-devtools/gdb/{gdb-10.2.inc => gdb-11.1.inc} (56%)
> > > >  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_10.2.bb => gdb-cross-canadian_11.1.bb} (100%)
> > > >  rename meta/recipes-devtools/gdb/{gdb-cross_10.2.bb => gdb-cross_11.1.bb} (100%)
> > > >  rename meta/recipes-devtools/gdb/gdb/{0008-Change-order-of-CFLAGS.patch => 0007-Change-order-of-CFLAGS.patch} (75%)
> > > >  rename meta/recipes-devtools/gdb/gdb/{0009-resolve-restrict-keyword-conflict.patch => 0008-resolve-restrict-keyword-conflict.patch} (91%)
> > > >  rename meta/recipes-devtools/gdb/gdb/{0010-Fix-invalid-sigprocmask-call.patch => 0009-Fix-invalid-sigprocmask-call.patch} (90%)
> > > >  rename meta/recipes-devtools/gdb/gdb/{0011-gdbserver-ctrl-c-handling.patch => 0010-gdbserver-ctrl-c-handling.patch} (82%)
> > > >  delete mode 100644 meta/recipes-devtools/gdb/gdb/0012-arc-Add-support-for-signal-handlers.patch
> > > >  delete mode 100644 meta/recipes-devtools/gdb/gdb/0013-arc-Add-support-for-signal-frames-for-Linux-targets.patch
> > > >  delete mode 100644 meta/recipes-devtools/gdb/gdb/0014-arc-Take-into-account-the-REGNUM-in-supply-collect-g.patch
> > > >  delete mode 100644 meta/recipes-devtools/gdb/gdb/0015-gdb-Add-native-support-for-ARC-in-GNU-Linux.patch
> > > >  rename meta/recipes-devtools/gdb/{gdb_10.2.bb => gdb_11.1.bb} (100%)
> > >
> > > Breaks on mingw:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4299
> > >
> >
> > I see
> >
> > > sys-linux.c:140:10: fatal error: linux/ipx.h: No such file or directory
> > >   140 | #include <linux/ipx.h>
> > >       |          ^~~~~~~~~~~~~
> > > compilation terminated.
> > > make[1]: *** [<builtin>: sys-linux.o] Error 1
> > > make[1]: Leaving directory
> > '/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/ppp/2.4.9-r0/ppp-2.4.9/pppd'
> >
> > perhaps wrong link ?
>
> Sorry, https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4293
>

sent a fix to ml and also queued a build :)

https://autobuilder.yoctoproject.org/typhoon/#/buildrequests/238205

> Cheers,
>
> Richard
>
>

