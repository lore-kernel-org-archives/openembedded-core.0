Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B34FC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 10:15:11 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web12.1765.1667816107770560121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 02:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UE9xP9kI;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id c1so14424332lfi.7
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 02:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rSFRyoZKIqqAA0rKSBCKkAGFRCbPKG58SBO9t2uYa+g=;
        b=UE9xP9kIcipSdo56k8USEzTSinjJGZUMVSrmJ0nQ8t0D1CPnFpvqnUD1JyvvNYBFXo
         VZVi1I/LBTNLFQ8W83bgftZSYxPawpuQ/5xLzi+BI2y0eJ+PBQccrKwT/RLLKIVd7zeG
         li04NC4dInp0KFqhpV6RY3Ta/ZKpbnDtEk2VhCwjQpy/km/8HsUgZzrqsezKRdRmN2h9
         tu3TA5c0xGT2vZ9zaYLbZpSrpeWHAu8TbzHsdopaOwvMPuY39BVhMXIm8EGPF6qXJHz/
         tJ1HVQ0VgS7Vh9cusAw7uQRgGPNxwIxCIRpr7SkQ6SVCvsWvluZ4rWUe/PaDBd/jm70r
         153g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSFRyoZKIqqAA0rKSBCKkAGFRCbPKG58SBO9t2uYa+g=;
        b=WvKQ1ewKsP2J7k213mVK2asTgQkYw1ugb+XjthqixfHTjdqSBGC4hvgIMhw/VowG9i
         yrtaxhtNZE2BJy+aUs5F/PZXYdvxm23pCCKungK1AudPmE0UOnoIykhQZXzXyiYMcvVa
         p1+dUq4V0SJRBMnU1yAy3ge+d19POEoK9wqwd0r/fAWaV90r8t7RrH/WjLpXdRyrdAct
         qrNydUef6QWzTOWWQeVuTOTBYLXrG5SkXz3+kuMlx0cpVqhSdbNwRofuvGlktZmn9TNW
         R4wYTa+z4aX11L+YLcEiTAv95sAbymyQNdq4GFn5W738lD09lpoVE1abf2kqFiZ91o6Q
         6hbQ==
X-Gm-Message-State: ACrzQf0g3FzvXGxVDjIxjHyDoPSsIDIOpblyIPg2lmeQ00wlLNFx/cW5
	+ypgdiNfNpB0Nil8jIOiywE8mOJgctACaTtm0l4=
X-Google-Smtp-Source: AMsMyM6Vi8FGMwJUbKG9Y2QulvPqzk3AefGCLIrSe/MLsW95xJ2kxc/axGCw5zDVWX8s/eVZdgQQ3EerHD/9cML9IT8=
X-Received: by 2002:a05:6512:4016:b0:4a4:6edb:8d6e with SMTP id
 br22-20020a056512401600b004a46edb8d6emr18972187lfb.393.1667816105913; Mon, 07
 Nov 2022 02:15:05 -0800 (PST)
MIME-Version: 1.0
References: <20221103104255.1120494-1-luca.boccassi@gmail.com>
 <Y2fUd0wqwdSpy48Z@mail.local> <CAMw=ZnT1aOF4-5C9013uEkD2pPV32xZ1DHMngw-YJ9=5tx0pAQ@mail.gmail.com>
In-Reply-To: <CAMw=ZnT1aOF4-5C9013uEkD2pPV32xZ1DHMngw-YJ9=5tx0pAQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Nov 2022 11:14:54 +0100
Message-ID: <CANNYZj979VysjrC51q7H4EDhSq4LWWmyYNU=DAHCA2m5mxLbqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: bump to v252
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 10:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172834

On Mon, 7 Nov 2022 at 11:01, Luca Bocassi <luca.boccassi@gmail.com> wrote:
> > This makes oe-selftest fail:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4353/steps/14/logs/stdio
> >
> > [    1.465610] Run /init as init process
> > [    1.532366] input: QEMU QEMU USB Tablet as /devices/pci0000:00/0000:00:1d.7/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input1
> > [    1.534612] hid-generic 0003:0627:0001.0001: input: USB HID v0.01 Mouse [QEMU QEMU USB Tablet] on usb-0000:00:1d.7-1/input0
> > /init: eval: line 103: syntax error: EOF in backquote substitution
>
> This is a very strange error, I don't think it comes from systemd? Any clue?

This comes from a specific selftest:

wic.Wic2.test_efi_plugin_unified_kernel_image_qemu

You should replicate what the test does, so you can see the issue
first hand - or confirm that it's not the new systemd:
https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/selftest/cases/wic.py#n1171

Particularly the wic plugin used by the test does refer to systemd:
https://git.yoctoproject.org/poky/tree/meta-selftest/wic/test_efi_plugin.wks

Alex

