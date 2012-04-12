Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SIP5X-0005hi-F0 for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 20:49:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3CIeSat026599
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 19:40:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26043-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 19:40:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3CIeK4W026593
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 19:40:22 +0100
Message-ID: <1334256020.7309.45.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 12 Apr 2012 19:40:20 +0100
In-Reply-To: <CAP9ODKraSBuER3diXxFR8sFW4xN=UKHi=76fTNBm=isJTban8g@mail.gmail.com>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
	<4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>
	<CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>
	<D08D0BD0-4C47-4062-9B08-F44FD1683EED@dominion.thruhere.net>
	<CAP9ODKraSBuER3diXxFR8sFW4xN=UKHi=76fTNBm=isJTban8g@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Yocto Project 1.2 M4 schedule
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
X-List-Received-Date: Thu, 12 Apr 2012 18:49:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-04-12 at 14:32 -0300, Otavio Salvador wrote:
> On Thu, Apr 12, 2012 at 14:22, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > You just volunteered to handle all the "Does it work with yocto 1.2?" questions :)
> >
> > Simply put: people are stupid, they need explicit PHB compliant names in tags, even if it isn't 100% politically correct to say "yocto" when we actually mean "oe-core".
> >
> > Unless the yocto 1.2 release note state that it's based on oe-core "foo" and all layers compatible with "foo" use "foo" in tags/branches.
> 
> I think layers ought to have tags for both ...
> 
> <layer>-oe-core-<tag>
> <layer>-yocto-<tag>

This would be rather sad if it were necessary. The whole point is we're
trying to build things which are compatible with each other. If that
turns out not to be the case I want to fix it, not encourage it.

Cheers,

Richard




