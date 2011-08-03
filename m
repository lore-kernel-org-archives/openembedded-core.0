Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/UYTQqwenpJOUNYKLBgSsq0sN86Yj1ksk=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qoepg-00034b-Cv
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 19:02:12 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p73GvniO003357
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 11:57:50 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1312390197.2344.702.camel@rex>
Date: Wed, 3 Aug 2011 11:57:53 -0500
Message-Id: <70C5D15F-E754-412E-845B-5F6D5C52442C@kernel.crashing.org>
References: <1312312720-20828-1-git-send-email-galak@kernel.crashing.org>
	<1312317548.2344.612.camel@rex>
	<992464A7-1010-4A47-BFAA-A7F93C683C99@kernel.crashing.org>
	<1312390197.2344.702.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] tune/arch-powerpc64: keep insync with arch-powerpc.inc
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
X-List-Received-Date: Wed, 03 Aug 2011 17:02:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Aug 3, 2011, at 11:49 AM, Richard Purdie wrote:

> On Tue, 2011-08-02 at 16:00 -0500, Kumar Gala wrote:
>> On Aug 2, 2011, at 3:39 PM, Richard Purdie wrote:
>> 
>>> On Tue, 2011-08-02 at 14:18 -0500, Kumar Gala wrote:
>>>> * Add DEFAULTTUNE setting
>>>> * Sync TUNE_PKGARCH with:
>>>> 	commit 20f285728219c1efcc23d8e861902c212893c68d
>>>> 	Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>> 	Date:   Tue Aug 2 12:40:06 2011 +0100
>>>> 
>>>> 	    tune/ppc: Fix various TUNE_PKGARCH issues
>>> 
>>> Quick question, are all ppc64 cores ppc32 capable or not?
>>> 
>>> Cheers,
>>> 
>>> Richard
>> 
>> yes
> 
> Should we make the 64 bit include file automatically include the 32 bit
> one then?
> 
> That would take care of the
> 
>>> +PPCPKGARCH = "${TUNE_ARCH}"
>>> +TUNE_PKGARCH ?= "${PPCPKGARCH}"
> 
> part but we probably should set the DEFAULTTUNE still...

Not a bad idea, I'll look at doing that.

- k


