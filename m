Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T5F5G-00081v-9l for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 14:03:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7PBp9gh004398;
	Sat, 25 Aug 2012 12:51:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16836-08; Sat, 25 Aug 2012 12:51:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7PBovUk004391
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 25 Aug 2012 12:50:59 +0100
Message-ID: <1345895458.14369.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Sat, 25 Aug 2012 12:50:58 +0100
In-Reply-To: <1345881587.4973.34.camel@x121e.pbcl.net>
References: <cover.1345867875.git.tom.zanussi@intel.com>
	<65d8351bbcb9fb6012c296222795f3c938dc5624.1345867875.git.tom.zanussi@intel.com>
	<1345881587.4973.34.camel@x121e.pbcl.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Sat, 25 Aug 2012 12:03:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-08-25 at 08:59 +0100, Phil Blundell wrote:
> On Fri, 2012-08-24 at 23:34 -0500, tom.zanussi@intel.com wrote:
> > This is the ia32-base.inc moved over from meta-intel.  See meta-intel
> > for the complete history of contributions to this file.
> > 
> > Here's the initial commit text that explains the purpose of this file:
> > 
> >   The meta-intel BSPs currently have a number of machine settings common
> >   to all - factor these out into a common include file.
> > 
> 
> It doesn't look as though the name "ia32-base" really reflects the
> contents of this file very accurately.  Most of the bits in here seem to
> have more to do with generic PC architecture and would equally apply to
> x86-64

Note that IA32 includes both x86 and x86-64 in contrast to IA64 which is
Itanium so the name is actually inclusive. 

>  (or indeed any architecture -- e.g. "ext2" which doesn't really
> seem to be a machine property in any meaningful sense).  Also, a lot of
> the stuff in this file seems rather more like distro policy than
> architecture/machine definition.
> 
> That's not to say that I think the idea of having an include file to
> capture a "PC-type" platform (or, at least, the common use-cases for
> one) is a bad idea.  If there are multiple platforms which want to do
> that then putting the definitions in a common place does seem sensible,
> but I think describing it as "ia32-base" is at the same time too
> specific and too generic.
>
> >  Also add several new intel-specific XSERVER variables for building
> >  XSERVER variables in BSPs.
> 
> If these are really intel-specific (and the i915/i965 bits do look like
> they are), shouldn't they stay in meta-intel?  It seems like having
> variables defined in oe-core, but not referenced by anything in oe-core,
> is possibly a recipe for future confusion.

They are used outside of meta-intel, just like the tune files and other
pieces we already have in OE-Core in the machine include directory. Yes,
they're only used by a subset of the architectures but I don't think
that is a reason to exclude this.

Cheers,

Richard



