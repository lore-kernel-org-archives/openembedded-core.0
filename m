Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QkBmT-0003X4-NH for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 11:12:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6M95KUI026716;
	Fri, 22 Jul 2011 10:05:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16025-10; Fri, 22 Jul 2011 10:05:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6M95Ash026710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 22 Jul 2011 10:05:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <BD5C61B9-8EC9-4C55-AE35-71D9B022F532@kernel.crashing.org>
References: <cover.1311234475.git.sgw@linux.intel.com>
	<1311280985.2344.82.camel@rex>
	<BD5C61B9-8EC9-4C55-AE35-71D9B022F532@kernel.crashing.org>
Date: Fri, 22 Jul 2011 10:05:08 +0100
Message-ID: <1311325508.2344.102.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/20] July 21, 2011
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
X-List-Received-Date: Fri, 22 Jul 2011 09:12:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-22 at 02:49 -0500, Kumar Gala wrote:
> On Jul 21, 2011, at 3:43 PM, Richard Purdie wrote:
> 
> > On Thu, 2011-07-21 at 00:52 -0700, Saul Wold wrote:
> >> Review and tested, the inherit perlnatives are needed.
> >> 
> >> The following changes since commit 0d03800caffc2341b74190d38f7a372223c89f4c:
> >> 
> >>  lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib (2011-07-20 15:43:43 +0100)
> >> 
> >> are available in the git repository at:
> >>  git://git.openembedded.org/openembedded-core-contrib sgw/stage
> >>  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> >> 
> >> Martin Jansa (9):
> >>  tcmode-default: set preferred version also for (e)glibc-locale
> >>  eglibc-package: don't fail without localedef/gconv
> >>  python: save Makefile.sysroot in do_compile
> >>  python: add patch to fix cross compilation on host with linux-3.0
> >>  polkit: inherit perlnative
> >>  shared-mime-info: inherit perlnative
> >>  xkeyboard-config: inherit perlnative
> >>  avahi: inherit perlnative
> >>  vte: inherit perlnative
> >> 
> >> Matthew McClintock (2):
> >>  Add endianess macros used by previous endian-ness_handling.patch
> >>  Make intltool use perlnative instead of perl on host
> >> 
> >> Saul Wold (2):
> >>  clutter-box2d: fix isfinite.patch
> >>  gettext: Add depends to gettext to avoid host contamination
> >> 
> >> Tom Rini (7):
> >>  python-native: Mangle scripts to use /usr/bin/env python, bump PR
> >>  gnome-doc-utils: Use /usr/bin/env python in xml2po, bump PR
> >>  perl-native: Add a perl-native wrapper in the normal bindir
> >>  cpan.bbclass: Perform more mangling for perl path
> >>  icon-naming-utils-native: Fix long path to perl in icon-name-mapping
> >>  siteinfo.bbclass: Port over oe.dev logic for site files
> >>  local.conf.sample: Add a note about ASSUME_PROVIDED for help2man
> > 
> > Thanks Saul, I merged this minus the perlnative pieces since I think we
> > might be able to solve this in a better way and we should at least
> > discuss that.
> > 
> > Cheers,
> > 
> > Richard
> > 
> 
> The version of:
> 
> clutter-box2d: fix isfinite.patch
> 
> in poky.git seems to still be broken

There is something in my patch workflow which seems to corrupt dos line
endings. I've manually fixed the patches which were out of sync in poky
compared with OE-Core and am looking into how this happened with a view
to fixing the scripts.

Cheers,

Richard



