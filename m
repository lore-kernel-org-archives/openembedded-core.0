Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TY2Qk-0005iQ-JN
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Nov 2012 23:24:34 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TY2DK-00011U-NY; Mon, 12 Nov 2012 23:10:42 +0100
Message-ID: <1352758235.6869.152.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Mon, 12 Nov 2012 22:10:35 +0000
In-Reply-To: <12301427.Yf0uchSh3U@helios>
References: <12301427.Yf0uchSh3U@helios>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: OE-Classic recipe migration status
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
X-List-Received-Date: Mon, 12 Nov 2012 22:24:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-11-11 at 19:11 +0000, Paul Eggleton wrote:
>     136 PERL

I encountered the horror that is the perl modules a few weeks ago while
I was working on mythtv.  At the time it seemed as though there were
more like 13600 recipes but I imagine your figure is probably the
accurate one.  It looks as though I managed to fix up 37 recipes to work
with oe-core before the tedium got too much.

I think this stuff probably wants to go into a dedicated
meta-perl-modules layer since in most cases there is no obvious
functional grouping.  I could publish those 37 as a starting point and
anybody else who wants to add more is welcome to do so.

p.




