Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B983CC4708A
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.4272.1650431607153649489
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 22:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RdZo7oYE;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id n11so639240qvl.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 22:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fVXirNBFMkpioOIlGwFa/qkd+jGeMCD22uqgJBwzlUc=;
        b=RdZo7oYEEgGapz8uTsVfQGSPMwkxQHYw+nIqdyBHLr6Qt5OfLMGzXdYh+dIhDyFzZR
         n78p3pADonOr8jd2FUarjkTVlFD9kMDyVpVJu8e4V+qr+AdKHSJ6R10iuGqsFSUdRH+t
         vphhe02GfnFeUnycsqrtn9HVIkxFSNWAeBJPfyEr6YeZyOaTY+BPgvsTEKcnE7XB8brI
         zqydLGfTYfqbnZvEopa7ZPsQA+dxIpHDn4SVxSXMkMJWYhn88Aho6HRrFICtF4ggpSEI
         dDpYNcpqvraqS7kUBMwkV6feXUFKDEUug38M04KpomJunjVVWCR06RGgno+26s3/PNtr
         0HbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fVXirNBFMkpioOIlGwFa/qkd+jGeMCD22uqgJBwzlUc=;
        b=NcsUSHWzcvi93oJG4HfYPoASTkOL9p7ypkLOBhmXj4Xi8i3DIVea5R7enjcxjpo/t7
         N+NIGoSp5Nkh0lgwsm8t8RsfaGwJyLf2iq0USPUoRGtkXUOjRWsCendc8BBpFhB+hcT7
         dcvHMPt+lJONLqen2OA/o0PVmWrEEb7cS5SdQY9fZitd3XW9Kpz9nwEQnN9WM5tzinJR
         uF5MIqXi0VvUQQyJ1evnVKB6wWagaSZDX7HZs4wt32KPNjR8ftMauKrvdSdhLXkugr34
         p9YbO+4QuGiQ/Vf+jJ/RS520aZRATJfNZnPgzTQyx8quTco9FsZjhR+GY4CqI2dK8c6V
         eNuQ==
X-Gm-Message-State: AOAM533qIoetgrLgq1f+MAwu/XdH8n6ZX3SGWGEMEbBOQU84/PFsGkfJ
	Gh8zj1Yaj1k0WmnCSEsY56ew5dtIdEL+QSgPFME=
X-Google-Smtp-Source: 
 ABdhPJz7DIqe1n5HQU/D6cZuKOzP0Z7prF4mVcMxbs+m8RSuM9v1D4NbvCrrOsiY+YmahKxaaH3ubxnQauaLsJCOF/4=
X-Received: by 2002:ad4:44b4:0:b0:444:45d6:ec25 with SMTP id
 n20-20020ad444b4000000b0044445d6ec25mr14410632qvt.24.1650431606146; Tue, 19
 Apr 2022 22:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220415173821.3079322-1-raj.khem@gmail.com>
 <6aa10133af2f9c6a198deed7a99aab6824a68ffe.camel@linuxfoundation.org>
In-Reply-To: 
 <6aa10133af2f9c6a198deed7a99aab6824a68ffe.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Apr 2022 22:13:00 -0700
Message-ID: 
 <CAMKF1so3nrt_fY1=y278OpjxovEQAgfA-xwy+Leaqdm6xBjUWg@mail.gmail.com>
Subject: Re: [OE-core] [RFT][PATCH v3] gcc: upgrade 11.2 -> current gcc-12
 snapshot
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bernhard.rosenkraenzer.ext@huawei.com>,
	Jon Mason <Jon.Mason@arm.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164658

On Sat, Apr 16, 2022 at 1:07 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2022-04-15 at 10:38 -0700, Khem Raj wrote:
> > From: Bernhard Rosenkr=C3=A4nzer <bernhard.rosenkraenzer.ext@huawei.com=
>
> >
> > - gcc 12 is in RC stages.
> > - Add patch to re-shuffle include of sched.h to fix build on musl
> >
> > Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bernhard.rosenkraenzer.ext@h=
uawei.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v3
> > - Switch to own snapshot for quick turnarounds than waiting for a
> >   weekly snapshot
> > - Add a fix for gcc target build on musl
> > - Fixed gcc for kernel build failures on arm/x86_64
> > - Fixed gcc for ccache build failure
>
> I ran this through the autobuilder as requested as it means we have a cha=
nce to
> get things fixed upstream before gcc 12 is released:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3535
>
> We see failures in:
>
> edgerouter/edgerouter-alt in linux-yocto 5.15/5.10:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/5078
> https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/2965
>
> meta-arm in linux-yocto 5.15:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/2307
>

this is fixable with couple of backports which I have sent a request
for 5.15 upstream
https://lore.kernel.org/stable/afb441a5-97ca-1488-e1ab-c399fd4e254d@gmail.c=
om/T/#u

> meta-intel in intel-media-driver:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/2770
>
> qemuppc/qemuppc-alt in linux-yocto 5.15/5.10:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5033
> https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2916
>
> Four oe-selftest failures due to missing maintainer entries (easy fix)
>
> A weird oe-selftest prservice.BitbakePrTests.test_import_export_override_=
db:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3409/st=
eps/14/logs/stdio
>
> The latter is one of our infamous intermittent issues and likely not gcc =
12
> """
> Parsing recipes...ERROR: ParseError in None: Not all recipes parsed, pars=
er
> thread killed/died? Exiting.
> ERROR: Parsing halted due to errors, see error messages above
> """
>
> So basically you have the intel-media-driver failure in meta-intel and a =
number
> of kernel issues. I've cc'd a few of the maintainers just so they're awar=
e of
> the status, I appreciate we'd wait for the mainline kernel to resolve thi=
ngs.
>
> Cheers,
>
> Richard
>
>
>
>
>

