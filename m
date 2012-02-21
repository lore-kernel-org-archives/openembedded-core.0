Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Rzxei-0001gi-2x
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 22:53:52 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RzxWf-0005tB-V2
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 22:45:35 +0100
Message-ID: <1329860710.2591.191.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2012 21:45:10 +0000
In-Reply-To: <CAGDS+nmmDatHX=MbJkEgCLNS0ZWssWVTDCQZR3Q5wNYPe82EhA@mail.gmail.com>
References: <cover.1329147583.git.Martin.Jansa@gmail.com>
	<1e2722b29db9486276198e13f06345babce10518.1329147583.git.Martin.Jansa@gmail.com>
	<4cb8ea6acd12fec8ff072912292a374aaac56dcb.1329147583.git.Martin.Jansa@gmail.com>
	<CAGDS+nkxwj33z1zP2Uc9+oH97WkOy_v0yP2cs0VDcDgxm3SYog@mail.gmail.com>
	<CAMKF1sqMP5yyeFo8qUhjd1xPkOvV6JcpzSwRP33VNyc0wf+C_A@mail.gmail.com>
	<CAGDS+nn7+3zVFX896P-+y5tT4Xw-++bgKtizmDsFZUno5D9Y8A@mail.gmail.com>
	<1329860021.2591.182.camel@x121e.pbcl.net>
	<CAGDS+nmmDatHX=MbJkEgCLNS0ZWssWVTDCQZR3Q5wNYPe82EhA@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 Feb 2012 21:53:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-21 at 13:39 -0800, Steve Sakoman wrote:
> Well, this is an image for a headless system, so neither directfb nor
> x11 will be used!  I'm not really sure what package is causing gtk+ to
> be built.

Ah.  Well, gtk+ 2.x requires you to choose exactly one of either x11 or
directfb as the backend.  If you don't have either then it isn't going
to work. 

You can use "bitbake -g" to find out what is depending on gtk+, or just
add gtk+ to BBMASK and see which recipe starts complaining about
unsatisfied dependencies.  Sounds like eliminating that dependency at
source is probably going to be the most fruitful route for you to
explore.

p.




