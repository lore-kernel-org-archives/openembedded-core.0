Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RZBGf-0000yn-19
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 01:58:21 +0100
Received: (qmail invoked by alias); 10 Dec 2011 00:51:29 -0000
Received: from p5B0A26D1.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.38.209]
	by mail.gmx.net (mp071) with SMTP; 10 Dec 2011 01:51:29 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+uzVY25ACu5f3jr7xcUoxjuEKTV4GmciSoEEi/rk
	5bu7qYBolpAzMz
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 10 Dec 2011 01:51:38 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-103.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<1323303457.971.5.camel@ted>
In-Reply-To: <1323303457.971.5.camel@ted>
MIME-Version: 1.0
Message-Id: <201112100151.39198.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Sat, 10 Dec 2011 00:58:21 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday, December 08, 2011 01:17:37 AM Richard Purdie wrote:
> On Thu, 2011-12-01 at 12:23 +0100, Koen Kooi wrote:
> > During the past month there have been a number of updates to OE-core
> > recipes that triggered parsing errors due to bbappend in other layers.
> > A small seleciton:
> > 
> > * netbase
> > * libdrm
> > * xserver-xorg
> > * clutter
> > 
> > My view is that layer maintainers need to keep an eye on potential
> > breakage and have updates ready when patches land into OE-core.
> > Looking back I can see that while the situation is improving a bit,
> > it's still not working. The problem with slow updates to layers is
> > that (with my angstrom hat on) users (and with my TI hat on) customers
> > and coworkers can't do builds without rm'ing the bbappends or
> > disabling the layer.
> 
> I've been thinking about this. I wondered if the notion of wildcards
> for .bbappend might help, e.g. a file called:
> 
> netbase_%.bbappend
> 
> would match all versions of the netbase recipe.
> 
> The % is consistent with PREFERRED_VERSION, I'm a little reluctant to
> use * since its a shell quoting mess.
> 
> It wouldn't be hard to allow bitbake to support this and would solve
> some of the issues we've been having...
> 
If being used in sub layers parse errors (weekend breakers) would turn into

* no issue
* build error

which are both enhancing current situation.

Andreas


