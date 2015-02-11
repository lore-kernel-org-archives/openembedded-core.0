Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 84E12732E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 10:10:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 11 Feb 2015 02:10:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,557,1418112000"; d="scan'208";a="525866918"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga003.jf.intel.com with ESMTP; 11 Feb 2015 02:02:20 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Feb 2015 12:10:20 +0200
Message-Id: <cover.1423649391.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/2] Various comms and multimedia PUs
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
X-List-Received-Date: Wed, 11 Feb 2015 10:10:36 -0000

The following changes since commit 231d4a9d3d89af4b1b5f6ea439c630e4cac82079:

  bitbake: bitbake-user-manual: Removed errant writer note line. (2015-02-10 23:09:32 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (2):
  harfbuzz: upgrade to 0.9.38
  connman: upgrade to 1.28

 .../connman/{connman_1.26.bb => connman_1.28.bb}                     | 5 ++---
 .../harfbuzz/{harfbuzz_0.9.37.bb => harfbuzz_0.9.38.bb}              | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.26.bb => connman_1.28.bb} (67%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.37.bb => harfbuzz_0.9.38.bb} (88%)

-- 
2.1.0


