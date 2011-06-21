Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZ16w-0003Pa-DP for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 15:35:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5LDVjAV021063
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 14:31:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20904-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 14:31:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5LDVclB021057
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 14:31:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CADFA591-642E-4377-9531-32646B9BE943@dominion.thruhere.net>
References: <1308658461.20015.24.camel@rex>
	<CADFA591-642E-4377-9531-32646B9BE943@dominion.thruhere.net>
Date: Tue, 21 Jun 2011 14:31:23 +0100
Message-ID: <1308663083.20015.30.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Multilib Development Update
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
X-List-Received-Date: Tue, 21 Jun 2011 13:35:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 14:28 +0200, Koen Kooi wrote:
> Op 21 jun 2011, om 14:14 heeft Richard Purdie het volgende geschreven:
> 
> > We've been experimenting with multilib and I now feel it right to
> > discuss the changes a bit further now there is something to discuss :).
> > The work so far on this is available on the branch:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rpurdie/ml
> > 
> > There have been a few issues and some lessons to learn. I've also have
> > to make some implementation decisions based on the issues we were
> > running into. To summarise them:
> 
> [..]
> 
> > g) I set the TARGET_VENDOR to the horrendously ugly string
> > "-pokymllib32". The reason is that any "-" characters in there breaks
> > config.sub at present and other separators cause other issues. I suspect
> > we can fix that going forward but for now it works albeit looking
> > horrible.
> 
> Angstrom has had some problems with that as well and I think DISTROs
> shouldn't poke TARGET_VENDOR directly, but do something like:
> 
> bitbake.conf:
> 
> # No hyphens!
> DISTROVENDOR ??= "oecore"
> TARGET_VENDOR = "-${DISTROVENDOR}"
> 
> DISTRO.conf:
> 
> # No hyphens!
> DISTROVENDOR = "foo"

Agreed, I think we're going to need to do something like this.

Cheers,

Richard



