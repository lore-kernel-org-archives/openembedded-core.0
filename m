Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 34E2171A69
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 15:32:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Dec 2016 07:32:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,310,1477983600"; d="scan'208";a="14374930"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga002.jf.intel.com with ESMTP; 06 Dec 2016 07:32:04 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 07:30:58 -0800
Message-Id: <20161206153059.101115-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH V6] cleanup subprocess
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
X-List-Received-Date: Tue, 06 Dec 2016 15:32:11 -0000

Changed since V5:
Smart needs to dump the installed packages to a file, as this file
is used to detect changes in the install. This was breaking:
test_incremental_image_generation

Stephano Cetola (1):
  package_manager: remove strings and migrate to direct arrays

 meta/lib/oe/package.py         |  13 +--
 meta/lib/oe/package_manager.py | 233 ++++++++++++++++++++---------------------
 2 files changed, 121 insertions(+), 125 deletions(-)

-- 
2.10.2


