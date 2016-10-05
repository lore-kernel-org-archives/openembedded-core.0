Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CAAE671A6C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:08:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 05 Oct 2016 10:08:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,449,1473145200"; d="scan'208";a="1060878665"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga002.jf.intel.com with ESMTP; 05 Oct 2016 10:08:18 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Oct 2016 10:07:16 -0700
Message-Id: <20161005170717.41046-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.0
Subject: [PATCH V4] devtool: modify command fails to ignore source
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
X-List-Received-Date: Wed, 05 Oct 2016 17:08:17 -0000

changed since V3:
added a check for the case where $S = $WORKDIR

fixes [YOCTO #10379]

Stephano Cetola (1):
  devtool: modify command fails to ignore source files

 scripts/lib/devtool/standard.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.10.0


