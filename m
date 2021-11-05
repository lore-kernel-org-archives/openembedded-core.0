Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007F4C433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 19:57:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.10795.1636142268625094736
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 12:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W2Ul/ksN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id d5so15442786wrc.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 12:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=51TYez9jRJc2QgSkH2fie2G1Rui5CUpjKYeRZGE9eR4=;
        b=W2Ul/ksNidIxN5rJYxBPMTCLSO/DDPD3vg8XhTIf2EfUjOHgHyumMCVc4r04o49iNC
         1CBw0l2FTizGcZS4eFjuekXKFtqykAMS+gndgNhvRuWNExaSHW0pHBupMykqnlfxCAOk
         GveEmD7gkE5LAC4+CKB2K5e+tlv0UbVINyQoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=51TYez9jRJc2QgSkH2fie2G1Rui5CUpjKYeRZGE9eR4=;
        b=74kMfQ1MDr5tqF05gQhflpIXSkKZ03ND0fQNvqsakKmZ5Q0JjQxqSaS0om32xOS6Mi
         SC6iUMscoEjyjB9QzOGI6/h372S4hft0KFKVCZqcRU8LHFyiQXV3M1YzIIjAD2MjEOJt
         VrkV8ivLSK9LWb9f2a6GlCZJZ/heyRg0rfBuj8L/Uu5WC29oSnjFbyTX86dtvm5kx5kO
         f1zNglJRJtNeiA46BxdIFCn4MmN7EG8or5s7G/kt/Ud4bC0lVl0kFbRWfRWSgG3w3M2j
         36s5W5kc+wM6W1Q7EYteVfIU7gcYon26lfrSAqBuVpuK3P4ZWaZn7XeUFKTmI+DZuGot
         2rTg==
X-Gm-Message-State: AOAM532fwm64JAfnarIxwU1jqfNMLwQvtZXvwfrDuTP22/HC091zenDp
	S3m7Xu02PPt59meeOfJgDTLKrQ==
X-Google-Smtp-Source: 
 ABdhPJySG4FyTK1M0L91nPbKoWkj6dgPcna2shfiDFQEMEu74wGiwYPrL8pD36uRXyJt4+djInOOQA==
X-Received: by 2002:a5d:51cf:: with SMTP id
 n15mr67308429wrv.106.1636142267095;
        Fri, 05 Nov 2021 12:57:47 -0700 (PDT)
Received: from hex.config (5751ab90.skybroadband.com. [87.81.171.144])
        by smtp.gmail.com with ESMTPSA id
 a134sm9138021wmd.9.2021.11.05.12.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 12:57:46 -0700 (PDT)
Message-ID: 
 <47e38a73464f82ce9aacfe6d772886a2e335be30.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] gdb: Upgrade to 11.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Joshua Watt
 <JPEWhacker@gmail.com>
Date: Fri, 05 Nov 2021 19:57:45 +0000
In-Reply-To: 
 <CAMKF1sppVQ1R56qR03UkqGzz8QWhevX-1CJ=tpWzPEDtK+ZXJA@mail.gmail.com>
References: <20211104013024.3517635-1-raj.khem@gmail.com>
	 <4f0010a081d65b32d7f883aa1c04fb696884200c.camel@linuxfoundation.org>
	 <CAMKF1sppVQ1R56qR03UkqGzz8QWhevX-1CJ=tpWzPEDtK+ZXJA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 19:57:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157927

On Fri, 2021-11-05 at 09:51 -0700, Khem Raj wrote:
> On Fri, Nov 5, 2021 at 4:19 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Wed, 2021-11-03 at 18:30 -0700, Khem Raj wrote:
> > > Drop backported patches
> > > Changes are here [1]
> > > 
> > > [1] https://sourceware.org/pipermail/gdb-announce/2021/000129.html
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/conf/distro/include/tcmode-default.inc   |   2 +-
> > >  .../gdb/{gdb-10.2.inc => gdb-11.1.inc}        |  14 +-
> > >  ...ian_10.2.bb => gdb-cross-canadian_11.1.bb} |   0
> > >  .../{gdb-cross_10.2.bb => gdb-cross_11.1.bb}  |   0
> > >  ...make-man-install-relative-to-DESTDIR.patch |  20 +-
> > >  ...ux-nat-Define-_ABIO32-if-not-defined.patch |   8 +-
> > >  ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  10 +-
> > >  ...port-for-Renesas-SH-sh4-architecture.patch |  39 +-
> > >  ...readline.a-when-using-disable-static.patch |  12 +-
> > >  .../gdb/gdb/0006-use-asm-sgidefs.h.patch      |   8 +-
> > >  ...atch => 0007-Change-order-of-CFLAGS.patch} |  12 +-
> > >  ...8-resolve-restrict-keyword-conflict.patch} |   8 +-
> > >  ...> 0009-Fix-invalid-sigprocmask-call.patch} |   8 +-
> > >  ...h => 0010-gdbserver-ctrl-c-handling.patch} |  10 +-
> > >  ...-arc-Add-support-for-signal-handlers.patch | 218 ---------
> > >  ...-for-signal-frames-for-Linux-targets.patch | 232 ----------
> > >  ...count-the-REGNUM-in-supply-collect-g.patch | 104 -----
> > >  ...-native-support-for-ARC-in-GNU-Linux.patch | 414 ------------------
> > >  .../gdb/{gdb_10.2.bb => gdb_11.1.bb}          |   0
> > >  19 files changed, 74 insertions(+), 1045 deletions(-)
> > >  rename meta/recipes-devtools/gdb/{gdb-10.2.inc => gdb-11.1.inc} (56%)
> > >  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_10.2.bb => gdb-cross-canadian_11.1.bb} (100%)
> > >  rename meta/recipes-devtools/gdb/{gdb-cross_10.2.bb => gdb-cross_11.1.bb} (100%)
> > >  rename meta/recipes-devtools/gdb/gdb/{0008-Change-order-of-CFLAGS.patch => 0007-Change-order-of-CFLAGS.patch} (75%)
> > >  rename meta/recipes-devtools/gdb/gdb/{0009-resolve-restrict-keyword-conflict.patch => 0008-resolve-restrict-keyword-conflict.patch} (91%)
> > >  rename meta/recipes-devtools/gdb/gdb/{0010-Fix-invalid-sigprocmask-call.patch => 0009-Fix-invalid-sigprocmask-call.patch} (90%)
> > >  rename meta/recipes-devtools/gdb/gdb/{0011-gdbserver-ctrl-c-handling.patch => 0010-gdbserver-ctrl-c-handling.patch} (82%)
> > >  delete mode 100644 meta/recipes-devtools/gdb/gdb/0012-arc-Add-support-for-signal-handlers.patch
> > >  delete mode 100644 meta/recipes-devtools/gdb/gdb/0013-arc-Add-support-for-signal-frames-for-Linux-targets.patch
> > >  delete mode 100644 meta/recipes-devtools/gdb/gdb/0014-arc-Take-into-account-the-REGNUM-in-supply-collect-g.patch
> > >  delete mode 100644 meta/recipes-devtools/gdb/gdb/0015-gdb-Add-native-support-for-ARC-in-GNU-Linux.patch
> > >  rename meta/recipes-devtools/gdb/{gdb_10.2.bb => gdb_11.1.bb} (100%)
> > 
> > Breaks on mingw:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4299
> > 
> 
> I see
> 
> > sys-linux.c:140:10: fatal error: linux/ipx.h: No such file or directory
> >   140 | #include <linux/ipx.h>
> >       |          ^~~~~~~~~~~~~
> > compilation terminated.
> > make[1]: *** [<builtin>: sys-linux.o] Error 1
> > make[1]: Leaving directory
> '/home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/ppp/2.4.9-r0/ppp-2.4.9/pppd'
> 
> perhaps wrong link ?

Sorry, https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4293

Cheers,

Richard



