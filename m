Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sz5Yi-0003C5-Rs for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 14:40:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q78CSZOK021996
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Aug 2012 13:28:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21433-03 for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2012 13:28:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q78CSOiQ021990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Aug 2012 13:28:25 +0100
Message-ID: <1344428907.9756.338.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 08 Aug 2012 13:28:27 +0100
In-Reply-To: <1344422390.23275.233.camel@phil-desktop>
References: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
	<1344422390.23275.233.camel@phil-desktop>
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
X-List-Received-Date: Wed, 08 Aug 2012 12:40:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-08 at 11:39 +0100, Phil Blundell wrote:
> On Wed, 2012-08-08 at 09:41 +0100, Burton, Ross wrote:
> > As everyone who's used it can attest, Web (the optional browser in
> > Sato) is pretty rough.  Part of my plans about replacing Sato with a
> > leaner environment involves replacing it with Midori, and if there
> > isn't any disagreements I'll work on a submission to merge Midori into
> > Sato now for everyone who expects the Sato web browser to be useful.
> 
> Replacing Web with Midori in Sato probably is a fine idea from the point
> of view of those folks who want to use Sato per se.  As far as oe-core
> is concerned, the point of having Sato included is apparently for
> testability and it's not entirely obvious that much extra test coverage
> would be gained by merging Midori.
> 
> Indeed, it's not totally clear that having WebKit in meta-sato is really
> justified by the test coverage it brings.  I think WebKit itself might
> be a reasonable candidate for inclusion in oe-core proper, but the
> current situation of having a slightly half-baked recipe in meta-sato is
> not very satisfactory.
> 
> However...
> 
> >This will involve pulling a few projects from meta-oe to oe-core:
> >ca-certificates, python-docutils and vala specifically (although its
> >possible that we can drop the vala dependency).
> 
> ... all three of those seem like reasonable enough things to have in
> oe-core.  Personally I would quite like to see Vala in there.  So, from
> that point of view, I don't have any objection to your proposal.
> 
> But, that said, I do still think that there is going to be some
> inevitable tension between the desire to make Sato useful in itself and
> the desire to have a test environment for oe-core which doesn't add too
> many extra dependencies.  So in the longer term I continue to feel that
> Sato should probably go away into its own layer (or, at least, a layer
> that isn't oe-core) and oe-core itself should gain a dedicated test
> suite.  Anybody who wanted to go on using Sato to exercise oe-core would
> obviously be free to do so even if it was in some other layer.

I think the intent which perhaps isn't being put clearly is that we're
intending to "morph" sato into a kind of test suite of OE-Core (whether
anything is still "sato" in the end remains to be seen). We appreciate
it needs to be minimal yet have good coverage of the various libs/apis.
Some things will just get moved (eds/pimlico) out, some will go into the
core (e.g. webkit) and so on.

If the webkit recipe is half baked, lets fully bake it as I believe in
doing things properly if you do them at all (which is why web-sato needs
to go).

The changes won't happen overnight but I think Ross' proposal for
sorting the browser as a first step is a good one as part of the larger
plan.

Cheers,

Richard



