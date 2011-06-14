Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QWTue-0006d8-4Z for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 15:44:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5EDelFO013053
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 14:40:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12745-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 14:40:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5EDeeZe013047
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 14:40:41 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308056484.25285.262.camel@phil-desktop>
References: <cover.1307947593.git.sgw@linux.intel.com>
	<42c945e9af04b3e9733253b1186abe13bc80bde7.1307947593.git.sgw@linux.intel.com>
	<1308056023.25285.258.camel@phil-desktop>
	<1308056484.25285.262.camel@phil-desktop>
Date: Tue, 14 Jun 2011 14:40:18 +0100
Message-ID: <1308058819.15712.335.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [*RFC CONSOLIDATED PULL RFC* 03/23] git: restore the dependency on perl-native
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
X-List-Received-Date: Tue, 14 Jun 2011 13:44:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-14 at 14:01 +0100, Phil Blundell wrote:
> On Tue, 2011-06-14 at 13:53 +0100, Phil Blundell wrote:
> > On Sun, 2011-06-12 at 23:54 -0700, Saul Wold wrote:
> > > -inherit autotools
> > > +inherit autotools perlnative
> > 
> > This broke the tree for me.  Now I get:
> > 
> > NOTE: Out of date cache found, rebuilding...
> > ERROR: Could not inherit file
> > classes/perlnative.bbclass###########################################
> > | ETA:  00:00:03
> > ERROR: Command execution failed: Exited with 1
> 
> BTW, Scott, this is also a new addition to my list of unsatisfactory
> bitbake error messages.  It would be more helpful if bitbake: (a)
> printed the name of the recipe causing the problem, rather than leaving
> me to grep the tree/guess, and (b) continued rather than immediately
> bailing out.  Also, aesthetically, it'd be nice if it didn't print the
> error on top of the status bar although I guess that is a minor issue in
> the larger scheme of things.
> 
> However, on the positive side, at least there is no python
> stacktrace :-)

I've fixed this.

Unintentionally, a merge was made to poky but not to OE-Core for a
series of patches. I suspect somehow I did make the merge but not the
push and then lost the changes thinking it was just testing changes when
I came back to them.

So I'm sorry about the screw up there, totally my fault and unintended
and it should be fixed now.

Cheers,

Richard



