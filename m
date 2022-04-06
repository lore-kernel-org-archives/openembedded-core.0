Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824C1C3A5A3
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:20 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.10965.1649262678661305300
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 09:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EVPPLXgi;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id k21so5055718lfe.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 09:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hN6yW6QvmeYBh88LLkyJd/iWqEsVIrMkEvliceDv+uU=;
        b=EVPPLXgiRoHXOGjMA/34x93NyypEWYikzKMQUusnkufPh33uqtDlCnrnOBdvKw4hvH
         u3MXk+NYkfd+FHrDdwHIDYffQ1MMP+wHiBAaiygTPwR4FinJ6Zsi4BBp87WboR8PG10k
         i6sPKCGydiPHLJ8w8EQzQzsRZdTw3/ijZffSFcziGAjkmLUBguCXzPGJ7KB+749Jw5UI
         l1nl0jUOdwAjY21HMfvlpMj1Nl48AfP0gFtIqQBqi9JOGWkeXUqYqfn7CHkBfpSzguxV
         g9OY196DWg+sVJd+mVI3mOIEVCLyQsrL/rxr0s3tG8AMS9idhEz03ywDbZDCkTq51AVn
         Owhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hN6yW6QvmeYBh88LLkyJd/iWqEsVIrMkEvliceDv+uU=;
        b=aHZANAjL5ICEjvkAFBHZWr7tpUCcQWfqVR0aIRBz1JcEpq1LUNnjynjpMkccLPJaan
         k/8ZKtUygu8EUkZx5cBIOOMpXFmEbRqNI7x4sPnmiLHden6a8vdBpKsOKNuyHwEC2QCL
         H2znw5mEwzLlti2Y7orvg+db4bQcTfRc2tOnO1MMu5hfOU3INYMG/L6SBzqDz/CAyXyc
         BDvneSH5RsoNEO3YTZe1xzYI3HWZY0qzEHIcW2N6YFnowiy7JmirXAE8kQfzthtEJMar
         DSn0KGwtlVkT1Lkxf/mpz2IJF+OtX1rsthZYrRfZXknTnP1CpI01v5A/BDph+C99lopk
         xVAw==
X-Gm-Message-State: AOAM532NwGcroG7/bzxg1xI19OwHmrzkQtyPWGNYHf8o76hHeEby+L/Y
	HgyUl6YhLv2OhJIKXg0myOcyqRNTxdbgryhKsF8=
X-Google-Smtp-Source: 
 ABdhPJxFuPAjpj1e5dZjV2PhRlGVrJA5z3NbHC0B28GzS0xZc1Qg6e1tTT32f95JnmUFW4svKTAYkTqplmafYR60UNY=
X-Received: by 2002:a19:ca14:0:b0:44a:23ab:90a5 with SMTP id
 a20-20020a19ca14000000b0044a23ab90a5mr6372377lfg.673.1649262676190; Wed, 06
 Apr 2022 09:31:16 -0700 (PDT)
MIME-Version: 1.0
References: 
 <dedf19a5167179f8960baf92acf74edf0dc202b7.camel@linuxfoundation.org>
In-Reply-To: 
 <dedf19a5167179f8960baf92acf74edf0dc202b7.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Apr 2022 18:31:04 +0200
Message-ID: 
 <CANNYZj_OP+renDEbrMVJz-xJnLv6w1ycjLJz3+7BZbW-RhUAoQ@mail.gmail.com>
Subject: Re: [OE-core] Ping issues on systemd images - Intermittent Notes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164089

sysvinit starts connmand with '-I eth0' (ignore eth0), but systemd
does not. I'll send a patch.

Alex

On Wed, 6 Apr 2022 at 17:52, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Do we have any experts on systemd and connman? I did find a little more data on
> some of our mystery autobuilder ping failures:
>
> Ping issues on systemd images
> =============================
>
> This failed with my ping test debugging present so we got more info. The host
> was unreachable.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/2888/steps/12/logs/stdio
>
> I reran the testimage and it passed. I diff'd the qemu console log output and
> there wasn't any difference that was meaningful. The testimage log output wasn't
> meaningful.
>
> I did find this interesting though:
>
> pokybuild@ubuntu1804-ty-3:~/yocto-worker/qemumips-alt/build/build/tmp/log/runtime-hostdump/202204051947_qemu$ cat target_00_ip
> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
>     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>     inet 127.0.0.1/8 scope host lo
>        valid_lft forever preferred_lft forever
>     inet6 ::1/128 scope host
>        valid_lft forever preferred_lft forever
> 2: eth0: <BROADCAST,MULTICAST,DYNAMIC,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
>     link/ether 52:54:00:12:34:06 brd ff:ff:ff:ff:ff:ff
>     inet 169.254.89.149/16 brd 169.254.255.255 scope global eth0
>        valid_lft forever preferred_lft forever
>     inet6 fe80::5054:ff:fe12:3406/64 scope link
>        valid_lft forever preferred_lft forever
>
> The :06 at the end of the mac address shows it was the right qemu and I couldn't
> find any other qemu using 192.168.7.6 on that machine at the time. Note there is
> no ip address configured for that interface.
>
> I suspect something in systemd+connman is causing this intermittently. We need
> better network interface debug enabled in connman/systemd so we can attempt to
> debug this further. Any pointers on how to do that very welcome!
>
> Cheers,
>
> Richard
>
>
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164088): https://lists.openembedded.org/g/openembedded-core/message/164088
> Mute This Topic: https://lists.openembedded.org/mt/90292799/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

