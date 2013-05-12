Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Ubbhl-0004Zk-0R for openembedded-core@lists.openembedded.org;
	Sun, 12 May 2013 21:13:20 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UbbQB-0003KB-KR; Sun, 12 May 2013 20:54:59 +0200
Message-ID: <1368384890.16243.79.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Saul Wold <sgw@linux.intel.com>
Date: Sun, 12 May 2013 19:54:50 +0100
In-Reply-To: <518FB7F9.2020102@linux.intel.com>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<518D7326.1030901@linux.intel.com> <518E4EAB.8050502@balister.org>
	<CAP9ODKoB_KzEPvRwDkZxLgq4d5A5DiPZ+gfko5XgF3qp9fP_xQ@mail.gmail.com>
	<518FB7F9.2020102@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Sun, 12 May 2013 19:13:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-05-12 at 08:40 -0700, Saul Wold wrote:
> On 05/12/2013 06:27 AM, Otavio Salvador wrote:
> > On Sat, May 11, 2013 at 10:59 AM, Philip Balister <philip@balister.org> wrote:
> >> On 05/10/2013 06:22 PM, Saul Wold wrote:
> >>> On 05/10/2013 05:33 AM, Jukka Rissanen wrote:
> >>>> The VPN support is activated if DISTRO_FEATURES contains
> >>>> vpn string.
> >>>>
> >>>
> >>> This also create a dependency on the meta-openembedded layer, I am not
> >>> sure we want to do that.
> >>
> >> If the default setting does not add the dependency it should be OK? What
> >> packages in meta-oe are needed? Does this suggest they should move to
> >> oe-core?
> >
> > I think so, it'd be good to have it in oe-core and allow use of vpn :)
> >
> I would like to see what the full dependency set looks like for these, 
> clearly there is the vpnc, openvpn, l2tp and pptp recipes, but what else 
> and what licenses are they under.

I don't think we necessarily want openvpn, l2tpd and suchlike in
oe-core.  None of those things seem very "core" to me (in an embedded
context) and testing them seems like it would be a bit of a challenge.

Equally, we certainly don't want to have dependencies in oe-core
pointing to packages in meta-oe or any other layer, since this would
make it impossible to test oe-core in isolation.  So I would be inclined
to say that the right way to deal with this is for those connman bits to
go in a .bbappend which lives in the same layer as the recipes in
question.

p.




