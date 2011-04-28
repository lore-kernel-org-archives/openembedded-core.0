Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QFNWm-0007X0-Vy for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 11:28:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3S9QIeZ016431;
	Thu, 28 Apr 2011 10:26:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16094-08; Thu, 28 Apr 2011 10:26:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3S9QDax016425
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 28 Apr 2011 10:26:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTik6odYsapq-n82ytd0H7HdYKTLV5g@mail.gmail.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
	<a0629aa0dc55829565b7ab1725875eac065ab2f1.1303539961.git.sgw@linux.intel.com>
	<4DB562CF.1020100@mlbassoc.com> <4DB59811.5040109@linux.intel.com>
	<4DB5ABDB.9070201@mlbassoc.com> <4DB65C5B.2050409@linux.intel.com>
	<BANLkTik6odYsapq-n82ytd0H7HdYKTLV5g@mail.gmail.com>
Date: Thu, 28 Apr 2011 10:25:41 +0100
Message-ID: <1303982741.21461.48.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: Re: [PATCH 07/37] modutils-initscripts: fix wrong order of module loading happening in udev
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
X-List-Received-Date: Thu, 28 Apr 2011 09:28:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-04-26 at 10:51 -0700, Khem Raj wrote:
> On Mon, Apr 25, 2011 at 10:47 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> > On 04/25/2011 10:14 AM, Gary Thomas wrote:
> >
> > Right, so for clarification, for 2.4 kernels, images should be built
> > using just the modutils_2.4.27.bb recipe. For 2.6 kernels, images should
> > be built using module_init_tools and modutils-initscripts.
> >
> > In oe-core, task-base requires module-init-tools and task-core-boot
> > requires modutils-initscripts. That actually seems backwards to me as
> > modutils-initscripts is useless without module-init-tools.
> >
> > There is a considerable amount of cruft in the kernel base classes
> > related to older kernels which I'd like to see purged. Perhaps a
> > meta-linux-2.4 layer would be a good place to keep things like these as
> > well as the modutils_2.4.27 recipe.
> 
> Do we have usecases to even support 2.4 anymore ? I would suggest
> to remove it if no use cases are reported.

I think the time has come for OE-Core to clean out kernel.bbclass of the
2.4 code. If anyone does want to support 2.4, they can do it with a
separate kernel-2.4 class.

Cheers,

Richard



