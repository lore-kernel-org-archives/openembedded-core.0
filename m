Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6C2C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 17:19:37 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web08.668.1664990370650444905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 10:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o8FoPh7r;
 spf=pass (domain: gmail.com, ip: 209.85.160.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-12c8312131fso20647678fac.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 10:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Elt4lSyBPhZdeRlavo54W3Lb7jH5di7WIkd4pPCpC6s=;
        b=o8FoPh7ri548atSyOVyIXhQCJBhRWfNhqg6rQiZdZ4pMM499vfc5vUUSnsGL26fa82
         J7KrEAILxApad4NZC//F5Qg+WVlyzdC1HsUqsi76IvVrpgwXJhQA4aeVBydYJq3+G+re
         BNoFZ0J4A/gr2wOeakjMz4K/J4gUp5vK16OSDT2Yydgf/1l69BQnH1hw0fiJVEfmSHyp
         tCAR0tSfnvl/xlLG0JgSBZ2rWwqaxZwCELODLZtUPT+yQ5PpeN1P77GJFgyDdqB673Aw
         ZRobGuymlgVZxV0iJ2V7ROvbCBnbiklG1sfQF1+lomefaI5V3k11GNOk3I3G0pcpQycU
         HFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Elt4lSyBPhZdeRlavo54W3Lb7jH5di7WIkd4pPCpC6s=;
        b=WSMXht0oy9O8EDPsR2XoAyhEUkyMa4LKyDd/DP0peVJYkm0zE36Pg8/a+FKgCE5GCd
         UKTMmdvDaPI7wg+uMyIYapv3SNKkTgIA1WseKP+63VTWXAVizn7Ywfg9/+uWrxjEO20D
         8pdhR5JAUHaZ6Uus2Gh507+TU/fMGs5cVwCW/uRJM/vwOJY6hqwY4sWaWFg6FZ5ieL+a
         hYIz4pUSDhZaWMdbGssvA7oBmZgd2YdobonBBR9N8+VYGv62gSQcVEn7JD2tizuck47k
         gmvuNK1mym42w1QEVrZd8opyzaPcaKNhXRn7U5qc0W9MFYpbi4sONrQlu5Occi3lwtpb
         ihrA==
X-Gm-Message-State: ACrzQf0kl8LHN8/xAmID5xCqlkuwKGSU7Qwinww94ib3JfE2lT0xxwyn
	O7VywfoYrNKhO2ZWSIgMMaH08RQqBo0fWdFxOTs=
X-Google-Smtp-Source: 
 AMsMyM5dUkw+sEQQ0a+11suI232X/kO8Eemerz29WFhjmA5gWD8Jw7Q8PGM9wVl4d8bipBXcexor9/FIaRfV2V15ims=
X-Received: by 2002:a05:6870:c5a4:b0:131:6edd:3955 with SMTP id
 ba36-20020a056870c5a400b001316edd3955mr372937oab.96.1664990369894; Wed, 05
 Oct 2022 10:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221005150138.2538539-1-thomas.perrot@bootlin.com>
 <CAMKF1sps-=A9OpQK86jX=EkYDVxWVfabD84G27+75VdMiguJHg@mail.gmail.com>
 <3a9e20001ec3677f73b451708c0932d7daf4f838.camel@bootlin.com>
In-Reply-To: <3a9e20001ec3677f73b451708c0932d7daf4f838.camel@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Oct 2022 13:19:18 -0400
Message-ID: 
 <CADkTA4Nh6uWd1H5LxSRCNiPzh3LJM3yS4bwZa2VZSgWN7rbVbA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] core-image-sato: install virtio input for Qemu
 targets
To: thomas.perrot@bootlin.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 17:19:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171473

On Wed, Oct 5, 2022 at 12:51 PM Thomas Perrot via
lists.openembedded.org
<thomas.perrot=bootlin.com@lists.openembedded.org> wrote:
>
> Hello Khem,
>
> On Wed, 2022-10-05 at 09:19 -0700, Khem Raj wrote:
> > On Wed, Oct 5, 2022 at 8:01 AM Thomas Perrot via
> > lists.openembedded.org
> > <thomas.perrot=bootlin.com@lists.openembedded.org> wrote:
> > >
> > > Otherwise, it isn't possible to interact with the UI.
> >
> > I wonder if it should be in the MACHINE_EXTRA_RRECOMMENDS in machine
> > configs, it will help a wide range of users who may be using
> > graphical images.
>
> I hesitated to put it in MACHINE_EXTRA_RDEPENDS for Qemu targets.
>
> Currently, kernel-modules are in MACHINE_EXTRA_RRECOMMENDS of Qemu
> RISC-V and PPC64, which are not installed when NO_RECOMMENDATIONS="1"
>

We don't control the kernel configuration to the point where we can
guarantee that something is built as a module or not.

Have you tried assembling the image with that option built-in, versus
a module ? Last I checked, a kernel-module* dependency won't be
provided by the built-ins, and this will trigger an error.

With that option appended, it isn't something that can be overridden
easily, and the qemu* + core images are used as a starting point for
demos, etc (whether or not that is a good idea is also debatable). If
a non-core kernel provider and qemu are used in a scenario like that
.. they can trigger the error.

Bruce

> Kind regards,
> Thomas
>
> >
> > >
> > > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > ---
> > >  meta/recipes-sato/images/core-image-sato.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta/recipes-sato/images/core-image-sato.bb
> > > b/meta/recipes-sato/images/core-image-sato.bb
> > > index e63a229d1257..0e37c15097b3 100644
> > > --- a/meta/recipes-sato/images/core-image-sato.bb
> > > +++ b/meta/recipes-sato/images/core-image-sato.bb
> > > @@ -12,6 +12,8 @@ inherit core-image
> > >  TOOLCHAIN_HOST_TASK:append = " nativesdk-intltool nativesdk-glib-
> > > 2.0"
> > >  TOOLCHAIN_HOST_TASK:remove:task-populate-sdk-ext = " nativesdk-
> > > intltool nativesdk-glib-2.0"
> > >
> > > +IMAGE_INSTALL:append:qemuall = " kernel-module-virtio-input"
> > > +
> > >  QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m
> > > 512", "-m 256", d)}'
> > >  QB_MEM:qemuarmv5 = "-m 256"
> > >  QB_MEM:qemumips = "-m 256"
> > > --
> > > 2.37.3
> > >
> > >
> > >
> > >
>
> --
> Thomas Perrot, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171468): https://lists.openembedded.org/g/openembedded-core/message/171468
> Mute This Topic: https://lists.openembedded.org/mt/94137249/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

