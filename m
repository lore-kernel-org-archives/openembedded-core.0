Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQJOn-0007Q3-Tl for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 14:50:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAFDhhER025876
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 13:43:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25200-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 13:43:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAFDha6Y025870
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 13:43:37 GMT
Message-ID: <1321364620.26881.211.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2011 13:43:40 +0000
In-Reply-To: <64A64AAB-6921-4A47-99FD-26BD1C58D15C@dominion.thruhere.net>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
	<1321307338.26881.83.camel@ted>
	<20A7BCF2-FB25-4E8F-91A5-00F5234AB184@dominion.thruhere.net>
	<1822275.d3xp7880vj@helios>
	<64A64AAB-6921-4A47-99FD-26BD1C58D15C@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/4] distcc: make distccmon-gnome optional and default to off
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
X-List-Received-Date: Tue, 15 Nov 2011 13:50:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-15 at 13:15 +0100, Koen Kooi wrote:
> Op 15 nov. 2011, om 12:44 heeft Paul Eggleton het volgende geschreven:
> 
> > On Tuesday 15 November 2011 08:58:00 Koen Kooi wrote:
> >> Let's move this to the TSC and see if we can get this crap removed. There is
> >> already an existing ruling that USEFLAGS should be a last resort. I'm tired
> >> of yocto-marketing feel good patches making life harder for people actually
> >> using oe-core and its output.
> > 
> > Marketing has nothing to do with it. All I really want is to fix the problem 
> > that the build blows up if you try to build any image for any of the qemu* 
> > machines with x11 removed from DISTRO_FEATURES.
> 
> Isn't a better question "Why are all images for qemu machines forcing distcc to get built?"?

Both questions are valid:

a) If I build distcc and I have x11 disabled, it shouldn't break.

b) Should qemu include distcc?

Traditionally, qemu-config does pull it in. Why? The qemu scripts allow
pass through of compilation to the build system instead of doing it
under emulation for a significant speed up in compile time. It was
originally felt that it should therefore maximally autoconfigure that
stuff transparently to the user.

If we don't think that is useful we can drop it. That is a separate
discussion to a) which seems to be the contentious problem and solving
b) is just hiding from the issue.

> Or just make a seperate recipe for distccmon-gnome, that would avoid
> the need of any USEFLAGS. Should be just a matter of require distcc_
> $PV.bb ; EXTRA_OEOCONF = foo

and the rest (resolving the various packaging conflicts so that
distcc-gnome only packages the gnome pieces and removes everything
else).

To put this quite simply, I think there is no good reason we shouldn't
use the mechanism we've selected to handle this kind of problem. We
should have defaults the reflect backwards compatibility. Other than
that where is the problem other than a general objection to
PACKAGECONFIG?

Cheers,

Richard







