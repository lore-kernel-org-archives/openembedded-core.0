Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EE4C19F2D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 14:29:14 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.5445.1660400946933893478
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 07:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CppV+I/B;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id y23so3431690ljh.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 07:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=IVMUxZGMz/rSuTZfUyhD9SCCbjRQe9vZXkmMK0GGCak=;
        b=CppV+I/BktnVTvdYujyn/dYeJ1zirf0V9q+za9/h4+ZoIQ8Et+BtHGXFikn7pMP5p9
         sAz770A2GuakioXGrd/N36Uu9Zj/GQkwAo826D8dPyUlNFTY32qhF873x6aR04fAP4LV
         4MK3D0kLSJ+HgFoQ3hTr8sQ4I/WiLFO9emPzWXiYS4VmVvM44HGW4me0i29AMHA094jC
         rccV2CZsAfZDOgydfR3ULHFuILyFmAZjixpBWgkvZOm7BR/LsoFzbLZFP4Hn8YNfTLs+
         EPZPcrVMEtL+zC1FaOuMOB81XxmISwXiS+23zh3QhLvHanygApqJsmehNb4+0QhakgV4
         w94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=IVMUxZGMz/rSuTZfUyhD9SCCbjRQe9vZXkmMK0GGCak=;
        b=ctuIxtQ7ZxgaNlWObysD5RJkw62UmicXDR2r4NthCMrsH5MlYU9m9Ii3QJ7JsXQeB8
         tvvPmJNVvlzJdKHrhwvZ1YwNzrWdpfT3Cbgb3ZbbfKUPS5PCfC220idE/26yrDheOVwf
         QPTisZQepBXvzdNqSm/ZiWr5dg72S1+0XnfseYNg+4TFsm6XiBeqaKGT+1XjFtaDRetU
         sczk1DgIKGygmblc5NXsZtIr1APbB58YWNMxJsA71GQMq2ZCTyk9IAn6Km3LzfQmnqQS
         S2Q45TJ2wozWtZHAgHCdMdfkL+IR5WoW+C1hFRHPvFGHyUiOtob1BERVItDO5BAKo9Ef
         9WGA==
X-Gm-Message-State: ACgBeo0GgNCs6J74BmQkbUsUzH1lGsA2EKhzKW53pg8GC0C9OBItjK6q
	sf+xosWmkUES2trf85PjGgUl9357ladoT9u6aOY=
X-Google-Smtp-Source: 
 AA6agR6sjNmCvohuehvwmHLAoXLpVvUajzww5GY14p2NIFAxJMxMesjxqq/Z1FQ/quwxLFEfaAHX/L0O4hDNKiUIi9I=
X-Received: by 2002:a2e:804e:0:b0:25e:7231:c304 with SMTP id
 p14-20020a2e804e000000b0025e7231c304mr2521869ljg.257.1660400945299; Sat, 13
 Aug 2022 07:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220808064237.3975347-1-alex@linutronix.de>
 <20220808064237.3975347-12-alex@linutronix.de>
 <Yveh2svRupzwP67Z@mail.local>
In-Reply-To: <Yveh2svRupzwP67Z@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 13 Aug 2022 16:28:53 +0200
Message-ID: 
 <CANNYZj9XdS0p_ms9nzOpg1-aQt-sSPVkf-DWSTG33UFyiC-gEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 12/44] util-linux: upgrade 2.38 -> 2.38.1
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 14:29:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169309

I believe there is nothing to rebase, the latest patch was merged.
Same for stress-ng.


Alex


On Sat, 13 Aug 2022 at 15:06, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> could you rebase on master?
>
> On 08/08/2022 08:42:05+0200, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  ...{util-linux-libuuid_2.38.bb => util-linux-libuuid_2.38.1.bb} | 0
> >  meta/recipes-core/util-linux/util-linux.inc                     | 2 +-
> >  .../util-linux/{util-linux_2.38.bb => util-linux_2.38.1.bb}     | 0
> >  3 files changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-core/util-linux/{util-linux-libuuid_2.38.bb => util-linux-libuuid_2.38.1.bb} (100%)
> >  rename meta/recipes-core/util-linux/{util-linux_2.38.bb => util-linux_2.38.1.bb} (100%)
> >
> > diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
> > similarity index 100%
> > rename from meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb
> > rename to meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
> > diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> > index c9bddfb7a6..f1511f02a8 100644
> > --- a/meta/recipes-core/util-linux/util-linux.inc
> > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > @@ -37,4 +37,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
> >             file://avoid_parallel_tests.patch \
> >             "
> >
> > -SRC_URI[sha256sum] = "6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64"
> > +SRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"
> > diff --git a/meta/recipes-core/util-linux/util-linux_2.38.bb b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
> > similarity index 100%
> > rename from meta/recipes-core/util-linux/util-linux_2.38.bb
> > rename to meta/recipes-core/util-linux/util-linux_2.38.1.bb
> > --
> > 2.30.2
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169036): https://lists.openembedded.org/g/openembedded-core/message/169036
> > Mute This Topic: https://lists.openembedded.org/mt/92887007/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

