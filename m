Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TswqJ-0002vk-QI
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 15:41:25 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:38004 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tswbd-0002ja-0B; Wed, 09 Jan 2013 09:26:13 -0500
Date: Wed, 9 Jan 2013 09:26:10 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <7E75003D-F6FC-4B4B-9FB8-A84DB5CCEDC8@gmail.com>
Message-ID: <alpine.DEB.2.02.1301090923001.10155@oneiric>
References: <alpine.DEB.2.02.1301090752510.25391@oneiric>
	<7E75003D-F6FC-4B4B-9FB8-A84DB5CCEDC8@gmail.com>
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
Subject: Re: for a quad-core machine, shouldn't parallelism be set to 8?
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
X-List-Received-Date: Wed, 09 Jan 2013 14:41:28 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 9 Jan 2013, Elvis Dowson wrote:

> Hi Robert,

> On my i7 quad core machine, I've set both values to 6. Setting it to
> 6 appears to be nearly the same as setting it to 8, I dare say a
> marginally faster by a minute. I can build core image console in
> around 22 minutes.
>
> Elvis

  i recall someone (richard purdie?) once benchmarked to check the
benefits of increasing parallelism and while it's obvious you'll hit
the wall eventually, it would still be nice for the documentation to
be consistent.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


