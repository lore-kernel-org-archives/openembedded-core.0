Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QhMvF-00062q-Ir
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 16:29:49 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QhMrQ-0005ZE-7l
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 16:25:52 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jul 2011 15:25:51 +0100
In-Reply-To: <1310653014.20015.1162.camel@rex>
References: <1310547824.6337.212.camel@phil-desktop>
	<1310555312.20015.1096.camel@rex>
	<6FD8E09E-1FDA-4CB6-84B0-085F878F0214@dominion.thruhere.net>
	<1310556386.2378.6.camel@phil-desktop>
	<DA356529-F7C2-4402-B058-6537D1272BCD@dominion.thruhere.net>
	<1310653014.20015.1162.camel@rex>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310653552.2378.64.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] eglibc: ensure that NSS libs go into the right package when ${base_libdir} and ${libdir} are the same
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
X-List-Received-Date: Thu, 14 Jul 2011 14:29:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-14 at 15:16 +0100, Richard Purdie wrote:
> On Wed, 2011-07-13 at 15:14 +0200, Koen Kooi wrote:
> > Op 13 jul 2011, om 13:26 heeft Phil Blundell het volgende geschreven:
> > 
> > > On Wed, 2011-07-13 at 13:13 +0200, Koen Kooi wrote:
> > >> Op 13 jul 2011, om 13:08 heeft Richard Purdie het volgende geschreven:
> > >> 
> > >>> On Wed, 2011-07-13 at 10:03 +0100, Phil Blundell wrote:
> > >>>> Previously, libnss_hesiod et al. could get swallowed by the wildcarded glob in ${PN}-dev.
> > >>>> Fix it by moving eglibc-extra-nss earlier in the PACKAGES and adjusting its FILES to ensure
> > >>>> that the devel symlinks don't get caught.
> > >>>> 
> > >>>> Signed-off-by: Phil Blundell <philb@gnu.org>
> > >>>> ---
> > >>>> meta/recipes-core/eglibc/eglibc-package.inc |    4 ++--
> > >>>> meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
> > >>>> 2 files changed, 3 insertions(+), 3 deletions(-)
> > >>> 
> > >>> Merged to master, thanks.
> > >> 
> > >> That is missing a PR bump for eglibc 2.12
> > > 
> > > Oh yeah.  Do we really need to keep 2.12 around still?
> > 
> > It's the default for angstrom, dunno if that's a good enough reason :)
> 
> Does Angstrom have any plans to switch to 2.13?
> 
> Certainly we're not aware of issues with 2.13 and as such we should
> really consider phasing out 2.12 from OE-Core at least...

How about glibc 2.10; is anybody still using that at all?

p.




