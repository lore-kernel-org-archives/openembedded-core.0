Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZhYQ-0007GR-7g for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 12:54:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NAoxPT016089
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 11:51:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15671-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 11:50:56 +0100 (BST)
Received: from [192.168.1.45] (dynamic15.rpnet.com [192.168.1.45])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NAoob3016083
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 11:50:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTik+gq5Pyc_UUmdBiHksJDSiwsTPiQ@mail.gmail.com>
References: <cover.1308706692.git.raj.khem@gmail.com>
	<1308758420.20015.82.camel@rex>
	<C48D1426-0755-45BC-B4E8-011677F3B11A@dominion.thruhere.net>
	<BANLkTik+gq5Pyc_UUmdBiHksJDSiwsTPiQ@mail.gmail.com>
Date: Thu, 23 Jun 2011 11:50:49 +0100
Message-ID: <1308826249.20015.111.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2 0/2] Change gcc 4.6 recipes to use svn in SRC_URI
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
X-List-Received-Date: Thu, 23 Jun 2011 10:54:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-23 at 01:40 -0700, Khem Raj wrote:
> On Wed, Jun 22, 2011 at 9:08 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >
> > Op 22 jun 2011, om 18:00 heeft Richard Purdie het volgende geschreven:
> >
> >> On Tue, 2011-06-21 at 18:43 -0700, Khem Raj wrote:
> >>> changes since V1
> >>>
> >>> Separate out non gcc changes to a different pull request
> >>> Patches are not attached inline due to sheer size of them
> >>> as they might choke patchwork. The are only on the branch
> >>>
> >>> The following changes since commit 78de64f58b98101f5be5778e9ecbdaae5ba32997:
> >>>
> >>>  binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64 (2011-06-21 17:58:06 -0700)
> >>>
> >>> are available in the git repository at:
> >>>  git://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.6
> >>>  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gcc-4.6
> >>>
> >>> Khem Raj (2):
> >>>  gcc-4.6: Switch to using svn SRC_URI for recipe
> >>>  tcmode-default.inc: use 4.6 for GCCVERSION and SDKGCCVERSION
> >>
> >> I'm afraid I don't like having "gcc 4.6" being so publicly visible. Its
> >> fine for the recipe names but the PV itself really needs to be something
> >> like "4.6.2+svn".
> >>
> >> I say this as a person who'd have to deal with people claiming we're
> >> behind on gcc since we were on 4.6[.0] :/
> >
> > There will always be people claiming nonsense about numbers :)
> 
> Hi Richard
> 
> I have pushed updated patches to the branch now. PV is set to 4.6.0+svnr${SRCPV}
> and we use wild card in choosing gcc version

Merged to master, thanks.

Richard



