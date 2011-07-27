Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1Qm5B3-0007cP-NK
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 16:33:37 +0200
Received: by rex (Postfix, from userid 1000)
	id 4605120176; Wed, 27 Jul 2011 15:29:13 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 15:29:11 +0100
Message-Id: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/4] Various Misc tweaks
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
X-List-Received-Date: Wed, 27 Jul 2011 14:33:37 -0000

The following series is for a few things I've noticed needed fixing as
various patches have gone by:

  git://git.openembedded.org/openembedded-core-contrib rpurdie/misc2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/misc2

Richard Purdie (4):
  base.bbclass: Add compatibility package name mapping handler
  gcc: Drop part of the 64bithack patch which is no longer used
  module-init-tools-cross: Drop static binaries patch as a better fix
    has been merged
  base.bbclass: Fix PACKAGE_ARCH typo

 meta/classes/base.bbclass                          |   10 +++++++-
 .../recipes-devtools/gcc/gcc-4.5.1/64bithack.patch |   13 ----------
 meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch  |   13 ----------
 .../files/no-static-binaries.patch                 |   25 --------------------
 .../module-init-tools-cross_3.16.bb                |    2 -
 5 files changed, 9 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-kernel/module-init-tools/files/no-static-binaries.patch

-- 
1.7.4.1



