Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RTH7F-0002pp-Ko
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 19:00:13 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RTH0x-0008Lt-M7
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 18:53:43 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2011 17:53:42 +0000
In-Reply-To: <6713028.ehgggRD6ui@helios>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
	<1322066940.26081.27.camel@phil-desktop>
	<1322068148.15626.15.camel@ted> <6713028.ehgggRD6ui@helios>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1322070823.26081.37.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 0/3] Make pulseaudio a DISTRO_FEATURE
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
X-List-Received-Date: Wed, 23 Nov 2011 18:00:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-23 at 17:45 +0000, Paul Eggleton wrote:
> I think I'm right in assuming that when we introduce a DISTRO_FEATURES feature 
> we are almost always doing it to allow disabling some existing functionality, 
> rather than enabling something new.

I'm not sure that this is true.  There are several recent(ish) examples
of DISTRO_FEATURES that are for new things (e.g. directfb as the base
graphics layer, or gold as the linker), rather than just turning off
switches that were previously the default.  And...

>In that case, should we not be providing the appropriate mechanism so
>that can exclude the features they don't want rather than including the
>ones that they do?

... it seems as though this is basically equivalent to the
"nopulseaudio" proposal, and would suck for the same reasons.

>This will solve the issue, but the more I think about it the more I 
>don't like it - from the perspective of a new user it just puts a fairly 
>arbitrary line between old features and new ones. If you want control 
>over the full range of options you'll need to look at two places.

I'm not quite sure I understand what you're saying here.  Richard's
proposal, if I understand it right, is basically giving DISTROs a way to
say "these are the features that I know about and have decided I don't
want" so that the compatibility code can give them sensible defaults for
the features that they aren't aware of.  

It's true that this will (in some sense) segment them into "new" and
"old" features but it isn't going to be a hard, fixed division and I
would expect that most DISTROs will do a fairly good job of keeping up
to date with the newly introduced flags.

p.




