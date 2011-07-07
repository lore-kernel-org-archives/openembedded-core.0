Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qey2s-0002NW-6c for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 01:31:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67NRqYA011655;
	Fri, 8 Jul 2011 00:27:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11567-01-3; Fri,  8 Jul 2011 00:27:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67NLmlh011065
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 8 Jul 2011 00:21:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <201107071534.51372.paul.eggleton@linux.intel.com>
References: <cover.1310044227.git.paul.eggleton@linux.intel.com>
	<b53c3209e62b53c744afeed13e1563932770cf1f.1310044227.git.paul.eggleton@linux.intel.com>
	<09ECC867-24F5-4CC7-8312-F00F34897B68@dominion.thruhere.net>
	<201107071534.51372.paul.eggleton@linux.intel.com>
Date: Fri, 08 Jul 2011 00:15:08 +0100
Message-ID: <1310080508.20015.856.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/2] bitbake.conf: update OLDEST_KERNEL to 2.6.0
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
X-List-Received-Date: Thu, 07 Jul 2011 23:31:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 15:34 +0100, Paul Eggleton wrote:
> On Thursday 07 July 2011 15:24:46 Koen Kooi wrote:
> > angstrom has been setting it to 2.6.16 for some years now, I forget which
> > bug that fixed over 2.6.0
> 
> Personally I don't know enough about which crusty old 2.6 kernels people are 
> still using out there, so I figured 2.6.0 was the safest bet.
> 
> A trawl of the OE history turns up these two:
> 
> -----------------------------------
> commit 8b0202e6e3f90a772df301e8522f9deb03e50132
> Author: Tom Rini <tom_rini@mentor.com>
> Date:   Wed Mar 3 12:17:38 2010 -0700
> 
>     glibc*.inc: Bump OLDEST_KERNEL to 2.6.16
>     
>     Per glibc's ChangeLog, 2.6.16 is the minimum required by at least glibc
>     2.9 
>     Prior to this, it was a murky 2.6.14 + patches to 2.6.16 (when it was all
>     upstream).
> -----------------------------------
> commit 794e8652f5c4fef71a8b9ab834b39f75b99f9420
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Thu May 21 20:30:37 2009 +0200
> 
>     Angstrom 2009.X: set OLDEST_KERNEL to 2.6.16 to avoid problems with 
> ppoll()
> -----------------------------------
> 
> Any further comments/info? Should we be using 2.6.16 in oe-core as well?

I'd suggest yes...

Cheers,

Richard



