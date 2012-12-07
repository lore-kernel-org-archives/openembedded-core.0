Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Th0p1-0003Jp-QM
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 17:30:45 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:46707 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Th0ax-00038s-Oo; Fri, 07 Dec 2012 11:16:11 -0500
Date: Fri, 7 Dec 2012 11:16:08 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1354896691.12928.34.camel@ted>
Message-ID: <alpine.DEB.2.02.1212071114070.8450@oneiric>
References: <alpine.DEB.2.02.1212061522350.31684@oneiric>
	<1354835735.12928.15.camel@ted>
	<alpine.DEB.2.02.1212061818500.3731@oneiric>
	<1354896691.12928.34.camel@ted>
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
Cc: "Rifenbark, Scott M" <scott.m.rifenbark@intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what exactly is the proper way to use FILESEXTRAPATHS?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2012 16:30:45 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 7 Dec 2012, Richard Purdie wrote:

> It sounds like the docs are missing some details about how this
> works and what its designed to do. We should add the information and
> there are several of us who will happily work with Scott on fixing
> that.
>
> Getting annoyed isn't going to help.
>
> I'd also add that we're about to change the way this works a little
> so we'd perhaps better hold off fixing the manual until we've made
> that change (which will simplify the lists of search paths you've
> been seeing further).
>
> Scott: Looks like we need to tweak the manual in this location.
> Could you open a bug or otherwise track this please?

  i'm in the midst of writing a wiki page on this for my upcoming
class, so once i'm done, feel free to steal.

  and on a related note, my profuse apologies for my snottiness
earlier -- i was totally missing the critical point about bbappend
files being stacked which made all the difference and cleared
everything up.

  grrrrrrr ... my bad.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


