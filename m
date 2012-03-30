Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SDiSc-0004SM-FP
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 22:30:14 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SDiJl-0002hP-V5 for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 16:21:06 -0400
Date: Fri, 30 Mar 2012 16:20:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CABcZANkeLoWBZbBA_hzyssvm21AO3PaF3LEjvMvLzpoxXekpjA@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1203301618170.3638@oneiric>
References: <alpine.DEB.2.02.1203300551220.28382@oneiric>
	<20120330195030.GA24301@denix.org>
	<CABcZANkeLoWBZbBA_hzyssvm21AO3PaF3LEjvMvLzpoxXekpjA@mail.gmail.com>
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
Subject: Re: require/include a .bb file in the same directory?
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
X-List-Received-Date: Fri, 30 Mar 2012 20:30:14 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 30 Mar 2012, Chris Larson wrote:

... snip ...

> The directory the recipe lives in gets temporarily injected into
> BBPATH as the first element.

  ah, that wasn't at all obvious, until i dumped the bitbake
environment with "bitbake -e" and noticed:

  BBPATH=":/home/rpjday/oe/oe-core/meta"

is the null entry at the front of BBPATH supposed to represent the
current directory, just like it would with PATH?

rday

p.s.  is this property mentioned anywhere in the bitbake manual?  it's
definitely useful to know.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


