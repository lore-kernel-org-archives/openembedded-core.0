Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6E0C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 19:36:34 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web11.116.1657568188542608737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 12:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=first header.b=MNWggS6j;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from Seans-MBP.hadsten (unknown [185.233.254.173])
	by first.geanix.com (Postfix) with ESMTPSA id CD2C5E9331;
	Mon, 11 Jul 2022 19:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1657568185; bh=X0UF4R0MtWrLTnprtNus+DE5YcOrepW7L8wL4Py/tmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MNWggS6j+VaUS4FcruCT7S8n5HdpDoTYkVHACrpOaA+ehMQ/eiC9x41b7PuQ4CH29
	 7Jvjh9i9DtOKmcks+tYD+0gX0AIrKWqpG61MRufzDnUimKieNz3+ctBkxaS/Q2CUXv
	 WjzhojpETgNpNjjySEHeJvoftY/e483Nx5FTHfjpOZDtKIJy9qka6Rh+lJHhKZOg2e
	 UAEiGcjGaCvTvWuMBFb5YfUTxH2MHF5G5oR538RNSWjoAJOnvGVdFi8WSeND8uGOj+
	 LGopVdjYoiz9wRkDdZgSP4Wl7rwfgWot+UnQT1p3p0lzxJZ5jN2R6gBZw5CRVMpwg+
	 1tvGTHKuFgsdw==
Date: Mon, 11 Jul 2022 21:36:25 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] zlib: split src_uri into inc file
Message-ID: <20220711193625.sw2inacx35ihy3u7@Seans-MBP.hadsten>
References: <20220711083309.1749253-1-sean@geanix.com>
 <CAMKF1sry2PHb52OyVBFSwFnnuHVB4g5rY-te_-BKjq4uQ0onsQ@mail.gmail.com>
 <20220711192740.yqa3kdfkvrxt4hib@Seans-MBP.hadsten>
 <CAMKF1sp1nrf1ZjYt9T9Hxq7mMSmtGzLhXJ_3nJuWBiAhD-Nu4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: 
 <CAMKF1sp1nrf1ZjYt9T9Hxq7mMSmtGzLhXJ_3nJuWBiAhD-Nu4A@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 19:36:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167882

On Mon, Jul 11, 2022 at 08:29:24PM +0100, Khem Raj wrote:
> On Mon, Jul 11, 2022 at 8:27 PM Sean Nyekjaer <sean@geanix.com> wrote:
> 
> > On Mon, Jul 11, 2022 at 07:07:38PM +0100, Khem Raj wrote:
> > > We are in process of merging the inc files can you cite reasons why we
> > want
> > > to split it
> > >
> >
> > @Khem:
> > Inside the zlib artifact resides a contrib directory that contains more
> > libs, one of them minizip are we using in our project.
> >
> 
> Is it possible to use packageconfig for enabling this
> 
> 

No it doesn't look like it :(

