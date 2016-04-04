Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 56F3270031
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 05:03:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Apr 2016 22:03:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,439,1455004800"; d="scan'208";a="951008486"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.142.238])
	by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2016 22:03:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Apr 2016 17:02:18 +1200
Message-Id: <cover.1459746060.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/3] Buildhistory fixes
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
X-List-Received-Date: Mon, 04 Apr 2016 05:03:12 -0000

An optimisation for image package size list collection, a fix for image
dependency graph filtering, and a minor comment grammar fix.


The following changes since commit d60806e56aed2f62f6a0e030a564f7fdc4a1314d:

  build-appliance-image: Exclude DDATETIME from task signature (2016-04-03 15:51:10 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-fixes

Paul Eggleton (3):
  classes/buildhistory: optimise getting package size list
  classes/buildhistory: fix filtering of depends-nokernel.dot
  classes/buildhistory: fix grammar in comments

 meta/classes/buildhistory.bbclass | 17 +++++------------
 scripts/oe-pkgdata-util           | 26 +++++++++++++++++++++-----
 2 files changed, 26 insertions(+), 17 deletions(-)

-- 
2.5.5


