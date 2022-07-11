Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FEAC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 08:58:49 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.26368.1657529921796858168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 01:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Sl0EKZl4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id n10so6097007wrc.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 01:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=fXZAhMdPntw1KWXvHPqhgZO+UGiAGX4/1h2ohYcH61E=;
        b=Sl0EKZl4gP6bn/YC1K0McqMVxA61nZgrWy5zETh1mftDd3LrYne7/jATr8vKk/5QZA
         8/6Ejup3LI1LgNv/E4ykXXMUO5a8uuZC/xhF1GWPEiABSfOv0yEfxoBwxDyaafuJnJb+
         yZJVR06qaLmudoyg2/mWmonKi8MvJbn61iQQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=fXZAhMdPntw1KWXvHPqhgZO+UGiAGX4/1h2ohYcH61E=;
        b=TDQN7UhByj1+mvLCnAT0HOIQzTkUJM+6KfALSM/qwXplcKhjfEii3UDA7mzBruOuAe
         wdEKdw9vKg60opx1Oc7DHkDlPvEpiEBPrOxogwtoYsfMlFFXCQsG7yRcOHjKSAJjd1a1
         NTcwVCgU2XIVp1Vy6ll3dV8ryCEhjNxFiqPmDMf+8PNyI8GXFKFy7CP6w1Xcr4rpECe7
         Cg7gf4tdyAr0Hjbx+v4xVn0SLAQrqiihR8tgvqWbaYxSSbo8sf0U54wbx3pM8yLX8UMV
         L2HYfWJLYVn4pRk36AzLaRpG02CgLJj/1/X8cFFQ71G5iZ1sZdNO1qH/GcJkoSCIhUPR
         vrVg==
X-Gm-Message-State: AJIora8lOucngjgm4kmL95jr5lDI4fGyJ9SLogjD9snOp9NlVvOjeYYQ
	mfKYZVLjYtNzH1qynnSXsGnRGw==
X-Google-Smtp-Source: 
 AGRyM1vd89VwoPh24dzsNOpZYzhecqUwouDb18X1YBzdl/QXs1OkzTelHE9sWClyi1WMoK1pFeLB0g==
X-Received: by 2002:adf:e98b:0:b0:21d:7337:da3a with SMTP id
 h11-20020adfe98b000000b0021d7337da3amr15640372wrm.13.1657529920182;
        Mon, 11 Jul 2022 01:58:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:33cc:9a17:a076:b55d?
 ([2001:8b0:aba:5f3c:33cc:9a17:a076:b55d])
        by smtp.gmail.com with ESMTPSA id
 j16-20020adfff90000000b0021d76a1b0e3sm5314933wrr.6.2022.07.11.01.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 01:58:39 -0700 (PDT)
Message-ID: 
 <2e252bb607b9ef3a5821a1a0882246c5de157a89.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] zlib: minizip: add recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2022 09:58:38 +0100
In-Reply-To: <20220711085329.su52yw5ygcpoalfm@Seans-MBP.hadsten>
References: <20220711083309.1749253-1-sean@geanix.com>
	 <20220711083309.1749253-2-sean@geanix.com>
	 <5227282d05b0791d57457c44f63859a97001c6ab.camel@linuxfoundation.org>
	 <20220711085329.su52yw5ygcpoalfm@Seans-MBP.hadsten>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 08:58:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167865

On Mon, 2022-07-11 at 10:53 +0200, Sean Nyekjaer wrote:
> On Mon, Jul 11, 2022 at 09:46:58AM +0100, Richard Purdie wrote:
> > On Mon, 2022-07-11 at 10:33 +0200, Sean Nyekjaer wrote:
> > > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > > ---
> > >  meta/recipes-core/zlib/minizip_1.2.12.bb | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >  create mode 100644 meta/recipes-core/zlib/minizip_1.2.12.bb
> >=20
> > I can see what this does, but why? Who would want this and why?=C2=A0Th=
ere
> > is no detail in the commit messages. Also no maintainers entry which
> > will break QA checks.
> >=20
> > Cheers,
> >=20
> > Richard
> >=20
> >=20
>=20
> Hi Richard,
>=20
> We have some software that depends on minizip.
> I don't know if an extra package zlib-minizip or this was the prefered
> way to add it?

I think an extra package on the existing recipe may be simpler and
easier maintenance.

Commit messages do need a bit more information in them too, it isn't
enough to say what something does, it needs to say why.

Cheers,

Richard

