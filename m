Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB72EC433EF
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 14:27:51 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.21479.1644762465566787479
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 06:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NiTnk2vu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id s10so9419745wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 06:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=+AF7IKSHwqBFK5LkEDybEauDNHzwNr589msd7f9BV0I=;
        b=NiTnk2vudi2K5aOa79le9lsc5LBI6rbsj6kqBAIgtmZ2QkVjRDeV674PJVKUnKKQR1
         kcO806twYisfoxeRCeE7vy1JduInTGhrnyUVxN6NSqTQLPM0h579JkpmrcimqfBGWzGU
         +plx8hjdsTW7zm74cXtlNcDBnhFNbXBBLfquk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+AF7IKSHwqBFK5LkEDybEauDNHzwNr589msd7f9BV0I=;
        b=U4NxAebwr8+aeuXQp8hOOiLCHPnnlQC6vovzp7P5lcKykAOBRyVxI7ecW7lFXS9/4S
         +i3oYcCkHzCJMm1AIQFtQ+eTsC0XHBVQoOOj/TCIrAfP4BWEwxBdz0EVlqadcwgDi1Pr
         yO6GHVTZTf5zTYnarLmzahd/BztZQeyLNFSg1cWJeSVSEc3lW1M3uvjFjnoX9xnFyHgI
         zC9R5/aww7/o0nQVWKM23gflsd8WaJymcU8gK4aCZ8FpICBe2+Qx3fvpMh5kQByq6aa2
         ru4G6Vet0tIFiEFeBwhGch6Dw7shREULQGMCL6VDXY73ZNyswAqvEPjze2O5QN5Ebgag
         +/BQ==
X-Gm-Message-State: AOAM533E2tP4FWYrIEVen6b0Ot2tlnlLxfHdHWPxELSUT8hNbyOxKbG/
	7J12XOuuICWB2UcnX2wDq8U7aw==
X-Google-Smtp-Source: 
 ABdhPJwg/a4mBClGIOKCg1onoqXnMQNNcOZ9/KzaZ1YlGtO8d+PivkBwrQy5GhWRjR0E4xjwheRxnQ==
X-Received: by 2002:a05:6000:1787:: with SMTP id
 e7mr5938910wrg.153.1644762463920;
        Sun, 13 Feb 2022 06:27:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:385:df26:3e57:9893?
 ([2001:8b0:aba:5f3c:385:df26:3e57:9893])
        by smtp.gmail.com with ESMTPSA id
 a9sm10890414wrg.53.2022.02.13.06.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 06:27:43 -0800 (PST)
Message-ID: 
 <c33e356bc1429ff6b8175dd056603a21cae833d4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.38 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Feb 2022 14:27:42 +0000
In-Reply-To: 
 <CADkTA4Nj137Tn58UQkZvDJVUjts5+OQtJ_6TuiWEq3GKQ7V2bw@mail.gmail.com>
References: <20220210183719.3213809-1-raj.khem@gmail.com>
	 <708e70534079e11e5db614f43e314aef62587a3c.camel@linuxfoundation.org>
	 <CAMKF1sqrEhQWAv7UzK7OwP7mR17nc3UxufnxcV05tLzr+G29wg@mail.gmail.com>
	 <CADkTA4Nj137Tn58UQkZvDJVUjts5+OQtJ_6TuiWEq3GKQ7V2bw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Feb 2022 14:27:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161683

On Sat, 2022-02-12 at 20:25 -0500, Bruce Ashfield wrote:
> On Sat, Feb 12, 2022 at 12:27 PM Khem Raj <raj.khem@gmail.com> wrote:
> > 
> > On Sat, Feb 12, 2022 at 5:27 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > 
> > > On Thu, 2022-02-10 at 10:37 -0800, Khem Raj wrote:
> > > > Release Notes are here [1]
> > > > 
> > > > [1] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00009.html
> > > > 
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > 
> > > So far there was a mingw failure:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4729
> > 
> > This seems a race
> > 
> > > i686-w64-mingw32-dlltool: lib32/libd3dcompiler_35.a: error reading
> > D3DCompiler_dll_t.o: No such file or directory
> > > Assembler messages:
> > > Error: can't open D3DCompiler_dll_h.s for reading: No such file or directory
> > > i686-w64-mingw32-dlltool: i686-w64-mingw32-as exited with status 1
> > > i686-w64-mingw32-dlltool: failed to open temporary head file:
> > D3DCompiler_dll_h.o: No such file or directory
> > > Makefile:82403: recipe for target 'lib32/libd3dcompiler_35.a' failed
> > > make[1]: *** [lib32/libd3dcompiler_35.a] Error 1
> > 
> > 
> > 
> > > 
> > > and a qemuppc kernel build issue:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4688
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2632
> > > 
> > 
> > this needs a kernel patch backported ( looking towards Bruce to include it)
> > 
> > https://lore.kernel.org/lkml/20220211005113.1361436-1-anders.roxell@linaro.org/T/
> 
> I've grabbed this change, and the riscv one, and applied them to 5.10 and 5.15.
> 
> The pull request is on the list for the binutils fixes and -stable updates.

Thanks Bruce. Unfortunately this doesn't seem to fix the qemuppc build issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4691
https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2634

Cheers,

Richard



