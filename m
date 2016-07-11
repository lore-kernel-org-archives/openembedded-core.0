Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1A979607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 17:54:48 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jul 2016 10:54:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,347,1464678000"; d="scan'208";a="844259046"
Received: from yocto-dev86.jf.intel.com ([10.7.198.60])
	by orsmga003.jf.intel.com with ESMTP; 11 Jul 2016 10:54:48 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 10:55:28 -0700
Message-Id: <20160711175529.2650-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH V3] rootfs.py: allow removal of support packages
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
X-List-Received-Date: Mon, 11 Jul 2016 17:54:53 -0000

I've updated the list to be extened by getVar().split() as requested.

Stephano Cetola (1):
  rootfs.py: allow removal of support packages

 meta/lib/oe/rootfs.py | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

-- 
2.9.0


