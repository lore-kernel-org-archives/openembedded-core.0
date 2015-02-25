Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 045AD71F1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 15:16:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2015 07:15:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,645,1418112000"; d="scan'208";a="683260379"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2015 07:15:53 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Feb 2015 17:15:45 +0200
Message-Id: <cover.1424877305.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Fix for YOCTO #6888
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Feb 2015 15:16:17 -0000

The following changes since commit 40d80f9e019118ac7bcd268f21e350bc154a4a63:

  build-appliance-image: Update to master head revision (2015-02-24 23:38:02 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/YB6888_t2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/YB6888_t2

Cristian Iorga (1):
  meta/lib/oe/utils.py: properly implement both_contain()

 meta/lib/oe/utils.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.1.0


