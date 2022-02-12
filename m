Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010A8C433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Feb 2022 17:27:29 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web12.11597.1644686848464487714
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 09:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nfaIsUeB;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id d3so11239586qvb.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 09:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IChUYOmYaWFFHa9lLhawcBalSSZOW1BIrynzwDTD4H8=;
        b=nfaIsUeB2KCMfbj9Oi2Hd1D3yUaf2gaUr6bUze/tqe3oOv4B7hEQMuslGHJPaiQ9/p
         80AwWVVZy1aTDnAQo5fbAGlRdjwgaW3PJfZOzplA417XhVYaG8c4Qoqz4jVy3HX05e8d
         ibwB2+7HURNc9viQL0HmqzzOsT1V4kJ9esiEzbQynY5fT6SEbIRAcd+NP47Ou5c9FEbt
         QwPyL2XCjWyg6uonzLOSqoBvBbkevurPQXylOBJUh1sFYmapFe4UiRXnrr0Fq5MBcPDp
         y5CseKhuRlpcZ8g8U/LLddxvAt/3nB9SZGTeY/xKvpyhmSeCwWJfirB/H7m8r1dKfVDi
         aTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IChUYOmYaWFFHa9lLhawcBalSSZOW1BIrynzwDTD4H8=;
        b=UZ4ieP0+iMTZJfmYBkk0v8QWR/T9eM4xBdLqGFToo/pHoZm7Sg5zg4cvOCkfl9sBP0
         aZ8z8roeBoyJjnI2NnQZUU9hnX2ckPnhBFoLaW8qynPSxlfLDmDqiHlUvwTLTpdejnJM
         ED/uAMfVEu2ySrq9/NdXoQpouVmNnEDn8+WldpW4XuC2JI2NAwrYYRJtx2X82X4ZgXQ0
         4C2oapnHWHFovJcveFMKq8c6AHsUuKKFicJocRyt3EIvkLEyx0TcbELQvJWAOkYMiOsE
         dwVzfXf1rsznD7Lx7c8zMBsRplBuTjdfrleUXoqyzYkFA2gJRZ2sxRP3afAXPD3Wi78M
         pGfw==
X-Gm-Message-State: AOAM532953KAG7JPvdsx+gkD+9xJtQ478ySSVRKVYJ1JDLmQaS+T05aY
	HXe7cS/TT0JaBn18TmgD2O9m4G2i6PwOUBlk24M=
X-Google-Smtp-Source: 
 ABdhPJxFq31wYmYBENHSG54XCZMgZ/k2kkj7SV8ugTDTywOdQlr6Co2cqF5tijKyZNvRBr1nt21oelSqx8szBsZ1AFE=
X-Received: by 2002:a05:6214:2306:: with SMTP id
 gc6mr5007241qvb.63.1644686847248;
 Sat, 12 Feb 2022 09:27:27 -0800 (PST)
MIME-Version: 1.0
References: <20220210183719.3213809-1-raj.khem@gmail.com>
 <708e70534079e11e5db614f43e314aef62587a3c.camel@linuxfoundation.org>
In-Reply-To: 
 <708e70534079e11e5db614f43e314aef62587a3c.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Feb 2022 09:27:01 -0800
Message-ID: 
 <CAMKF1sqrEhQWAv7UzK7OwP7mR17nc3UxufnxcV05tLzr+G29wg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.38 release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Feb 2022 17:27:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161673

On Sat, Feb 12, 2022 at 5:27 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2022-02-10 at 10:37 -0800, Khem Raj wrote:
> > Release Notes are here [1]
> >
> > [1] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00009.html
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> So far there was a mingw failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4729

This seems a race

| i686-w64-mingw32-dlltool: lib32/libd3dcompiler_35.a: error reading
D3DCompiler_dll_t.o: No such file or directory
| Assembler messages:
| Error: can't open D3DCompiler_dll_h.s for reading: No such file or directory
| i686-w64-mingw32-dlltool: i686-w64-mingw32-as exited with status 1
| i686-w64-mingw32-dlltool: failed to open temporary head file:
D3DCompiler_dll_h.o: No such file or directory
| Makefile:82403: recipe for target 'lib32/libd3dcompiler_35.a' failed
| make[1]: *** [lib32/libd3dcompiler_35.a] Error 1



>
> and a qemuppc kernel build issue:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4688
> https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2632
>

this needs a kernel patch backported ( looking towards Bruce to include it)

https://lore.kernel.org/lkml/20220211005113.1361436-1-anders.roxell@linaro.org/T/


> The build is:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3220
>
> and the meta-aws issue is known about and not related.
>
> Cheers,
>
> Richard
>

