Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TFP37-0004gI-7d
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 14:43:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Sep 2012 05:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,467,1344236400"; d="scan'208";a="196428766"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.225])
	by orsmga001.jf.intel.com with ESMTP; 22 Sep 2012 05:30:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2012 13:29:55 +0100
Message-Id: <cover.1348316945.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 0/2] Fixes for warnings during parse with multilib
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
X-List-Received-Date: Sat, 22 Sep 2012 12:43:09 -0000

The following changes since commit 5e03d1e83d0536a2fc69a88d3e5407108836203f:

  gcc: Use 4.7.2 release tarball (2012-09-21 14:55:26 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/multilib
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/multilib

Paul Eggleton (2):
  classes/multilib: ensure MLPREFIX is set for image recipes
  classes/multilib: prevent multilib extension of nativesdk recipes

 meta/classes/multilib.bbclass |    4 ++++
 1 file changed, 4 insertions(+)

-- 
1.7.9.5



