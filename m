Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web12.972.1620325617204305099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 11:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KFD+YqVP;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id h4so9224898lfv.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 May 2021 11:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZC1WHW6fcyAWtGUDc02frYPXGjID7Q9XJo2oPSwX6rg=;
        b=KFD+YqVPEjVDR5d+vax149ldsmc36Jk7xoahtYjoOv0U/B9AQ6m9QtFGAqQKfaVvZ+
         DuS++ImfNAZhyv8LBkbNVljtiA38Khm9bVUFPrp70vGwypn3Ce3SRiTd5lqDNvS2rwuc
         NvjL9awNy6QbsLiz5wx6XbXkVtPis1STfcm9Q2Vj26RMCKQYkonIjlHAOxrl/sueNhEK
         PfLPJg7nnFdqx1MYnvaX/84/JP1eG7Dq6mfZFq1k/49bfDnH8PV5C2jHtWRKZy22/0fH
         wKMbu+ZWCQ4VZ85uj4eb1oC8wBWa0CgsbVuqdlJVkQ5UULJWig3p0Z3X5HcnXCtSfiPe
         hDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZC1WHW6fcyAWtGUDc02frYPXGjID7Q9XJo2oPSwX6rg=;
        b=aQtPd7TcyAsZUHZOIEHb5eHRlneV5f/uvGC6MQ3El+2nNLxR7eE7fXjl4pAhthKL2X
         LE6TnVEwc7SAmWVrvn+WT6V3VuA05svmeS8gwdJZoNcxlt/1qsVgtHZa+xpy7t5dCCzG
         hXZZs43n3BjrrFfw8PzH3PY2ARPfEBhuKpW3HE1UrEgtOKXE0/Zp/OyH/ODFSLpNknqD
         MbVRCf/IrS7CgKG3UAaIUTeD5tgcbD1sAjiw1av3t2yzvvnUnlSzYQJSZG063j72jThK
         F0+z0i4NXCTXRBeSKy2iHfAPMY4xcuNo1Md8DO4FY5iYRPS+BtBL1uPz4Xu6OQKvXwCF
         63Sg==
X-Gm-Message-State: AOAM530EFW+5gvUN6LIjFxA+75oqjfI8/tFtXbT/8gOlHO4LtJOam/VO
	V4u52zgkSLPNqp/lcCucaEifpLRX+PUJ78WVNCQ=
X-Google-Smtp-Source: ABdhPJzvD5VEsF2k7dy2qLOBD/VkiT+qggJ+kthPvqqNW2lvGHrGO5K5OdLSkZWKATO3xdFcsoPHbIyv9OUaXbTdz4g=
X-Received: by 2002:a05:6512:3e9:: with SMTP id n9mr3920675lfq.207.1620325615061;
 Thu, 06 May 2021 11:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210429113046.172473-1-vinay.m.engg@gmail.com>
 <4064cc6aa03b56a7e3aa5e403fc4c17ed5bef77d.camel@intel.com>
 <CANUMPcUyz7S_ynQGEtoq03TjnD-ccJZF9=Vfin+QGe7TW_GkEg@mail.gmail.com> <5477b2d1345e68ebe5fe99c23325fc306215611b.camel@linuxfoundation.org>
In-Reply-To: <5477b2d1345e68ebe5fe99c23325fc306215611b.camel@linuxfoundation.org>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Thu, 6 May 2021 23:56:43 +0530
Message-ID: <CANUMPcUdbwYA4uvD-0ZnuhoA5cmQRiK4nnUUGLptpxjd4YYcQw@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] Binutils: Fix CVE-2021-20197
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"vinay.kumar@blackfigtech.com" <vinay.kumar@blackfigtech.com>, "rwmacleod@gmail.com" <rwmacleod@gmail.com>, 
	"umesh.kalappa0@gmail.com" <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

>> The patch was tested and then merged but we can update the patch header with
>> more info if we have it.
Thanks for clarification.

Updated the patch header with additional info,
===========================
This patch is cherry picked from commit
95b91a043aeaeb546d2fea556d84a2de1e917770 on binutils-2_36-branch.

The original patches are discussed at,
https://sourceware.org/bugzilla/show_bug.cgi?id=26945#c14
https://sourceware.org/bugzilla/show_bug.cgi?id=26945#c15
===========================

Sent v2 patch with suggested corrections for review.

Regards,
Vinay

On Thu, May 6, 2021 at 6:19 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2021-05-06 at 17:55 +0530, Vinay Kumar wrote:
> > Hi Anuj,
> >
> > Thanks for the feedback.
> >
> > > > This doesn't look like a cherry pick of: https://github.com/bminor/binutils-gdb/commit/d3edaa91d4cf7202ec14342410194841e2f67f12
> > > > What else is in there?
> >
> > cherry picked commit ids in the below order to "SRCREV" of binutils-2.36.inc.
> >
> > 1. 8e03235147a9e774d3ba084e93c2da1aa94d1cec
> > 2. d3edaa91d4cf7202ec14342410194841e2f67f12
> > 3. 8b69e61d4be276bb862698aaafddc3e779d23c8f
> >
> > Direct cherry-pick of "d3edaa91d4cf7202ec14342410194841e2f67f12" into
> > "SRCREV" gives errors due to the changes in arsup.c file. So used
> > 8e03235147a9e774d3ba084e93c2da1aa94d1cec (binutils: Avoid renaming
> > over existing files).
> >
> > The commit id 8b69e61d4be276bb862698aaafddc3e779d23c8f is
> > to fix the binutils build error with Mingw.
> >
> > > > Also this didn't apply on hardknott and I had to rebase it. Please also
> > > > use b in the subject for binutils.
> >
> > Will send a v2 patch with corrections.
>
> The patch was tested and then merged but we can update the patch header with
> more info if we have it.
>
> I'd assumed the differences were due to the smart_rename disabling/renabling
> the patch mentioned.
>
> Cheers,
>
> Richard
>
