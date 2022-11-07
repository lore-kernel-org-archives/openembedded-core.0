Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E48C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 10:01:51 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web09.1758.1667815306303485150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 02:01:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bmNegBrx;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: luca.boccassi@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-36cbcda2157so98988807b3.11
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 02:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3FmZH3735YTWGsU0zBz5QGmWB0cLkwNRcdGDhDtl1Bw=;
        b=bmNegBrxRgX+KjBGzDwjnXYxkcayA5kUz/VE+NhNEoYdZxpvDK93Ql73aHhd4SfpVB
         YIk87Z+ciDnVqNWucA+72BJ2Y4uA6Mzzq/cJUdgbvXv7WgzNDYD0x4obI8/LqJI6hMeM
         WT5WQJHPvGM4RtzlRcF02Rm+LUMldXYCvkNHQo7gXCS0tkODckcKUOj7R2A0o2mUT2FX
         gmugj/6uTR8fXFvLSrFrYtw1N2BHwpTGMYTr72BzHRfkhThhh/mVBBoWMAisOq02Y8LB
         D4GFL/VzJ8grxA9IaSukWa7h4Z19wo9lWAH0EFwVvzOuguU35sLmWsHXzlylfP10ipMt
         TdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FmZH3735YTWGsU0zBz5QGmWB0cLkwNRcdGDhDtl1Bw=;
        b=aIF3rwLlEuqO1QFkPCHaRGjTNK0EseS8pQBOFSWCnWYsISviPFGG+aRdaN067EZD+X
         BTyTrhHvmbwYBLFezfYQKf+5H0ah06deuWtPiqFDBgglzJ8JDbQ2qRDbMH5Adn1/+2Oe
         ag8zEoe4mBLV/GCfI7fNZ72StCKN2I5t+X4aN+xHL06+VeiRbx8N1bqLs5BJ4LEqwbJo
         Ev4iCbtA6yRB0KRJfM8DLmR4ei1G1TElIzs5R/P2Z7skhPtH2svVwEdTGYDfp05PfJbA
         6IhYk9T6lGTyH4ABBzTwodUCADXYt8Wf1HAM/MVq0G2kCWVtjkpkIyp+cNKHAFr7+4Gt
         9khg==
X-Gm-Message-State: ACrzQf0CeQ0fvvXUphfrZpPgS/vgAIlBhrg6Ddc2KD5hHC936pD3eO6s
	c+0NOvtPYDuTHWvkl2AZ9yMzIuBu+ylFUFpY3njLg7SO
X-Google-Smtp-Source: AMsMyM5NlsDaFdsNsockBtBQvBfBdB8rosigG9rF3jWlfQ//pqhRghkn1m5JCqbvW9X31vyk/dnEvJpppPCsBhM0lg4=
X-Received: by 2002:a81:c310:0:b0:36e:71cb:eb0 with SMTP id
 r16-20020a81c310000000b0036e71cb0eb0mr46845183ywk.425.1667815305350; Mon, 07
 Nov 2022 02:01:45 -0800 (PST)
MIME-Version: 1.0
References: <20221103104255.1120494-1-luca.boccassi@gmail.com> <Y2fUd0wqwdSpy48Z@mail.local>
In-Reply-To: <Y2fUd0wqwdSpy48Z@mail.local>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Mon, 7 Nov 2022 10:01:33 +0000
Message-ID: <CAMw=ZnT1aOF4-5C9013uEkD2pPV32xZ1DHMngw-YJ9=5tx0pAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: bump to v252
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 10:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172833

On Sun, 6 Nov 2022 at 15:36, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> This makes oe-selftest fail:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4353/steps/14/logs/stdio
>
> [    1.465610] Run /init as init process
> [    1.532366] input: QEMU QEMU USB Tablet as /devices/pci0000:00/0000:00:1d.7/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input1
> [    1.534612] hid-generic 0003:0627:0001.0001: input: USB HID v0.01 Mouse [QEMU QEMU USB Tablet] on usb-0000:00:1d.7-1/input0
> /init: eval: line 103: syntax error: EOF in backquote substitution

This is a very strange error, I don't think it comes from systemd? Any clue?

Kind regards,
Luca Boccassi

