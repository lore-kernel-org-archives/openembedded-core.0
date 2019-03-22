Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1602B79ECE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 19:35:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44Qv584RTPz5c;
	Fri, 22 Mar 2019 20:35:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553283325;
	bh=TSPdqs0f7fA43MJs9/XaOseX+A0QMnwbAO59DSrkBJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HadyeLCHIoD+Sy9RwRbb6P6lWXFdO5MlBpfBtRakSFu5AahjCZwRzpCHJg3TO+ZrP
	VkWvglVsxi+PkWsvOGUOxqsDd83RuUT8BTJTYk1jQWYV2FHjNtLjw1rvo6n+lkRenR
	ZXAouPQ6YuxLz8RERT67OLv6N/uFgtSSF05jX8VIRuJOhenAcqfuDukQe1zehREeR4
	d3p4J4vGbmG2/R2ogVnlE6PlWdmWLFb/pyXosvEOiSdteS0F3U37BAG7wO0dV6ff3Y
	aY1HgoO82b1TPg2wQNGmuO45Ln97J5dZ9eQI+J9WZrxKFY5MZzYatEPl6BtCNZef7p
	vNrlz3qQ/z4wwHYV5vnm7IjBmY1MHfuWuObeTvqKlBPnEGplTCmPHP7aT8KYzkUYAS
	zrrby43kv+4lgY5Xr9V0DNLgazkYqqya/LJMXHisUscAmb295ftX+zHe358NcFjURU
	hReIaTAh2h2bKlz9/l7S893ZIfKHcZeh5Ar9ifKez8jF8agGdv72GpHQTdO9xD7gNq
	IaK73LDeQfywT+9IIsG1eiOEQEDu0B+TO4cCrEowcjhwBHg2TDYfCd101RFpgj9mIt
	96hDmvQ3aKwG5RIzvr0xvk6y1Z2zktGBPu0VCKhD4hI5pErWScIi6foQyfFKnk/Ccm
	R37JpNEJz2vUWVyhPcf9bdXo=
Date: Fri, 22 Mar 2019 21:35:22 +0200
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190322193522.GA14099@localhost>
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
	<4ac23adb-9be1-c09b-7794-54c2dbd04a24@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4ac23adb-9be1-c09b-7794-54c2dbd04a24@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: musl thoughts
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
X-List-Received-Date: Fri, 22 Mar 2019 19:35:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Mar 22, 2019 at 07:53:03AM -0700, akuster808 wrote:
> On 3/21/19 6:11 PM, Andreas Müller wrote:
>...
> > As you might guess I'd prefer 3 because:
> > + Many patches can go and don't need maintenance on upstream refactoring anymore
> > + Burden for people sending patches would be reduced
> > + Recipes not building with musl currently might work without further
> > modification
> > + Just in case musl stops (we have seen this before with others e.g
> > ulibc) the cleanup would be reduced
> 
> Didn't we do something like this with glibc? We carried several patches
> that where rejected and just recently got removed so there is a
> precedent for carrying OE specific changes  so it seems like a
> reasonable approach.

The glibc patches that got removed were patches where it can be 
questioned whether they should have ever been applied.

glibc still carries far too many patches that simply shouldn't be there.

All this is different from the musl situation where some kind of 
patching is required somewhere at least short-term.

> - armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


