Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbvRs-0005EE-TE for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 16:09:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TE5HMP004890;
	Wed, 29 Jun 2011 15:05:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04529-10; Wed, 29 Jun 2011 15:05:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TE58vB004878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 29 Jun 2011 15:05:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6A167F0C71C@shsmsx502.ccr.corp.intel.com>
References: <cover.1308278404.git.dexuan.cui@intel.com>
	<1865303E0DED764181A9D882DEF65FB6A167F0C71B@shsmsx502.ccr.corp.intel.com>
	<1865303E0DED764181A9D882DEF65FB6A167F0C71C@shsmsx502.ccr.corp.intel.com>
Date: Wed, 29 Jun 2011 15:04:52 +0100
Message-ID: <1309356292.20015.392.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 0/1] bump PR to fix the perl-native issue
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
X-List-Received-Date: Wed, 29 Jun 2011 14:09:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-29 at 20:49 +0800, Cui, Dexuan wrote:
> Cui, Dexuan wrote:
> > Cui, Dexuan wrote:
> >> I did a core-image-sato-sdk and meta-toolchain-gmae building using a
> >> commit of May 12 between 605141a9(the perl-native workaround patch)
> >> and 3ba6d018(populate perl-native into its own dir), and grepped
> >> ${STAGING_BINDIR_NATIVE}/perl in
> >> ${STAGING_BINDIR_NATIVE} to find out all the scripts needed to
> >> address. Some recipes' PRs have been bumped, so this patch only
> >> bumps the omitted ones. 
> >> 
> >> Please review the patch.
> >> 
> >> The following changes since commit
> >> 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:
> >> 
> >>   systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16
> >> 22:14:06 +0100) 
> >> 
> >> are available in the git repository at:
> >>   git://git.pokylinux.org/poky-contrib dcui/bump_PR
> >>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/bump_PR
> >> 
> >> Dexuan Cui (1):
> >>   glib-2.0,intltool,rpm,sgmlspl-native: Bump PR to resolve
> >> perl-native     issue 
> >> 
> >>  meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb      |    2 +-
> >>  meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb      |    2 +-
> >>  meta/recipes-devtools/intltool/intltool_0.40.6.bb  |    2 +-
> >>  meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    2 +-
> >>  .../sgmlspl/sgmlspl-native_1.03ii.bb               |    2 +-
> >>  5 files changed, 5 insertions(+), 5 deletions(-)
> (Sorry for my previous empty reply to this thead. I pressed enter too hastily...)
> Looks the patch was neglected somehow, either? :-)

It did seem to get missed, sorry. I've merged it.

Cheers,

Richard



