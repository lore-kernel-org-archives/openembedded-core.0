Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QoeiS-0002aH-8E for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 18:54:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73GoMRw027696
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 17:50:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27440-05 for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2011 17:50:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p73GoGpp027690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 17:50:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <992464A7-1010-4A47-BFAA-A7F93C683C99@kernel.crashing.org>
References: <1312312720-20828-1-git-send-email-galak@kernel.crashing.org>
	<1312317548.2344.612.camel@rex>
	<992464A7-1010-4A47-BFAA-A7F93C683C99@kernel.crashing.org>
Date: Wed, 03 Aug 2011 17:49:57 +0100
Message-ID: <1312390197.2344.702.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Wed, 03 Aug 2011 16:54:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-02 at 16:00 -0500, Kumar Gala wrote:
> On Aug 2, 2011, at 3:39 PM, Richard Purdie wrote:
> 
> > On Tue, 2011-08-02 at 14:18 -0500, Kumar Gala wrote:
> >> * Add DEFAULTTUNE setting
> >> * Sync TUNE_PKGARCH with:
> >> 	commit 20f285728219c1efcc23d8e861902c212893c68d
> >> 	Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> 	Date:   Tue Aug 2 12:40:06 2011 +0100
> >> 
> >> 	    tune/ppc: Fix various TUNE_PKGARCH issues
> > 
> > Quick question, are all ppc64 cores ppc32 capable or not?
> > 
> > Cheers,
> > 
> > Richard
> 
> yes

Should we make the 64 bit include file automatically include the 32 bit
one then?

That would take care of the

>> +PPCPKGARCH = "${TUNE_ARCH}"
>> +TUNE_PKGARCH ?= "${PPCPKGARCH}"

part but we probably should set the DEFAULTTUNE still...

Cheers,

Richard



