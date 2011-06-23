Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QZj45-0007TY-0o
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 14:31:21 +0200
Received: by rex (Postfix, from userid 1000)
	id 7965B2065A; Thu, 23 Jun 2011 13:27:44 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2011 13:27:25 +0100
Message-Id: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/4] Misc core cleanups
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
X-List-Received-Date: Thu, 23 Jun 2011 12:31:21 -0000

Following are four proposed cleanups for the core classes. 

The patches are available on the end of the branch in the git repository at:
  git://git.pokylinux.org/poky-contrib rpurdie/wip
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rpurdie/wip

Richard Purdie (4):
  base.bbclass: Drop old style SRCDATE handling, we have pn- overrides
    now
  base.bbclass: Since we require python 2.6 which always contains
    hashlib we can drop this fallback code
  classes/conf: Drop MULTIMACH_ARCH variable, it adds unused complexity
    and serves no useful purpose
  base/glib-2.0: Simplify USE_NLS handling for glib-2.0

 meta/classes/base.bbclass                  |   27 +--------------------------
 meta/classes/cross-canadian.bbclass        |   14 +++++++-------
 meta/classes/sstate.bbclass                |    4 ++--
 meta/conf/bitbake.conf                     |    9 ++-------
 meta/conf/distro/include/tclibc-uclibc.inc |    1 -
 meta/recipes-core/glib-2.0/glib-2.0.inc    |    6 ------
 meta/recipes-core/glib-2.0/glib.inc        |    3 +--
 7 files changed, 13 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0.inc

-- 
1.7.4.1



