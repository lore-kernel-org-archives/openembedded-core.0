Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA574C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 19:18:14 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.480.1637176693603594530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 11:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gGU/TZOl;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id i9so3719752qki.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 11:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OhkkC0R/P50QVQfEKOm5tEd5S9I11DfHfsDGZhyfjmk=;
        b=gGU/TZOl6jd2JO0cHxR3QEikh8VCwzLix1RFwzFzvtddS+jRAWQmfZnOo8WpA/bC/N
         2M+Uzw4l+HbaABKTXPtTijKds1WtN9TQZ65iZl58UJkd2MTE9a1Cz20//rSVxR+h3E11
         /kr5/59a/VkmcAKi2vvFIzPhone8NLzVaxl+QMajNogd/cmE0nc495/cTo0js3WU8n4E
         9jGaf/xpCrq1o4SyCBNs+/0ruKeFcpYC9lXtQdl2d0tic9WynbfndeoJB0rjPr6uqY63
         ZqJIbikoNJ7LDruONixoM+SZdzOjGNobgshFpNa3E2QvCvTS4SVV2Sz/awoNp9LHDdez
         d2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OhkkC0R/P50QVQfEKOm5tEd5S9I11DfHfsDGZhyfjmk=;
        b=XXPbRfcNC0B9UbELQs8Jd6yarQkQbAGmb9y7Bj+diOB3nmNzasQ6uMx7F09zmpSIsW
         JjCCsOAHnQNzUkDG0izydBgbkEhMLJcxsI5+3svmuVGPPSHPQS8utE2zsYjUbUPnUIhl
         UaRnQvG/vto300krxECkouYKLeA1VOd9JnzU+6G4hewW3K0njgc7Ai2CAw4zGrXWNMgK
         4AEu0KWci2/HcUZoyjnXHn+XP4+PrHQ8Cb2saY48ux2hMDZqLu0p7p7Dfca16beKu2aL
         mEPjFfo8USWM+tW5Sn5QTrTVqQUT/ST+PBlKDRXOi/5fP0woLWvrP56WK9tukGrDIwb2
         AKQQ==
X-Gm-Message-State: AOAM531CAg4FdDo+YWuyLSozC0vyl4uaADp+zQgN+9XuTkK5B9XrfJ6n
	NbwMSNLn67dj5dNIQTVPo0I85SNRZaVFiIeCIM0=
X-Google-Smtp-Source: 
 ABdhPJyBDNMhRnDY2FkDdcD9zZG759lQtNU6vKmAR0BC6FFaAArWuqyktNisNALNXNgrX8bici2c15YYVzAgnjDl4JA=
X-Received: by 2002:a05:620a:4687:: with SMTP id
 bq7mr15885070qkb.231.1637176692609;
 Wed, 17 Nov 2021 11:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20211117153525.257146-1-alex@linutronix.de>
 <20211117153525.257146-22-alex@linutronix.de>
 <CAMKF1sq-59kYn0WpPKzNB331BLSrDKweCk2+S3AhSsZ2Eb1WVQ@mail.gmail.com>
 <CANNYZj8JDt_F+v3TxUuXHV9S-EPR9=9mYdNxd1Pg2Hwe4esLiA@mail.gmail.com>
 <YZVT+eDIX8zbnOHA@wildebeest.org>
In-Reply-To: <YZVT+eDIX8zbnOHA@wildebeest.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Nov 2021 11:17:46 -0800
Message-ID: 
 <CAMKF1sr0YP=BjUcdu4PD9soSGK+8uXf2uO+YQ-D2PLHb-ixJ3g@mail.gmail.com>
Subject: Re: [PATCH 22/36] elfutils: update 0.185 -> 0.186
To: Mark Wielaard <mark@klomp.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Hongxu Jia <hongxu.jia@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 19:18:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158456

On Wed, Nov 17, 2021 at 11:11 AM Mark Wielaard <mark@klomp.org> wrote:
>
> Hi,
>
> I hack on elfutils upstream.
>
> On Wed, Nov 17, 2021 at 06:32:40PM +0100, Alexander Kanavin wrote:
> > On Wed, 17 Nov 2021 at 18:15, Khem Raj <raj.khem@gmail.com> wrote:
> > > > Rework support for error() on non-glibc targets:
> > > > upstream now provides its own implementation, so we can drop
> > > > the patch that adds ours; said implementation isn't
> > > > build-tested with tests, so ptest has to be disabled on musl.
> > >
> > > Overall this is an improvement so I am good with this patch.
> > > if upstream implementation does not pass ptests
> > > perhaps worth reporting upstream.
> >
> > I would if upstream would be interested in tests with anything except
> > glibc, but I'm fairly sure they're not. The tests don't even build with
> > musl without invasive patching.
>
> If you don't report issues we won't know there are any.  elfutils
> upstream is certainly focussed on glibc. And some of the musl
> developers are pretty hostile and agresssive, which certainly isn't
> appreciated. But we do appreciate bug reports and patches to support
> alternative libc implementations where they make sense and help
> others.

Thanks Mark, good point about creating bug reports at least.

>
> Cheers,
>
> Mark
>

