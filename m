Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SANFS-00022G-44
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 16:14:50 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SAN6r-0004un-FB for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 11:05:57 -0400
Date: Wed, 21 Mar 2012 11:05:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CABcZANmwUbGd2GMrNxaDRvvt9Mx=mKnY6pU2bmnO68SrWsmTWw@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1203211104510.24553@oneiric>
References: <alpine.DEB.2.02.1203210615100.21394@oneiric>
	<alpine.DEB.2.02.1203210625530.16813@oneiric>
	<101A2F63-917B-40EA-809F-E42FF0C1DE14@dominion.thruhere.net>
	<4F69B2B5.1010607@slimlogic.co.uk>
	<CABcZANmwUbGd2GMrNxaDRvvt9Mx=mKnY6pU2bmnO68SrWsmTWw@mail.gmail.com>
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
Subject: Re: what is meaning of "SRC_URI_append_whatever +=" ??
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
X-List-Received-Date: Wed, 21 Mar 2012 15:14:50 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 21 Mar 2012, Chris Larson wrote:

... snip ...

> No, sorry, it's still bogus. _append isn't part of the variable
> name, it's an operation. _append is *always* cumulative, so += is
> redundant, only being used to add the " " separator which you could
> add yourself just as easily.

  i believe my work here is done. :-)  as i said before, i will now
let the clever people sort this out.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


