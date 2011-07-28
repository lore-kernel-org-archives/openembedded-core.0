Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QmRUC-0001S8-8x
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 16:22:52 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Jul 2011 07:18:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,282,1309762800"; d="scan'208";a="32570318"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.244])
	by azsmga001.ch.intel.com with ESMTP; 28 Jul 2011 07:18:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 15:18:27 +0100
Message-Id: <cover.1311862525.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Fix PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Thu, 28 Jul 2011 14:22:52 -0000

Here's a fix as discussed for the PACKAGE_EXTRA_ARCHS issue since the
tune file changes. It may not be the proper fix but it does at least it
makes the value of this variable correct again.

The following changes since commit 1fe892ab6876c405599c79657221a8b4675b6ecf:

  Update TERMCMD message to align with previous change (2011-07-27 17:43:27 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/core-pkgarch-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/core-pkgarch-fix

Paul Eggleton (1):
  bitbake.conf: remove PACKAGE_EXTRA_ARCHS_tune-XXX default

 meta/conf/bitbake.conf |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

-- 
1.7.4.1



