Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 812B370057
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 00:13:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 01 May 2016 17:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,564,1455004800"; d="scan'208";a="944102389"
Received: from bitbang.jf.intel.com ([10.7.199.65])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2016 17:13:06 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 May 2016 17:13:01 -0700
Message-Id: <cover.1462147930.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/2] extensible sdk fixes
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
X-List-Received-Date: Mon, 02 May 2016 00:13:07 -0000

Fixes for the building a derivative sdk from the extensible sdk.

The following changes since commit f7b520878babbaa7527151f22c031ae160512753:

  poky: Switch to post release name/version (2016-04-29 07:58:46 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rewitt/esdk-fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rewitt/esdk-fixes

Randy Witt (2):
  populate_sdk_ext: Change lockedsigs task mismatch to a warning
  devtool: Fix build-sdk when pn doesn't match filename

 meta/classes/populate_sdk_ext.bbclass |  2 +-
 scripts/devtool                       |  3 +++
 scripts/lib/devtool/build_image.py    | 16 ++++++++++++----
 3 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.5.5


