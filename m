Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 7D10E6093D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 19:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 208B320B3A;
	Tue, 17 Jan 2017 19:56:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id afLVYrsdOZOC; Tue, 17 Jan 2017 19:56:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DF161208D7;
	Tue, 17 Jan 2017 19:56:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 79605162320; Tue, 17 Jan 2017 14:56:04 -0500 (EST)
Date: Tue, 17 Jan 2017 14:56:04 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20170117195604.GR15833@denix.org>
References: <2683342.SVnRAGIE1W@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <2683342.SVnRAGIE1W@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: yocto@yoctoproject.org, openembedded-architecture@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [Openembedded-architecture] Patchwork and incoming patch testing
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
X-List-Received-Date: Tue, 17 Jan 2017 19:56:08 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Paul,

That is some impressive work by the team! Thank you all for the hard work and 
bringing the plan to fruition - I'm sure this framework will benefit our 
entire Community and will improve and streamline the workflow!

-- 
Denys


On Wed, Jan 18, 2017 at 07:05:58AM +1300, Paul Eggleton wrote:
> Hi all,
> 
> As some of you are aware some of my colleagues and I have been working on 
> improving how incoming patches are handled - initially for OE-Core but we hope 
> to arrive at something that will be useful for other layers as well. The aim 
> was to do so without adversely affecting existing workflows, so that means 
> building on top of the things we already have. It's taken a bit longer than 
> we'd originally planned - we embarked on this a little over a year ago [1] - 
> but now I am happy to be able to show some meaningful progress.
> 
> A few months ago we upgraded OE's patchwork instance [2], moving not just to a 
> later version but to a fork of patchwork where a bunch of new functionality 
> was being developed for freedesktop.org [3], notably support for capturing and 
> presenting patch series instead of just individual patches. There were some 
> teething problems but we've now resolved most of them. Unfortunately work on 
> said freedesktop.org fork appears to have stalled so for now we have forked it 
> ourselves [4]; long term we'll have to see if we can merge back with patchwork 
> upstream - at least for small fixes we'll try to push those back up 
> independent of any wholesale merge. In any event we are now finally in the 
> position where our patchwork instance can be relied upon to collect emails, 
> and the UI is much improved. This should give us a bit more visibility into 
> where patches are at in the process, although we are still working on a few 
> places where patch series status needs to be updated (e.g. when a patch goes 
> into testing).
> 
> On top of patchwork we have built a simple smoke-testing framework called 
> "patchtest" [5] along with a suite of corresponding tests for OE [6]. These 
> tests are fairly simplistic at this point but check the basics such as whether 
> a patch has been properly signed off, etc. We should soon start seeing replies 
> sent to the mailing list and to submitters with results if there are any 
> failures, saving us from noticing and pointing out some of the more obvious 
> classes of mistakes. The tests are easy to run locally without the rest of the 
> infrastructure and can be extended without difficulty, and I expect we'll 
> continue to work on those as time progresses. Contributions would be very 
> welcome.
> 
> My sincere thanks to José Lamego, Leonardo Sandoval, Daniela Plascencia, 
> Belen Barros Pena, Michael Halstead, Damien Lespiau, Patrick Ohly and others 
> that have been part of implementing this, and to everyone else who has put up 
> with the delays.
> 
> Please let us know if you have issues with any part of this process or 
> suggestions on how to improve it. We're tracking improvements in the Yocto 
> Project bugzilla [7] so you can see what's being worked on there if you're 
> interested.
> 
> Cheers,
> Paul
> 
> [1] Earlier announcement:
>     https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg72952.html
> 
> [2] OE's patchwork instance:
>     http://patchwork.openembedded.org
> 
> [3] Freedesktop.org patchwork fork:
>     https://github.com/dlespiau/patchwork
> 
> [4] Our patchwork fork:
>     http://git.yoctoproject.org/cgit/cgit.cgi/patchwork/
> 
> [5] Patchtest main repository:
>     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest/
> 
> [6] OE test suite for patchtest:
>     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe/
> 
> [7] Yocto Project bugzilla area for patchwork/patchtest:
>     https://bugzilla.yoctoproject.org/describecomponents.cgi?product=Patchwork%2FPatchtest
> 
> -- 
> 
> Paul Eggleton
> Intel Open Source Technology Centre
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
> 

