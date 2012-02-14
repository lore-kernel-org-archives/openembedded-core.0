Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RxEnG-0001gu-5b
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 10:35:26 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RxEfN-0004Wd-RL
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 10:27:17 +0100
Message-ID: <1329211619.2591.35.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 14 Feb 2012 09:26:59 +0000
In-Reply-To: <CAMKF1spU8Yw7Uhw6JmkJ1EBm2K8K6Q0Zu_DmdhT8L0aL7nBthw@mail.gmail.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
	<4F30DC16.1050506@linux.intel.com>
	<CAMKF1sqTc3PA_4xNbp1751tA73pRazsvrFdwhomdELtb-25ZGg@mail.gmail.com>
	<4F314A73.8070406@linux.intel.com>
	<20120207231245.GA13160@sakrah.homelinux.org>
	<4F31BF7B.4040303@linux.intel.com>
	<CAMKF1sqCgiu0TnTj_rgvDgZ5+JE3uX+Y_5KvKmcfd4LDOAoF2Q@mail.gmail.com>
	<CAGDS+nmdBg8QyBPx6iuG0p0aaPfAU3kvE6jJbekvC2ne0XBedw@mail.gmail.com>
	<54DBF0D0-65DA-4444-8EF5-3E14ED8FE44F@dominion.thruhere.net>
	<20120213074852.GA3832@jama.jama.net>
	<CAGDS+nne1Xbe6XGPuLXqyMLOC_7uqYKFkbRuW77Ub672kpL7BA@mail.gmail.com>
	<60152733-3093-4B6D-8D98-517DEA75C5A2@dominion.thruhere.net>
	<857BE142E5399E46B20FD45B9DB8A7BC0FCE7381@SHSMSX102.ccr.corp.intel.com>
	<CAMKF1spU8Yw7Uhw6JmkJ1EBm2K8K6Q0Zu_DmdhT8L0aL7nBthw@mail.gmail.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Tue, 14 Feb 2012 09:35:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-02-13 at 22:24 -0800, Khem Raj wrote:
> On Mon, Feb 13, 2012 at 8:52 PM, Lu, Lianhao <lianhao.lu@intel.com> wrote:
> >>>>>
> >>>>> It works if you -c cleansstate on a bunch of recipes, pango, cairo, fontconfig, gtk+, etc
> >>>>
> >
> > I tried rpm-native after "-c cleansstate", but it still asks for libz.la? Anyone has the clue?
> 
> try to find which native .la files have libz,la in deps
> and rebuild them too

Can we not just put libz.la back in zlib?  Having to spend hours hunting
out and rebuilding things, and/or bumping PR on half the .bb files in
the repository, seems like an unsatisfactory state of affairs.  As far
as I know the presence of libz.la wasn't previously causing us any
trouble so I'm not entirely clear why heroic measures are justified in
trying to get rid of it.

p.




