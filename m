Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5A75171985
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 00:44:05 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 02 Oct 2016 17:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,287,1473145200"; d="scan'208";a="15590042"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga005.jf.intel.com with ESMTP; 02 Oct 2016 17:44:07 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Oct 2016 17:43:06 -0700
Message-Id: <20161003004307.824-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.0
Subject: [PATCH V2] add function to check for git config user
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
X-List-Received-Date: Mon, 03 Oct 2016 00:44:06 -0000

Changed since V1:
forgot to add Yocto bug #, also cleaned up commit message

Stephano Cetola (1):
  sanity: add function to check for git config user

 meta/classes/buildhistory.bbclass | 13 ++++---------
 meta/classes/kernel-yocto.bbclass |  2 ++
 meta/classes/sanity.bbclass       | 15 +++++++++++++++
 3 files changed, 21 insertions(+), 9 deletions(-)

-- 
2.10.0


