Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6EBE860C3C;
	Sun,  8 Mar 2020 21:46:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48bFKc6TLRz2C;
	Sun,  8 Mar 2020 22:46:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1583703973;
	bh=Lr261tVcbYiVq9lzGBQ6rbl+aalW1NIBf4qqKc18g4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XpT3ikpCHoEzTV08mDuSU0oaOylIOmXNkIy4ohYHWRAVsR8CD9rO9BRMqDLM3qMCL
	Og9wthlcRd5Dxob46q9SNF+crE52bLASIRm7l3VgfDdTz6xtqUoSUlueIkYNhS/ajc
	7w1XxpTaHeoOu/fi5f2Ak0A+1TGdaJzmiLBZMQ8nn6+rjO7j63Am3ILKvEp88JDc6G
	P4+si38BJ28xx7jzEUA0qsOpZim2Zz202w586+lpq9K9U5lH7oeH3EVRtVOF4LS+CD
	m8xfGYKFNyRYLZPVrOt9HU1LW1Zj5j/6fCwwLbjQCp0uUufDdvn1rIGOWQrnSr59Zc
	uB8Jp6V3jjUuErZ2dyv5zBmPcrkPLeeR7vP18fqsqWgoRGbPt2fscvJekJSvLKvXdw
	iLdY6ffylqhSoz34uLA7bkRCkYU1ETELM8NOK6fTHrHsrp4nnGLuRHe5BdbPkkyhYu
	nqeizlK/jmA7kTp45Nelj9A4vLZmIFeZ302/Z1ohkvOgGLhCq+cSX/eTpBhMbJIteD
	bgkc9gitSMzNEPdaWM5khayVdADQOWg4aczIiz1ldPnGjDwHwo/wjPEeGYjGzbySAa
	EQuDp2gti06BB/mJmepWHl/DnEi1mp2sir/N0PpQrtviBYjbsOdAWmBWoXtOoJLZuA
	NBYAuOGEN6EdLgls5iNx28fE=
Date: Sun, 8 Mar 2020 23:46:10 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200308214610.GB1425@localhost>
References: <20200304090507.GA7923@localhost>
	<CANNYZj9FbH=Poibo03-7tU=QhJjO5vu3kKHGpCgMCNd9=xVAVQ@mail.gmail.com>
	<20200304113217.GB7923@localhost>
	<CANNYZj8wnuNLrw6s=y0cgg5uoMTjA+fMEXW_TsmtKWZ4UDzwOA@mail.gmail.com>
	<20200304140109.GC7923@localhost>
	<CANNYZj8ciqgR7eed+B+WwfMRHKc3u_XHrT3vo004=TEX9cCmhA@mail.gmail.com>
	<20200304172415.GA29456@localhost>
	<01b3bb37-f65f-8048-1a27-b859b62d7f98@gmail.com>
	<20200306100422.GA17785@localhost>
	<877e317932176664bc7b0120439c56d4dda791af.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <877e317932176664bc7b0120439c56d4dda791af.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-architecture@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Does YP provide security support for stable and LTS branches?
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
X-List-Received-Date: Sun, 08 Mar 2020 21:46:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Mar 06, 2020 at 10:36:59AM +0000, Richard Purdie wrote:
> On Fri, 2020-03-06 at 12:04 +0200, Adrian Bunk wrote:
> > For most community companies there is no clear Return on Investment
> > if they would use the opportunity to invest in upstream involvement.
> 
> That isn't true. If you fix something yourself and hold the change you
> get to maintain it. If you work with upstream you can share the
> maintenance burden with the community going forward. That is a direct
> ROI, there are also more indirect benefits.

I was responding to Armin talking about the build swat team.
It is hard to see the ROI for a community company when participating
in something like that.

Upstreaming of own local changes is a different story.

>...
> Today, our stable branch maintenance is done "ad-hoc" by volunteers.
> I/we can't ask them to do anything in any given time frame, its a best
> effort. I *hugely* appreciate what those people do but it has its
> limitations.

On developer lists the message is always "we are short on resources,
please help". Which reaches the few people already involved in 
development.

The message to users is that everything is fine and what new things
Yocto is additionally offering.

No regular user of Wikipedia would miss the regular fundraising where 
the project needs/wants money.

>...
> > The wording is "releases move to community support, which means they 
> > only receive occasional patches for critical defects and updates,
> > and no regular defect fixes and security updates".
> > 
> > When the move to community support means no regular security updates,
> > this is a clear claim from YP that before the move there are regular
> > security updates.
> 
> I think you're being rather pedantic here and I'd suggest we go back to
> what the essence of this announcement is.

The essence for me is that a few days after I am told on the developer 
list that 'track and fix CVEs' for stable releases is on users, YP makes 
an announcement that is worded to make users believe the opposite.

I am getting attacks like being accused of making "toxic accusations" 
for stating the fact that millions of devices being put at risk by
YP misrepresenting the status of security support to users who are
building products based on Yocto.

It is on YP to make it clear to users whether or not Yocto comes with
the same set of security guarantees as distributions like Ubuntu or Debian. 
If it is the duty of every user of Yocto to track and fix CVEs,
then this has to be stated clearly instead of implying the opposite.
This gives users the opportunity to mitigate, instead of unknowingly
shipping insecure products.

E.g. embedded products based on Ubuntu with its security support from 
Linux Foundation member Canonical are clearly better than embedded 
products based on any distribution without similar security support.

And while you are downloading an Ubuntu image from their website you are 
on a "Contribute with PayPal" page.

>...
> > If YP does not want to be responsible for insecure millions of
> > devices, it is up to YP to not make incorrect claims and make it
> > clear in announcements and user documentation if security support is
> > not provided by YP.
> 
> I think the definition of "security support" is arguable to be
> different things but the intent of what we're trying to do here is
> clear. No, the person will not write the patches, the intent is to
> coordinate the maintenance of the branch. If there are huge security
> holes I would at least expect they can highlight the issues and then
> coordinate any help in fixing them. That in itself is a level of
> security support btw.

This is a bit of a strawman, the problem is elsewhere.

Vulnerabilities are rarely OE/Yocto-specific, in practice security
support means applying the same patches that other distributions
are also applying.

When a security advisory will be published for Ubuntu 20.04 LTS
there will be a patch available for usually approximately the
same version of this software as is in Yocto 3.1 LTS.

Going back to where this discussion started:

If YP gives the impression that stable and LTS series are security
supported by YP, then it is a problem when a crypto library like
nss is not getting any security fixes in Yocto 2.7.

Debian stable ships the same upstream version and applied fixes for 5 
CVEs last year. In practice security support means integrating these 
existing patches. And providing security support means that there is
a person resposible for integrating such existing patches from elsewhere.

>...
> Its incredibly hard to find funding to try and then organise what we're
> trying to do, it would be nice if you could try and help us support in
> doing so.
>...

Do you have constructive suggestions how people can help with funding 
who do not have access to money sources that could contribute 6 digit 
amounts to upstream Yocto?

Any support I could provide or might be able to organize would be
4 digits per year, and I am not aware of any existing way to pool
such contributions easily for paying people for upstream YP work.

The best I could offer would be that I open a company that sends 
invoices for small contributions and pays people from that money.
Which sounds like a clear non-starter for financing YP stable/LTS branch 
maintainance - this would likely have to be organized through the LF.

I might have use for continued warrior maintainance and might volunteer
as community maintainer for that after the 12 months, but this doesn't 
generate funding for YP.

It is really hard to help you find funding when you are offering 
opportunities to fund YP only for big companies with huge budgets,
but aren't offering any opportunity to give a 1k contribution to YP.

I fully understand that improving on that would be difficult,
but this is a reason why most businesses are not able to help
you even if they want to.

> Cheers,
> 
> Richard

cu
Adrian

