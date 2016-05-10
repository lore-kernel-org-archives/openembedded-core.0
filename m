Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 757B06FEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 03:07:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 09 May 2016 20:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,603,1455004800"; d="scan'208";a="802704877"
Received: from wlee21-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.143.133])
	by orsmga003.jf.intel.com with ESMTP; 09 May 2016 20:07:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2016 15:06:41 +1200
Message-Id: <cover.1462849565.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/2] Extensible SDK fixes
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
X-List-Received-Date: Tue, 10 May 2016 03:07:12 -0000

The following changes since commit ece101be5158beee709cdfbb85ecdbdc8d9fb864:

  test-empty-image: Fix LIC_FILES_CHKSUM typo (2016-05-06 10:47:59 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdkfixes11-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdkfixes11-oe

Paul Eggleton (2):
  devtool: sdk-update: drop support for local updates
  classes/populate_sdk_ext: adjust variable blacklisting

 meta/classes/populate_sdk_ext.bbclass |   4 +
 scripts/lib/devtool/sdk.py            | 188 ++++++++++++++--------------------
 2 files changed, 80 insertions(+), 112 deletions(-)

-- 
2.5.5


