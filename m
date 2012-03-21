Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SAUyV-0005i5-8J
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 00:29:51 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SAUpu-0006cF-OJ for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 19:20:58 -0400
Date: Wed, 21 Mar 2012 19:20:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1332371826.9740.222.camel@ted>
Message-ID: <alpine.DEB.2.02.1203211920360.16949@oneiric>
References: <alpine.DEB.2.02.1203211859490.15915@oneiric>
	<1332371826.9740.222.camel@ted>
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
Subject: Re: one more curiosity about oe-buildenv-internal: what's with BBEXTRA?
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
X-List-Received-Date: Wed, 21 Mar 2012 23:29:51 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 21 Mar 2012, Richard Purdie wrote:

> On Wed, 2012-03-21 at 19:02 -0400, Robert P. J. Day wrote:
> > apparently, given the following in oe-buildenv-internal:
> >
> > BITBAKEDIR="$OEROOT/bitbake$BBEXTRA/"
> >
> > you can use BBEXTRA to use a different bitbake directory than the
> > default.  is this a debugging aid?  are normal users meant to know
> > about this?  i don't see any mention of it anywhere.  in fact, from
> > the top level of oe-core:
> >
> > $ grep -r BBEXTRA *
> > scripts/oe-buildenv-internal:BITBAKEDIR="$OEROOT/bitbake$BBEXTRA/"
> > $
>
> I was responsible for this one a long time ago and it was simply a
> development aid. I was probably its main user although I haven't used it
> in a while. We don't have multiple versions of bitbake being used
> heavily anymore, thankfully.

  is it worth just removing?  i can send in a patch unless you'd
rather quietly keep it around.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


