Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0515C41535
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.1474.1649447758199778663
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=sSs8ah2E;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id z15so2329324qtj.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c0sRnxlqA/pdM8hul0z/GWKSAAi26zoOK3T34knrDNY=;
        b=sSs8ah2EmOdJXG/I2bP5RGYayJRiJ41by6aiC+Cs1hF5CHWp7oOHIH1ro/WcEO+L1l
         Lx8Ai33pgI5mm96fQ88Ohx9QrJRk4f5KjfIp5HoNvnb01gywyvrBRQHfb1Eu6qmPc4XM
         Dfp4s98/wWb/Bsi4+XmEnUHqojTWxLo1aVA75AxKBKfZfgszdU5kDLt5V342IciFVBUe
         jsIuOwJzpX+6p0VvYiaEWZHnTfDuATiZoO7Ck/Pf//8fy2pPwRWZ0d2hNkekbKQ3xnsL
         bPOPIIIVFvNvvFEJBxbfzMXQ2xVDH1DLB6b7iDEmI7RPUHLAk8CRRyWvqYsXzPRogdsk
         wKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c0sRnxlqA/pdM8hul0z/GWKSAAi26zoOK3T34knrDNY=;
        b=H0XToPZK9vE91MKIR9MLm1ApFH0T/VaDVu8LZVRZHJFdcsJMNuJ8o0vB2n9r5cfDH2
         G8MVvsAIolQwTW9EwWyxgfp6dtI1UTdMH7OuxHclKFcgS3DxjTibX0kZAz2xJRvHM+QV
         i/XybtFfzto+iSAbFOUShplo79P5RKRWjZHR9RJee4k4Mrbt15VLe2165J8xvqVy/644
         THOOJOI2Rd9mLdEm+p9w+RV7xk5DT3rLiiyWFaxEhhekmHwN4KHsDGzXZFPkW8ij9EnG
         xaBZZWtRNeORfnoeEDW9z+LAWO+plqGcwAhBaNsuUA7G3nwzPhGlu/EeRkz8DIUkXwkO
         HJ/A==
X-Gm-Message-State: AOAM532oU8phPtLdq9nETTcnDCxEDCJNGFNbdCxDR4rqHBPZR/UOth63
	E4dR29FA/UEo5pFXjW1dCBKKSFqndRAotm/zKTG8c1qYD4owaw==
X-Google-Smtp-Source: 
 ABdhPJyEM4Dtg3BbN8wtcAGfzmNBY1g19QRE19v5IRDlE2BkWUbGaF+unpkDcuIiblnY6TNdiCUJgxYlUpsxU+rmWWk=
X-Received: by 2002:ac8:5a04:0:b0:2e1:d39d:61d8 with SMTP id
 n4-20020ac85a04000000b002e1d39d61d8mr17564901qta.363.1649447757295; Fri, 08
 Apr 2022 12:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220408192521.1608764-1-jdmason@kudzu.us>
 <20220408192521.1608764-6-jdmason@kudzu.us>
 <6f6d562e-f33f-e528-4dda-ccc4bc444b74@gmail.com>
In-Reply-To: <6f6d562e-f33f-e528-4dda-ccc4bc444b74@gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 8 Apr 2022 15:55:45 -0400
Message-ID: 
 <CAPoiz9zasM8oWqhSaiDVdvWwdrWPEkt=Qzr9VH41os1RsNz_jg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 5/6] poky-tiny: add a distro description
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164173

On Fri, Apr 8, 2022 at 3:40 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 4/8/22 12:25 PM, Jon Mason wrote:
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> >   meta-poky/conf/distro/poky-tiny.conf | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro/poky-tiny.conf
> > index 499af906a898..91c596faf182 100644
> > --- a/meta-poky/conf/distro/poky-tiny.conf
> > +++ b/meta-poky/conf/distro/poky-tiny.conf
> > @@ -32,6 +32,7 @@ require conf/distro/poky.conf
> >   require conf/distro/include/gcsections.inc
> >
> >   DISTRO = "poky-tiny"
> > +DISTRO_NAME = "Poky Tiny (The Smallest Yocto Project Reference Distro)"
>
> maybe replace 'Distro' with Distribution

poky has
DISTRO_NAME = "Poky (Yocto Project Reference Distro)"

But I guess there is some form of humor in the tiny distro having a
longer distro name :)

>
> >   DISTROOVERRIDES = "poky:poky-tiny"
> >   TCLIBC = "musl"
> >
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164170): https://lists.openembedded.org/g/openembedded-core/message/164170
> Mute This Topic: https://lists.openembedded.org/mt/90343239/3616920
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
>

