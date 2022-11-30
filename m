Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADD2C4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 21:11:16 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.24763.1669842670523016594
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 13:11:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N78uvO0s;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id c1so28836667lfi.7
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 13:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+NgzMuYiftVtCxFkQ8prk3+RMF2MmWJ/yn0pQkMyTGQ=;
        b=N78uvO0s0GVMFq5AXP4z5w2VZPqucPJM77TnJXq59Ykiy4D0MVU4ZR1jMs9zgnlwBQ
         LOIiWlkeMf5hOBTZsBDoa4A95fEG972cum0ibMfL6g51Xo1T0zVIQFufmCPbI+PQjuhH
         D4bcFCfcDOtp0zh+V6nmobwvQx3up58ixr4+xXKqG1+ZkHwDXdbV6zzbljGkJ72KfUDm
         r6trnsNANgdNRTtwfR0sgIzv7l8P+IjRwOobqBEEJ+wf9zMuuPYYoxq7gTTP0SNq+AG0
         sN8ZtaM+FIXKza4KIpGUziGU0lQjJbedS88XTowVByaihglouhoFh3jksRqzksxnneNG
         zrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NgzMuYiftVtCxFkQ8prk3+RMF2MmWJ/yn0pQkMyTGQ=;
        b=bqWk3c2mIv3eYHBFwYr3HWCA4iMbG+3eLBRkmkfYg1cNQ0VD/dpdPdZJZGgxs9ojKp
         x1srUTO9hLn1mwzpUntphkcHag/wvQSgDpCXdZCM3nCxxnquVaD9dv3/zjF6+lgwpIyi
         UKr2h3ARqEYoI0725c6199DPwKnKVjd+XkpxttbL/v7pMlm0Z8BfBvaUInTsPtqUAacI
         z8Lne4mg0qhzEkFLvsa5PVfMt5Kt20RsP7dVsR2pyFVeEHwaoQQpryRdPkmvsUkNfqYh
         6LPmMcCzDePoEetPDQWz3vWo2DjTlbGGh87p8v5ZAfL+0Hx4Qtm+vjaa1ryPDeTtxC5s
         PaEg==
X-Gm-Message-State: ANoB5pk/fF3lvj3Qiplc5ze1JxHk8Fzhuv+GCpuCjdHrh5acA1OMB7yz
	juztreD/GXpPnpru8Sh1TJf13LrgPT18xnvR0Yc=
X-Google-Smtp-Source: AA0mqf6R2SmwX/35QLCeAT+wmwMIZLiiXK8x2iSDW7wlOifxMtLIr7wAG1un3OG7IS62uHM2PTQYukfc/xstDzcwb6k=
X-Received: by 2002:a05:6512:3445:b0:4a9:39f4:5793 with SMTP id
 j5-20020a056512344500b004a939f45793mr18183652lfr.131.1669842668479; Wed, 30
 Nov 2022 13:11:08 -0800 (PST)
MIME-Version: 1.0
References: <20221130053450.95655-1-f_l_k@t-online.de> <20221130053450.95655-4-f_l_k@t-online.de>
 <Y4d8QoDyNaoV0rEY@mail.local> <MD46MR.7526AS010V5V3@t-online.de> <Y4fDxIl6wWuVUTnc@mail.local>
In-Reply-To: <Y4fDxIl6wWuVUTnc@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 30 Nov 2022 22:10:56 +0100
Message-ID: <CANNYZj9bUx2=YbP+NY0Zkd9kZMX3vi81uPPhuJMTR-PCNi5FwA@mail.gmail.com>
Subject: Re: [oe-core][PATCHv8 4/4] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 21:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174031

I would also request that you (Markus) run:

devtool check-upgrade-status <list of newly added recipes>

and verify that their upstream version check works properly.

Alex

On Wed, 30 Nov 2022 at 21:57, Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
>
> Last missing things:
>
> The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
> gcr3 (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-gnome/gcr/gcr3_3.40.0.bb)
> gtk4 (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-gnome/gtk+/gtk4_4.6.7.bb)
> graphene (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb)
> libsass (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-support/sass/libsass_git.bb)
> sassc (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-support/sass/sassc_git.bb)
>
> The following recipes do not have a HOMEPAGE. Please add an entry for HOMEPAGE in the recipe.
> sassc (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-support/sass/sassc_git.bb)
>
> On 30/11/2022 16:58:34+0100, Markus Volk wrote:
> > Am Mi, 30. Nov 2022 um 16:52:34 +0100 schrieb Alexandre Belloni via
> > lists.openembedded.org
> > <alexandre.belloni=bootlin.com@lists.openembedded.org>:
> > > | Run-time dependency gcr-3 found: NO (tried pkgconfig)
> >
> > Sent a patch for it
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174029): https://lists.openembedded.org/g/openembedded-core/message/174029
> Mute This Topic: https://lists.openembedded.org/mt/95352831/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

