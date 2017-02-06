Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6E52671985
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:30:53 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 06 Feb 2017 12:30:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="61869019"
Received: from mmurr6x-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.252.199.82])
	by fmsmga005.fm.intel.com with ESMTP; 06 Feb 2017 12:30:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2017 09:30:47 +1300
Message-Id: <cover.1486412900.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/3] eSDK fixes
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
X-List-Received-Date: Mon, 06 Feb 2017 20:30:54 -0000

Task dependency fixes for the extensible SDK.

NOTE: two of these patches depend upon the patch I just sent to
bitbake-devel adding bb.build.tasksbetween().


The following changes since commit b3a74335e1f9701ce2d6217080800baf3a61acb4:

  Revert "yocto-bsps: add 4.9 bbappend" (2017-02-06 14:45:48 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/esdk-fixes4
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/esdk-fixes4

Paul Eggleton (3):
  classes/populate_sdk_ext: remove unnecessary dependencies breaking SDK_TARGETS
  classes/patch: switch to new bb.build.tasksbetween() function
  classes/populate_sdk_ext: account for custom image tasks

 meta/classes/patch.bbclass            | 20 +-------------------
 meta/classes/populate_sdk_ext.bbclass | 10 ++++++----
 2 files changed, 7 insertions(+), 23 deletions(-)

-- 
2.9.3
 

