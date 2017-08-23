Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 87A0D71C9B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 12:14:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 23 Aug 2017 05:14:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,416,1498546800"; d="scan'208";a="1006804071"
Received: from skhurana-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.43])
	by orsmga003.jf.intel.com with ESMTP; 23 Aug 2017 05:14:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 00:14:46 +1200
Message-Id: <cover.1503490439.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH 0/2] recipetool npm regression fixes
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
X-List-Received-Date: Wed, 23 Aug 2017 12:14:55 -0000

Fixes for a couple of regressions caused by recent patches to
recipetool.


The following changes since commit f59e729f98ef9b506b0cfdc415567e03ec87f2a9:

  runqemu: Use virtio to mount cdrom drives (2017-08-23 12:06:46 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/recipetool-npm-fixes2
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/recipetool-npm-fixes2

Paul Eggleton (2):
  recipetool: create: fix broken import in npm module
  recipetool: create: fix npm license code regression

 scripts/lib/recipetool/create_npm.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.9.5


