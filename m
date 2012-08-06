Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SyR0N-0004vD-9k
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 19:22:11 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:51779 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SyQp1-00076W-Fz for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 13:10:27 -0400
Date: Mon, 6 Aug 2012 13:10:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1344272557.9756.177.camel@ted>
Message-ID: <alpine.DEB.2.02.1208061308330.11697@oneiric>
References: <alpine.DEB.2.02.1208061158050.8873@oneiric>
	<1344272557.9756.177.camel@ted>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: proper(?) way to *require* an earlier, unsupported version of a recipe file?
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
X-List-Received-Date: Mon, 06 Aug 2012 17:22:11 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 6 Aug 2012, Richard Purdie wrote:

> On Mon, 2012-08-06 at 12:02 -0400, Robert P. J. Day wrote:
> > what is the OE philosophy for preferring an earlier version of a
> > recipe file that doesn't even exist anymore?  for example, the
> > "watchdog" recipe was recently upgraded from 5.11 to 5.12.  in the
> > process, the recipe file for 5.11 was removed; therefore, i interpret
> > that as that OE-core no longer supports that version, which is fine.
> >
> >   hypothetically, what if someone still *needed* that earlier version?
> > would it be their responsibility to, say, create a new layer that
> > re-introduced that older, now-unsupported version?  just curious.
>
> Well, if there is some reason 5.11 is much better "we" as in OE-Core
> would like to know about it to evaluate if we should be keeping it
> around for some reason. If the reason you want that particular version
> is specific to you then yes, your own layer would be the place to
> maintain it (or a layer shared with other like minded users).

  there was nothing about 5.11 that i see as superior, it's just that
that general question came up last week in class and my admittedly
off-the-cuff answer was that OE-core provided a well-defined, stable
set of recipes to build on and if you *chose* to deviate in any way
from that, that was kind of your problem and you had to deal with it.

  which appears to be pretty much what you're saying.  thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


