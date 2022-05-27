Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9B1C433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 19:11:00 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web08.7623.1653678658573967778
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 12:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cljv6d/x;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id r3so5877137ljd.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 12:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lifgu2a9076U4yj02fHuUcUliaEvHxQ+tXoV7OzBa7k=;
        b=cljv6d/xyU1OUYFupgjy+2eO+nIREKQ8Gv/41M+9YnBhZjqAOdZ15tRjHh5QSQEvxU
         /UovZa9Xw+1kjv4QLtzJITumpAYo/1xN/j9vuMfC9EQ845llEYJeZqT/CDSDvj4D0GJi
         Jpqq6uBotXN24YWT+n685ms0vpa0L8UulK0ZZQWrmSbzW6tY2Cp75oiy7qpapgEzibN9
         hw83bXgm3aOH+bXXhwV+BY/hMIQzvlfic++DYxJyk0+FPwY4imH21haZ2cJQbImtgPsX
         meon0gGCFhRZsFG5/u8U1alp1r162lLzteINuQmQPgjJedutaBsrKaBrkWoM9j/YyBpU
         g/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lifgu2a9076U4yj02fHuUcUliaEvHxQ+tXoV7OzBa7k=;
        b=m+9zzG0j0KPqpYbzdlEUP5aC9FRbyKIjGdAUEH+Y5hqwNEs3fcaWhY1iB9bFQRog/9
         hOWN6aFunOFtnwtOhyNik2dEmXMVdUYFHHSsblZc1lZTNpqXyCxvZH9G4er4LVAbRjmZ
         4hTp5iXUZ8/NY+iqLoF0NwFkq6vhNc/ibcqRx9/AabudTmwZ3+uGVmoKvNmZjd8qhLoE
         3NAaEpKH5pVTtkfNvcZFnc2eBLvPr3wUvHWHwTmgOIyhyGF3N7Sdjf/N3Ad3OUfm8sNN
         kOSCN64sSZvn6LJzGWXBLRN7RgkKSQaqNQV9tvZ6GiGfRmqAXYIJccvKhYDWk/ToGRdX
         z5YQ==
X-Gm-Message-State: AOAM532pxWtDWJZKszPYo62G27C1CrlnpHeEawveR5erhX87laiNCmEl
	OiU3eWnPXJtvkIwgfNuR/BJx80BVMqKtgk/+tr4=
X-Google-Smtp-Source: 
 ABdhPJy5VjG3mOrZ4VvQnGORZPhvFh3qGYoZjFd/myV62q5mgiM7OD1CABApiz2l7QHEfKVd5K8qYGRqQoZOH0RCWts=
X-Received: by 2002:a2e:7c0f:0:b0:255:4649:43b7 with SMTP id
 x15-20020a2e7c0f000000b00255464943b7mr127473ljc.257.1653678656660; Fri, 27
 May 2022 12:10:56 -0700 (PDT)
MIME-Version: 1.0
References: 
 <OS0PR01MB61783B64BAF9C5AE3BE85331A0D89@OS0PR01MB6178.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OS0PR01MB61783B64BAF9C5AE3BE85331A0D89@OS0PR01MB6178.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 May 2022 21:10:45 +0200
Message-ID: 
 <CANNYZj8LKgJA5vheJz-fMO_7ySbgPenzGMH58zSZSCMLCm50mA@mail.gmail.com>
Subject: Re: [OE-core] DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
 doesn't work.
To: leimaohui <leimaohui@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 19:11:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166217

Can you explain the use case please? If you just want to use systemd,
set INIT_MANAGER = "systemd".

Alex

On Fri, 27 May 2022 at 02:39, leimaohui <leimaohui@fujitsu.com> wrote:
>
> Hi, all
>
> Because the following patch, "DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"" doesn't work anymore. I have to " DISTRO_FEATURES:remove = "sysvinit" " instead to disable sysvinit.
> But I'm not very clear if there is difference between "DISTRO_FEATURES_BACKFILL_CONSIDERED" and " DISTRO_FEATURES:remove " for my image. Can anybody tell me?
> --------------------------------------
> commit a6ebbe3a10ff76386dde03ddaa7097bdb2f5d9a5
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Wed Apr 13 18:41:39 2022 +0100
>
>     poky: Use INIT_MANAGER in main distro config
>
>     Just to keep things standard and clear, use the new INIT_MANAGER variable
>     in the main distro config. This matches the default config with the addition
>     of some DISTRO_FEATURES tweaks.
>     ......
>     BB_HASHSERVE ??= "auto"
>     +
>     +INIT_MANAGER = "sysvinit"
> --------------------------------------
>
> Best regards
> Lei
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166198): https://lists.openembedded.org/g/openembedded-core/message/166198
> Mute This Topic: https://lists.openembedded.org/mt/91367188/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

