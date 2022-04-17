Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2B7C6370B
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:59 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.26016.1650171716806219774
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 22:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XMl8KYPT;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d14so352849qtw.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 22:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7Wbz5xAtjA4t/ZW0GC0C1e+fFR+umdGDx0uOXoS9rp8=;
        b=XMl8KYPTdKvh+s61+okguSF175WRowUXlKrssyt3OnhxISfbaIVXTbKpN09o6Kldcm
         JohJEI7JbY4JxOY4kU7TXix1A0d4QfL/wT4TFf+3y3+o21Rhss2ZUQ4oHayUafvXdBwz
         3pM9aBG4KBHLMvKh1rO9sUjOnJ6vAkYW615NuNezHtGtlVnXf05VcEqOZ7OcDGkDtC7L
         NzuT5oIo3U7/eRI0ll0rwRKbXKW3lDhSmweU67+daWjOrHhO01HDuKafhsfbKgRrftnT
         ZsS9+gAqQuEUw5p948bDDkzO/iYKddZ/hYF8aNbTi6SzWlQs0DHur45u476QlKLVFVze
         Yfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7Wbz5xAtjA4t/ZW0GC0C1e+fFR+umdGDx0uOXoS9rp8=;
        b=usmWrNnvw3zBTbAC+4+teG4B/DCtZ0tjFryDrLoNCEbZiRfYAP1ilSakVAsht54LKI
         kHDY/LHd3YksDceR8RHhkhwiknHnFglN/SSrxd9b9qXe2CQdoRhOcqnzT2TplUgcHrQ8
         SZ+xSJ5C8Hh1fU1s4Mf2nzntrIWwfwgt+VPGjzC7UDAWp4f5h8/ZPPXxMc4x5gfThkOY
         97JZSrUmW8RUnBrJlri5kgxs+c90hXEn9cTybLO/mfTcYBGJxhMigPtnjDfCl4ed9Ah+
         8RcVEmAzHnbtpqBB/db1TlzdYlzCeIavUcisDlEmEnMRHCbIH/DSEh+yY7KZILRqt4/+
         e5Sg==
X-Gm-Message-State: AOAM533N6aRo/CNxdvBUxIL1Dpu1XaDhnQqecS+MTDNmp8Ledg5Hc0+0
	PA9t0jhA5lp+XYWt3yP9COnogBceQ+8ODFD+QoM=
X-Google-Smtp-Source: 
 ABdhPJxMu+6hKzGcF/6rmEF3U7UQjwuG3cHSgoBQSUS8IHNFBSpFY+Fh5clW6qQMvO8s1wOI7VFEOQ/AC4g4NTAZrzs=
X-Received: by 2002:ac8:5743:0:b0:2e1:cee6:f15 with SMTP id
 3-20020ac85743000000b002e1cee60f15mr3725656qtx.634.1650171715821; Sat, 16 Apr
 2022 22:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220415173821.3079322-1-raj.khem@gmail.com>
 <6aa10133af2f9c6a198deed7a99aab6824a68ffe.camel@linuxfoundation.org>
In-Reply-To: 
 <6aa10133af2f9c6a198deed7a99aab6824a68ffe.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Apr 2022 22:01:29 -0700
Message-ID: 
 <CAMKF1soDEVXec8DXSYJHJ3+4coj-hc95NfQ2r+sA+F7Mg0dYnw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164569

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

these are fixed with
https://github.com/torvalds/linux/commit/a431dbbc540532b7465eae4fc8b56a85a9=
fc7d17
and I see its already backported to 5.15 branch. so whenever Bruce
bumps to latest tip of linux-5.15 we should be
getting this fixed.

> meta-arm in linux-yocto 5.15:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/2307
>

this can be addressed by disabling -Werror=3Dstringop-overread but
perhaps better to change code to fix it.

> meta-intel in intel-media-driver:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/2770
>

 error: the address of '_CODEC_VP8_PIC_PARAMS::ucMvUpdateProb' will
never be NULL [-Werror=3Daddress]
|   238 |     if (codecPicParams->ucMvUpdateProb[0] && picParam->mv_probs[0=
])

perhaps fixable by not checking the redundant
> qemuppc/qemuppc-alt in linux-yocto 5.15/5.10:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5033
> https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2916
>

include/linux/printk.h:450:44: error: using a dangling pointer to
'__str' [-Werror=3Ddangling-pointer=3D]
this needs fixing too. I see it on ppc64 as well.

> Four oe-selftest failures due to missing maintainer entries (easy fix)

I will add it in v4.

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

