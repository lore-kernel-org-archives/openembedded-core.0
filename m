Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sz5TY-00033O-4C for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 14:35:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q78CNEYL021969
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Aug 2012 13:23:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21361-04 for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2012 13:23:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q78CN69K021963
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Aug 2012 13:23:08 +0100
Message-ID: <1344428588.9756.333.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 08 Aug 2012 13:23:08 +0100
In-Reply-To: <5995DE95-9135-4B8E-82BA-F0938B2D755F@dominion.thruhere.net>
References: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
	<5995DE95-9135-4B8E-82BA-F0938B2D755F@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Replacing Web in Sato with Midori
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
X-List-Received-Date: Wed, 08 Aug 2012 12:35:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-08 at 12:01 +0200, Koen Kooi wrote:
> Op 8 aug. 2012, om 10:41 heeft "Burton, Ross" <ross.burton@intel.com> het volgende geschreven:
> 
> > Hi,
> > 
> > As everyone who's used it can attest, Web (the optional browser in
> > Sato) is pretty rough.  Part of my plans about replacing Sato with a
> > leaner environment involves replacing it with Midori, and if there
> > isn't any disagreements I'll work on a submission to merge Midori into
> > Sato now for everyone who expects the Sato web browser to be useful.
> > 
> > This will involve pulling a few projects from meta-oe to oe-core:
> > ca-certificates, python-docutils and vala specifically (although its
> > possible that we can drop the vala dependency).
> 
> Adding more stuff to oe-core is a bad idea. You should take this
> opportunity to split all the sato stuff into its own layer.

I feel very strongly that having a core layer with no way of
demonstrating and testing it is a very bad idea. I haven't changed my
mind about this and am very unlikely to. "How do you know it works?" is
the question you ask about package upgrades for example.

I know Ross is planning to rationalise what is in sato and ultimately
replace it with something more suited to this purpose. I don't think
removing it entirely is a good move.

One of the steps involved here is to replace what is currently a rather
hacky browser with a real world usable one which fulfils the above
objective - allow OE-Core to be testable. "web" is a core technology and
important to a significant subset of devices. So some things need to get
added, some will also get removed and things will become much less
"sato" like over time.

For example, pimlico is likely just to get removed/moved out to
meta-gnome or wherever as PIM isn't core technology like web is.

So I'd like to give Ross some room to manoeuvre and try to improve this.
It will involve some additions, deletions will also happen. I for one
think this proposal is a good first step (of many).

Cheers,

Richard





