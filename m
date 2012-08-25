Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T5F7V-00084f-Jd for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 14:05:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7PBrVoC004553;
	Sat, 25 Aug 2012 12:53:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17462-06; Sat, 25 Aug 2012 12:53:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7PBrKkm004547
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 25 Aug 2012 12:53:21 +0100
Message-ID: <1345895601.14369.103.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Aug 2012 12:53:21 +0100
In-Reply-To: <CAMKF1srk3toCstU+aL66uohw4CPmCZm6szB4f2qswkUsJjTr9g@mail.gmail.com>
References: <cover.1345867875.git.tom.zanussi@intel.com>
	<65d8351bbcb9fb6012c296222795f3c938dc5624.1345867875.git.tom.zanussi@intel.com>
	<3BDCB1BC-7393-4B42-BE04-3BE9A8C90123@dominion.thruhere.net>
	<CAMKF1srk3toCstU+aL66uohw4CPmCZm6szB4f2qswkUsJjTr9g@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sat, 25 Aug 2012 12:05:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-08-25 at 01:13 -0700, Khem Raj wrote:
> 
> 
> On Saturday, August 25, 2012, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> >
> > Op 25 aug. 2012, om 06:34 heeft tom.zanussi@intel.com het volgende
> geschreven:
> >
> >> From: Tom Zanussi <tom.zanussi@intel.com>
> >>
> >> This is the ia32-base.inc moved over from meta-intel.  See
> meta-intel
> >> for the complete history of contributions to this file.
> >>
> >> Here's the initial commit text that explains the purpose of this
> file:
> >>
> >>  The meta-intel BSPs currently have a number of machine settings
> common
> >>  to all - factor these out into a common include file.
> >>
> >>  Also add several new intel-specific XSERVER variables for building
> >>  XSERVER variables in BSPs.
> >>
> >> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> >> ---
> >> meta/conf/machine/include/ia32-base.inc | 58
> +++++++++++++++++++++++++++++++++
> >>
> >> +# glibc-related variables
> >> +#
> >> +GLIBC_ADDONS ?= "nptl"
> >
> > That's a distro setting
> 
> And its redundant

I thought you tried removing this and we ran into issues?

Regardless, I think this is reason to have this in one place where we
can clean it up. I tried to untangle the GLIBC_EXTRA_CONF bit that was
here until recently and that was more painful than necessary needing
patches to meta-intel and meta-yocto. If we get one good include file,
we then have one place to clean this kind of thing up and it stops BSP
layers having to do their own things badly.

So in summary I think this is a reason to support this change :)

Cheers,

Richard






