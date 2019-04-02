Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id AC44360116;
	Tue,  2 Apr 2019 06:51:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44YKcX693lz4T;
	Tue,  2 Apr 2019 08:51:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1554187885;
	bh=9Vslfiu4ks6EqT0/GeFlpHVLOQ/6yJVWB7nV5XWnhWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tvxKPekSrYWAvqtodhShyIYp5YUGQqh4FoQhXOT8qSU1BO+XFHEVhQEKFsIFTZ4r6
	VLPYxGJQAQMakLDhe7pdupZUY3XbXgMpwT87P/SoNZiKsR+0xZ8Hh1cdT+/k2q8PtV
	v+UrM0E11f6znWio38wGAp6QImUKWnHRuAq+tIwtNZ/irKVRPIq2yLj8SQrKJVNPtM
	RIal7JPu39gau5BlSS4V6ql7B1VpSoLXaRE7OLl7AZ1oARB5dJBZtD8O7L+FqNb2lp
	pHyfJ6O7FdMzDZSeO7as+BVIHK/8tGREUkppIIhLpWp/if4tlKsNx6CMjIU8/ss5k8
	VcPzMkLI1nuzARt9LoIQ3oEuq6FCckCWhbdWWBYijEVpfYfWmfpUx4Ek5hXuyEsIyY
	AfOVVGoNDPPWW41uDWHTP/rj6OhcmhjY9dAebt+LZqMy7xrwZWhgMma8rzcGmNCBvD
	CLanEB18EtMlbxPF3v+6gooK2hUZiouKl7HAtmb8EvjPEzJn/1J4tDldTKYSAGJ8RW
	cJ540vp74aexICKtsa+bf6U40bB0l2d+v/geMCvkRxSI3ZLAJMRbdKQYoeBNdWcnM+
	lcTNwYFAZKsizcdz6jfO4KM7syvUBmfG4ChRITKgR5CyTlMIoSCHNkW09cGRrt24rz
	xXWWYEI7wmcmI0ZD1n2UT3QA=
Date: Tue, 2 Apr 2019 09:51:21 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190402065121.GA31468@localhost>
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
	<b08083fc2f63f6324a652706f8343a0b8defe209.camel@linuxfoundation.org>
	<a1416fe3-04fb-1d37-eaef-05b9a838254e@gmail.com>
MIME-Version: 1.0
In-Reply-To: <a1416fe3-04fb-1d37-eaef-05b9a838254e@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Git commit process question.
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
X-List-Received-Date: Tue, 02 Apr 2019 06:51:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Apr 01, 2019 at 04:20:41PM -0700, akuster808 wrote:
> 
> 
> On 4/1/19 4:02 PM, Richard Purdie wrote:
> > On Mon, 2019-04-01 at 15:33 -0700, akuster808 wrote:
> >> Hello,
> >>
> >> I have noticed a large number of git commits with no header
> >> information being accepted.
> > Can you be more specific about what "no header information" means? You
> > mean a shortlog and no full log message?
> Commits with just a "subject" and signoff. No additional information
> 
> We tend to reference back to how the kernel does things.
> 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> These two sections in particular.
> 
> 
>     2) Describe your changes
> 
> Describe your problem. Whether your patch is a one-line bug fix or 5000
> lines of a new feature, there must be an underlying problem that
> motivated you to do this work. Convince the reviewer that there is a
> problem worth fixing and that it makes sense for them to read past the
> first paragraph.
>...

The kernel does not have "upgrade foo to the latest upstream version" commits.

With the Automatic Upgrade Helper this is a semi-automatic task, and 
most of the time there is no specific motivation other than upgrading
to the latest upstream version.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


