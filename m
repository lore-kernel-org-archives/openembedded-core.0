Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q4Hik-0006AQ-ND for openembedded-core@lists.openembedded.org;
	Mon, 28 Mar 2011 21:03:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2SJ1O6A001315
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2011 20:01:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01141-03 for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2011 20:01:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2SJ1F9m001309
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2011 20:01:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1301337825.6397.15.camel@scimitar>
References: <cover.1301322225.git.josh@linux.intel.com>
	<201103281944.03722.schnitzeltony@gmx.de>
	<1301337825.6397.15.camel@scimitar>
Date: Mon, 28 Mar 2011 20:01:12 +0100
Message-ID: <1301338872.24596.0.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] Recipes for Clutter 1.6
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
X-List-Received-Date: Mon, 28 Mar 2011 19:03:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-28 at 19:43 +0100, Joshua Lock wrote: 
> On Mon, 2011-03-28 at 19:44 +0200, Andreas Mueller wrote:
> > On Monday 28 March 2011 16:28:23 Joshua Lock wrote:
> > > From: Joshua Lock <josh@linux.intel.com>

> > >  create mode 100644 meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
> > >  create mode 100644
> > > meta/recipes-graphics/clutter/clutter-box2d-1.6_0.10.0.bb create mode
> > > 100644
> > > meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patc
> > > h create mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.6_1.3.6.bb
> > Is version in recipe name really required (it clutters all the dependent 
> > recipes)?
> 
> I'm just following precedent set by the existing recipes in oe-core. I'm
> not particularly fond of it myself either.
> 
> I'm not sure if we're able to set a specific recipe version in the
> DEPENDS without doing something like this, however. At least if we can
> do it I've not seen it.

Clutter is a special case as by design, its meant to be parallel
installable and you need to depend on a specific library version. The
versions are not backwards compatible. We're therefore following the
projects requirements by doing this and don't have much choice.

Cheers,

Richard




