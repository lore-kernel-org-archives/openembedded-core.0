Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B21EC433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 21:41:50 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web08.3509.1638481309078706402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 13:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YmoQDtH0;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id s9so836532qvk.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 13:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=922eEKwH3kiWSe70C8QpKyNzJ7EwRO4lwxnW2Pd1MHk=;
        b=YmoQDtH0sBORvsbwQzC0hXkr/OAikJLVzayI4IFqWiBptYzWXRYqLVGSTzoVzia/vN
         iISiW8H+0jKumXhaHKr+NIu8jSEJLAjaiT3LablnB2hjL1mW0QZsNl1ftzzsA5KAGrzL
         PiT1+dugq1YI142PUtLV9WwvdrcFxIwFBl3x+NJU7dEzJIfA0BzBOSDUcG3xC0rXtizp
         xx7lAmAokZR1g2xeWuLwgctx2CxUaV4KSsDQytpjLUrEQwGFZ3wd6gyKWi7vR2LoUCCB
         tg+E02WkTQXniEuM8aB9ByNl5pESmlEAMUvxLdcjmp7yraV/zjYJJ9e8v16lSAKIm7tm
         VbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=922eEKwH3kiWSe70C8QpKyNzJ7EwRO4lwxnW2Pd1MHk=;
        b=soO3ID1kLYQK5x1y6RA5YshgtXm3hny6dJnymbZh88NrMmrObEG+rm/3MP9OgVnGBR
         ebSmeP0igFamiGAjZuyX0F7ngEewFQlaj1/erEqZToppo5OZIpb0ny7z85kDuTxcJnd5
         V943myDVEVAG6qlrQlP/qjB62alCKZ+O2GITnbFvvzO3aQsXMM+LLYskYKxORjGP4xeQ
         grJKUKRUfdaU13Wm3uEcPs6rgi/yIfq3GbdkvVFAutgppuc0m6vvbNMFnO6ksNn2mMXE
         6dVO+4iuQuMDIYoXQf/DULN3YAgGRJfRqD0NOeUbnCJLoVJxCW5dSaKFth8EIgMTysgm
         kskA==
X-Gm-Message-State: AOAM532Zc+DFIEnHCBAStW7M0YNG59J/kq+uMeb2kuu4TavjseAAH0KG
	26ybgiL+ElX+s8Qxw35grSsy7hGvz0EOQQZajTw=
X-Google-Smtp-Source: 
 ABdhPJwJYyUW7rM6QEqEC885E/H9j+Omc9nnTkXjJTfBA2aeuzeDmz2dJvDseQpc/z/icUle6CmTtY0bs0W1k4eJJlw=
X-Received: by 2002:a05:6214:c83:: with SMTP id
 r3mr15753799qvr.110.1638481308161;
 Thu, 02 Dec 2021 13:41:48 -0800 (PST)
MIME-Version: 1.0
References: <20211202202056.698020-1-raj.khem@gmail.com>
 <a346808b3be445a880c78236394174be@axis.com>
In-Reply-To: <a346808b3be445a880c78236394174be@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Dec 2021 13:41:22 -0800
Message-ID: 
 <CAMKF1soNmejTNV_WU7dCOYYXGR=Zc6AWDw7pPUZM-yDUiNqvCA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tune-cortexa72.inc: Add tune for nocrypto case
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 21:41:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159105

On Thu, Dec 2, 2021 at 1:32 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 2 december 2021 21:21
> > To: openembedded-core@lists.openembedded.org
> > Cc: Khem Raj <raj.khem@gmail.com>
> > Subject: [OE-core] [PATCH] tune-cortexa72.inc: Add tune for nocrypto case
> >
> > RPI4 based on BCM2711 soc which does not enable AES extentions
> > in hardware see [1] fixes [2]
> >
> > [1] https://forums.raspberrypi.com/viewtopic.php?t=207888&start=25#p1642862
> > [2] https://github.com/agherzan/meta-raspberrypi/issues/964
> >
> > [YOCTO #14641]
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> > index 2a510bd45bd..b2eb35f111b 100644
> > --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> > +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> > @@ -6,8 +6,14 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=corte
> >  require conf/machine/include/arm/arch-armv8a.inc
> >
> >  # Little Endian base configs
> > -AVAILTUNES += "cortexa72"
> > +AVAILTUNES += "cortexa72 cortexa72-nocrypto"
> >  ARMPKGARCH:tune-cortexa72             = "cortexa72"
> >  TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a-crc-crypto} cortexa72"
> >  PACKAGE_EXTRA_ARCHS:tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72"
> >  BASE_LIB:tune-cortexa72               = "lib64"
> > +
> > +# Some implementations do not enabled crypto ( e.g. BCM2837B0 in rpi4 )
> > +ARMPKGARCH:tune-cortexa72-nocrypto    = "cortexa72"
> > +TUNE_FEATURES:tune-cortexa72-nocrypto = "${TUNE_FEATURES:tune-armv8a-crc} cortexa72"
> > +PACKAGE_EXTRA_ARCHS:tune-cortexa72-nocrypto = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72"
> > +BASE_LIB:tune-cortexa72-nocrypto      = "lib64"
> > --
> > 2.34.1
>
> I do realize renaming cortexa72 to cortexa72-crypto would not be backwards
> compatible, but is it really a good idea to introduce a name like this
> that does not follow the naming other tunes use?

yeah I thought about it but its an exception than norm.  We also have
novfp usecases.

>
> //Peter
>

