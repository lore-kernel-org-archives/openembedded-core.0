Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D898C433FE
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:23 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.926.1639600150616959158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 12:29:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=gT9+jqVK;
 spf=pass (domain: madison.systems, ip: 209.85.208.169,
 mailfrom: matt@madison.systems)
Received: by mail-lj1-f169.google.com with SMTP id k23so35154576lje.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 12:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FG6BpL1QNXNgwivyCcpE22o3crCvrxBHPnb4tRH0wiI=;
        b=gT9+jqVKhFnWRuk76VPbQmUkXAhQgTVJrc+uDERlAB5Wg4wL9/qI6HFPPjE6Ac37Qe
         MdbQiFIej+jFysGRafQy6Ni93sXgHneQiL/zwEp55sazV6LfzpE8Dabn8a5LeGbnI+Yi
         c/7+oPZhwCeHA7aSMbh8Y/bTIY+9LiTOCpmGOlBMfuRAXs8KeYXCCeZMs2fi7PqbQSid
         8auOI3ITZGjezNvQsnkHJSn3jQ1/7BIPvfbcq9yUfWBS7Zgo58a5JxacJEERWJGo1jf8
         o50Jxr6XFZVo89F8VcTrza/5K3bC7xsvI10inshvQ4mjcoBiHzxgEjIvKDdnTcKlSudW
         netw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FG6BpL1QNXNgwivyCcpE22o3crCvrxBHPnb4tRH0wiI=;
        b=r6sFthoYDGj3O6z0V9pg1Vou+LRqKeTt8mnpYdWgKbFcNq0R6c3qbIgNcpWh19xcDC
         zru+ef+C8UlmoixQADI52d5rKJCp0Ti8eqrbeJR6xWFM4N0FwLLPEQc288yfJT6R5nDi
         eHmAxBRNXsUaYaWfnEEhUcPMqoMTKWMamOc2p6W37TLC7wuYWTfcl05FREtJkQCHO+nn
         P1oejiCkCvv8IM71FRPB4ulFKZVPTMgkexMpL5sXjQ7cIZjOHultIt+U6R81p+iOTeoc
         NO9INjvWmEdjguJAuppcTBvvzEHCNRq7JW4mxErCMIBfdRFVOpRy8M+SQJLWB/BqpdMo
         dpiA==
X-Gm-Message-State: AOAM5332ZQMPak80edM2ql7roXy8PtdflCelMgogGe0mDMxdyX5cqjK/
	7QBlzWhV2+xpn8XkuBQu9MQxnq2F+KGYjllx0Mmbpg==
X-Google-Smtp-Source: 
 ABdhPJxjGCUtITNOhTRt4ELy483ynwMmN0yXVDsHFLONKiM+qDI6gJ1sa9Br+UkWGNZlsfbXQlm9nvbphS9lD+BKzD4=
X-Received: by 2002:a2e:98c6:: with SMTP id s6mr12208686ljj.49.1639600148667;
 Wed, 15 Dec 2021 12:29:08 -0800 (PST)
MIME-Version: 1.0
References: <20211215201615.536707-1-matt@madison.systems>
 <4b84e786-7592-1b7d-be0a-d8804ed7a607@gmail.com>
In-Reply-To: <4b84e786-7592-1b7d-be0a-d8804ed7a607@gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Wed, 15 Dec 2021 12:28:57 -0800
Message-ID: 
 <CAGgRHJr4CxabpEiOhB6XGzskMY4WZpM+peMB+P=X3zw2kkceUw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu.bbclass: drop OLDEST_KERNEL reference
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159742

On Wed, Dec 15, 2021 at 12:24 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 12/15/21 12:16 PM, Matt Madison wrote:
> > which is introducing task hash changes for some
> > allarch package builds, and should no longer
> > be needed with recent versions of qemu.
> >
>
> This would need a qemu backport for riscv32
> https://lists.nongnu.org/archive/html/qemu-riscv/2021-12/msg00220.html

Thanks, Khem.  I'll publish a V2 with that addition.

-Matt

>
> > Signed-off-by: Matt Madison <matt@madison.systems>
> > ---
> >   meta/classes/qemu.bbclass | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> > index 01a7b86ae1..333202b7c4 100644
> > --- a/meta/classes/qemu.bbclass
> > +++ b/meta/classes/qemu.bbclass
> > @@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
> >   # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
> >   # qemu-arm default CPU supports all required architecture levels.
> >
> > -QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> > +QEMU_OPTIONS = "${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> >   QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
> >
> >   QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"

