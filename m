Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1ROUG2-00060r-8P for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 14:01:30 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1ROU9s-00072W-GT for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 13:55:08 +0100
Received: from 188-223-88-44.zone14.bethere.co.uk ([188.223.88.44])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 13:55:08 +0100
Received: from julian.pidancet by 188-223-88-44.zone14.bethere.co.uk with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 13:55:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Julian Pidancet <julian.pidancet@gmail.com>
Date: Thu, 10 Nov 2011 13:43:02 +0000
Message-ID: <j9ghc8$ps7$1@dough.gmane.org>
References: <1319505532-23199-1-git-send-email-julian.pidancet@gmail.com>
	<CAEsOVNen8kUVPge_jZDq5LjhC7BAG0YKx=wxO+ZysNGAd_KwQg@mail.gmail.com>
	<CAKZ=5EVjCrBdH2NBrVD_4UD52h6ZG=p6m-QS5L9K8xfpUcUr1g@mail.gmail.com>
	<1320784166.10843.109.camel@ted>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 188-223-88-44.zone14.bethere.co.uk
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20111110 Thunderbird/7.0.1
In-Reply-To: <1320784166.10843.109.camel@ted>
Subject: Re: [PATCH] Introduce biarch DISTRO_FEATURE
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
X-List-Received-Date: Thu, 10 Nov 2011 13:01:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/08/11 20:29, Richard Purdie wrote:
> 
> I'm left wondering how useful the resulting compiler is to most users.
> In most cases a user would expect full libc support and hence this is
> likely to confuse them. I do appreciate people do have usecases for a
> compiler that can handle the other bit format though.
> 

Standard linux distros out there like debian or gentoo already ship a
biarch gcc per default. It wouldn't seem odd to me if OE had an option
to enable the generation of a biarch compiler.

> I think my biggest worry is the "--enable-targets=all" option which may
> or may not enable things we might not want enabled. I've not had a
> chance to go and look at gcc and convince myself that piece is safe. The
> other pieces looked less worrying.
> 

In the patch, the --enable-targets=all is only active in the x86 case. I
did not find any other way of enabling both -m32 and -m64 switches in gcc.

I've been successfully using this patch to generate a complete x86 32bit
distro with a 64bit Xen hypervisor (I believe the result would have been
the same if I tried to compile a 64bit linux kernel). I did not have any
issues with it so far.

Cheers,

-- 
Julian



