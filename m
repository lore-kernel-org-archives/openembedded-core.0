Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D39C433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 18:15:00 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.9085.1640110498913644610
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 10:14:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=M5wYHOTp;
 spf=pass (domain: madison.systems, ip: 209.85.208.170,
 mailfrom: matt@madison.systems)
Received: by mail-lj1-f170.google.com with SMTP id m12so22756487ljj.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 10:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LTYFZtPtal5Cli9w9MZ/LnSVNEY+wRvdFtq8ho+vTgE=;
        b=M5wYHOTpnfTJ10nVzDLFm/YEO5FFRMrVHxCk5libPKUxr5QLnHijQ7sQaqNGcA2KIm
         6w6l0kxG7bfLDRgKLBqHhn3AAMJhgpoXjyICIk4oLAIFyWyWlnbjw5ogYWPivEVYyLrl
         vKm37eYC/pxpX77KXCc99K9473RWNuwGKqWXKm+uq/14+CzmV8CfWESUMU246su6vVNG
         RV2Wqa9avRVmXES18/KNxh407mrF7kj4FWZJlsjOMt9Hg0UnmJTMbDa8zLMpR2v7E1Wi
         11GdztpwtIl9tdUWnXlxADAUHixQbej75FZLBpO8f0mGoi6hckPSt+Npcr12bKMqJiFc
         5FwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LTYFZtPtal5Cli9w9MZ/LnSVNEY+wRvdFtq8ho+vTgE=;
        b=u7nAyaG0pMU5cXinM2v8beBs18iGzLyWc2loMIoB+ZHGbZABExa27+FDAEEnLVYo+T
         g5ZfNfgqD3+e1jS9M4GJzOH5cl+8wdrjfTXaV5+969Kh+wZkpM2EJbcS9FghwHC/ptQy
         A1QJyWstII5w2eZZxCyGifGuUSpEqFfQ1Dy8PT7weOGVlsrmR7jK6yoF3yT6E2WHV/YZ
         PdZ9sV44j7v24veM5z7N284yA++UF/lYrh57KhCZmj5vkN03FIvcRYeR85IJQoocIuLu
         njlidm46U11mo6WemfjsQkW2sh0hnsxu8Khy9syWxU+BFXDAAn1thmFyLSs0KCpzRDnw
         96iQ==
X-Gm-Message-State: AOAM533WALt6lC0++HSy7SWlIXwSuIswvf2zngqbNmsmqqzi19q8c0X5
	BQW2r7tccS3D5nYnNTzApM+Y944NaWKByRrcLOzgug==
X-Google-Smtp-Source: 
 ABdhPJxIoleWd66gmM+ahXutUYIn+XW0BQCeH88Ka2Ajerzydym2wFQ5l/TmAclLyE/mIN5DaS6Vk7fT5u7MgS+O3UQ=
X-Received: by 2002:a2e:9acf:: with SMTP id p15mr3486174ljj.213.1640110496878;
 Tue, 21 Dec 2021 10:14:56 -0800 (PST)
MIME-Version: 1.0
References: <20211217153630.1746217-1-matt@madison.systems>
 <100ff0ce-72e1-b3b3-ff1e-2a56e0742624@sancloud.com>
 <7b0757495eff0e466dc84cb82f597e4c28256061.camel@linuxfoundation.org>
 <015ba052-f4ce-5eb3-4b91-5d7d9eac981b@sancloud.com>
In-Reply-To: <015ba052-f4ce-5eb3-4b91-5d7d9eac981b@sancloud.com>
From: Matt Madison <matt@madison.systems>
Date: Tue, 21 Dec 2021 10:14:45 -0800
Message-ID: 
 <CAGgRHJpSz1s3KSmFLsTX7L6V8o8EK1zhywgcNUop3FdNwk12Ng@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Move crate fetcher to OE_IMPORTS
To: Paul Barker <paul.barker@sancloud.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Joshua Watt <jpewhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 18:15:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159928

On Tue, Dec 21, 2021 at 6:07 AM Paul Barker <paul.barker@sancloud.com> wrote:
>
> On 20/12/2021 22:34, Richard Purdie wrote:
> > On Mon, 2021-12-20 at 17:01 +0000, Paul Barker wrote:
> >> On 17/12/2021 15:36, Matt Madison wrote:
> >>> This patch series switches to using the OE_IMPORTS mechanism
> >>> for installing the crate fetcher. This simplifies the addition
> >>> and clears up issues with interactions between SRCPV and
> >>> the shared-state fetching logic.
> >>>
> >>> Matt Madison (4):
> >>>     lib/crate.py: install crate fetcher on import
> >>>     base.bbclass: add crate to OE_IMPORTS
> >>>     cargo_common.bbclass: remove inherit of crate-fetch
> >>>     classes: remove crate-fetch.bbclass
> >>>
> >>>    meta/classes/base.bbclass         |  2 +-
> >>>    meta/classes/cargo_common.bbclass |  2 --
> >>>    meta/classes/crate-fetch.bbclass  | 28 ----------------------------
> >>>    meta/lib/crate.py                 |  2 ++
> >>>    4 files changed, 3 insertions(+), 31 deletions(-)
> >>>    delete mode 100644 meta/classes/crate-fetch.bbclass
> >>>
> >>
> >> Would a better solution here be to move the crate fetcher into
> >> lib/bb/fetch2/ in bitbake?
> >
> > I've been wondering about this too.
> >
> > Does anyone remember how the fetcher lines up against the general fetcher
> > requirements we have and is there a list of anything that remained to be done
> > before it could be added to bitbake?
>
> If I remember correctly, it just needed some test cases writing. The
> crate fetcher is a subclass of the wget fetcher with changes to how
> urldata is set up and how unpack is handled, so it should integrate well
> into bitbake.

One thing I see that's a bit worrisome is that it disables
recommends_checksum for the downloaded files,
and populates metadata for use (I assume) by cargo with the calculated
SHA256 on the download.

-Matt

>
> Thanks,
>
> --
> Paul Barker
> Principal Software Engineer
> SanCloud Ltd
>
> e: paul.barker@sancloud.com
> w: https://sancloud.co.uk/

