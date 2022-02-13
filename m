Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4227DC433EF
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 01:26:05 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.16068.1644715563873533428
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 17:26:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ie/uBwMw;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id y17so19956794edd.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 17:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GOwJ3fW6D94RZDfS9H6uSjhMokSjnc0k9K1+sOMy5r4=;
        b=Ie/uBwMwZlaPHaSStJWt9Lv7VUECAQk97CiGcwUJMuy7yUWzaXWRl6nEQB4rpenhku
         KJkExGoNM+qralAp1lI44VGhJRVNAqE3FcMqt2J8ePsGvBfwsxpG5H63MhF89SZ8l7C/
         ygZb43DaNgJ+CvAq4y/L7Lh0WVfJeU5PN0u9/GX3mu8RZvanKh64SWMkW1LY+gsIyxrk
         VaI2PcyvwVXT4d+LAs7KNuzz/lYsoIiRBv3szdwzv74ScfkVgfej0INZgrlRJKXqh7yv
         Z+aO1YvGNjHavT/yvW2+hXNJcnU33lTM9fynOWNAHX5JBlE/mdsxTJowPj9y5yGpKQVf
         d8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GOwJ3fW6D94RZDfS9H6uSjhMokSjnc0k9K1+sOMy5r4=;
        b=Ffx1IktCBBjQFfLBolijShZVJTtxkUVLPVkuFJb1NbxaqPDwtvbgvm0he6wx77bfRf
         tqKlgDFDex3YQpvdO3BVuIbbRSwWQRqBuo8l/HTOPfvmsv1z++rAuufRmiPorjgIGEPu
         BU6qrYn6hwwo0t+BcFUwbkd1MvxYlBu5gSv+bwPuO3yr4149ajuFAhu7yoI5YuzEw0Rn
         +CJrUSv2nCLz9eLG1IYoO+1z4gR/Ob7Fj5Fns0CBjHSY2Hjzff3MsxQIxcFBnElKFFOX
         XQdzpc0Som/Af5KWIA+0cQRqjLgw+ploPyRp3OGSuyT3w9hqGcZbFWTo0y3lAAaFhoWp
         h2TA==
X-Gm-Message-State: AOAM5303+XaASeY/FElUhVU41aN4YOa6R5B/3Jkkbq+oGR+wIrd6Z/o6
	7wAGUS1OpO9CjuXmgbY8z57vLrjt2+uAgXfWRz8=
X-Google-Smtp-Source: 
 ABdhPJxmWmsTW26+WK39/VRq52XWa66RKDvI3mTfaNlusmuZHbzqx/LnW8oo+/xi+MUgbIg8hz8QuOzglQpJM34PMt8=
X-Received: by 2002:a05:6402:206e:: with SMTP id
 bd14mr8634004edb.296.1644715562025;
 Sat, 12 Feb 2022 17:26:02 -0800 (PST)
MIME-Version: 1.0
References: <20220210183719.3213809-1-raj.khem@gmail.com>
 <708e70534079e11e5db614f43e314aef62587a3c.camel@linuxfoundation.org>
 <CAMKF1sqrEhQWAv7UzK7OwP7mR17nc3UxufnxcV05tLzr+G29wg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqrEhQWAv7UzK7OwP7mR17nc3UxufnxcV05tLzr+G29wg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 12 Feb 2022 20:25:51 -0500
Message-ID: 
 <CADkTA4Nj137Tn58UQkZvDJVUjts5+OQtJ_6TuiWEq3GKQ7V2bw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.38 release
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Feb 2022 01:26:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161680

On Sat, Feb 12, 2022 at 12:27 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Feb 12, 2022 at 5:27 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2022-02-10 at 10:37 -0800, Khem Raj wrote:
> > > Release Notes are here [1]
> > >
> > > [1] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00009.html
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > So far there was a mingw failure:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4729
>
> This seems a race
>
> | i686-w64-mingw32-dlltool: lib32/libd3dcompiler_35.a: error reading
> D3DCompiler_dll_t.o: No such file or directory
> | Assembler messages:
> | Error: can't open D3DCompiler_dll_h.s for reading: No such file or directory
> | i686-w64-mingw32-dlltool: i686-w64-mingw32-as exited with status 1
> | i686-w64-mingw32-dlltool: failed to open temporary head file:
> D3DCompiler_dll_h.o: No such file or directory
> | Makefile:82403: recipe for target 'lib32/libd3dcompiler_35.a' failed
> | make[1]: *** [lib32/libd3dcompiler_35.a] Error 1
>
>
>
> >
> > and a qemuppc kernel build issue:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4688
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2632
> >
>
> this needs a kernel patch backported ( looking towards Bruce to include it)
>
> https://lore.kernel.org/lkml/20220211005113.1361436-1-anders.roxell@linaro.org/T/

I've grabbed this change, and the riscv one, and applied them to 5.10 and 5.15.

The pull request is on the list for the binutils fixes and -stable updates.

Bruce

>
>
> > The build is:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3220
> >
> > and the meta-aws issue is known about and not related.
> >
> > Cheers,
> >
> > Richard
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161673): https://lists.openembedded.org/g/openembedded-core/message/161673
> Mute This Topic: https://lists.openembedded.org/mt/89052445/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

