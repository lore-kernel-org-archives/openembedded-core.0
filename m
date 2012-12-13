Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Tj8gz-0007j9-W7
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 14:19:14 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:47626 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tj8Su-0006B3-8Y; Thu, 13 Dec 2012 08:04:40 -0500
Date: Thu, 13 Dec 2012 08:04:37 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1355403151.32519.1.camel@ted>
Message-ID: <alpine.DEB.2.02.1212130804030.5256@oneiric>
References: <alpine.DEB.2.02.1212121438400.13564@oneiric>
	<1355403151.32519.1.camel@ted>
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
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: which fetch protocols are actually in any use these days?
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
X-List-Received-Date: Thu, 13 Dec 2012 13:19:14 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 13 Dec 2012, Richard Purdie wrote:

> On Wed, 2012-12-12 at 14:42 -0500, Robert P. J. Day wrote:
> > while the bitbake fetcher code supports a number of protocols, which
> > ones are *actually* in serious use these days?  while the fetcher code
> > handles protocols like osc:// and p4://, is anyone actually using
> > those?
> >
> >  i'm writing a tutorial on fetching and i just don't want to spend any
> > time on protocols no one's going to care about.  thanks.
>
> Few care about those two, at least looking for the patches we receive to
> those fetchers. p4 may have some users, I suspect osc has none since I
> know why it was added and that it isn't used by that user group.
>
> Having said that I don't see a pressing need to remove them either as
> they still work, at least in theory.

  oh, i wasn't proposing removing them, i just wanted to know which
protocols i could safely ignore during class. :-)

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


