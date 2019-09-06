Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id D8DC17ED52
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 12:43:50 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c10so6388067wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 05:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=KoHFIA+qHdK/T5tcIytzfuTqog+r5UebYOek7TKOp64=;
	b=euLZdoTtv2hU1Wxf3c510onzA7HLXRhvzI3vL/ST8szChJwLoZmXMPiX/3uFHs2SiT
	70Z0w58/+e86VQ0ih1OIeVbZJwwDL8dT6752dP0TCJch7BOEYSlbX5mRvIb7PO3EVyNR
	tQgh1gB/ztEb/f5uBylfKuc5JDd+IJ6I+V2u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=KoHFIA+qHdK/T5tcIytzfuTqog+r5UebYOek7TKOp64=;
	b=WB3/3s33FdTD8JudCryVRxnCM+HSBI1S5tPBUexVIS8FFipMKX2AtN6t9prYq84T8u
	+XfwCjnqUOrq04Su8vWveyo4c9ZryNke4LZsi8WgzglEmQT4EbCa9uQxuLvoap0Clv+p
	+bwW/vHJbzvbwOeTk2gWay1RZaApjDOM7u8oVfGD0CQaCtzSBIiBM80P7VZAZfUjHnJD
	0zIfzDUmdNr1sISvK/TORP+vzYfnNW3sit/Jsd+O1TkcGocMn64pcmh0NOtUOTKIMvgI
	982lCiVVRORpROuFje4HX8eQhdIyP2gmIIQofGpIBcKf7f1Yad4fRkEfAe2xYca2c3kh
	kPsA==
X-Gm-Message-State: APjAAAVAuDciFR1/+ouG5XyM8HS8OHZzmQH4p6HIPFivTXsSLi/mQ83c
	rxFTXA/NOYXqcT/eNTpaMqzL0A==
X-Google-Smtp-Source: APXvYqy1GjqrOXcbW+eIc0PkAmuvCNjOJFQAD+6pNt93JgUa0Bd69706SLdT0MFPHicifGTzVamXSw==
X-Received: by 2002:a1c:110:: with SMTP id 16mr7397502wmb.88.1567773831470;
	Fri, 06 Sep 2019 05:43:51 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id r1sm5430504wro.13.2019.09.06.05.43.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 05:43:50 -0700 (PDT)
Message-ID: <3d3dc2514bd632d216550b3b42308abfdfbb46a8.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 06 Sep 2019 13:43:49 +0100
In-Reply-To: <CADkTA4OFwO91cmwrvrTeHWHLF2iEz_JrxU=WODARQsiBqCSSHQ@mail.gmail.com>
References: <20190906072347.31616-1-richard.purdie@linuxfoundation.org>
	<CADkTA4OFwO91cmwrvrTeHWHLF2iEz_JrxU=WODARQsiBqCSSHQ@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] systemtap: Test latest and greatest for 5.2 kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Sep 2019 12:43:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-09-06 at 08:24 -0400, Bruce Ashfield wrote:
> On Fri, Sep 6, 2019 at 3:24 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Systemtap has issues with the 5.2 kernel which are fixed in master,
> > we helped
> > debug and submitted some of the patches. Update to a git version
> > which includes
> > all the fixes.
> 
> And I can confirm that I can now run the stap test on all the arches
> with 5.2.

Cool. I also got a few more systemtap patches accepted upstream so we
can clean up the patches there a bit.

> 
> I'll send the rest of my 5.2 queue in a few hours (the removal of
> 5.0,
> and setting 5.2 as default where needed). I just want to run a few
> more tests before sending.

I actually merged my patch to poky which changed the default FWIW since
it made it though the autobuilder...

Cheers,

Richard


