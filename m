Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42254C46467
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 23:52:54 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.62009.1674172372770799005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 15:52:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WuTI3A3j;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id cm26-20020a056830651a00b00684e5c0108dso2176538otb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 15:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c4Dcjjaja9hqS+OWM+u9DE2gz16DhU8pLmkdLKBwy+Y=;
        b=WuTI3A3jJXcbKX+UmltCB/IvCXBsWHKqM68HjTgjtAggnLP308DPROt8jDZ1pXBUiF
         23gfL5rqnjb3mllUodxJ1+1zzJ5b9iYcWsxEhjlsKVEKkwQy4PeBtqs+m1Cm1Dti0Pjs
         nZkzml229wBsaXK1sifM4L5KMj+L8htbuR1j7GyvejSTdgqSWvdBujT9qTjxfNEgu8h3
         ppJUqgwP8uMBQ3oVnWk53mrj0ONb0l2Opmw6oDuYxLzLHs45Dl0I+UWxI2PiBmX5F5uM
         jhub/7A+IoKiA+Piuvnju9CfwDPqReqE4T+SCntkjxsuFvXB+3gA9sDRzzEIbKStHH9E
         EbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4Dcjjaja9hqS+OWM+u9DE2gz16DhU8pLmkdLKBwy+Y=;
        b=qn3QqQZQJcO57vSzOaJEwTxyC9zkATEPIHEpweIUErP4IxR82m+goGjyhX0zj5AmAp
         kuvFINbivgdVaaPVvn1mSI0OWwaR5BGohwmTWpvuUEXZ0gqrIvzjUymoB5QVV+g4VL9c
         vlKiWO7fnnP5545pA7V+KH1D5YMfwMlyF8Bw+ykYB+isEuFHcK/+E3833bzRTIWQH+L7
         A+5nvWG4jV5SlWgbB/ntIZ96Cs0y1Ljl1whEsa/m6qMrmqIw7dsNkacAqHAhPsFFN1TZ
         4j9fknTx6ntb6spz+zjU2RmT6YViZl6TiR+0jJdK7K4kjXtlEQFS6RnrxE/E1okCYQEa
         Bfug==
X-Gm-Message-State: AFqh2ko49mB9Cb14fO7SJtce0EHuSaK0ETg0eXSsjpyf1hYrpUXnrH1k
	CYgbdFf2gSPxG5DL6D/VW2jbcp+ha1aRE8pIntY=
X-Google-Smtp-Source: AMrXdXvJaKy/e4jVAHya6BG7wtndOFbSrFt5LSpnP5onWxqBInrkZ+q85rS3bjCsZ0Cot8S5kzDY5J52o9T8PLpVVPA=
X-Received: by 2002:a05:6830:6382:b0:686:4bf5:e675 with SMTP id
 ch2-20020a056830638200b006864bf5e675mr650296otb.111.1674172371906; Thu, 19
 Jan 2023 15:52:51 -0800 (PST)
MIME-Version: 1.0
References: <20230119042724.1413857-1-raj.khem@gmail.com> <20230119104413.0afa6711@booty>
 <CAMKF1sr=HFFJJ-HNe2r3rn0zeD4Fw5Fxn69jde9EE_ZBFvJtEA@mail.gmail.com> <20230119235827.20e6f4cb@booty>
In-Reply-To: <20230119235827.20e6f4cb@booty>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Jan 2023 15:52:25 -0800
Message-ID: <CAMKF1sp2F=16yeLQ7iB8ZmQQDR_ryBSJKMdX+g1sMdpb9Tb+Rg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/3] binutils: Upgrade to 2.40 release
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alejandro Hernandez <aehs29@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 23:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176176

On Thu, Jan 19, 2023 at 2:58 PM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hi Khem,
>
> On Thu, 19 Jan 2023 08:52:09 -0800
> "Khem Raj" <raj.khem@gmail.com> wrote:
>
> > On Thu, Jan 19, 2023 at 1:44 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> > >
> > > Hi Khem,
> > >
> > > On Wed, 18 Jan 2023 20:27:22 -0800
> > > "Khem Raj" <raj.khem@gmail.com> wrote:
> > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> This version is failing too:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/6592/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/122/builds/2263/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/6521/steps/14/logs/stdio
>

my bad. I have fixed the mingw32 patch and sent v3. Please try that
patchset out.

> ...
>
> > > > diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> > > > index 4d4929529a..bcc5f7ce1f 100644
> > > > --- a/meta/conf/distro/include/tcmode-default.inc
> > > > +++ b/meta/conf/distro/include/tcmode-default.inc
> > > > @@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
> > > >
> > > >  GCCVERSION ?= "12.%"
> > > >  SDKGCCVERSION ?= "${GCCVERSION}"
> > > > -BINUVERSION ?= "2.39%"
> > > > +BINUVERSION ?= "2.40%"
> > > >  GDBVERSION ?= "12.%"
> > > >  GLIBCVERSION ?= "2.37"
> > > >  LINUXLIBCVERSION ?= "6.1%"
> > >
> > > Applying this patch on an oe-core repository fails with 'git am':
> > >
> > > error: sha1 information is lacking or useless (meta/conf/distro/include/tcmode-default.inc).
> > > error: could not build fake ancestor
> > > Patch failed at 0001 binutils: Upgrade to 2.40 release
> > >
> > > And also with 'git apply'
> > >
> > > error: patch failed: meta/conf/distro/include/tcmode-default.inc:18
> > > error: meta/conf/distro/include/tcmode-default.inc: patch does not apply
> >
> > It might be due to glibc 2.37 upgrade which I have in my local tree
> > staged as well.
> > you might edit it locally. If you want I can push it to a dedicated branch
>
> Hm, maybe. I will try with your v3 I guess. :)
>
> Not a big problem so far, but an annoyance.
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

