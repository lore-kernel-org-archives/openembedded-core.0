Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QBiYl-0007Yn-SU for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 09:07:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I75HOu009432;
	Mon, 18 Apr 2011 08:05:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09365-01; Mon, 18 Apr 2011 08:05:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I758Lm009423
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 18 Apr 2011 08:05:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <9480BCD7-8617-488A-B034-B30D1195E9C4@dominion.thruhere.net>
References: <cover.1302886579.git.paul.eggleton@linux.intel.com>
	<72ccbf03bcbec48a34d830c356e591a9139e3794.1302886579.git.paul.eggleton@linux.intel.com>
	<4DA88DE3.2050702@linux.intel.com>
	<9480BCD7-8617-488A-B034-B30D1195E9C4@dominion.thruhere.net>
Date: Mon, 18 Apr 2011 08:05:01 +0100
Message-ID: <1303110301.5518.62.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	"poky@yoctoproject.org" <poky@yoctoproject.org>
Subject: Re: [poky] [PATCH 2/3] netbase: automatically bring up usb0 on beagleboard
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
X-List-Received-Date: Mon, 18 Apr 2011 07:07:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-04-16 at 06:31 +0200, Koen Kooi wrote:
> 
> Op 15 apr. 2011 om 20:26 heeft Saul Wold <sgw@linux.intel.com> het volgende geschreven:
> 
> > On 04/15/2011 10:00 AM, Paul Eggleton wrote:
> >> From: Paul Eggleton<paul.eggleton@linux.intel.com>
> >> 
> >> Avoids manual configuration of the BeagleBoard xM's ethernet port (which
> >> shows up as usb0).
> >> 
> >> Fixes [YOCTO #930]
> >> 
> >> Signed-off-by: Paul Eggleton<paul.eggleton@linux.intel.com>
> >> ---
> >>  .../netbase/netbase-4.45/beagleboard/interfaces    |   27 ++++++++++++++++++++
> >>  1 files changed, 27 insertions(+), 0 deletions(-)
> >>  create mode 100644 meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces
> >> 
> > I know this time would come!
> > 
> > So this is up for discussion in a big way!
> > 
> > There was some initial discussion at ELC this last week about what
> goes where and how layers are going to work moving forward.  I know
> that we are committed to the qemu* machines in oe-core (meta), and
> that currently meta-yocto contains a set of core HW (beagleboard among
> them), so the question then is should the HW specific stuff, such as
> this patch move to meta-yocto or some other layer?  There are a couple
> other recipes such as x-load and formfactor that contain HW specific
> files.
> 
> It should live in the upstream beagleboard BSP layer, which currently
> is meta-texasinstruments

That is the goal, yes. It was agreed that until we sort out the layer
tooling, there would be some code in meta-yocto which would be a copy of
various upstream parts which includes beagleboard. Over time I'm hoping
to see these pieces converge, then we when get the tooling right it will
become automated.

Cheers,

Richard




