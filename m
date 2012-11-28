Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Tdja5-0003o9-AY
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 16:29:45 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TdjMJ-00044N-3o; Wed, 28 Nov 2012 16:15:31 +0100
From: Phil Blundell <philb@gnu.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Nov 2012 15:15:29 +0000
In-Reply-To: <CAJTo0LYHS+j4s_=+2t1v7yXQ6tPxkStOwMJUsAOy9U3BXoN2SA@mail.gmail.com>
References: <1350481324.3259.185.camel@phil-desktop>
	<CAJTo0LYHS+j4s_=+2t1v7yXQ6tPxkStOwMJUsAOy9U3BXoN2SA@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1354115731.23886.94.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH] autotools: Don't install .la files if the distro doesn't want them
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 15:29:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-11-28 at 15:09 +0000, Burton, Ross wrote:
> On 17 October 2012 14:42, Phil Blundell <philb@gnu.org> wrote:
> > It's not obvious that libtool's .la files serve any very useful purpose
> > on a modern system and they can be positively vexatious under some
> > circumstances.  Make installation of this stuff conditional on the new
> > "libtool-garbage" flag in DISTRO_FEATURES and backfill it for existing
> > distros.
> 
> I never saw a patch with a less inflammatory (albeit accurate) name.
> Libtool has been causing me pain again so I'd love to turn this on.
> Is this still good for merging with a different name (libtool-la?)

The only minor roadblock to this is that RP wasn't very keen on the
clean-on-reconfigure patch when I submitted that one independently, see:

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-October/031449.html

Without some equivalent of that thing, turning off .la files in an
existing build tree will cause you to start getting failures.  I guess
we could just accept that as an occupational hazard, and say that people
who turn off libtool-la need to take care of the necessary cleaning for
themselves.

Other than that, yes, I would also like to see this patch get merged.

p.




