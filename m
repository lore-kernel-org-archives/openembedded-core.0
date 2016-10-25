Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5A77171A6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 18:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8B423209BC;
	Tue, 25 Oct 2016 18:29:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qjmsTz5PQKfx; Tue, 25 Oct 2016 18:29:42 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 61B3120911;
	Tue, 25 Oct 2016 18:29:40 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id AF45A16217E; Tue, 25 Oct 2016 14:29:39 -0400 (EDT)
Date: Tue, 25 Oct 2016 14:29:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20161025182939.GE2494@denix.org>
References: <alpine.LFD.2.20.1610221156210.31588@localhost.localdomain>
	<68D800E1-2594-4E8B-AB8E-6B9C758FD3CF@gmail.com>
	<alpine.LFD.2.20.1610221251550.7526@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1610221251550.7526@localhost.localdomain>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: basic bitbake commands to create an SDK?
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
X-List-Received-Date: Tue, 25 Oct 2016 18:29:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 22, 2016 at 12:53:24PM -0400, Robert P. J. Day wrote:
> On Sat, 22 Oct 2016, Khem Raj wrote:
> 
> > generally meta-toolchain is prior art. You want to use image
> > specific SDKs so -cpopulate_sdk <image> is fine. In this case it
> > will include the needed dev headers/libs in your SDK for that given
> > image automatically it can be any image
> 
>   ah, good to know, i was starting to get that impression from the
> readings. (is there any mention in the docs that meta-toolchain is
> deprecated? if that's the correct word.)

It's not really depricated! It's still useful in cases when you need a 
standalone toolchain that is not based on any specific image recipe.
It's prone to errors and more complicated for beginners, hence the new "-c 
populate_sdk" method is recommended by default, unless you know what you 
are doing...


> > I would recommend to try using eSDK, which can be generated using
> > -cpopulate_sdk_ext see
> >
> > https://wiki.yoctoproject.org/wiki/Application_Development_with_Extensible_SDK
> 
>   i was just perusing the testsdk.bbclass file, where i read at the
> top:
> 
>   # testsdk.bbclass enables testing for SDK and Extensible SDK
>   #
>   # For run SDK tests you need to do,
>   # - bitbake core-image-sato -c populate_sdk
>   # - bitbake core-image-sato -c testsdk
>   #
>   # For run eSDK tests you need to do,
>   # - bitbake core-image-sato -c populate_sdk_ext
>   # - bitbake core-image-sato -c testsdkext
> 
> does that testing actually require the core-image-sato image? that's
> certainly what those comments seem to suggest.
> 
> rday
> 
> -- 
> 
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
> 
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

