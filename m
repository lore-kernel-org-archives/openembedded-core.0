Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q1e0I-0008Nd-Uq for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 13:14:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LCCicW012853;
	Mon, 21 Mar 2011 12:12:44 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12813-01; Mon, 21 Mar 2011 12:12:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LCCbaq012843
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 21 Mar 2011 12:12:38 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <93102E2F-F094-409F-AB37-B9887256A219@dominion.thruhere.net>
References: <63726.2611.qm@web95703.mail.in.yahoo.com>
	<93102E2F-F094-409F-AB37-B9887256A219@dominion.thruhere.net>
Date: Mon, 21 Mar 2011 12:12:13 +0000
Message-ID: <1300709533.30423.3459.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Sparsh Wid hope <sparsh150847@yahoo.com>, poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] Need help to build poky image for beagle board
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
X-List-Received-Date: Mon, 21 Mar 2011 12:14:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-21 at 12:49 +0100, Koen Kooi wrote:
> Op 21 mrt 2011, om 11:29 heeft Sparsh Wid hope het volgende geschreven: 
> > I'm trying to build poky image for beagle board. 
> 
> I'll address the 'beagleboard' portion of your question below.
> 
> > I got the following error- 
> > FATAL: Error when parsing []: file classes/packaged-staging.bbclass not found in /home/surya/Surya/pro/POKY/meta-texasinstruments:/home/surya/Surya/pro/POKY/meta
> > 
> > I followed the steps below-
> > 
> > 1.Downloaded the source 
> > wget -c http://git.pokylinux.org/cgit/cgit.cgi/poky/snapshot/poky-laverne-4.0.1.tar.bz2
> > 
> > and rename it as POKY.
> > 2. Get TI's overlay
> > git clone git://github.com/mrchapp/meta-texasinstruments.git
> > cd meta-texasinstruments
> > git checkout -b gitomapzoom --track origin/gitomapzoom

As others have said, this is an older metadata layer which was written
by some people at TI for older versions of Poky. Its not really been
updated in a couple of years. If you really want to use that layer, you
need to use it with the version of Poky it was written for. I'm not sure
offhand which that would be but its a very early development of our
layer technology and we're getting better at handling documenting the
depedencies and working on a more automated way to handle this.

> That's not a TI overlay, it's an overlay done by someone to add the
> dspbridge stuff to OE. If you want better beagleboard support, use the
> following layer:
> 
> http://gitorious.org/angstrom/angstrom-layers/
> 
> If you don't want to manually resolve all the layer dependencies have
> a look at the scripts mentioned in the readme:
> 
> http://gitorious.org/angstrom/angstrom-layers/blobs/master/README
> 
> The 'better' in the above is aimed at hw support like cpufreq, DSP,
> 1GHz/720MHz, etc. The standard yocto kernel lacks all that because
> it's focussed at different things like 100% POSIX compliance.

Right, Yocto decided to use the beagleboard hardware as a hardware
target to demonstrate that its core arm support was good.

We've therefore been looking at things like POSIX tests, LSB compliance
and also some of the tooling benefits from the Yocto kernel such as its
defconfig management, integrated lttng support and other features. In
the meantime, the hardware component support in other layers has vastly
improved which is great.

I'm hoping we'll find ways to get the best of both worlds in future and
we're looking at ways of making that happen.

Cheers,

Richard




