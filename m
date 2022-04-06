Return-Path: <mans.zigher@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44586C3527E
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.5472.1649226605020729537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 23:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c0a+hDGA;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: mans.zigher@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id d185so1367884pgc.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 23:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=gaQaGkxvxM57dBH9gjO+TNCOXWuBe/T7dITGdGeKkPU=;
        b=c0a+hDGA30PiupQiEEUCZEztdZKBi9tlzlw4oh3DuECRprHwNzRto6tGAYsM4uBd/T
         NTjnINfrJJxCc8NqYJFQe8/F21nuooCrWt12f8w0I2PhsDS0plLUYm9oHIP45+BHhm/K
         hOni0WiMlFsSrw5R8oS58+9Si2w/zc2wpZePCob2ilosz5LwgloP5dJf9kiQGneVEfYw
         oNyH8d3tBDOGxQw90osZOu3LaF5lbdQJQfowXTmTkDdl+9wTssL+s9Fba/NcHmq02JDt
         +NI48RBbSyh/sdmIpW7eibjV2uPjaJOHZGDhgT/q1i0Dc4W/nDrF33K+IsrLKEnwEqP7
         8+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=gaQaGkxvxM57dBH9gjO+TNCOXWuBe/T7dITGdGeKkPU=;
        b=asUhbrNQYT96mt26vma3uq+fOXAW3nulOtoBRsI0vS/WFkGHm3HkcI7iPXCabzr+T1
         ydqyw2/1EE4MxVl0nEijaJWmUOBlCBAIgAypGzr1FydtIKXde1hpu53W/BsWVYDE5e8I
         P12nKLLfhZWV9fusRoRvguP76CYlBmOHGaVZazSytfzumDLpoAWdbPUbkBJg+iOeJa77
         3Pr4oWA/nBGZ0L/muDC6i7PwEXjOuONi+T3yDodjM0fV8/6pg9+qkXYOUk1uu8J8F4AS
         Wp8r0x28+EBd3sHtODUMe4W7YNiZ9OPm2VAh9EfG88PqQ34SxJbmwYjjS9qO3ZOyeSfw
         hztA==
X-Gm-Message-State: AOAM5339WpK7p2fU/06DBiCTdv7m/nfLZO0jX/M5QUdLnNo0yC5VFf/I
	D8tEGhIdwHLP07lLDnbZs58zcoj8AW2hVtZJhJ+LSbXm5Zo=
X-Google-Smtp-Source: 
 ABdhPJzFoNFhzG7iS8O4LsK+P83dO+MjEOByBPWMA/pW5PIEnGSu8ctEVDWd908cD3mddquGPGcwOGCHoLxpFIvqjV0=
X-Received: by 2002:a63:4f46:0:b0:382:56b2:f8 with SMTP id
 p6-20020a634f46000000b0038256b200f8mr5919320pgl.90.1649226604042;
 Tue, 05 Apr 2022 23:30:04 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAEhQi8mbm-RXs0=7Ygj+rMqJYZaxPw4xTjJnkoXApXKQZGWFiA@mail.gmail.com>
In-Reply-To: 
 <CAEhQi8mbm-RXs0=7Ygj+rMqJYZaxPw4xTjJnkoXApXKQZGWFiA@mail.gmail.com>
From: =?UTF-8?B?TcOlbnM=?= <mans.zigher@gmail.com>
Date: Wed, 6 Apr 2022 08:29:53 +0200
Message-ID: 
 <CAEhQi8=HMz2M-PmzjCwp_Ap=mgd0+j3ewC67Y9kQoVVzKqu=cw@mail.gmail.com>
Subject: Re: [OE-core] Including kernel-devsrc to the SDK while using
 INCOMPATIBLE_LICENSE
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164056

So for anyone that stumbles across this issue it looks like I was
using the kernel-devsrc in the wrong way.
It seems like it is more for kernel module development done on the
target. I was more interesting in having access to
some kernel driver headers so instead I ended up following

https://docs.yoctoproject.org/singleindex.html#using-headers-to-interface-w=
ith-devices

Thanks

Den tis 29 mars 2022 kl 08:52 skrev M=C3=A5ns <mans.zigher@gmail.com>:
>
> Hi,
>
> I am trying to add the kernel-devsrc to the SDK by using
>
> TOOLCHAIN_TARGET_TASK_append =3D "kernel-devsrc"
>
> My problem is that we are trying to prevent GPLv3 packages by setting
>
> INCOMPATIBLE_LICENSE =3D "GPL-3.0"
>
> This resulting in an issue because the kernel-devsrc depend on GPLv3 pack=
ages
>
> RDEPENDS_${PN} =3D "bc python flex bison ${TCLIBC}-utils"
>
> We are currently using Thud. We are not shipping the SDK so the
> INCOMPATIBLE_LICENSE is only needed for the image build. Any
> suggestions on the best approach on how to solve this would be really
> appreciated.
>
> Thanks

