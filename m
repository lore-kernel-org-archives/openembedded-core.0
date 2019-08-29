Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7E38A7EC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 00:24:56 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id l14so1295701lje.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 17:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fMyUKlm+cik4ZTzchzoAsKnZ8DzrO0tOOMzJolxr0SI=;
	b=jopceaBRSjLJUVaRWWbXLHHKu4IZ0NV0j75AxxbT/AcncNOHfxB0YzqDPJG/daZxuQ
	BY8XC1QcXGmYlz0qxN4jWZZpNiJ2YAGTIqUow5PxL55wVBsIMOadOZyeJx/B1ZEbLNfC
	otaahyHC+SsK6I77gEz7fFcV53Oa6p7IW9Is/QTiaPJxP1p1Q5eT/p1bVGMXtlRZT8qb
	MhPJdp4E0dtNndf2pyIZrFLXTpycOtGrfzbU00hwebqXvJoRbTGp/hVUkXyRWIHppZ22
	hLxzuTjLxWTOotxKbWPOcC+VVxVsEvabRtCk0o+VhoGFkuYoS1+VtlxI2dr+CMo9uPl/
	k+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fMyUKlm+cik4ZTzchzoAsKnZ8DzrO0tOOMzJolxr0SI=;
	b=ZhugNhAIIfpEPi0w6LUUgfvOZDYKeaXwnUPQPxhgsfyAUc+fPQxkXu/h0reieSySk7
	Uu61QWUrsDkOtQbznKnx9aLVy9isHyT1f6ssJAjbPckVZVTHgDXNdiqzhE6EVoaj8PIF
	eBELo1FqJivqWyRetgQJrFAuGO/vb4sPkYcrbcgKZW27r1rXgJxta5G2dD+T2aCh8Jse
	CH3WpAzxS3pD6QNuCSQtlarZE5Pj34loGLNPWZiqmaIfw2ysfP7fD78e7ekJG8jZTV3q
	zlvTIxnUV2UtFKF9/oSYRDozWS/3+jXoCHrmwXmuimHbCqVYqzVnG9KRBRIklu+e80CL
	TWUw==
X-Gm-Message-State: APjAAAWjpQtYWeftb78f4wfMRtYeWDSzPotOoo4qz3GBDcFgsZa4jNLk
	PmOc/l7v6+j4wMQ2kaViHTjFNU+fQHN7mHF5moA=
X-Google-Smtp-Source: APXvYqz5vZofc+7cxOHCiq10io/vg74a7hVEIjm5SJILnuuWQL6/OGPyFU7xyfzERtL9XKMQrfbZbEl8YMl+EAfgsZI=
X-Received: by 2002:a2e:9a10:: with SMTP id o16mr3597386lji.104.1567038296711; 
	Wed, 28 Aug 2019 17:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<c1bffa0ef4621c96d200e8ed14fd818d97b41677.1567019771.git.bruce.ashfield@gmail.com>
	<8664f9ff7f4a8463b16d3d17d213ad3375798ea8.camel@intel.com>
	<CADkTA4O_39fPJYD1DmiVVUL4GguyjqYG6VUct330GtzDnSezow@mail.gmail.com>
	<390a239da98f0f9013f9d32726354958620baf68.camel@intel.com>
In-Reply-To: <390a239da98f0f9013f9d32726354958620baf68.camel@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 28 Aug 2019 20:24:45 -0400
Message-ID: <CADkTA4Mg-wtkuyik8yEm=jMDO+VPq934oOocUnLN1sgo_vapAg@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] perf: change dependencies on python to python3
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
X-List-Received-Date: Thu, 29 Aug 2019 00:24:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 28, 2019 at 8:18 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Wed, 2019-08-28 at 20:13 -0400, Bruce Ashfield wrote:
> > > On Wed, Aug 28, 2019 at 8:01 PM Mittal, Anuj <anuj.mittal@intel.com>
> > wrote:
> > This is causing failure for 5.0 kernels probably because the attr.py
> > > python -> python3 changes are not there ...
> > >
> > > ERROR: perf-1.0-r9 do_package_qa: QA Issue: /usr/libexec/perf-
> > > core/tests/attr.py contained in package perf-tests requires
> > > /usr/bin/python, but no providers found in RDEPENDS_perf-tests?
> > > [file-
> > > rdeps]
> > > ERROR: perf-1.0-r9 do_package_qa: QA run found fatal errors. Please
> > > consider fixing them.
> > > ERROR: Logfile of failure stored in: /home/pokybuild/yocto-
> > > worker/genericx86/build/build/tmp/work/genericx86-poky-
> > > linux/perf/1.0-
> > > r9/temp/log.do_package_qa.36284
> > > NOTE: recipe perf-1.0-r9: task do_package_qa: Failed
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/975/steps/8/logs/step1b
> > ote:
> unfortunately, I can only cover the active kernels in master with any
> certainty, and I already have a patch to drop 5.0, so I didn't
> > trigger
> this.
> I can spin a patch for 5.0 and make sure it is version proofed a ibt,
> but if anyone else has issues with <insert version here>, they'll
> > need
> > >
> > unfortunately, I can only cover the active kernels in master with any
>
> Can we cover at least the kernels in OE-Core master right now affected
> by this change? So 4.19 as well ...

Consider 5.0 to be not there. It is going to be deleted in about a
day. My hands are very full, so I'm not able to spend much time on it
at the moment.

4.19 did work in my earlier testing, but I will have a look ASAP
(probably next week, since my cycles are largely spoken for at the
moment).

Bruce

>
> Thanks,
>
> Anuj



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

