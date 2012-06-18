Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SgeOj-0001Am-IL
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 18:01:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Jun 2012 08:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="159057528"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.122])
	by orsmga002.jf.intel.com with ESMTP; 18 Jun 2012 08:50:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2012 16:50:49 +0100
Message-Id: <cover.1340034490.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Ensure -c menuconfig forces kernel rebuild
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
X-List-Received-Date: Mon, 18 Jun 2012 16:01:49 -0000

Note: to have any effect, this change requires a patch just sent to the
bitbake-devel list; without it -c menuconfig will behave as it did
before.


The following change since commit 6d761ae17ddbd3d936e7fe985b40825ad62b2418:

  debian.bbclass: invoke target objdump (2012-06-18 13:20:29 +0100)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/menuconfig-rebuild
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/menuconfig-rebuild

Paul Eggleton (1):
  classes/cml1: ensure -c menuconfig forces a rebuild next time

 meta/classes/cml1.bbclass |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

-- 
1.7.9.5



