Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rt1sc-0004SR-Tt
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 19:59:35 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Feb 2012 10:51:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="103229355"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.78])
	by orsmga001.jf.intel.com with ESMTP; 02 Feb 2012 10:51:37 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 10:51:34 -0800
Message-Id: <cover.1328208481.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/1] Force netbase to be MACHINE specific for all MACHINEs
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
X-List-Received-Date: Thu, 02 Feb 2012 18:59:35 -0000

Subject says it all and the detail is in the patch commit entry.

Cheers,
Joshua

The following changes since commit a69108ea388fce9034ecc8670f1149fabae55e1b:

  atk: add native / disable introspection / merge atk.inc->recipe / change license (2012-02-02 18:37:21 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib josh/fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/fixes

Joshua Lock (1):
  netbase: make netbase recipe MACHINE specific for all targets

 meta/recipes-core/netbase/netbase_4.47.bb |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

-- 
1.7.7.6



