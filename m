Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C0AA3719F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 17:18:22 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP; 15 Nov 2016 09:18:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,495,1473145200"; d="scan'208";a="31251120"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga004.jf.intel.com with ESMTP; 15 Nov 2016 09:18:24 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 09:17:27 -0800
Message-Id: <20161115171728.76132-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH V4] Cleanup subprocess calls
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
X-List-Received-Date: Tue, 15 Nov 2016 17:18:25 -0000

Changed since V3:
Corrected commit summary by changing primary item worked on from
subprocess to package_manager.

Stephano Cetola (1):
  package_manager: remove strings and migrate to direct arrays

 meta/lib/oe/package.py         |  13 +--
 meta/lib/oe/package_manager.py | 229 ++++++++++++++++++++---------------------
 2 files changed, 118 insertions(+), 124 deletions(-)

-- 
2.10.2


