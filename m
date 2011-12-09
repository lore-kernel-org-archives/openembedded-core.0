Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RYu0u-0006Cd-GO for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 07:32:56 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1RYtuJ-00047K-Q5 for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 07:26:08 +0100
Received: from 99-57-141-118.lightspeed.sntcca.sbcglobal.net ([99.57.141.118])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 07:26:07 +0100
Received: from raj.khem by 99-57-141-118.lightspeed.sntcca.sbcglobal.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 07:26:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2011 06:25:56 +0000 (UTC)
Message-ID: <loom.20111209T072203-634@post.gmane.org>
References: <1308219330.25285.4194.camel@phil-desktop>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 99.57.141.118 (Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1;
	WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727;
	.NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0;
	InfoPath.3; MS-RTC LM 8))
Subject: Re: eglibc testing?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Dec 2011 06:32:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Phil Blundell <pb@...> writes:

> 
> I just ran "make check" under qemu on my eglibc-2.13 build (from oe-core
> master) and got rather a lot of failures.  It wasn't immediately obvious
> to me whether these were libc bugs, qemu infelicities, oe-related
> harness problems, or some kind of local finger trouble.
> 
> Before I spend too much time investigating this, are other people seeing
> the same effect?  What approach do the Yocto folks use for glibc
> testing: are they running the testsuite directly on target hardware, or
> via qemu, or something else?
> 
> The gcc testsuite is next on my list to look at and, again, I'd be
> interested to hear what approach other folks are using there and what
> sort of results they are currently getting.
> 


Hi Phil

I have finally found some time to cobble up howto cross test eglibc
on top of oe-core
I have tried to document it here
http://sakrah.homelinux.org/blog/2011/12/cross-testing-eglibc-regression-
testsuite-using-openembedded-coreqemu/

Right now I see around 34 failures on arm out of 1100 odd tests it ran
Let me know if you have any feedback on it.

I will also post the cross gcc testing howto sometimes soon

> thanks
> 
> p.
> 






