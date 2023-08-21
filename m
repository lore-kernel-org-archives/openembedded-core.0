Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 717E7EE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 15:50:27 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.441.1692633023886170210
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 08:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=OHZrmlOK;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-792388ea4b3so26571639f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 08:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692633023; x=1693237823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCY95ZgJ4/iS3oyhdpc/SAYDBjNA9wezhlUvi6Js8UA=;
        b=OHZrmlOKh08YwiSy1BDb5RKs+z4ShFyLLYbuXANYzdQNh/1sewmD8bGo4NYpsyOU0m
         Wa8b7fUBwKdTR57L/Mu0j6p8J7ngH0tvv8+a8tCYRy2+2XFOhILBPdhRkZRDL+AoD7Bb
         oqsfs3vWKoEwkLPqAj/hT/+eLhTsBnlLtasehkWX4vsDmxSLJ5GW3wb/cp+LCpsqS8GX
         SaruAx6ZO/uPG4xiaiQ3i8IQhWgk8XWMfjmsjhD5PSd/G8tfzg9t3xkHLse0ewWxhIhT
         q9Rdmuika1rmMVmC1Q37TEfoy9Se1rKlvxNKYHOEfckPG98XhaukpWmMUP29FM375xq0
         jT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692633023; x=1693237823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCY95ZgJ4/iS3oyhdpc/SAYDBjNA9wezhlUvi6Js8UA=;
        b=KMAQjISKaL0mUhc7SVL/Wos2PV53aCFrSrP894WH02s/14w0JuKxDz749Nvt7PdhrM
         Uf9u5eSAogFKVbJhpUMDZJMevaje5ljHMVfoRfyTUWsVxA57DQpkCOa8BvnLsudQ7L8o
         hWRGU/uqxegmwRVRs6EsGTlgoc2jEpa75jpFlZF572clBQVonA6y4+zefnhL1hZWJ0q6
         TtkaQD9HrTbH1Qe60JZBHqR4Z37fXa3Cgg+zsDdv4AgBih4IxgYtw9JPQknivY4kUbx4
         L7jGDhPGGa49TuLhjhMxISffBZhCX/V/fECoV5eccb10ViHtiL4LTr2exY4NPk6Z1IyJ
         IbRw==
X-Gm-Message-State: AOJu0YxYjnMwGALr3g1oimHOnpRCn3WHueTrfK49Y9Vsz1EWNm3V2eEt
	KgNUcF1uNWVu0Pp+Q5ce1XCHARia9Hn5sp1SXTY=
X-Google-Smtp-Source: AGHT+IE9QXr2YtL1Y8d3ASg6pro0B+u/tRSpA/x29xbQLB2yEpGwATIc84AzceJoEccGaaX+DfCURRvVxXdnYhF7F1Q=
X-Received: by 2002:a92:c202:0:b0:34c:a7e2:c9a6 with SMTP id
 j2-20020a92c202000000b0034ca7e2c9a6mr4408461ilo.31.1692633022887; Mon, 21 Aug
 2023 08:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692632563.git.bruce.ashfield@gmail.com> <dda1aed14e449ff1516bb5e12a4e700b26314d59.camel@linuxfoundation.org>
In-Reply-To: <dda1aed14e449ff1516bb5e12a4e700b26314d59.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 21 Aug 2023 11:50:12 -0400
Message-ID: <CADkTA4OrbwtY-gix6=FimyW6SygNyxYc1rRHuw2PoQR99j6YZQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] linux-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 15:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186462

On Mon, Aug 21, 2023 at 11:47=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2023-08-21 at 11:44 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > While we track down the remaining 6.4 boot issues, here is the
> > set of -stable and specific fixes that I've queued in my kernel
> > testing tree.
> >
> > It is possible that some of the 6.4-stable's have fixes for our
> > boot issues, but I didn't see anything obvious.
> >
> > In particular we have the -rt warning fix from PaulG and also
> > a fixup on our isocpus patch.
>
> Thanks! This means we should revert:
>
> https://git.yoctoproject.org/poky/commit/?id=3Dd57e6de496621cb721ef0eb23e=
fa1bdb1363d8cb
>

In theory ... yes!

Bruce

> ?
>
> Cheers,
>
> Richard



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

