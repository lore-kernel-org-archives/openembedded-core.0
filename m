Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QCzWR-00073F-47 for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 21:26:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3LJOFc2008584
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 20:24:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07963-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 20:24:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3LJOAlV008578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 20:24:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1303404025.9960.6.camel@vorpal>
References: <8313867A-EA5C-473D-A82B-D8338186BF5F@dominion.thruhere.net>
	<201104211605.28351.paul.eggleton@linux.intel.com>
	<1303404025.9960.6.camel@vorpal>
Date: Thu, 21 Apr 2011 20:23:54 +0100
Message-ID: <1303413834.5518.361.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Working toward a GNOME layer
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
X-List-Received-Date: Thu, 21 Apr 2011 19:26:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-04-21 at 09:40 -0700, Joshua Lock wrote:
> On Thu, 2011-04-21 at 16:05 +0100, Paul Eggleton wrote:
> > On Thursday 21 April 2011 15:02:49 Koen Kooi wrote:
> > > and possibly more. I would like to create a meta-gnome layer in the
> > > meta-openembedded repository where new recipes get added and things from
> > > meta-demoapps can get moved over into. Long term recipes-gnome in oe-core
> > > should move there as well.
> > > 
> > > What are your thoughts on this?
> 
> +1
> 
> > 
> > From my perspective this sounds like a great idea. The only question would be 
> > how much of the "GNOME" libs would remain in oe-core as some of them are quite 
> > widely used outside of GNOME proper; however that can easily be worked out as 
> > these things mature.
> 
> +1
> 
> My personal opinion would be that we start with glib & gtk+ (plus their
> dependencies, i.e. pango, atk, etc) in core and move the rest out to a
> layer.

Do we move out sato as well?

> I feel that Gtk+ is used by enough non-gnome software that it belongs in
> core but others may disagree?

I think it needs to be in the core as we need something there to test
X/graphics and so forth. This implies we need sato and its dependencies
there too though (which are thankfully minimal by design).

Cheers,

Richard




