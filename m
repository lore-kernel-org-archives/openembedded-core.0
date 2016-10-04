Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A73E8719DC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 02:00:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 03 Oct 2016 19:00:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,292,1473145200"; d="scan'208";a="1060058334"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga002.jf.intel.com with ESMTP; 03 Oct 2016 19:00:51 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2016 18:59:46 -0700
Message-Id: <20161004015947.127442-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH V3] devtool: modify command fails to ignore source files
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
X-List-Received-Date: Tue, 04 Oct 2016 02:00:51 -0000

Changes since V2:
Added os.sep to path name for decreased chance of false positive matches.

Stephano Cetola (1):
  devtool: modify command fails to ignore source files

 scripts/lib/devtool/standard.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.10.0


