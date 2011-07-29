Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QmhKX-0002kU-Fh
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 09:17:57 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QmhGR-0003gO-Dj
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 09:13:43 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E325549.6080908@gmail.com>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311777255.30326.347.camel@phil-desktop>	<4E302785.9070705@windriver.com>
	<1311780347.30326.376.camel@phil-desktop> <4E325549.6080908@gmail.com>
Date: Fri, 29 Jul 2011 08:13:36 +0100
Message-ID: <1311923616.3141.3.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Fri, 29 Jul 2011 07:17:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-28 at 23:38 -0700, Khem Raj wrote:
> On 07/27/2011 08:25 AM, Phil Blundell wrote:
> > On Wed, 2011-07-27 at 09:58 -0500, Mark Hatle wrote:
> >> For the tune names..  armv5 means I want classic ARM instructions, while armv5t
> >> means I was thumb instructions.
> >>
> >> So armv5 and armv5t are distinct in the contents of the tunings.
> >
> > Ah, I see.  Does that go for v4t too?  I can imagine cases where you
> > would want to say "select the v4T ISA but generate ARM code not Thumb".
> >
> >> Yes, the mention of DSP should be using the 'e'.  What I'm not sure of is does
> >> the "dsp" capabilities actually change any of the code or support generated.  If
> >> not then we can ignore it.
> >
> > Yes.  PLD, for example, is only available in ARMv5E (not ARMv5) and this
> > will affect any code which uses __builtin_prefetch().  I don't think GCC
> > will ever open-code the saturating arithmetic instructions, but it does
> > expose the v5/v5e distinction through preprocessor macros and source
> > code might use that to select asm() statements which use those opcodes.
> 
> LDRD/STRD which are armv5e only are used by gcc IIRC

Ah yes, you're right.  Those too.

p.



