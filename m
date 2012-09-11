Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TBVo9-0004IY-Pe
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:07:37 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TBVc4-0000V6-0a; Tue, 11 Sep 2012 20:55:08 +0200
Message-ID: <1347389582.29443.52.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Sep 2012 19:53:02 +0100
In-Reply-To: <CAMKF1spX7cpvrb=zLOxi+qFaYhW2fpccOdFQ1-=-LVgv1gETKg@mail.gmail.com>
References: <20120911130155.GC14077@jama.jama.net>
	<20120911134814.GF14077@jama.jama.net> <504F5E0C.7040502@windriver.com>
	<A6372E3C-A8A4-4987-9C2B-D65FFBBCEF5C@dominion.thruhere.net>
	<CAMKF1spX7cpvrb=zLOxi+qFaYhW2fpccOdFQ1-=-LVgv1gETKg@mail.gmail.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: ARM-tuning -- was qemuarm: should it really have TUNE_ARCH armv5te?
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
X-List-Received-Date: Tue, 11 Sep 2012 19:07:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-11 at 11:40 -0700, Khem Raj wrote:
> On Tue, Sep 11, 2012 at 9:13 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > From a gcc point of view both are the same ISA, but using xscale will take in account the absurdly long pipeline on that SoC.
> 
> Not really, when you tune for XScale it will use ldrd/strd and pld if possible

Are you sure?  As far as I remember, the only effects of -mtune=xscale
are to alter some minor pipeline-related tradeoffs in code generation.
In particular, LDM is especially slow on xscale so it is usually best
avoided unless loading very large numbers of registers.

I can't think of any reason why pld would be any more beneficial on
xscale than generic v5TE, and I don't think gcc does anything special
with it in that regard.

p.




