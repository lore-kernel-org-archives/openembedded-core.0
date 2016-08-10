Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CAA22762B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 20:40:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 10 Aug 2016 13:40:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,501,1464678000"; d="scan'208";a="863269512"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2016 13:40:15 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2016 13:03:15 -0700
Message-Id: <20160810200316.28446-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.9.2
Subject: [PATCH V2] simultaneous do_rootfs tasks with testimage fix
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
X-List-Received-Date: Wed, 10 Aug 2016 20:40:13 -0000

Changed since V1:

I've added a fix to the smart tests which creates a fresh index of the RPM
packages specifically for the tests. This decouples the tests and the rootfs
processes, which also does some indexing for installation.

Stephano Cetola (1):
  Allow for simultaneous do_rootfs tasks with rpm

 meta/classes/rootfs_rpm.bbclass |  5 -----
 meta/lib/oe/package_manager.py  | 17 ++++++++++++++---
 meta/lib/oeqa/runtime/smart.py  | 41 ++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 54 insertions(+), 9 deletions(-)

-- 
2.9.2


