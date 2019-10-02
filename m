Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C650F7EDF1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 20:20:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46k6vC6mzyz2C;
	Wed,  2 Oct 2019 22:20:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1570047608;
	bh=5ClXCeSScbJH+6Huw+tycRh7VqaJQaComi84eGfvnow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S78oiHBzKiA28lQs+QVnVYbFBEN0m4DzZsp+Y4Kuv81Slode6R/MBvH1VkYDgp/At
	ZVYdGDrOfRqIyj4Jox//aKbgumjGmEr0WkF3dqhHpPRGxQgPCR/xB9DTccGTLjy9ty
	mM09jZ0UYiQWlnfSTBtnzOeArlhd36oVHvCHG7o+WucWtY7o7fWSdvRAhc++UlvoIT
	d66IvNu/BzLA8YyM2JgxC2SRY75X7VIr0W1lYWOL0JkTFEW+GRumLsVOiLJPvHx/32
	UoYWul67D0F956UlebDALgxLqnJVtDvKOZ2VwI+bLa3AdWvcQJsfYewskjI0p2lnrR
	GpP4fJp35393jqh8L6o/BOt3EXfkus9huHDzm++TWZlNv3IJy64Iptu7zbOyd/TynR
	l/vPnItitKxnrb0K6XNuXJqKE+1VE4Qxv/o0806yTWUNphojheip4UfY18Zj7WRGBl
	FodRZ99qprUv7xvy21Dzzsfd9gJbNWavlH8dpJy//3yj34i6CeBR9TGlI9bJp8/UuX
	hLUYJkvJ5wY8AKisP1yHK0kPSI055qHBpp1ArvTfJsreflxjPU0I6ieDPb2Z/61YFK
	M4m87u3RKxLwljlyYdSJE0OlLcGK7flGh1OSVRLUd8XS+O86n4hkGZkPkgBxVAz7NC
	u1LeEASUSffVAXl4Z47vPD6U=
Date: Wed, 2 Oct 2019 23:20:01 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191002202001.GB18433@localhost>
References: <20191002120027.109242-1-alex.kanavin@gmail.com>
	<20191002120027.109242-2-alex.kanavin@gmail.com>
	<20191002175152.GA14877@localhost>
	<CANNYZj89n07FE7UEo5DdwCs_q2xUePEh_MZgwZ=uYX1hyRqDnA@mail.gmail.com>
	<20191002181821.GB14877@localhost>
	<CANNYZj8W=Ugu8sRctN3aO1mwSrijDBWLONhFiT4aYrMjRygabw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj8W=Ugu8sRctN3aO1mwSrijDBWLONhFiT4aYrMjRygabw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ethtool, libcap: fix upstream version check
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
X-List-Received-Date: Wed, 02 Oct 2019 20:20:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Oct 02, 2019 at 08:27:55PM +0200, Alexander Kanavin wrote:
> On Wed, 2 Oct 2019 at 20:18, Adrian Bunk <bunk@stusta.de> wrote:
> 
> > On Wed, Oct 02, 2019 at 08:08:08PM +0200, Alexander Kanavin wrote:
> > > On Wed, 2 Oct 2019 at 19:51, Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > > Works for me without your patch:
> > >
> > > I am not sure what this may mean; but for me the patch definitely solves
> > > the problem.
> >
> > It means that even without your patch devtool is able to tell me that
> > there is a new upstream version of ethtool available.
> >
> > I was originally wondering whether there is a problem that also affects
> > other users of KERNELORG_MIRROR, and was then surprised that it worked
> > for me without the change the way I tried.
> >
> > How are you reproducing the problem?
> 
> The same way. I am getting the following on my home computer and on both of
> my work computers (which are on two different networks). Note the IP
> address is different, and the file size is smaller, as it's gzip-compressed:
>...

I am able to reproduce your problem from a machine located elsewhere, 
and there is no difference in the headers sent that can change the 
behaviour to either make both work or both break.

My guess would be that this is a temporary problem on some part of the
Fastly network,
  wget --debug http://www.kernel.org/pub/software/network/ethtool/
says the cache that is broken for me is HHN in Frankfurt:
  Content-Encoding: gzip
  X-Served-By: cache-hhn4065-HHN

I'd be surprised if this affects only 2 recipes, the big hammer would be
  -KERNELORG_MIRROR = "https://cdn.kernel.org/pub"
  +KERNELORG_MIRROR = "https://www.kernel.org/pub"

But so far it looks to me that it might only be a temporary hiccup 
(and affecting only functionality not usually used by users).

I sent an email to Fastly support, let's see if they will answer.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


