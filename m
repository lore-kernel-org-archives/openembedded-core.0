Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1629C433F5
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 17:45:55 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.23802.1644774354036268949
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 09:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ahVVQO+D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso6392692wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 09:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=clX36Uf60EotV9rw01HPO1df1MihLQsHoV87XV92Jow=;
        b=ahVVQO+DL790bkhYkuRa/y5U0Xj6QxC0iglvyh20o7dXw9mFm9b4jtDCSO1Asgc4GL
         jZjHhIV/FaZlu1OAD9r4FvsbrRkD91dKz3jkdGZ6PGRos9DEr1Oyz1ApqKUFHlvfCF7l
         qjL6MEQia2If24iCrXTUwAFdJ2ndDEewX9N5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=clX36Uf60EotV9rw01HPO1df1MihLQsHoV87XV92Jow=;
        b=vIK+VRQkCxrVoL8gzHD8BgQjYo2gak1YqPdrX+bl9WAVDcKTHhJYUdSs0D8PMFoPHt
         R8yyLseGnDy33/TuBXOY4nykihcgINxcYZkZKPJMbL07O1Tt3GlMryJ9/1tqtMgZ+gZQ
         zv8zoOq08yWCE0EjhMk0sSoiCQUxOapLHNKkqgsqsCf0lYv9dZDnAX/vAse4ZcUqBCN8
         zbTIUp8qnRZhD8KTqhDWCcBYz+GVdEBPVA7yoI6w5vqHH6x9YtfksIbFZSYTo2CFFVBB
         rCvZ2os/Tf61qFuDEnSCBhDawC4EInme8u2tqulTSm7Vt3Bx7mlSaVEpFLvov7AT0wlU
         H44Q==
X-Gm-Message-State: AOAM530HnVOCIbNxIeqJHC3XNXAhLrkD3vFZtzRjPmQTTMKIppZCMOqN
	A8khCDI2RgYIZDW97iY91ThbBQ==
X-Google-Smtp-Source: 
 ABdhPJwa0qjIDCGTBKQzs5CtmXs9DkJ098Gb1FkLKZI0MIRyIFKQJFYBjRVlTRTh/wxzEHwUzA4CVw==
X-Received: by 2002:a05:600c:154c:: with SMTP id
 f12mr5969115wmg.35.1644774352208;
        Sun, 13 Feb 2022 09:45:52 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:385:df26:3e57:9893?
 ([2001:8b0:aba:5f3c:385:df26:3e57:9893])
        by smtp.gmail.com with ESMTPSA id n7sm8711517wra.5.2022.02.13.09.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 09:45:51 -0800 (PST)
Message-ID: 
 <9e65fd13504219c3b84fe17e844a368176cfcb6d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.38 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Feb 2022 17:45:48 +0000
In-Reply-To: 
 <CADkTA4N-yxzSMuhVpPWyddcaOLkmBpEwgs4TECr8SNup8tE__Q@mail.gmail.com>
References: <20220210183719.3213809-1-raj.khem@gmail.com>
	 <708e70534079e11e5db614f43e314aef62587a3c.camel@linuxfoundation.org>
	 <CAMKF1sqrEhQWAv7UzK7OwP7mR17nc3UxufnxcV05tLzr+G29wg@mail.gmail.com>
	 <CADkTA4Nj137Tn58UQkZvDJVUjts5+OQtJ_6TuiWEq3GKQ7V2bw@mail.gmail.com>
	 <c33e356bc1429ff6b8175dd056603a21cae833d4.camel@linuxfoundation.org>
	 <CADkTA4N-yxzSMuhVpPWyddcaOLkmBpEwgs4TECr8SNup8tE__Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Feb 2022 17:45:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161688

On Sun, 2022-02-13 at 11:27 -0500, Bruce Ashfield wrote:
> On Sun, Feb 13, 2022 at 9:27 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Sat, 2022-02-12 at 20:25 -0500, Bruce Ashfield wrote:
> > > On Sat, Feb 12, 2022 at 12:27 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > > 
> > > > On Sat, Feb 12, 2022 at 5:27 AM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > 
> > > > > On Thu, 2022-02-10 at 10:37 -0800, Khem Raj wrote:
> > > > > > Release Notes are here [1]
> > > > > > 
> > > > > > [1] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00009.html
> > > > > > 
> > > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > 
> > > > > So far there was a mingw failure:
> > > > > 
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4729
> > > > 
> > > > This seems a race
> > > > 
> > > > > i686-w64-mingw32-dlltool: lib32/libd3dcompiler_35.a: error reading
> > > > D3DCompiler_dll_t.o: No such file or directory
> > > > > Assembler messages:
> > > > > Error: can't open D3DCompiler_dll_h.s for reading: No such file or directory
> > > > > i686-w64-mingw32-dlltool: i686-w64-mingw32-as exited with status 1
> > > > > i686-w64-mingw32-dlltool: failed to open temporary head file:
> > > > D3DCompiler_dll_h.o: No such file or directory
> > > > > Makefile:82403: recipe for target 'lib32/libd3dcompiler_35.a' failed
> > > > > make[1]: *** [lib32/libd3dcompiler_35.a] Error 1
> > > > 
> > > > 
> > > > 
> > > > > 
> > > > > and a qemuppc kernel build issue:
> > > > > 
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4688
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2632
> > > > > 
> > > > 
> > > > this needs a kernel patch backported ( looking towards Bruce to include it)
> > > > 
> > > > https://lore.kernel.org/lkml/20220211005113.1361436-1-anders.roxell@linaro.org/T/
> > > 
> > > I've grabbed this change, and the riscv one, and applied them to 5.10 and 5.15.
> > > 
> > > The pull request is on the list for the binutils fixes and -stable updates.
> > 
> > Thanks Bruce. Unfortunately this doesn't seem to fix the qemuppc build issues:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4691
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2634
> 
> I see a patch from January on lkml with the shortlog: "powerpc/mm:
> Switch obsolete dssall to .long", which may be related.
>
> But I'm not setup to see the build issues myself this weekend, but can
> start looking more closely on Monday.

FWIW that sounds highly likely. If I get time I'll try and add a patch to the
build, see if it helps.

Cheers,

Richard


