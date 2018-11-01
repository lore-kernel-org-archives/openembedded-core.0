Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0596079C7C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 06:21:10 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id 185so4517462vkv.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 23:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u2lbbvOxFRv4Y4SM5dCLLRLbcS6sF5uqHRpvEUtnObg=;
	b=ZIqsrs8A+TDLODLgUfMHmGaXG3lkT0LuKBYJpnWrteDCvk+g4pXluXzj0bG56r9CZd
	RtV3NC9jXM76IVopFiKRjdvo65o+MYcXydngmVdMYrH3gJsbfKT7cxdPBYsNHKA8M+3K
	jSa317RqpwFQwBxSKj/LjTmBgH8z8R7cB3X+uRBs9Ip1aEGpzDYkDA7AMmd1SRvHSanN
	IByG0HSjXMf/8Xotrt5RQIYan29MFg1KfpDoe7caI6wc4OYWXiNcLvgqCCMouu7U4aGJ
	eo8EY5uID2f0JaqAHcVk/16Jts+vxSg411LDQzkbsSXrdWpNvlSBcy6GhsT5bS8ShSuS
	vclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u2lbbvOxFRv4Y4SM5dCLLRLbcS6sF5uqHRpvEUtnObg=;
	b=JYkH2CDXOuLpmDbiJXbot/m7Pu6BqbBoIRFXu1WgOTDT/v96OQPT3iEtzjeQIZrRzO
	P5SZmTgsi6oaiVrU093jlN0PxTmL7OvtmmnO4FWY+FEpvo8fo+mYhxWx5IY6katG7BAm
	FGXW9vhMWraTDBG5t90RS5S1nNHZT/4lhaFspD8ZUwYdLv5Q20+Ok9dgPqCMjs73Hcdp
	jROR22IvA6i6NpqgS/NyfRjD177BJJM4qLkic6H3yNMWbsLgll+WuE9u9CiPXW/aCu9Z
	QJTQbe/D2u0J6DPbchmWHmE21zkZmTgrgnPtq2Hu5hCJ2kqpvhPwetvpSwbwWMQENVok
	wBhA==
X-Gm-Message-State: AGRZ1gLIh9YdqtK164pX2Ku2H9j+3zNSK2bn9hSMLMVQz2v8TAq23Jza
	iEA5LObHB6ijYbUCYTQvO33mtkiUgNjQfWMeUrh7Svj1
X-Google-Smtp-Source: AJdET5fV9K3UHYvW8ZV5hLxATqS+11lF5Bh+tOlOA3qRqwXr2VDy7JB2NDuT+IBDkXOqFIagbSgEeYTyGBSsj7wnPms=
X-Received: by 2002:a1f:24d3:: with SMTP id k202mr1585696vkk.45.1541053271802; 
	Wed, 31 Oct 2018 23:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20181101025320.21456-1-robert.joslyn@redrectangle.org>
	<CAJ86T=W08p366z458VjejjFkVTTFu23o9U2o6utp027a0p7r9w@mail.gmail.com>
	<1541050762.8937.20.camel@redrectangle.org>
In-Reply-To: <1541050762.8937.20.camel@redrectangle.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 31 Oct 2018 23:20:59 -0700
Message-ID: <CAJ86T=Vgn9-pMhurKgLhggjPatdmkTPmSHANHYHzFFjtE7Rvjg@mail.gmail.com>
To: robert.joslyn@redrectangle.org
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] openssl: Update from 1.0.2n to 1.0.2p
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
X-List-Received-Date: Thu, 01 Nov 2018 06:21:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 31, 2018 at 10:39 PM Robert Joslyn
<robert.joslyn@redrectangle.org> wrote:
> On Wed, 2018-10-31 at 20:31 -0700, Andre McCurdy wrote:
> > On Wed, Oct 31, 2018 at 7:54 PM Robert Joslyn
> > <robert.joslyn@redrectangle.org> wrote:
> > >
> > > Refresh parallel.patch.
> > >
> > > Remove duplicate LIC_FILES_CHKSUM assignment.
> > >
> > > License-Update: Updated copyright years
> >
> > Normally a backport to pyro would be merged to sumo and rocko first,
> > so this would be done in steps:
> >
> > 1) Backport the existing patches to update 1.0.2n -> 1.0.2o from
> > rocko to pyro
> >
> > 2) Update rocko from 1.0.2o -> 1.0.2p, ideally by backporting patches
> > already in sumo. Note however that the update to 1.0.2p in sumo comes
> > with a lot of non-critical cleanups and it's questionable how far
> > back
> > we want to port those, so a new patch which just updates the version
> > might be preferred?
> >
> > 3) Backport whatever 1.0.2o -> 1.0.2p patches are merged to rocko
> > into pyro.
>
> I debated how much to backport from sumo, and thought I would try to
> minimize the changes to the rocko and pyro branches. The two patches I
> sent are pretty much the minimum required to get 1.0.2p working with
> rocko and pyro.
>
> It's probably easiest to take what's on sumo directly back to rocko and
> then pyro. I'll test that tomorrow and resend the patches if there's no
> objection to taking the other small fixes. I have a feeling trying to
> pull out small cleanups is more trouble than it's worth (for my
> purposes at least), but I'll do so if that's preferred.

As the author of many of the cleanups I would tend to favour including
them in any backport... but I'm not the maintainer of the stable
branches.

