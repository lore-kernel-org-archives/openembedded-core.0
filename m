Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 78A47605FF;
	Fri, 18 Nov 2016 21:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7E1D920AB6;
	Fri, 18 Nov 2016 21:17:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KxXMkmSW_IK1; Fri, 18 Nov 2016 21:17:44 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3B8CE204AF;
	Fri, 18 Nov 2016 21:17:41 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id 783D11621A4; Fri, 18 Nov 2016 16:17:40 -0500 (EST)
Date: Fri, 18 Nov 2016 16:17:40 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20161118211740.GG26131@denix.org>
References: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
	<70e3fff2-d9a5-37c3-5e14-5dbcc4e4d37b@gmail.com>
	<1479492365.28508.113.camel@linuxfoundation.org>
	<C693ECD4-7EEE-497B-A937-670B441067D2@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <C693ECD4-7EEE-497B-A937-670B441067D2@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Enabling uninative by default in oe-core?
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
X-List-Received-Date: Fri, 18 Nov 2016 21:17:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 18, 2016 at 09:50:08PM +0100, Koen Kooi wrote:
> 
> > Op 18 nov. 2016, om 19:06 heeft Richard Purdie <richard.purdie@linuxfoundation.org> het volgende geschreven:
> > 
> > On Fri, 2016-11-18 at 08:28 -0800, akuster808 wrote:
> >> On 11/17/2016 09:31 AM, Burton, Ross wrote:
> >>> Background: uninative is a class that downloads a precompiled host
> >>> glibc for use in the sysroot, thus isolating the native sysroot
> >>> from the host environment.  This means greater sstate reuse, as
> >>> instead of native builds being dependent on the host system they're
> >>> able to be shared between all hosts.  There is a reference tarball
> >>> hosted on www.yoctoproject.org, and the URL can be overridden by
> >>> distros if you would prefer to build your own.
> >>> 
> >>> We enable this in Poky so that we get greater reuse on the
> >>> autobuilders, and due to some issues with the C++ ABI the eSDK
> >>> generation in master now requires uninative to be enabled.  The
> >>> question is: do we now enable uninative by default in oe-core's
> >>> nodistro (pointing at the yoctoproject tarball), or do we keep it
> >>> disabled by default and require the user to enable uninative if
> >>> they wish to build an eSDK?
> >>  
> >> If Poky wants the default to use a prebuilt uninative that is fine,
> >> but it should be not be the default in OE.  In the spirit of Bitbake,
> >> uninative should be a build dependency for eSDK with the option of
> >> using a prebuilt one.
> > 
> > Its not that simple. Using uninative requires certain options passed in
> > when compiling native recipes for example, e.g. to pick particular C++
> > abis. If you start the build without those set (since uninative is
> > disabled), you can't get native sstate built in the right way for it to
> > work with eSDK. We could of course add a new BBCLASSEXTEND, "native2"
> > which is native specially for use in the eSDK but that seems silly.
> > 
> > I guess we could move the configuration uninative requires into global
> > bitbake.conf but not require the actual binary shim to be enabled. That
> > would let eSDK work in OE-Core just not make OE-Core require uninative.
> > It would mean the compiler options for native would be a little
> > different. That might be an acceptable compromise?
> 
> It would be for me.

Agree, sounds like a good compromise.

-- 
Denys

