Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334F9C433FE
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 16:52:37 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web09.128.1652115148698475227
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 09:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NqSE6Vef;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id e17so10883854qvj.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wgVjynSWTxodfILwFhzxVRUhhfeABxnja+NfV+BIZrI=;
        b=NqSE6VefS5BBlv5YqbNVfvnD/RlkAR0viGctrzUttA/He3LKT9tfvkS3+AI2jobJI8
         4Y9YT3w7tlQgl4kCiuJmJ6B76U2PpB3sPD2PcAxAE3bt+jpy1d0Lj2i9lY/SJ+Azc+LI
         uL7es9T7VT0Ye1uqYe4N1n09l0Xcm1chfcvQRcHBQ0Py1SQfYdZGgZfVBMnbwHdHtfxH
         Sz3ScSc0Tm4x9FRTtwXEEcnbEHqI7pjXbV+tOCxIZ5ShkcPZXzoTZrBdP2Llir4KVw8h
         E8VvXNQDazdiJL1m0c8VLcur40y4uRiuqEvIp+M0ZMaddRLgghl0pa5D6XfYqyf2hCYz
         3bsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wgVjynSWTxodfILwFhzxVRUhhfeABxnja+NfV+BIZrI=;
        b=DJd4IAn4WHU4+RIPjdurCR338PJrKnIc4ACaXB3fz5H20fKim0Rnf1zwiTTdONCgJ5
         Iib1qeD10QA8BLq5rr/vcz52htJuK2aSWtUtddj7yxWIzXOWEAnm/U7kSmZ+++PbfM0j
         1/rFgShQLa6AahfwUaUnrm2URs3oak5d/xRx1YWNJn+v/QIgpNgdC79ZT/2tZB522Y9c
         loBmVJXuHyRyegm/hXOXCDD4feksFbcSAPiKbBQlkR+Ev5QtnLMEMSy61LVMgDc6OlMg
         Kh2IYirKo5XNch94MMQt5Uj9EZR9Cyho1RGhBc+46p53/iYFuoOkZw6xlxIWU/uwL2XL
         mafg==
X-Gm-Message-State: AOAM531FUuk9d5ZJtO1DsCMN/6idBD0mjFvpUhVLwgURrwaJc46gLh0K
	Ij3X1jR+glMbkx0xIQ1vn8F9x6RUn1MTKH7Ashs=
X-Google-Smtp-Source: 
 ABdhPJxX9ZHa+sv8JmGastVQ5/D33ds9rtmaj4uoSJUjHUJcmqEII9RQIXhm2EMW5yjQlCbdkZhp60MzT//pt6SRMKw=
X-Received: by 2002:a05:6214:410c:b0:45a:7a94:ee04 with SMTP id
 kc12-20020a056214410c00b0045a7a94ee04mr14334344qvb.63.1652115147749; Mon, 09
 May 2022 09:52:27 -0700 (PDT)
MIME-Version: 1.0
References: 
 <0f338ca1e26012b86f183975252e670f11776e99.camel@linuxfoundation.org>
 <CADkTA4MuiKGp-PqEC2B4UmsiUrVi89kTxm_Bn9=-myOGsoWo_A@mail.gmail.com>
 <e5b0f0f42b1fe5cfe94901387ff9d18225b76368.camel@linuxfoundation.org>
In-Reply-To: 
 <e5b0f0f42b1fe5cfe94901387ff9d18225b76368.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 May 2022 09:52:01 -0700
Message-ID: 
 <CAMKF1spqRgTqDQP81_MX0odWXyZF1dEiFuhpNefVcqeuvZXz-g@mail.gmail.com>
Subject: Re: [OE-core] gcc12 testing results
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Ross Burton <ross.burton@arm.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 16:52:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165402

On Mon, May 9, 2022 at 9:34 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2022-05-09 at 09:24 -0400, Bruce Ashfield wrote:
> > On Fri, May 6, 2022 at 11:14 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > I reran the gcc 12 testing. We still have an issue with linux-yocto
> > > 5.10 and edgerouter:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/3046
> >
> > I just sent the yocto-bsp bump to 5.10.113, which had the identified
> > -stable fix for gcc12. I can't say it is 100% complete at runtime for
> > gcc12, but this moves us along.
> >
> > >
> > > and meta-virtualization has a couple of issues:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/46
> > >
> >
> > I pushed the patch that Ross found on opensuse for gcc12 and Xen. I
> > can only say that it doesn't break gcc11 at the moment, but again, it
> > moves us along.
>
> Thanks, that looks like it fixes xen but xen-tools still has an issue:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/60/steps/13/logs/stdio

yeah I have sent a patch for xen-tools too

>
> Cheers,
>
> Richard

