Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C214FC00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 17:05:23 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web08.13567.1661360713987119846
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 10:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CeHgkNLz;
 spf=pass (domain: gmail.com, ip: 209.85.128.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-3321c2a8d4cso477126947b3.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 10:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=SM2JZMaY+6RkgE3i/XXR61kqVVgADmcEhU3U5j6NcME=;
        b=CeHgkNLzCSLY2VTrERN21rKsVDvJaaVQ8a8z52LxV25SDurLv1ZmOWvuQJW+l0ncy5
         005DWitjgdCvmdNlotZKuKAe+atm0n7TMppBIKYCsga0+rm4iyTwqwTChiFCn9dhhnnT
         ouCBdeh8XCsskxLuzJohzUb+geJmZ6Ad0JDzaXkxiqzWKSYXDBSZkwU5CjAiwKlZC5Od
         PIw4IutSRq7UtjmymHytORxuG/XxYIHsCx8JKwqMQYUZX1pQv6zf5x96NocQ/2ZLyNL1
         AyeKZea0+S4waVcVOqfk3DtjlNLUP+C6MnUjMsghobVSx8MPAPO4NmTc4QWpOtCcl/9y
         8fSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=SM2JZMaY+6RkgE3i/XXR61kqVVgADmcEhU3U5j6NcME=;
        b=7CwDJ+MRXQ/QVve/PgcxSm+r6UXR3UUNtfr5LFRyT2EXid9pwPsc79JhFY4Aqc1lY0
         6gUKOI4lZEyJhefn/RDUqCkJ3mQHgYyWipWUsKA8j8obAQw/1fW30oyyhKqoDZmGTWIa
         aDNm6I2WBK3BAurbx7sr8daN2ulyiTbrk+XXUpcPCj6rMRetqTLMuUmwuuXJqwnLu9Bt
         bRV7guPZ/KSzk+GfozbAyRh+r6BqknFsNDBd2TcssyOWA/lnfCgXmlqo2gy92uEtP0pn
         4Y/BuB0aWNrVwTv1lFfifpgEWkn/Yr5ElF3EEE89wWI52ZyNvv249G0KkLITu+ACdFKj
         TGRw==
X-Gm-Message-State: ACgBeo1O+7F5MkmOJJ6qQf/paxDX5HFscAxkCTgbCuXa6HsI8bf9zwho
	C4Gmmr3yW1FynRfkSosYxdvNUTj6RcnUYj1/pSw=
X-Google-Smtp-Source: 
 AA6agR60mEs6eqa2WBzVvhpFMl9cEYiiwStq1lqNJlFPXAecofkPn0vWNL9gMSqwaogkZPwCcLh620UuobaRbuxx3pk=
X-Received: by 2002:a5b:107:0:b0:67c:4077:17f0 with SMTP id
 7-20020a5b0107000000b0067c407717f0mr44040ybx.363.1661360713090; Wed, 24 Aug
 2022 10:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220823180151.3321962-1-raj.khem@gmail.com>
 <20220823180151.3321962-3-raj.khem@gmail.com>
 <20220824185224.370c44bf@booty>
 <CAMKF1src=s9CWjps=i1PBNw=Q6BuEwE=FpJi9O9R2en3A+3BCA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1src=s9CWjps=i1PBNw=Q6BuEwE=FpJi9O9R2en3A+3BCA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Aug 2022 10:04:46 -0700
Message-ID: 
 <CAMKF1spoc4GsrCNAEc=xUJZ2LWBHH04rSEEm+32Oom5-+ZPemw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] ccache: Upgrade to 4.6.2
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 17:05:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169826

On Wed, Aug 24, 2022 at 9:57 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Aug 24, 2022 at 9:52 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> >
> > Hi Khem,
> >
> > On Tue, 23 Aug 2022 11:01:51 -0700
> > "Khem Raj" <raj.khem@gmail.com> wrote:
> >
> > > Fix build with musl
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > AB testing with these 3 patches I got an error in test_ccache_tool. Not
> > sure these patches are guilty, but they are the only ones
> > ccache-related.
> >
> > Maybe you can have a look?
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4037/steps/15/logs/stdio
> >
>

looking at logs I see rsync is failng perhaps due to some pseudo stuff
underneath or combination of.

| INSTALL /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3150738/tmp/work/core2-64-poky-linux/linux-libc-headers/5.19-r0/image/usr/include
| abort()ing pseudo client by server request. See
https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on
this.
| Check logfile:
/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3150738/tmp/work/core2-64-poky-linux/linux-libc-headers/5.19-r0/pseudo//pseudo.log
| rsync: connection unexpectedly closed (14935 bytes received so far) [sender]
| rsync error: error in rsync protocol data stream (code 12) at
io.c(228) [sender=3.2.5]
| make: *** [Makefile:1277: headers_install] Error 12
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3150738/tmp/work/core2-64-poky-linux/linux-libc-headers/5.19-r0/temp/run.do_install.3307996:185
exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):




> drop the upgrade patch
>
> [3/3] ccache: Upgrade to 4.6.2
>
>  and see if that helps. We dont really need that for gcc 12 issue.
>
> > Best regards,
> > --
> > Luca Ceresoli, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

