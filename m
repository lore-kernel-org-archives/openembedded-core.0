Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T5FAc-00087P-Ja for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 14:08:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7PBuhb1004579;
	Sat, 25 Aug 2012 12:56:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16836-09; Sat, 25 Aug 2012 12:56:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7PBuZbq004573
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 25 Aug 2012 12:56:36 +0100
Message-ID: <1345895796.14369.106.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 25 Aug 2012 12:56:36 +0100
In-Reply-To: <3BDCB1BC-7393-4B42-BE04-3BE9A8C90123@dominion.thruhere.net>
References: <cover.1345867875.git.tom.zanussi@intel.com>
	<65d8351bbcb9fb6012c296222795f3c938dc5624.1345867875.git.tom.zanussi@intel.com>
	<3BDCB1BC-7393-4B42-BE04-3BE9A8C90123@dominion.thruhere.net>
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
X-List-Received-Date: Sat, 25 Aug 2012 12:08:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-08-25 at 09:45 +0200, Koen Kooi wrote:
> Op 25 aug. 2012, om 06:34 heeft tom.zanussi@intel.com het volgende geschreven:
> 
> > From: Tom Zanussi <tom.zanussi@intel.com>
> > 
> > This is the ia32-base.inc moved over from meta-intel.  See meta-intel
> > for the complete history of contributions to this file.
> > 
> > Here's the initial commit text that explains the purpose of this file:
> > 
> >  The meta-intel BSPs currently have a number of machine settings common
> >  to all - factor these out into a common include file.
> > 
> >  Also add several new intel-specific XSERVER variables for building
> >  XSERVER variables in BSPs.
> > 
> > Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> > ---
> > meta/conf/machine/include/ia32-base.inc | 58 +++++++++++++++++++++++++++++++++
> > 
> > +# glibc-related variables
> > +#
> > +GLIBC_ADDONS ?= "nptl"
> 
> That's a distro setting

Yes and no. It makes sense for architectures to have sane defaults and I
class nptl on ia32 as that. We want OE-Core to function distroless but
allow distros to change things where it makes sense to them. So I'd
argue this is reasonable.

I seem to remember a number of issues where ia32 defaulted to something
less sane going back in time and you needed this on every ia32 machine.
As has been pointed out, this is probably redundant now. If that is the
case, great, lets clean it up. As I mention to Khem, having one place to
cleanup is better than a whole load of different places.

So I see more in favour of merging this and working on improvements than
not merging it as things stand.

Cheers,

Richard








