Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C1E9F719BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 23:33:47 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 03 Oct 2016 16:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,292,1473145200"; d="scan'208";a="15927122"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga005.jf.intel.com with ESMTP; 03 Oct 2016 16:33:48 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2016 16:32:44 -0700
Message-Id: <20161003233245.100337-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.0
Subject: [PATCH V3] add function to check for git config user
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
X-List-Received-Date: Mon, 03 Oct 2016 23:33:48 -0000

Chnages since V2:
moved functionality from sanity to utils
utilize existing name / email variables 

Stephano Cetola (1):
  utils.bbclass: add function to check for git config user

 meta/classes/buildhistory.bbclass | 15 ++++++---------
 meta/classes/kernel-yocto.bbclass |  3 +++
 meta/classes/utils.bbclass        | 10 ++++++++++
 3 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.10.0


