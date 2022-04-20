Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A568FC38A02
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web09.4119.1650428866289072608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 21:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nCOf3xhj;
 spf=pass (domain: gmail.com, ip: 209.85.222.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id d198so432121qkc.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 21:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JVBZen9YmS6oBUyRYmF2nWba+oUjMNdSgrV16nArShE=;
        b=nCOf3xhjMZkzwu/UBa6nr106vumDNJdYnVOy8DbIJxBTAV2n2M7qNFwmnLvYaEJk6h
         qHeFKxWyUHZLs1a8hRw7aNII+o2nrRt/s/sR6IAg7HynY2zZi+TCbMA3J5dpD0QPwqwO
         PHGqf7wUKh57av+DWnO5SSDhCQi0VA/j7+2HboKuO/FDS6Kaf7g4HuUjOsCTqMA2qPOa
         OCY6PR619MoMyi8Nx4g6BVZgwY3iy4RXEM9R5W41FkixAIffZ75JwBMKOl3qLum4R64B
         Fdr/cwkUDtkNEsKHp2TsGXZJsZPsnwbcwa1ZLE3Y1ejBTjT/+gxfsqyPanj82gbCSs5s
         Q/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JVBZen9YmS6oBUyRYmF2nWba+oUjMNdSgrV16nArShE=;
        b=0Od7MMEp2fiCiJv9+p1qIyfCuFHkfWAuywvhtWS0KaoA9cSqXDmGVqsknoqw0MtLVR
         +Ak+/y+nkp2BOU6aCvMxu9By+GIF7NS+4S8sLeqlZEiYdcYmgjN+Paps+wkoifS7pvD7
         BO332shp8ELPrRlH7I0PL9vPFz1hhNrWb9q1EVkFzIiPJUu9nvVh0s+ukd/go65yU0Ku
         jXESsW0/GvF3eNkFegoaHgghM2U5XHMKg040M/9mcvHRYVQ5edG86v14Bvh4HXjcr08t
         liILtG8uNQ++GOcyaj26bStsNkQR4fa1FeQpqHQaLvTOeryqTfcABAviL4r2yn8QH8m3
         Y/AQ==
X-Gm-Message-State: AOAM530T217upEexPsK8Q4oU82H+OztPWuZNFUnDW9cno7uM5eeYYInZ
	kpeyL7NRpfiBwMhoTffp0yC/6yiuycbvTg3krPs=
X-Google-Smtp-Source: 
 ABdhPJyzmX/8X4CRANQnDHqbasJbFdvCnv8elnUjF/u908qloWApZzrrcXPRSPRsttkNvvdOsBXUPzv2BKvqnCdw3ws=
X-Received: by 2002:a05:620a:2286:b0:69c:c095:698c with SMTP id
 o6-20020a05620a228600b0069cc095698cmr11663360qkh.149.1650428865302; Tue, 19
 Apr 2022 21:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220415173821.3079322-1-raj.khem@gmail.com>
 <6aa10133af2f9c6a198deed7a99aab6824a68ffe.camel@linuxfoundation.org>
 <CAMKF1soDEVXec8DXSYJHJ3+4coj-hc95NfQ2r+sA+F7Mg0dYnw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soDEVXec8DXSYJHJ3+4coj-hc95NfQ2r+sA+F7Mg0dYnw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Apr 2022 21:27:19 -0700
Message-ID: 
 <CAMKF1spSa+gi6zbbxjybD+Gx7p-rPUZcqJ7o0CGFm0gi5W0_mQ@mail.gmail.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/164656

On Sat, Apr 16, 2022 at 10:01 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Apr 16, 2022 at 1:07 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2022-04-15 at 10:38 -0700, Khem Raj wrote:
> > > From: Bernhard Rosenkr=C3=A4nzer <bernhard.rosenkraenzer.ext@huawei.c=
om>
> > >
> > > - gcc 12 is in RC stages.
> > > - Add patch to re-shuffle include of sched.h to fix build on musl
> > >
> > > Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bernhard.rosenkraenzer.ext=
@huawei.com>
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > v3
> > > - Switch to own snapshot for quick turnarounds than waiting for a
> > >   weekly snapshot
> > > - Add a fix for gcc target build on musl
> > > - Fixed gcc for kernel build failures on arm/x86_64
> > > - Fixed gcc for ccache build failure
> >
> > I ran this through the autobuilder as requested as it means we have a c=
hance to
> > get things fixed upstream before gcc 12 is released:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3535
> >
> > We see failures in:
> >
> > edgerouter/edgerouter-alt in linux-yocto 5.15/5.10:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/5078
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/2965
> >
>
> these are fixed with
> https://github.com/torvalds/linux/commit/a431dbbc540532b7465eae4fc8b56a85=
a9fc7d17
> and I see its already backported to 5.15 branch. so whenever Bruce
> bumps to latest tip of linux-5.15 we should be
> getting this fixed.
>
> > meta-arm in linux-yocto 5.15:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/2307
> >
>
> this can be addressed by disabling -Werror=3Dstringop-overread but
> perhaps better to change code to fix it.
>
> > meta-intel in intel-media-driver:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/2770
> >
>
>  error: the address of '_CODEC_VP8_PIC_PARAMS::ucMvUpdateProb' will
> never be NULL [-Werror=3Daddress]
> |   238 |     if (codecPicParams->ucMvUpdateProb[0] && picParam->mv_probs=
[0])
>

this has been fixed upstream
https://github.com/intel/media-driver/commit/c8457540aed1ab9424661087276fb7=
88c0e3aabb

which should be in intel-media-22.4.0 release we are on 22.01 in
master. So perhaps a bump in this
recipe will fix it.

> perhaps fixable by not checking the redundant
> > qemuppc/qemuppc-alt in linux-yocto 5.15/5.10:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5033
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2916
> >
>
> include/linux/printk.h:450:44: error: using a dangling pointer to
> '__str' [-Werror=3Ddangling-pointer=3D]
> this needs fixing too. I see it on ppc64 as well.
>

this needs to be fixed in ppc arch specific code in kernel. Meanwhile
I have enabled

CONFIG_PPC_DISABLE_WERROR=3Dy

in config and it now can build the kernel

> > Four oe-selftest failures due to missing maintainer entries (easy fix)
>
> I will add it in v4.
>
> >
> > A weird oe-selftest prservice.BitbakePrTests.test_import_export_overrid=
e_db:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3409/=
steps/14/logs/stdio
> >
> > The latter is one of our infamous intermittent issues and likely not gc=
c 12
> > """
> > Parsing recipes...ERROR: ParseError in None: Not all recipes parsed, pa=
rser
> > thread killed/died? Exiting.
> > ERROR: Parsing halted due to errors, see error messages above
> > """
> >
> > So basically you have the intel-media-driver failure in meta-intel and =
a number
> > of kernel issues. I've cc'd a few of the maintainers just so they're aw=
are of
> > the status, I appreciate we'd wait for the mainline kernel to resolve t=
hings.
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
> >

