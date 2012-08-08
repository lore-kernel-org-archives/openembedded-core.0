Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Sz3rT-0005r4-LW
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 12:51:35 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Sz3g6-0006Ml-OO
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 12:39:50 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 08 Aug 2012 11:39:47 +0100
In-Reply-To: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
References: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1344422390.23275.233.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 08 Aug 2012 10:51:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-08 at 09:41 +0100, Burton, Ross wrote:
> As everyone who's used it can attest, Web (the optional browser in
> Sato) is pretty rough.  Part of my plans about replacing Sato with a
> leaner environment involves replacing it with Midori, and if there
> isn't any disagreements I'll work on a submission to merge Midori into
> Sato now for everyone who expects the Sato web browser to be useful.

Replacing Web with Midori in Sato probably is a fine idea from the point
of view of those folks who want to use Sato per se.  As far as oe-core
is concerned, the point of having Sato included is apparently for
testability and it's not entirely obvious that much extra test coverage
would be gained by merging Midori.  

Indeed, it's not totally clear that having WebKit in meta-sato is really
justified by the test coverage it brings.  I think WebKit itself might
be a reasonable candidate for inclusion in oe-core proper, but the
current situation of having a slightly half-baked recipe in meta-sato is
not very satisfactory.

However...

>This will involve pulling a few projects from meta-oe to oe-core:
>ca-certificates, python-docutils and vala specifically (although its
>possible that we can drop the vala dependency).

... all three of those seem like reasonable enough things to have in
oe-core.  Personally I would quite like to see Vala in there.  So, from
that point of view, I don't have any objection to your proposal.

But, that said, I do still think that there is going to be some
inevitable tension between the desire to make Sato useful in itself and
the desire to have a test environment for oe-core which doesn't add too
many extra dependencies.  So in the longer term I continue to feel that
Sato should probably go away into its own layer (or, at least, a layer
that isn't oe-core) and oe-core itself should gain a dedicated test
suite.  Anybody who wanted to go on using Sato to exercise oe-core would
obviously be free to do so even if it was in some other layer.

p.




