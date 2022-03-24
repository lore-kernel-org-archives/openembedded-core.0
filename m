Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2977C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 14:05:01 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.11289.1648130700083200948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 07:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=S7DJ786C;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f50.google.com with SMTP id u26so5717169eda.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 07:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rTlfwRIVLeI/dUyLJ2rbJ9PutEvYppMrhFxfa/6Xqfc=;
        b=S7DJ786CbF4qw5ZzoLhoccauCL2sQsOuk4stYFCXWdVcfI8L4+PFZT/5KWgufUqF5F
         odkmDVd7snedSaDqjl+cJRXHavD2SjoQ8TTJ5tvyRS0Cjb7nqRdgAzoM/Qa5GOwySfil
         ej1WStd3DzT4QTOLOxEXWoBgwThjO4z2g2hIynQEUgCkMwbZu0mBuKJahdl5fXlGj70Q
         Nug6dxRhYNr8NolsEEGPj5x22tCcCv+2MjbRM0WLn+BfGcnC3elnw6YykgHTyUgqeZk4
         vFOY/EijQJm2jPndC71LAMk3J0nqGRDCiJ6D5au1oM9gzmtN/DSBpnIkETJFTGhY175B
         EM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rTlfwRIVLeI/dUyLJ2rbJ9PutEvYppMrhFxfa/6Xqfc=;
        b=BlMV5qDZEynZXgl4SYQz095jdgUsDm7Pe4yBZLzFurGmTSQHBtRIRN3gCeC26OsEan
         EBpUtYnFr8Cgz1VJ4gzBFkKsU3uIECkQ9cef/69DmP5kFEfwBUXb65n/DDwIyJaU23eT
         Xes4fiuhVH0OOB12zsdJrPvWPTg2B3KZS1BwD/QMHaHH0qFo5BuHKuLC/wAoBx48Fkj0
         MrErwQ0qBE4hIULNFTdpekpz4JBbAbIDobQyHfhDBUgm9RJu5EmPxufP8yy/GUqCXlIX
         OflkB2AwmmM4J7risxFMle5MC2N2D0It3E/3W8IRDrECYr2vJmKOg5f8CZl4QmnPqyg3
         bhyA==
X-Gm-Message-State: AOAM533kEKv/jgd3ZeBlpKptDr2PrOxVvS+R8OxzFNmRVqUyydNWa5Sd
	DMdhKoVkXMraa2T4TN1XI+bIG4LYsJpUd553VWGZdw==
X-Google-Smtp-Source: 
 ABdhPJzZRTxlyby6aQKwhLQ7iUOLyOTLWUAqbXlvdpQ3JMoXAjDHbk8tTJRSx4+buEEYvH90YymOdNbHJydrnah1F3U=
X-Received: by 2002:a05:6402:b15:b0:419:fb4:e2e4 with SMTP id
 bm21-20020a0564020b1500b004190fb4e2e4mr6818314edb.147.1648130698416; Thu, 24
 Mar 2022 07:04:58 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20220323085009.11573-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
 <Yjs+RGCl6mjOAoSN@piout.net>
 <784707888.393251.1648115097590.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: 
 <784707888.393251.1648115097590.JavaMail.zimbra@savoirfairelinux.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 24 Mar 2022 04:04:47 -1000
Message-ID: 
 <CAOSpxdZsNW2ka9FUZbDqmroF4APmfaQUhqV7fTaEg_H85k9Z0g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] mobile-broadband-provider-info: update branch
 name
To: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 14:05:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163612

On Wed, Mar 23, 2022 at 11:45 PM Enguerrand de Ribaucourt
<enguerrand.de-ribaucourt@savoirfairelinux.com> wrote:
>
> ----- Original Message -----
> > From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
> > To: "Enguerrand de Ribaucourt" <enguerrand.de-ribaucourt@savoirfairelinux.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Sent: Wednesday, March 23, 2022 4:35:32 PM
> > Subject: Re: [OE-core][PATCH] mobile-broadband-provider-info: update branch name
>
> > Hello Enguerrand,
>
> > This was already fixed in master in:
> > https://git.openembedded.org/openembedded-core/commit/?id=ed02ee8f20094f598448d58875cb7be8a24a019f
>
> > Is this for another branch?
>
> Hello Alexandre,
>
> Yes, this patch is for honister. The issue is also yet unfixed in the dunfell branch.

Also fixed in dunfell:

https://git.yoctoproject.org/poky/commit/?h=dunfell&id=08b8cd174d823eeccb1a505ac68e753f5eb4a43e

Steve

>
> Thank you for your time.
>
> > On 23/03/2022 09:50:10+0100, Enguerrand de Ribaucourt wrote:
> > > The master branch was renamed main, resulting in do_fetch failure.
> > > This patch updates SRC_URI with the new branch name.
>
> >> Signed-off-by: Enguerrand de Ribaucourt
> > > <enguerrand.de-ribaucourt@savoirfairelinux.com>
> > > ---
> > > .../mobile-broadband-provider-info_git.bb | 2 +-
> > > 1 file changed, 1 insertion(+), 1 deletion(-)
>
> >> diff --git
> >> a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
> > > b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
> > > index 4246f4dcbd..3b170f4fdd 100644
> >> ---
> > > a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
> >> +++
> > > b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
> > > @@ -8,7 +8,7 @@ SRCREV = "11f2247eccd3c161b8fd9b41143862e9fb81193c"
> > > PV = "20210805"
> > > PE = "1"
>
> >> -SRC_URI =
> > > "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=master"
> >> +SRC_URI =
> > > "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
> > > S = "${WORKDIR}/git"
>
> > > inherit autotools
> > > --
> > > 2.25.1
>
>
>
> > >
>
>
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163602): https://lists.openembedded.org/g/openembedded-core/message/163602
> Mute This Topic: https://lists.openembedded.org/mt/89971498/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

