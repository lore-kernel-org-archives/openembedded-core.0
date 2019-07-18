Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 181477ECAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 12:43:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45qDMh3333z4s;
	Thu, 18 Jul 2019 14:43:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563453826;
	bh=XLteHv8BGX6qWPV3c261OQEup612pedfNsAAEAuOcj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RMdjN1GCdNROx7wsTQrpqBdHM1n3s2Eosi9jvpiGiO1PF9Hk84OMQUZElSZFtD3SY
	CgCEAdWAmoRfhIG6nsOsLQCZI9eEAV6K7EZ8RowR8L6Y3CYeU+CwQ3tVdbxZRhWONE
	3m6Hsy6ZVDfUwp4khdWf+DToa5v5dsSk02VisowZ8mBaufgAuPld8k9WuloBeUX1LS
	21T1ArlcUTk+p96KOCQX3V/Wca4ux8MW1yVLLxMhK+loZEeN7wfKtrhT6eovLa4nt1
	1Csfmop3jvNJNZX3M2iftXeTqRYV+H4M03ErLqyd40bLWvro3fYjHwv6LNbkr1+mFj
	x0xU0rgff73pjNPPZh/8HmRFzO79E0pYKVIRGTH46eQyqys0Z6+q/wMUvxabkIqMOY
	vs3/xwlGCoMbP4PIen0lHCI38uiQ5jWZWdJ7nm3SlEOasN0/IbyElGAZZOA/mO4E8K
	wvooI9rt+JclGiBRJ7YywsGEHQ0ZbVuXXNBKqODcZjsVTw9pMwHzTUCFYZWTnnxD2P
	hkxSy9rNfDnD4lLAGrBxBmWdimgxZqPEasuP2Ot49669fiEn+cZqpz7SYWipT8WDV7
	MELzPfrG8MsyLx9dJeH9imK15Vqm2xr015oJe6tExZko8RxMvW0Y1CS/ZfIlRwvrn/
	U5hBSRQHRVryAmxrY5C/6KFo=
Date: Thu, 18 Jul 2019 15:43:42 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190718124342.GA1393@localhost>
References: <CAJTo0LaOHbSB75OGLsHJ3Vxd5eVgg9+7Cq3k0=P-BwPLpFiyjg@mail.gmail.com>
	<20190718060409.GA27459@localhost>
	<CAJTo0LbDCp=Wn76R56LxkAbU7pbkeJuBmnXhVr7h=gCJd1phqA@mail.gmail.com>
	<b19a2df01ff9e66056d1c4f23fb9469cff9dacd9.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <b19a2df01ff9e66056d1c4f23fb9469cff9dacd9.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Yocto-mailing-list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: dropping official support for Debian 8 / Opensuse 42.3
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
X-List-Received-Date: Thu, 18 Jul 2019 12:43:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jul 18, 2019 at 12:43:50PM +0100, Richard Purdie wrote:
> On Thu, 2019-07-18 at 12:31 +0100, Burton, Ross wrote:
> > > CentOS 7 is based on Fedora 19 from 2013.
> > > 
> > > This is the oldest currently supported distribution, and when to
> > > remove
> > > support for it (replacing it with the not yet existing CentOS 8)
> > > should
> > > IMHO be part of this discussion.
> > 
> > Centos 7 support is, I believe, already patchy - I think we mandate
> > the buildtools for that?  Any idea what the support plan for Centos 7
> > will be once 8 is released, whenever that is?
> 
> There is some kind of official feed to add python 3.6 to it which we
> use.

Python is only a small part of the picture.

What I would be interested in would be to get rid of the 
ever-growing number of hacks and patches for supporting
the ancient gcc 4.8 in CentOS 7.

With support for Debian 8 removed, CentOS 7 will be two gcc major
versions behind all other supported host distributions.

Remember the nettle problems immediately before Yocto 2.7 was released, 
the root cause was a (bogus) workaround for supporting hosts with gcc < 5.

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


