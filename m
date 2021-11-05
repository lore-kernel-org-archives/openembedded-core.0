Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FF8C433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 16:51:57 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.8368.1636131116256386149
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 09:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h2Yr7/ix;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id w9so2616567qtk.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 09:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lwaIH1pqq4PlEA39gIjLnlZ5hso7sdLZzN7R9IKEfAU=;
        b=h2Yr7/ixEzEpRRHRfImvEQHf/9sIXHUrxOLI+l8i1MH4zcoCUjzYIFXbcyxEbd4o79
         dAokVuTYy0t/Vj3evtzIFSLl8mf6eWG3yA9gtOtpRNFG7HFgWi6hNkPqePGZe9ygYQO8
         r56E58MEr/HBqLif2wdecctQneSV1Wol0j45ZS2uQPho35FF530b0hAg+Eaqn0uayKG1
         oPmF5N6fDSMy1OMEgu8AGTDuHALD4pXoCBhxDgguTEnxRpzr3dHtWAHCBZQzIPBtDWbg
         XZ3Y0fXai2rMdEDoeNq//ok6MaVpC2BswoyJpxCJ/3CHwOjzQonDh7R1OS21pa2Eo6H4
         n5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lwaIH1pqq4PlEA39gIjLnlZ5hso7sdLZzN7R9IKEfAU=;
        b=oC+37GINWdSt6Wc78SrQTwp1NHUnBqhTnxPAAeVSk1pRprzEs7mxZZmOewn6fNdAcT
         JyJFDgCV1KlJCCDEbUtmhekG7AH8Ho9d/6zqBZTaRrjAzMymejISXINbnsuO1A2ZZ2US
         RFCmCByFVF12o4MC/W3C9pj8HCMBCg4bnD/nZgufShze1uofUlk/0vVhrQ2dlazUE8VK
         ZRPHbfQHq9XE74/ASP2Pui1U/Ywnv4Y9JZEP2A8nB9Mf5R4KN0Vlh8KzRvqtbfqfjv06
         cjLHJRe+GTdmpeXXU54bVPHlEOmHIjMh5b3Rf6+wrzhCclAbmJ2nYR+zijo0Hb4dwWO5
         0img==
X-Gm-Message-State: AOAM532L473tubd0vI6sX26YmR7jbkOiJ2LeUofaSD5ww1UMTMFbNrUp
	oCyUTApna51p13OrH5mO667PBkRZO44M0kHr/7A=
X-Google-Smtp-Source: 
 ABdhPJzNoDGaolOidgGiSL6XQf1Khb2t3la/miklYw9qFENv+TURoSnq2WNlLyqgXtGPRCDONm2bR6vzu9xLz6mtXj8=
X-Received: by 2002:a05:622a:58e:: with SMTP id
 c14mr59498469qtb.225.1636131115258;
 Fri, 05 Nov 2021 09:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211104013024.3517635-1-raj.khem@gmail.com>
 <4f0010a081d65b32d7f883aa1c04fb696884200c.camel@linuxfoundation.org>
In-Reply-To: 
 <4f0010a081d65b32d7f883aa1c04fb696884200c.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Nov 2021 09:51:29 -0700
Message-ID: 
 <CAMKF1sppVQ1R56qR03UkqGzz8QWhevX-1CJ=tpWzPEDtK+ZXJA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] gdb: Upgrade to 11.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Joshua Watt <JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 16:51:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157911

On Fri, Nov 5, 2021 at 4:19 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-11-03 at 18:30 -0700, Khem Raj wrote:
> > Drop backported patches
> > Changes are here [1]
> >
> > [1] https://sourceware.org/pipermail/gdb-announce/2021/000129.html
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/distro/include/tcmode-default.inc   |   2 +-
> >  .../gdb/{gdb-10.2.inc => gdb-11.1.inc}        |  14 +-
> >  ...ian_10.2.bb => gdb-cross-canadian_11.1.bb} |   0
> >  .../{gdb-cross_10.2.bb => gdb-cross_11.1.bb}  |   0
> >  ...make-man-install-relative-to-DESTDIR.patch |  20 +-
> >  ...ux-nat-Define-_ABIO32-if-not-defined.patch |   8 +-
> >  ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  10 +-
> >  ...port-for-Renesas-SH-sh4-architecture.patch |  39 +-
> >  ...readline.a-when-using-disable-static.patch |  12 +-
> >  .../gdb/gdb/0006-use-asm-sgidefs.h.patch      |   8 +-
> >  ...atch => 0007-Change-order-of-CFLAGS.patch} |  12 +-
> >  ...8-resolve-restrict-keyword-conflict.patch} |   8 +-
> >  ...> 0009-Fix-invalid-sigprocmask-call.patch} |   8 +-
> >  ...h => 0010-gdbserver-ctrl-c-handling.patch} |  10 +-
> >  ...-arc-Add-support-for-signal-handlers.patch | 218 ---------
> >  ...-for-signal-frames-for-Linux-targets.patch | 232 ----------
> >  ...count-the-REGNUM-in-supply-collect-g.patch | 104 -----
> >  ...-native-support-for-ARC-in-GNU-Linux.patch | 414 ------------------
> >  .../gdb/{gdb_10.2.bb => gdb_11.1.bb}          |   0
> >  19 files changed, 74 insertions(+), 1045 deletions(-)
> >  rename meta/recipes-devtools/gdb/{gdb-10.2.inc => gdb-11.1.inc} (56%)
> >  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_10.2.bb => gdb-cross-canadian_11.1.bb} (100%)
> >  rename meta/recipes-devtools/gdb/{gdb-cross_10.2.bb => gdb-cross_11.1.bb} (100%)
> >  rename meta/recipes-devtools/gdb/gdb/{0008-Change-order-of-CFLAGS.patch => 0007-Change-order-of-CFLAGS.patch} (75%)
> >  rename meta/recipes-devtools/gdb/gdb/{0009-resolve-restrict-keyword-conflict.patch => 0008-resolve-restrict-keyword-conflict.patch} (91%)
> >  rename meta/recipes-devtools/gdb/gdb/{0010-Fix-invalid-sigprocmask-call.patch => 0009-Fix-invalid-sigprocmask-call.patch} (90%)
> >  rename meta/recipes-devtools/gdb/gdb/{0011-gdbserver-ctrl-c-handling.patch => 0010-gdbserver-ctrl-c-handling.patch} (82%)
> >  delete mode 100644 meta/recipes-devtools/gdb/gdb/0012-arc-Add-support-for-signal-handlers.patch
> >  delete mode 100644 meta/recipes-devtools/gdb/gdb/0013-arc-Add-support-for-signal-frames-for-Linux-targets.patch
> >  delete mode 100644 meta/recipes-devtools/gdb/gdb/0014-arc-Take-into-account-the-REGNUM-in-supply-collect-g.patch
> >  delete mode 100644 meta/recipes-devtools/gdb/gdb/0015-gdb-Add-native-support-for-ARC-in-GNU-Linux.patch
> >  rename meta/recipes-devtools/gdb/{gdb_10.2.bb => gdb_11.1.bb} (100%)
>
> Breaks on mingw:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4299
>

I see

| sys-linux.c:140:10: fatal error: linux/ipx.h: No such file or directory
|   140 | #include <linux/ipx.h>
|       |          ^~~~~~~~~~~~~
| compilation terminated.
| make[1]: *** [<builtin>: sys-linux.o] Error 1
| make[1]: Leaving directory
'/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/ppp/2.4.9-r0/ppp-2.4.9/pppd'

perhaps wrong link ?

> Cheers,
>
> Richard
>

