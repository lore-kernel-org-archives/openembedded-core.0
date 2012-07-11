Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sp2Aa-0004Km-GZ for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 21:01:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BIoZT9011885;
	Wed, 11 Jul 2012 19:50:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10738-09; Wed, 11 Jul 2012 19:50:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BIoRh1011879
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 11 Jul 2012 19:50:28 +0100
Message-ID: <1342032628.11939.37.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 19:50:28 +0100
In-Reply-To: <1625033.FUQGRG6suy@helios>
References: <4FFD0425.7040004@intel.com> <1342004414.7934.11.camel@ted>
	<CAEsOVNfeZBjERBFsXSWqihHccROAR3N4kRGgW8XhpJd4iKzRdw@mail.gmail.com>
	<1625033.FUQGRG6suy@helios>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: Upcoming Yocto 1.2.1 "denzil" release this week.
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
X-List-Received-Date: Wed, 11 Jul 2012 19:01:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-11 at 19:00 +0100, Paul Eggleton wrote:
> On Wednesday 11 July 2012 17:55:18 McClintock Matthew-B29882 wrote:
> > On Wed, Jul 11, 2012 at 6:00 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Wed, 2012-07-11 at 09:57 +0100, Jack Mitchell wrote:
> > >> Are Khems eglibc patches going to make it in for this - 2.16 is playing
> > >> havoc with my builds at the moment and surely will with everyone else
> > >> when the major distros catch up.
> > > 
> > > Its too late to get those pieces into 1.2.1, they're not even in master
> > > yet, let alone in a stable release branch.
> > > 
> > > I'm proposing we get 1.2.1 out, get the 2.16 pieces tested in master,
> > > then port them to the denzil branch quickly post release so they'd make
> > > any 1.2.2 release and are available on the git branch for people using
> > > the stable branch.
> > 
> > Can you fill me in? Why would a point release include such a dramatic
> > upgrade?
> 
> I think what we would be looking at would be just adding the fixes to allow the 
> native packages to build against eglibc 2.16 so it can work on host distros 
> that use it, not bringing eglibc 2.16 itself in for the target.

Right, this would just be to allow edison to work on systems that have a
native eglibc 2.16. I'm not convinced we have the patches worked out yet
though. Target eglibc would remain with whatever is in edison (2.13?).

Cheers,

Richard



