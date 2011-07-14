Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QhMmm-0005vP-8A for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 16:21:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6EEH5cq008171
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:17:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08140-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:17:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6EEGwJo008165
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:16:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <DA356529-F7C2-4402-B058-6537D1272BCD@dominion.thruhere.net>
References: <1310547824.6337.212.camel@phil-desktop>
	<1310555312.20015.1096.camel@rex>
	<6FD8E09E-1FDA-4CB6-84B0-085F878F0214@dominion.thruhere.net>
	<1310556386.2378.6.camel@phil-desktop>
	<DA356529-F7C2-4402-B058-6537D1272BCD@dominion.thruhere.net>
Date: Thu, 14 Jul 2011 15:16:54 +0100
Message-ID: <1310653014.20015.1162.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Thu, 14 Jul 2011 14:21:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-13 at 15:14 +0200, Koen Kooi wrote:
> Op 13 jul 2011, om 13:26 heeft Phil Blundell het volgende geschreven:
> 
> > On Wed, 2011-07-13 at 13:13 +0200, Koen Kooi wrote:
> >> Op 13 jul 2011, om 13:08 heeft Richard Purdie het volgende geschreven:
> >> 
> >>> On Wed, 2011-07-13 at 10:03 +0100, Phil Blundell wrote:
> >>>> Previously, libnss_hesiod et al. could get swallowed by the wildcarded glob in ${PN}-dev.
> >>>> Fix it by moving eglibc-extra-nss earlier in the PACKAGES and adjusting its FILES to ensure
> >>>> that the devel symlinks don't get caught.
> >>>> 
> >>>> Signed-off-by: Phil Blundell <philb@gnu.org>
> >>>> ---
> >>>> meta/recipes-core/eglibc/eglibc-package.inc |    4 ++--
> >>>> meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
> >>>> 2 files changed, 3 insertions(+), 3 deletions(-)
> >>> 
> >>> Merged to master, thanks.
> >> 
> >> That is missing a PR bump for eglibc 2.12
> > 
> > Oh yeah.  Do we really need to keep 2.12 around still?
> 
> It's the default for angstrom, dunno if that's a good enough reason :)

Does Angstrom have any plans to switch to 2.13?

Certainly we're not aware of issues with 2.13 and as such we should
really consider phasing out 2.12 from OE-Core at least...

Cheers,

Richard



