Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 06C5A7829B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 13:51:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 09 Jun 2017 06:51:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="1139632813"
Received: from therfet-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.41.2])
	by orsmga001.jf.intel.com with ESMTP; 09 Jun 2017 06:51:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 15:50:38 +0200
Message-Id: <cover.1497016071.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH 0/2] buildhistory: fix incorrect command line in commit message with memres
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
X-List-Received-Date: Fri, 09 Jun 2017 13:51:09 -0000

Note: this depends upon the patchset I just sent to the bitbake-devel
list.


The following changes since commit 186882ca62bf683b93cd7a250963921b89ba071f:

  buildhistory: skip tests if GitPython module is missing (2017-06-07 16:00:43 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-cmdline-memres
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/buildhistory-cmdline-memres

Paul Eggleton (2):
  bitbake.conf: add BB_CMDLINE to BB_HASHCONFIG_WHITELIST
  classes/buildhistory: use BB_CMDLINE to get bitbake command line

 meta/classes/buildhistory.bbclass | 13 ++++++++-----
 meta/conf/bitbake.conf            |  2 +-
 2 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.9.4


