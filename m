Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RzxTa-00019R-MJ
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 22:42:22 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RzxLZ-0005sJ-9y
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 22:34:05 +0100
Message-ID: <1329860021.2591.182.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2012 21:33:41 +0000
In-Reply-To: <CAGDS+nn7+3zVFX896P-+y5tT4Xw-++bgKtizmDsFZUno5D9Y8A@mail.gmail.com>
References: <cover.1329147583.git.Martin.Jansa@gmail.com>
	<1e2722b29db9486276198e13f06345babce10518.1329147583.git.Martin.Jansa@gmail.com>
	<4cb8ea6acd12fec8ff072912292a374aaac56dcb.1329147583.git.Martin.Jansa@gmail.com>
	<CAGDS+nkxwj33z1zP2Uc9+oH97WkOy_v0yP2cs0VDcDgxm3SYog@mail.gmail.com>
	<CAMKF1sqMP5yyeFo8qUhjd1xPkOvV6JcpzSwRP33VNyc0wf+C_A@mail.gmail.com>
	<CAGDS+nn7+3zVFX896P-+y5tT4Xw-++bgKtizmDsFZUno5D9Y8A@mail.gmail.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 4/4] recipes: bump PR to rebuild .la files without libz.la
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
X-List-Received-Date: Tue, 21 Feb 2012 21:42:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-21 at 13:16 -0800, Steve Sakoman wrote:
> On Tue, Feb 21, 2012 at 1:07 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Tue, Feb 21, 2012 at 11:25 AM, Steve Sakoman <sakoman@gmail.com> wrote:
> >>
> >> | configure: error: Package requirements (cairo-xlib >= 1.6) were not met:
> >> |
> >> | No package 'cairo-xlib' found
> >
> > Add DEPENDS += "cairo"
> 
> Nope, cairo is already in the DEPENDS list for gtk+.
> 
> Seems the issue is that on that build machine (the 4 core) cairo isn't
> being built with --with-x=yes.
> 
> The cairo recipe checks for x11 in DISTRO_FEATURES and does
> --with-x=yes if it is present.
> 
> Since Poky doesn't have x11 in DISTRO_FEATURES, cairo builds without
> xlib support by default.

If you don't have x11 in DISTRO_FEATURES then I wouldn't have expected
gtk+ to want cairo-x11 either.  Though, I don't quite know what the gtk+
configury will do if you don't select any backends at all and it's
possible it might be falling back to X in that case.

What gtk backend are you expecting to use - directfb?

p.




