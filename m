Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F64C43334
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:49:24 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web08.404.1654102155250508632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VZkCK//4;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id q1so2642743ljb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rbLUnN9iAZCVQK2LtXBNFHBmkxT9XL8r8dVf54g4h4M=;
        b=VZkCK//4QzwCX+d4NdEKm5IsMhI1YfhF1bIVQtCH0Uy40tje2GGF3imKW17ymtegrz
         ZIQAPhOqwcI8tgzCC3XbtXJgLhGYvfJIL6L1xU4MYE52i4srDdfn84V+9nogke4ohqRn
         yF8+ufEJKQ/OE/3RSC77FV4/z7OgC7GDf422JYwaGwxEG0X5VWmpoSl8yqTJYs4Q/D0h
         dYTETMJSCymcw035yGUtC9ilTfhYFWtj3OS2OBkdPIWmc3VcCUc3TONvDDsljv7oL9LX
         upgAn4lePE0e7DAwLurf7F9dvXy//fkP1c4AMs6XvFHcW0dvqixCi4MQAClABSJ7BBt0
         bDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rbLUnN9iAZCVQK2LtXBNFHBmkxT9XL8r8dVf54g4h4M=;
        b=q1njf3xxECKhQAvpqYFZh2yRFVSIdnv462DZe4mBf3xd5MJ2Wa9HGG8byE2itlS4mx
         KvUZQVx1MKZf58nyrzdTwsWRaLQR2PXt5E7YHEv32SpTEuGMw+ITnBKB5GJyTxMa2z2L
         cKRimRS44EVK1TCT6MHENxvLJ12u3Ovns32UdElRauMXa2PHioh0t/sSinrwRRjXrLyt
         jhuUlkukcscpqSwH6OTngT4HD+n6orm5FMtoSCLriM1wgEKzHBg0lbfRqsWOkNJweh93
         C2iPYtA05ij2Lh9W27icGDjjw5/u0Mmjy+HhYzJD/Q2hbsUVlP8w+hD23Hwpe1weecV4
         VCJA==
X-Gm-Message-State: AOAM530qT+iO2jgjN7Pk9xGh91NXI07xFUH7VoR4h5VGTMA/8zhSmChx
	hlgKCTI9Ih61GuF8X8H8nxBzbcDrMkqlMcDzE94=
X-Google-Smtp-Source: 
 ABdhPJxY8/iQIcXZYvJKFv1V90T2QNU+OZ4E2wbPCgmcNSXoNyrSdL6m9+gkwBJlMsy5OgesmaLZDQVIO2f3dOlZOMU=
X-Received: by 2002:a2e:84c9:0:b0:253:bd3e:63b3 with SMTP id
 q9-20020a2e84c9000000b00253bd3e63b3mr37534933ljh.350.1654102153280; Wed, 01
 Jun 2022 09:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220531213206.7119-1-marcel@ziswiler.com>
 <20220531213206.7119-2-marcel@ziswiler.com>
 <20220601154815.085aa68d@booty>
 <ae6dd0c4f06337b9551e6b08da78851eb4c9be97.camel@ziswiler.com>
In-Reply-To: <ae6dd0c4f06337b9551e6b08da78851eb4c9be97.camel@ziswiler.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Wed, 1 Jun 2022 18:49:02 +0200
Message-ID: 
 <CAEHkU3Udwnmtf0ZHmn8BM3ij6dA-awejsSXYh3gHMjL=-6aOQQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH v3 2/2] libavtp: add recipe to be able to use aaf
 config for alsa-plugins
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Peter Bergin <peter@berginkonsult.se>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:49:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166436

On Wed, Jun 1, 2022 at 5:14 PM Marcel Ziswiler <marcel@ziswiler.com> wrote:
>
> On Wed, 2022-06-01 at 15:48 +0200, Luca Ceresoli wrote:
> > Hi Marcel,
> >
> > On Tue, 31 May 2022 23:32:06 +0200
> > "Marcel Ziswiler" <marcel@ziswiler.com> wrote:
> >
> > > From: Peter Bergin <peter@berginkonsult.se>
> > >
> > > In order to enable configuration option aaf (AVTP Audio Format)
> > > used for AVB the library libavtp is a dependency but no recipe for
> > > this library was present. aaf support for alsa-plugins was
> > > introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.
> > >
> > > Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> > > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> >
> > This patch is failing on musl builds:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5308/steps/11/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5294/steps/12/logs/stdio
>
> To be honest, I don't know nothing about musl and will need to get familiar with that topic first. If anybody
> has some suggestions that would be highly appreciated. Thanks!
>
> Cheers
>
> Marcel
>
I have the patch ready for Marcel. So with the move to
meta-openembedded the recipe will also build with musl.
Max

