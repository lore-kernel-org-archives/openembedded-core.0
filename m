Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BDE1771DC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 08:50:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 14 Dec 2016 00:50:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="912033704"
Received: from oshau-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.185.66])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2016 00:49:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2016 21:49:49 +1300
Message-Id: <cover.1481705295.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] devtool: package: don't try to initialise tinfoil twice
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
X-List-Received-Date: Wed, 14 Dec 2016 08:50:13 -0000

This patch is on top of the tinfoil2 set but doesn't actually require it -
it fixes an issue that's been there for a while, it just slowed things
down a bit instead of failing as it does with tinfoil2.


The following changes since commit 2eea6a65b009e9d47c03b7d82d2699f88228fc62:

  oe-selftest: add basic tinfoil tests (2016-12-13 19:55:02 +1300)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/tinfoil2-extra-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/tinfoil2-extra-fix

Paul Eggleton (1):
  devtool: package: don't try to initialise tinfoil twice

 scripts/lib/devtool/package.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

-- 
2.5.5


