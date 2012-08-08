Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sz5rs-0003sL-BV for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 15:00:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q78CmM6O022126
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Aug 2012 13:48:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21361-06 for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2012 13:48:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q78CmGnn022120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Aug 2012 13:48:17 +0100
Message-ID: <1344430098.9756.342.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 08 Aug 2012 13:48:18 +0100
In-Reply-To: <20120808123637.GA2854@jama.jama.net>
References: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
	<5995DE95-9135-4B8E-82BA-F0938B2D755F@dominion.thruhere.net>
	<1344428588.9756.333.camel@ted> <20120808123637.GA2854@jama.jama.net>
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
X-List-Received-Date: Wed, 08 Aug 2012 13:00:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-08 at 14:36 +0200, Martin Jansa wrote:
> On Wed, Aug 08, 2012 at 01:23:08PM +0100, Richard Purdie wrote:
> > On Wed, 2012-08-08 at 12:01 +0200, Koen Kooi wrote:
> > > Op 8 aug. 2012, om 10:41 heeft "Burton, Ross" <ross.burton@intel.com> het volgende geschreven:
> > > 
> > > > Hi,
> > > > 
> > > > As everyone who's used it can attest, Web (the optional browser in
> > > > Sato) is pretty rough.  Part of my plans about replacing Sato with a
> > > > leaner environment involves replacing it with Midori, and if there
> > > > isn't any disagreements I'll work on a submission to merge Midori into
> > > > Sato now for everyone who expects the Sato web browser to be useful.
> > > > 
> > > > This will involve pulling a few projects from meta-oe to oe-core:
> > > > ca-certificates, python-docutils and vala specifically (although its
> > > > possible that we can drop the vala dependency).
> > > 
> > > Adding more stuff to oe-core is a bad idea. You should take this
> > > opportunity to split all the sato stuff into its own layer.
> > 
> > I feel very strongly that having a core layer with no way of
> > demonstrating and testing it is a very bad idea. I haven't changed my
> > mind about this and am very unlikely to. "How do you know it works?" is
> > the question you ask about package upgrades for example.
> 
> And does it need to be in the same layer?
> 
> Why not test webkit-gtk from oe-core with midori from meta-oe layer? 
> Or meta-browser layer if meta-oe is too big for testing webkit-gtk.

It needs to be in the same layer. The logistics of including sections of
meta-oe or meta-browser on the autobuilder whilst trying to test things
like "bitbake world" is not somewhere I want to go. The Yocto Project
does not have the manpower at this point in time to increase test
coverage to include meta-browser or meta-oe. If someone gives me access
to a large team of engineers...

Cheers,

Richard





