Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F333CC433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 13:17:44 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.7081.1642166263301378906
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MRIGzxCS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 f141-20020a1c1f93000000b003497aec3f86so5618591wmf.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 05:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=F46G8GFIIaUJxz2/Eozck5RwM1AlTc+ql+ZtzR1GAy8=;
        b=MRIGzxCSsMfw6ZW+1FoBW5wPTFmS0TZ7Hutkf1g5N4NsdjZJnIgzLyY1d0+D/EvpB6
         H+ORfr9n+w0dMsJO8A7clBV/momZiJe0pLR7NlYtmBbvqMW+7H6MraQ+icywI03xatXN
         0CG1DPjkYXv/SWOrjHoXi8IQMZAMYTyDyOfK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=F46G8GFIIaUJxz2/Eozck5RwM1AlTc+ql+ZtzR1GAy8=;
        b=LeyUsgnBlReGvL6VX+dLzspkROUtPXFaCvue0GvdQFccdhobyUtWGIAhhIH4sAVNc5
         pY6UoeSv+Fwd56liroFtTqw3cwSoKt9IWjudPOHmXN3vmtqERLK9NOFcTy3mqorSoTiJ
         BEMBS/7U+rwYJ1Bsl/0FxEquc+pMRWHcYs9VAzq4RDk3guMOFEtClXsrk7YHWOqyGckS
         DUFEKe0wKxuOoYA7GnFcW2+QEUHtASGwAzZ9Xbaio8bgBEaeJFAM7DYCagK9uMwa5Y/f
         UvAgHdUuwA3sf3Ug0guBEzhuZYEYkU4gXDbHWos/byBqiiDnU3SwAtCK9xLmfvYUX3p1
         gNrA==
X-Gm-Message-State: AOAM533EDXI98oT0e6AM+s+5Ap2dmfE9e0wM3CXzm13DFcy70G4TMqjN
	RXzgQuk2wEP7UeHqTfkEoqTK8Q==
X-Google-Smtp-Source: 
 ABdhPJxPd7Tsf6Or3zByiZUGlC1Lc4MoEtseudss9PwnAiCLY45ZzYhq0zlt3ySVLcTjOuTGmBWedw==
X-Received: by 2002:a7b:c10b:: with SMTP id
 w11mr15898249wmi.192.1642166261405;
        Fri, 14 Jan 2022 05:17:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b80b:58a:dabd:3794?
 ([2001:8b0:aba:5f3c:b80b:58a:dabd:3794])
        by smtp.gmail.com with ESMTPSA id
 b13sm6008666wrm.72.2022.01.14.05.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 05:17:40 -0800 (PST)
Message-ID: 
 <0df4212ccba05e3daa691797561ebc1e7b51f109.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 0/4] Move crate fetcher to OE_IMPORTS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matt Madison <matt@madison.systems>
Cc: Paul Barker <paul.barker@sancloud.com>, Patches and discussions about
 the oe-core layer <openembedded-core@lists.openembedded.org>, Joshua Watt
 <jpewhacker@gmail.com>
Date: Fri, 14 Jan 2022 13:17:39 +0000
In-Reply-To: 
 <CAGgRHJrzK87MBuaz1NRi+F4tvn=BFJDMZTECE0f06a3J0RPxOA@mail.gmail.com>
References: <20211217153630.1746217-1-matt@madison.systems>
	 <100ff0ce-72e1-b3b3-ff1e-2a56e0742624@sancloud.com>
	 <7b0757495eff0e466dc84cb82f597e4c28256061.camel@linuxfoundation.org>
	 <015ba052-f4ce-5eb3-4b91-5d7d9eac981b@sancloud.com>
	 <16C2D7CF44733347.22520@lists.openembedded.org>
	 <CAGgRHJrzK87MBuaz1NRi+F4tvn=BFJDMZTECE0f06a3J0RPxOA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 13:17:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160565

On Fri, 2022-01-14 at 02:31 -0800, Matt Madison wrote:
> On Tue, Dec 21, 2021 at 10:15 AM Matt Madison via
> lists.openembedded.org <matt=madison.systems@lists.openembedded.org>
> wrote:
> > 
> > On Tue, Dec 21, 2021 at 6:07 AM Paul Barker <paul.barker@sancloud.com> wrote:
> > > 
> > > On 20/12/2021 22:34, Richard Purdie wrote:
> > > > On Mon, 2021-12-20 at 17:01 +0000, Paul Barker wrote:
> > > > > On 17/12/2021 15:36, Matt Madison wrote:
> > > > > > This patch series switches to using the OE_IMPORTS mechanism
> > > > > > for installing the crate fetcher. This simplifies the addition
> > > > > > and clears up issues with interactions between SRCPV and
> > > > > > the shared-state fetching logic.
> > > > > > 
> > > > > > Matt Madison (4):
> > > > > >     lib/crate.py: install crate fetcher on import
> > > > > >     base.bbclass: add crate to OE_IMPORTS
> > > > > >     cargo_common.bbclass: remove inherit of crate-fetch
> > > > > >     classes: remove crate-fetch.bbclass
> > > > > > 
> > > > > >    meta/classes/base.bbclass         |  2 +-
> > > > > >    meta/classes/cargo_common.bbclass |  2 --
> > > > > >    meta/classes/crate-fetch.bbclass  | 28 ----------------------------
> > > > > >    meta/lib/crate.py                 |  2 ++
> > > > > >    4 files changed, 3 insertions(+), 31 deletions(-)
> > > > > >    delete mode 100644 meta/classes/crate-fetch.bbclass
> > > > > > 
> > > > > 
> > > > > Would a better solution here be to move the crate fetcher into
> > > > > lib/bb/fetch2/ in bitbake?
> > > > 
> > > > I've been wondering about this too.
> > > > 
> > > > Does anyone remember how the fetcher lines up against the general fetcher
> > > > requirements we have and is there a list of anything that remained to be done
> > > > before it could be added to bitbake?
> > > 
> > > If I remember correctly, it just needed some test cases writing. The
> > > crate fetcher is a subclass of the wget fetcher with changes to how
> > > urldata is set up and how unpack is handled, so it should integrate well
> > > into bitbake.
> > 
> > One thing I see that's a bit worrisome is that it disables
> > recommends_checksum for the downloaded files,
> > and populates metadata for use (I assume) by cargo with the calculated
> > SHA256 on the download.
> 
> Any other thoughts on this?  I've modified my distro to work around
> the problem that led me to propose these patches, but something needs
> to be fixed here. crate-fetch.bbclass should not be setting SRCPV.

My thoughts are that we should look to getting this merged into bitbake. To do
that we need some tests and then we can probably make it happen.

I am worried about your comments on the checksum and that may be something we
need to fix before it can be merged.

Cheers,

Richard




