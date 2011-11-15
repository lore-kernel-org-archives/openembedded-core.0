Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQKnC-0001jk-A1 for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 16:19:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAFFCuQ3026718
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 15:12:56 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26302-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 15:12:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAFFCm5F026712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 15:12:49 GMT
Message-ID: <1321369973.26881.225.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2011 15:12:53 +0000
In-Reply-To: <0B9C45DF-86DC-4D1C-8D66-C59EB17C9D8C@dominion.thruhere.net>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
	<1321307338.26881.83.camel@ted>
	<20A7BCF2-FB25-4E8F-91A5-00F5234AB184@dominion.thruhere.net>
	<1822275.d3xp7880vj@helios>
	<64A64AAB-6921-4A47-99FD-26BD1C58D15C@dominion.thruhere.net>
	<1321364620.26881.211.camel@ted>
	<543166F7-0EA0-47B3-A7E1-4EE932979710@dominion.thruhere.net>
	<1321368170.26881.221.camel@ted>
	<0B9C45DF-86DC-4D1C-8D66-C59EB17C9D8C@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 15 Nov 2011 15:19:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-15 at 15:55 +0100, Koen Kooi wrote:
> Op 15 nov. 2011, om 15:42 heeft Richard Purdie het volgende geschreven:
> 
> > On Tue, 2011-11-15 at 14:59 +0100, Koen Kooi wrote:
> >> Op 15 nov. 2011, om 14:43 heeft Richard Purdie het volgende geschreven:
> >>> To put this quite simply, I think there is no good reason we shouldn't
> >>> use the mechanism we've selected to handle this kind of problem. We
> >>> should have defaults the reflect backwards compatibility. Other than
> >>> that where is the problem other than a general objection to
> >>> PACKAGECONFIG?
> >> 
> >> It forces a choice when there is a solution where things can coexist.
> > 
> > There are multiple ways of coexisting and the configuration changing
> > based on DISTRO_FEATURES doesn't force a choice either.
> 
> It does force a choice, since you don't want to change DISTRO_FEATURES
> when distributing binaries. If changing it is safe, then it isn't a
> DISTRO_FEATURE.

I'd expect a given distro to be able to figure out in advance whether it
intends to have X11 or not?

If unsure you leave it present...

I really don't see the problem here.

Cheers,

Richard



