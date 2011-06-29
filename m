Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QbsgN-0000gr-Ko for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 13:11:47 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1Qbscp-00014H-CJ
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 13:08:07 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309344835.20015.355.camel@rex>
References: <044DC375-E0BA-44D9-A063-9BB8E11F7742@dominion.thruhere.net>
	<1309341325.15156.232.camel@phil-desktop>
	<1309344835.20015.355.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Wed, 29 Jun 2011 12:08:06 +0100
Message-ID: <1309345686.2551.13.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: Gstreamer packaging
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
X-List-Received-Date: Wed, 29 Jun 2011 11:11:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 11:53 +0100, Richard Purdie wrote:
> Obviously you can make the recipe depend on good+bad+ugly but its less
> than ideal for build time reasons (esp. when considering dependencies)
> but also the reason that good/bad/ugly exist in the first place which is
> licensing. If the recipe always has to depend on good+bad+ugly, it
> becomes rather tricky to disable ugly and work out whether the resulting
> configuration can build. Companies interested in license compliance do
> have a strong need to be able to do this.

Incidentally, there isn't actually (as far as I can tell) anything in
the current -ugly recipe which would indicate to an ENTERPRISE_DISTRO
that this recipe is potentially problematic.  Its LICENSE field just
reads "GPLv2+ & LGPLv2.1+ & LGPLv2+", which might or might not be
accurate, and it doesn't appear to have the self-skipping behaviour
which the corresponding recipe in oe.dev does.

p.




