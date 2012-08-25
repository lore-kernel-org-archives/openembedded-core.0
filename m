Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T5BVB-0004ab-Vr
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 10:13:54 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1T5BJS-0005vb-NH; Sat, 25 Aug 2012 10:01:46 +0200
Message-ID: <1345881587.4973.34.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: tom.zanussi@intel.com
Date: Sat, 25 Aug 2012 08:59:47 +0100
In-Reply-To: <65d8351bbcb9fb6012c296222795f3c938dc5624.1345867875.git.tom.zanussi@intel.com>
References: <cover.1345867875.git.tom.zanussi@intel.com>
	<65d8351bbcb9fb6012c296222795f3c938dc5624.1345867875.git.tom.zanussi@intel.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] ia32-base.inc: new include file
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
X-List-Received-Date: Sat, 25 Aug 2012 08:13:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-08-24 at 23:34 -0500, tom.zanussi@intel.com wrote:
> This is the ia32-base.inc moved over from meta-intel.  See meta-intel
> for the complete history of contributions to this file.
> 
> Here's the initial commit text that explains the purpose of this file:
> 
>   The meta-intel BSPs currently have a number of machine settings common
>   to all - factor these out into a common include file.
> 

It doesn't look as though the name "ia32-base" really reflects the
contents of this file very accurately.  Most of the bits in here seem to
have more to do with generic PC architecture and would equally apply to
x86-64 (or indeed any architecture -- e.g. "ext2" which doesn't really
seem to be a machine property in any meaningful sense).  Also, a lot of
the stuff in this file seems rather more like distro policy than
architecture/machine definition.

That's not to say that I think the idea of having an include file to
capture a "PC-type" platform (or, at least, the common use-cases for
one) is a bad idea.  If there are multiple platforms which want to do
that then putting the definitions in a common place does seem sensible,
but I think describing it as "ia32-base" is at the same time too
specific and too generic.

>  Also add several new intel-specific XSERVER variables for building
>  XSERVER variables in BSPs.

If these are really intel-specific (and the i915/i965 bits do look like
they are), shouldn't they stay in meta-intel?  It seems like having
variables defined in oe-core, but not referenced by anything in oe-core,
is possibly a recipe for future confusion.

p.




