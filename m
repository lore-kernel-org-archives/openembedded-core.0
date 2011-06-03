Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QSPjs-00034u-Lb for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 10:28:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p538P48K002621
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jun 2011 09:25:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02262-07 for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2011 09:25:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p538OwhV002609
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jun 2011 09:24:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <F6127B53-6B93-4059-AD34-2D0AF130AA9B@dominion.thruhere.net>
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<BANLkTi=q-bMwYtjTAqAXeaB4QQ_n85y8Rw@mail.gmail.com>
	<1307032661.27470.581.camel@rex>
	<201106021806.13486.raj.khem@gmail.com>
	<F6127B53-6B93-4059-AD34-2D0AF130AA9B@dominion.thruhere.net>
Date: Fri, 03 Jun 2011 09:24:37 +0100
Message-ID: <1307089477.27470.625.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/3] busybox: enable mdev by default
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
X-List-Received-Date: Fri, 03 Jun 2011 08:28:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-06-03 at 08:37 +0200, Koen Kooi wrote:
> Op 3 jun 2011, om 03:06 heeft Khem Raj het volgende geschreven:
> 
> > On Thursday, June 02, 2011 09:37:41 AM Richard Purdie wrote:
> >> On Wed, 2011-06-01 at 20:40 +0000, Otavio Salvador wrote:
> >>> On Wed, Jun 1, 2011 at 20:37, Phil Blundell <pb@pbcl.net> wrote:
> >>>> On Wed, 2011-06-01 at 20:09 +0000, Otavio Salvador wrote:
> >>>>> -# CONFIG_MDEV is not set
> >>>>> +CONFIG_MDEV=y
> >>>> 
> >>>> Per previous discussion, I am still uneasy about this change.  I think
> >>>> we really need some sort of coherent policy for what exactly the
> >>>> default busybox configuration in oe-core is meant to be doing, and
> >>>> then (if necessary) a set of patches to make it match the policy. 
> >>>> Just flipping random features on and off does not seem like a good way
> >>>> to proceed.
> >>> 
> >>> OE-core has support to mdev as device handling mechanism as such this
> >>> ought to be enabled by default IMO.
> >>> 
> >>> Personally it doesn't matter since I have already overriden it in my
> >>> internal layer.
> >> 
> >> I'm afraid I'm with Phil on this. I don't like the idea of enabling
> >> something we don't actually use. This really needs to become some kind
> >> of configure option which would at the same time disable/replace udev so
> >> the patch in its currently form isn't acceptable.
> >> 
> > 
> > mdev or udev are image features so probably should be controlled by 
> > IMAGE_FEATURES or some such
> 
> You can't put IMAGE_FEATURES in the equivalent of EXTRA_OECONF since
> the packages in the feeds don't magically change when being installed
> in a different image.

Right, it would have to be a DISTRO_FEATURE for that reason...

Cheers,

Richard



