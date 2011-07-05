Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qe5O9-0005Hn-9a for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 15:10:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65D6H49031407
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 14:06:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31191-03 for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2011 14:06:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65D6ADM031401
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 14:06:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309432642.2551.131.camel@phil-desktop>
References: <1309275023-2626-1-git-send-email-koen@dominion.thruhere.net>
	<1309277475.20015.320.camel@rex>
	<AE12D97B-A9AF-4516-93D2-7A5655B46844@dominion.thruhere.net>
	<1309354589.2551.40.camel@phil-desktop>
	<1309355375.20015.383.camel@rex>
	<1309432642.2551.131.camel@phil-desktop>
Date: Tue, 05 Jul 2011 14:05:39 +0100
Message-ID: <1309871139.20015.698.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] eglibc-locale: fix localedef packaging
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
X-List-Received-Date: Tue, 05 Jul 2011 13:10:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 12:17 +0100, Phil Blundell wrote:
> On Wed, 2011-06-29 at 14:49 +0100, Richard Purdie wrote:
> > On Wed, 2011-06-29 at 14:36 +0100, Phil Blundell wrote:
> > > On Tue, 2011-06-28 at 22:32 +0200, Koen Kooi wrote:
> > > > From http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/commit/?h=yocto&id=0d0e14cda2ddd881d09798b0e6edd8086aa9b6d9
> > > > 
> > > > +libc6 -> libc6_dev;
> > > > 
> > > > So libc6 now depends on libc6-dev :(
> > > 
> > > I guess it would be straightforward to patch insane.bbclass to detect
> > > that particular failure (which does indeed seem to happen to libc
> > > distressingly often).  It already diagnoses the case where a package
> > > erroneously depends on a -dbg package, and I can't think of any reason
> > > why the same logic couldn't be applied to -dev.
> > 
> > I'd love to see a patch for this! :)
> 
> Your wish, naturally, is my command.  I've built micro-base-image with
> this and verified that I didn't get any false positives; I also checked
> (via some manual fiddling) that it did indeed detect the case that we
> want it to.  
> 
> I guess it might be a good idea for someone to test it with a slightly
> larger dataset before actually checking it in, just in case.

I merged an updated version of this into master as I think its a useful
check, thanks.

Richard



