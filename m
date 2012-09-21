Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TF6Tl-0006UK-Ed
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 18:53:25 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Sep 2012 09:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,463,1344236400"; d="scan'208";a="147626869"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.241])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Sep 2012 09:40:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2012 17:40:35 +0100
Message-Id: <cover.1348245594.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Fixes for warnings during parse with multilib
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
X-List-Received-Date: Fri, 21 Sep 2012 16:53:25 -0000

The following changes since commit 5e03d1e83d0536a2fc69a88d3e5407108836203f:

  gcc: Use 4.7.2 release tarball (2012-09-21 14:55:26 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/multilib
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/multilib

Paul Eggleton (2):
  classes/multilib: ensure MLPREFIX is set for image recipes
  classes/multilib: prevent multilib extension of nativesdk recipes

 meta/classes/multilib.bbclass |   17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
1.7.9.5



