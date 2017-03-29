Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 298D46067C;
	Wed, 29 Mar 2017 23:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 10EDB20B7A;
	Wed, 29 Mar 2017 23:00:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id GovNmtFdx35i; Wed, 29 Mar 2017 23:00:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 972162010C;
	Wed, 29 Mar 2017 23:00:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 18E1D162450; Wed, 29 Mar 2017 19:00:33 -0400 (EDT)
Date: Wed, 29 Mar 2017 19:00:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170329230033.GR15664@denix.org>
References: <20170327142231.21807-1-marex@denx.de>
	<1490624701.13980.267.camel@linuxfoundation.org>
	<5c037512-7bf1-8a3c-cb76-fda7230781a0@denx.de>
	<20170329215658.GP15664@denix.org>
	<1490825767.13980.333.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1490825767.13980.333.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Update to 2017.03 release
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
X-List-Received-Date: Wed, 29 Mar 2017 23:00:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 29, 2017 at 11:16:07PM +0100, Richard Purdie wrote:
> On Wed, 2017-03-29 at 17:56 -0400, Denys Dmytriyenko wrote:
> > On Mon, Mar 27, 2017 at 04:31:16PM +0200, Marek Vasut wrote:
> > > 
> > > On 03/27/2017 04:25 PM, Richard Purdie wrote:
> > > > 
> > > > On Mon, 2017-03-27 at 16:22 +0200, Marek Vasut wrote:
> > > > > 
> > > > > Upgrade U-Boot to the latest version.
> > > > Wrong list and how does this compare to Ovatio's patch?
> > > I was not CCed on Otavio's patch :(
> > Yeah, me neither, unfortunately - people just ignore maintainers file
> > now.
> > 
> > Good thing Ross copied me on the other discussion!
> 
> This raises a very valid point which is what any maintainers file is
> and what it is not.
> 
> The one that exists in meta-yocto today has a very specific meaning. I
> know there is discussion about moving it to OE-Core however if we do so
> I want to by *really* *really* clear about what being listed there
> means and does not mean.
> 
> As things stand right now, there is no requirement or advice in any of
> our guides to cc "maintainers". People struggle to send patches as it
> is and giving them more hoops to jump through doesn't seem like a
> brilliant idea to me. I know we can create a file with all kinds of
> path matching for files people care/don't care about but I worry this
> will descend into complicated scripts and people still getting upset
> when they were cc'd needlessly or weren't cc'd etc.
> 
> I also quite strongly dislike the "I own X, so only I can change it"
> type view, to be the maintainers are people who help look after
> specific areas in the absence of anyone else and help review patches
> that come in. They certainly get significant influence on things but
> the price for that is they also have to help fix issues and figure out
> ways of helping others with issues in that area.
> 
> So please think very carefully about what you want this "maintainers"
> file to be/not be as I worry its a huge can of worms we once tried in
> OE before...

Well, this reminds me of numerous discussions we've had in the past at several 
OEDEMs and OEDAMs about maintainers file and requirements/responsibilities it 
carries - unfortunately we never been able to resolve it one way or another. I 
guess we'll try finalizing it again with the renewed effort now...


As of u-boot - wasn't trying to claim ownership at all. In the past we've had 
a number of updates from TI, as it's a bootloader of choice for our platforms. 
Somehow I got assigned as a maintainer for the corresponding recipes. I know 
Otavio is also responsible for some changes there, from his involvement with 
Freescale. And at OEDEM last fall, I had a good conversation with Marek about 
u-boot recipes, we've discussed restructuring and re-versioning plans and 
since then he's copying me on his updates - I'm trying to review and/or test 
his changes as much as I can. That's all to it.

-- 
Denys

