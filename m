Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E62A5605C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 14:29:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 15 Nov 2016 06:29:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,495,1473145200"; d="scan'208";a="1059739179"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga001.jf.intel.com with ESMTP; 15 Nov 2016 06:29:38 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 06:28:41 -0800
Message-Id: <20161115142842.75276-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH V3] Cleanup subprocess calls
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
X-List-Received-Date: Tue, 15 Nov 2016 14:29:40 -0000

Changed since V2:
Fixed rpm "remove" function, changing strings to arrays.
This fixes the error when using "read-only-rootfs" image feature.

Stephano Cetola (1):
  subprocess: remove strings and migrate to direct arrays

 meta/lib/oe/package.py         |  13 +--
 meta/lib/oe/package_manager.py | 229 ++++++++++++++++++++---------------------
 2 files changed, 118 insertions(+), 124 deletions(-)

-- 
2.10.2


