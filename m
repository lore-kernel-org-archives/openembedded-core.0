Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RERK4-0000NI-Nq
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 21:52:08 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1REREY-00033H-RG
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 21:46:26 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20111003150904.GR7364@jama.jama.net>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
	<3ffacbd5138165278774387c51b4bd3bb625eaff.1317648041.git.Martin.Jansa@gmail.com>
	<1317654131.13337.6.camel@phil-desktop>
	<20111003150904.GR7364@jama.jama.net>
Date: Thu, 13 Oct 2011 20:46:20 +0100
Message-ID: <1318535180.3158.4.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCHv2 26/30] glx-use-tls: add from meta-oe layer
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
X-List-Received-Date: Thu, 13 Oct 2011 19:52:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-03 at 17:09 +0200, Martin Jansa wrote:
> On Mon, Oct 03, 2011 at 04:02:10PM +0100, Phil Blundell wrote:
> > Can you add some commentary explaining why this is necessary -- i.e.
> > what exactly is lacking in uClibc to mean it doesn't have "prober TLS
> > support"?
> 
> I'm not using uClibc myself and tracking original bbclass in OE-classic
> leads to this commit
> http://git.openembedded.org/cgit.cgi/openembedded/commit/packages/mesa/mesa-tls.inc?id=b527d8f723c98c77f2f5c5358062e5348493d767
> 
> So I'm CCing woglinde and he will probably explain it.

I see this patch has been applied in the meantime so I guess it's a
slightly academic question now, but I still think it would benefit from
some further explanation.

p.




