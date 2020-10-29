Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web08.7359.1603971305073851305
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 04:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F1qtAooj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id w1so2384855wrm.4
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 04:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=0yDwXZ2ohE8hc2duPvFjxe9/3eRdivxUf2PV8dF4XCk=;
        b=F1qtAoojZaVrmGVjw+JqdR1wqgjbCIEkiViyLQ6SHGA6i2hGkTs6Zwa6BvwftP/aYb
         mBeNuInkN3tDjKfHHYaCPngf24CR74awQgg0XhBjVxADvEsLl6bjwihMVOLH0l7PXfx6
         CHRZ6eITAnT1dUDgJ9CZpOX2Oiu1Yr3ed0QWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0yDwXZ2ohE8hc2duPvFjxe9/3eRdivxUf2PV8dF4XCk=;
        b=rQYKIEN9+1PQ97bHB+9LtpJX+48h+biI1qi9vBSQ8+rH6Y9hCIVV+E3UD3CMh9gQ+f
         MpD2ErLH9wkITYD+MtmnqdhPWKldafvwxHBe9zTs1WrOMBIQaowBFUckv7U9j6e5VKl4
         Vg2Fb68Bj9gU0NbpdhSbB3mq05OZhJ7LGnbWkUSu5zrVAmyKCbdPqoIxfxbyGT5HLEDR
         TpQ+LK+3BlA1amIlbHTWVnGUzzzpwceS292ekq93Y+3qUSL5oxZl5bhJkHQ4STUB+tBa
         Hmq6VNaAYw39WykpwG9WH53gezZnCc1zHSxi/7U0pbm6IoBEPV8fEeU76HXAmh557E3t
         zbCw==
X-Gm-Message-State: AOAM532Bt2S2V6LnQFEaW49R2F1pTaV8TDB0gmTB3a97gn7fjPgeWhbE
	pAUdGPcqxHTrxtGSldT9MidIEA==
X-Google-Smtp-Source: ABdhPJxgRBTXsfeSSwDGy09jrlaca6NasY8t2mAUC5UN5A/O1pvY+ZwMPxS8sfSRAg1LBR9hD3edIw==
X-Received: by 2002:adf:f210:: with SMTP id p16mr5371064wro.40.1603971303522;
        Thu, 29 Oct 2020 04:35:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b185:d1c6:b4bf:ce77])
        by smtp.gmail.com with ESMTPSA id e5sm4307237wrw.93.2020.10.29.04.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 04:35:02 -0700 (PDT)
Message-ID: <287ac9ee493791a0e504de44c86b8b0675cb668c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 1/2] classes/buildhistory: record SRC_URI
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de
Cc: paul.eggleton@linux.microsoft.com, 
	openembedded-core@lists.openembedded.org
Date: Thu, 29 Oct 2020 11:35:02 +0000
In-Reply-To: <20201029091845.GM1246345@korppu>
References: <cover.1603080016.git.paul.eggleton@linux.microsoft.com>
	 <e83e7133cc7affdc013455744f1bc31d83503757.1603080016.git.paul.eggleton@linux.microsoft.com>
	 <20201026064259.GT2040@korppu>
	 <f3c0e0b9ce68c2377148e85c522d9f5003a580bc.camel@linuxfoundation.org>
	 <20201029091845.GM1246345@korppu>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-29 at 09:18 +0000, Mikko.Rapeli@bmw.de wrote:
> On Wed, Oct 28, 2020 at 02:21:22PM +0000, Richard Purdie wrote:
> > On Mon, 2020-10-26 at 06:43 +0000, Mikko Rapeli wrote:
> > > On Sun, Oct 18, 2020 at 09:03:56PM -0700, Paul Eggleton wrote:
> > > > From: Paul Eggleton <paul.eggleton@microsoft.com>
> > > > 
> > > > It can be useful to record SRC_URI into buildhistory for the
> > > > purposes of
> > > > tracking exactly which sources got built (we already have
> > > > SRCREV)
> > > > as
> > > > well as getting an indication when changes to the SRC_URI
> > > > relate to
> > > > changes in the output.
> > > > 
> > > > Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
> > > 
> > > I have similar patch in our poky trees. Also have patches
> > > to export LICENSE and CVE_PRODUCT to buildhistory. These are used
> > > by some post-build QA check scripts.
> > > 
> > > Acked-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > 
> > I'm actually fairly against some of these kinds of changes.
> > Buildhistory is meant to be there to highlight changes in the
> > output
> > over time. Using it to create manifests and for license checking
> > purposes is not what it was designed for.
> > 
> > I just feel if the original author of the class thinks its a good
> > idea
> > I need to give up :/.
> 
> Surely changes in LICENSE and SRC_URI over time are important for an
> overview of changes?

LICENSE is important and I understand that one. SRC_URI is trickier.
The recipe version is in some ways more relevant that SRC_URI. I guess
with the latter, you can look at the change in the set of patches or
perhaps source of the code but I'd suspect the version is the more
useful thing people are looking for.

There is then the temptation for people to use the buildhistory data
for license auditing which worries me as its not what its intended for.

> At least to me they are pretty much essential. I'm using buildhistory
> diffs to see what changes in major yocto updates for example once
> builds are passing.

The question is whether the history is of the inputs, the outputs or
tangential information like the license information. Traditionally it
was focused very specifically on the output, we've then added more and
more input data and people are using it for licensing (which there is
supposed to be separate code for). It makes it hard to maintain and
develop since the usage becomes so varied. I appreciate few people care
about that though as it's someone else's problem though :(. I try and
keep things true to their design and people end up unhappy. Where we
deviate, I try and ensure its at least a conscious decision, I'm still
not sure it is in this case.

Cheers,

Richard


