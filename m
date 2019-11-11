Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6ABA17F828
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 14:14:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47BXtf2WKzz3Q;
	Mon, 11 Nov 2019 15:14:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573481659;
	bh=kvy4qLIccO/F12u1sC3PlNOmGopPqwq8NVh6qySMvVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p79OJ0psQ3aIRLGZofNuaeH3o5u+aYWrLO7lhj6dQEQ4j4bBFFCzwuTzAP5084Zc5
	hIPSvj/Ce+EDrwZEcq9onU6gR3xZuyrKUfVKNkR/ae0Dd6VHh491QhqlFV4RjYEG0u
	DHu0x1D3FQCcqBjCNxkAffj86i3NnVQ45ouIO4MWZ2ncI39l72LqLhRa7S5RZJvTJq
	h92RTUK9uVbWeH4PPHA2xzgQCSiXRxxEghqQ0H7/SGLeK3uRosznZerlLr5VQPvCer
	bZiDmKfa+bTzBYJJObo3fZRWZdAcekZVXlGS2pp4Hrmu9KeIY5mYwGiys8GZ6so3QQ
	CeBwrC0ypNJ4f10RgJGgw6rPrcW8fXlDP4l9ZXKW4TQP3JcHsTCyOEJPj/rCqCw3gN
	rvm50VLOfweiTiDkGS74hQTkc3E8iTEAU+i2/0zIYuxFFzeWaD40kopnaMKiKSEHFq
	dy/HzCjp/6wxr87Q0ut0WjGoisGEYS2PpwW17aG9tBNuA5kJiALyAmKbJAZizPM1Sr
	JIstTQistK7xadun/kO4B125DusN/BdCU4jEUTShO4LRYaLF5h7+wSASY8NsBAeDSU
	Nbh3Z3M9uxCcEnnRlW7qCCmn/hur7fF5dslBQRIAhuXYRxkmpuhWvBR9uvewTvh6wq
	S6Eko57fMPuoqqN2ZG2SpFFE=
Date: Mon, 11 Nov 2019 16:14:16 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191111141416.GF28797@localhost>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
	<ec8a8c61-25a0-7e87-efee-b76e6c954d07@gmail.com>
	<717e1439a3c155fc1f506d7a2933b968ee38f9a8.camel@linuxfoundation.org>
	<be45a323-4379-8a13-71c6-21f98e3a0af4@gmail.com>
	<afa8eed45a5acefa38a89e82e5a833f387963a8f.camel@linuxfoundation.org>
	<20191111104209.GB28797@localhost>
	<63e30a3a07cd78e89c54637ad9893e8a1aec9f84.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <63e30a3a07cd78e89c54637ad9893e8a1aec9f84.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH RFC CFH][sumo 00/47] CVE check backport
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
X-List-Received-Date: Mon, 11 Nov 2019 14:14:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Nov 11, 2019 at 01:12:47PM +0000, Richard Purdie wrote:
> On Mon, 2019-11-11 at 12:42 +0200, Adrian Bunk wrote:
> > On Thu, Nov 07, 2019 at 04:32:35PM +0000, Richard Purdie wrote:
> > > On Thu, 2019-11-07 at 07:55 -0800, akuster808 wrote:
> > > ...
> > > > Are you taking the other patches also submitted for sumo ?
> > > 
> > > I am worried about what the bigger picture for this looks like but
> > > we
> > > could try testing them. I think the TSC needs to discuss this.
> > 
> > How were community supported branches supposed to work?
> > 
> > All branches from 2.1 (sic) are documented as supported in the wiki.
> 
> That was changed recently

What was changed recently was that the pre-2.1 branches were marked EOL:
https://wiki.yoctoproject.org/wiki/index.php?title=Releases&diff=62334&oldid=62324

Non-stable branches are documented as community-supported since 2014:
https://wiki.yoctoproject.org/wiki/index.php?title=Releases&diff=12747&oldid=12743

> and I kind of wish we'd waited until we'd
> followed through with a consistent plan which covers the spectrum of
> EOL/community/stable/LTS.
> 
> As I've said in a few places, the TSC really needs to figure this out
> and its complicated by the LTS discussions. Those discussions are
> happening but aren't simple.

Past releases and future releases might be separate topics.

Please keep in mind that many people already have to support products
on existing stable branches, working under the assumption that patches 
submitted by the community will be accepted.

Closing future non-LTS branches early might be OK if this is part of a 
clearly communicated EOL schedule for future LTS and non-LTS releases, 
like it is clear when Ubuntu releases will be released and for how long 
they are supported.

But this visibility on upstream support is needed before deciding on
a Yocto release for a product. Future LTS releases are irrelevant for 
existing products that cannot move to a different stable branch.

> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


