Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QMkR8-0005iZ-OO
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 19:21:30 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 10:18:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,232,1304319600"; 
   d="scan'208";a="480638"
Received: from unknown (HELO localhost) ([10.255.12.192])
	by orsmga001.jf.intel.com with ESMTP; 18 May 2011 10:18:34 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 10:18:24 -0700
Message-Id: <cover.1305738598.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Paul Eggleton <paul.eggleton@intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH v2 00/15] *-pull-request: cleanup and overhaul
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
X-List-Received-Date: Wed, 18 May 2011 17:21:31 -0000

This series was reviewed and received several Acks, now included, and no
suggestions for change. It is now ready to be pulled into oe-core. Before
merging into the poky/meta dir, poky/meta needs to be synced with oe-core.
It is missing the following commit from oe-core:

commit 84e07ef76bf4f484a2d5e0180632e7a4981a1af7
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Tue Mar 15 11:07:22 2011 +0100

    create-pull-request: switch URL from git.pokylinux.org/poky-contrib to git.o
    
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


The following changes since commit c12126ebf07604f998cb35546aa51d806d97af22:

  create-pull-request: switch URL from git.pokylinux.org/poky-contrib to git.openembedded.org/openembedded-core-contrib (2011-05-13 20:38:20 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dvhart/git-pull-v2-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/git-pull-v2-oe

Darren Hart (13):
  create-pull-request: alphabetize arguments
  create-pull-request: whitespace cleanup
  create-pull-request: use git request-pull and arbitrary remotes
  create-pull-request: rewrite known private URLs to public URLs
  create-pull-request: provide an RFC mode via -c argument
  send-pull-request: whitespace cleanup
  send-pull-request: remove local mta support
  send-pull-request: fix greedy auto-cc regex
  send-pull-request: don't send all patches to everyone even with -a
  send-pull-request: verify git sendemail config
  create-pull-request: add untested oe repository support
  send-pull-request: streamline git-send-email usage
  *pull-request: add copyright, license, and descriptions

Otavio Salvador (2):
  create-pull-request: do not check certificate
  create-pull-request: add GitHub remote support

 scripts/create-pull-request |  222 ++++++++++++++++++++++---------
 scripts/send-pull-request   |  307 ++++++++++++++++++++-----------------------
 2 files changed, 302 insertions(+), 227 deletions(-)



