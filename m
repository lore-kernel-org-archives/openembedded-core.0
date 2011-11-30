Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVsg2-0001Pt-1u for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:30:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUMOBTt006413;
	Wed, 30 Nov 2011 22:24:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05846-08; Wed, 30 Nov 2011 22:24:08 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUMO2rk006407
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 Nov 2011 22:24:03 GMT
Message-ID: <1322691850.17484.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 22:24:10 +0000
In-Reply-To: <cover.1322689519.git.darren@dvhart.com>
References: <cover.1322689519.git.darren@dvhart.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 0/4] Cleanups: grub, autotools, meta-environment
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
X-List-Received-Date: Wed, 30 Nov 2011 22:30:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-30 at 13:49 -0800, Darren Hart wrote:
> During grub feature development I ran across various bugs, typos, thinkos,
> ommisions, etc. that I've collected in this series.
> 
> The following changes since commit 2864ff6a4b3c3f9b3bbb6d2597243cc5d3715939:
> 
>   getVar/setVar cleanups (2011-11-26 22:42:00 +0000)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/user-contrib/dvhart/oe-core cleanup
>   http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=cleanup
> 
> Darren Hart (4):
>   meta-environment: Fix a typo in do_populate_sysroot[noexec]
>   autotools.bbclass: Report the missing configure path
>   grub: Use COMPATIBLE_MACHINE
>   grub: Drop "apply=yes" from patch

Merged to master thanks (using v2 of the COMPATIBLE_MACHINE/HOST one).

I'm moving a little more rapidly with patches as there are a *lot*
appearing at the moment and I want to get some of the simpler ones
merged sooner than later. 

Cheers,

Richard



