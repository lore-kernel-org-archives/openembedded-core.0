Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SuUxe-0003yF-6C for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 22:47:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QKZZXU026273
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 21:35:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25976-09 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 21:35:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QKZLcD026249
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 21:35:23 +0100
Message-ID: <1343334921.9574.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 21:35:21 +0100
In-Reply-To: <007BD92917A2324FA403BCF9A464CF841FF7DD2E@ALA-MBB.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF841FF7D6FA@ALA-MBB.corp.ad.wrs.com>
	<1343329639.7600.13.camel@ted>
	<007BD92917A2324FA403BCF9A464CF841FF7DD2E@ALA-MBB.corp.ad.wrs.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: EXCLUDE_FROM_WORLD
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
X-List-Received-Date: Thu, 26 Jul 2012 20:47:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-26 at 20:16 +0000, Slater, Joseph wrote:
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-
> > bounces@lists.openembedded.org] On Behalf Of Richard Purdie
> > Sent: Thursday, July 26, 2012 12:07 PM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] EXCLUDE_FROM_WORLD
> > 
> > On Thu, 2012-07-26 at 18:45 +0000, Slater, Joseph wrote:
> > > Could somebody clarify excluding things from world?  I see
> > > EXCLUDE_FROM_WORLD = "1" in
> > >
> > > many places, including libx11.inc, and I'm sure there's plenty of
> > > libx11 stuff in world.
> > 
> > The issue is that there are multiple providers of libx11 and when you
> > bitbake world, we don't want them all to build. For that reason it gets
> > excluded and then the correct version will get built as needed.
> > 
> > There are plans afoot to merge those different libx11 recipes at which
> > point the exclude from world will get dropped.
> > 
> > > I also see package specific exclusions in world-broken.inc.
> > 
> > This was originally a list of known problematic packages and used to be
> > quite large. Looking at the list:
> > 
> > gobject-introspection: Totally broken recipe, I'm tempted to delete it.
> > eds-tools: Again, I'm tempted to delete the recipe
> > clutter-box2d: This should build, not sure why its on the broken list.
> 
> Thanks for the clarifications.  I would think that there would be packages
> that you'd want to exclude conditionally.  Like i-only-build-for-x86.bb would
> not be part of world for ppc builds.  Maybe such packages just cannot ever
> be in world, or maybe we do something where EXCLUDE_FROM_WORLD gets computed
> from, say, MACHINE_FEATURES?

For those we have COMPATIBLE_MACHINE and COMPATIBLE_HOST.

Cheers,

Richard



