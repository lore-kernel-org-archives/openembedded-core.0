Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8Zop-0000zr-Br
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 18:48:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Sep 2012 09:35:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,360,1344236400"; d="scan'208";a="188267702"
Received: from unknown (HELO helios.localnet) ([10.252.121.155])
	by azsmga001.ch.intel.com with ESMTP; 03 Sep 2012 09:35:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 03 Sep 2012 17:34:42 +0100
Message-ID: <10363526.IokYFYkZ8L@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <0FE91CED-1C7F-46B8-953C-D2D7DD7B7D4B@dominion.thruhere.net>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
	<1554049.jPb4PTGYOQ@helios>
	<0FE91CED-1C7F-46B8-953C-D2D7DD7B7D4B@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 15/28] packagegroup-base: remove openswan from packagegroup-base-ipsec
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
X-List-Received-Date: Mon, 03 Sep 2012 16:48:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 03 September 2012 18:25:35 Koen Kooi wrote:
> Op 3 sep. 2012, om 12:54 heeft Paul Eggleton <paul.eggleton@linux.intel.com> 
het volgende geschreven:
> > On Monday 03 September 2012 11:50:01 Phil Blundell wrote:
> >> On Mon, 2012-09-03 at 11:37 +0100, Paul Eggleton wrote:
> >>> On Monday 03 September 2012 11:35:24 Phil Blundell wrote:
> >>>> On Mon, 2012-09-03 at 11:30 +0100, Paul Eggleton wrote:
> >>>>> openswan was only ever provided in unmaintained form in meta-demoapps
> >>>>> which has been removed, so we never really provided it in OE-Core.
> >>>> 
> >>>> Isn't packagegroup-base-ipsec rather useless without it?
> >>> 
> >>> If you ignore the RRECOMMENDS line that follows, yes.
> >> 
> >> Is there a meaningful use-case where installing kernel-module-ipsec
> >> without any user-space support is a desirable thing to do?  And, even if
> >> the answer is yes, is it really valuable to have a
> >> packagegroup-base-ipsec which just recommends a single other package
> >> without doing anything else?
> > 
> > The idea is supposed to be that just having "ipsec" in DISTRO_FEATURES
> > brings in what we can to support IPsec, assuming your image uses
> > packagegroup-base that is.
> 
> Isn't that an IMAGE_FEATURE?

It has been implemented within DISTRO_FEATURES since long ago in the OE-
Classic days. We could move it to IMAGE_FEATURES or simply have it as a 
package group on its own, however the minute we have something that requires 
enabling/disabling IPsec at configure time it will break. A cursory google 
search suggests this is not an unlikely situation although not one we actually 
face right now.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


