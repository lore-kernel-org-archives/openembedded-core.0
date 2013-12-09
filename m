Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DA9526DB5B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 15:49:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Dec 2013 07:49:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,858,1378882800"; d="scan'208";a="441060267"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2013 07:49:36 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2013 17:51:57 +0200
Message-Id: <cover.1386604276.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/2] connman and harfbuzz PUs
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
X-List-Received-Date: Mon, 09 Dec 2013 15:49:39 -0000

The following changes since commit 4aac8d87d47636f1d3a7f6688d36bf4bcae4448a:

  bitbake: data: Ensure we add the contains keys in a particular order (2013-12-09 10:25:47 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PU2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PU2

Cristian Iorga (2):
  harfbuzz: upgrade to 0.9.25
  connman: upgrade to 1.20

 meta/recipes-connectivity/connman/connman.inc                         | 2 ++
 .../recipes-connectivity/connman/{connman_1.19.bb => connman_1.20.bb} | 4 ++--
 .../harfbuzz/{harfbuzz_0.9.22.bb => harfbuzz_0.9.25.bb}               | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.19.bb => connman_1.20.bb} (68%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.22.bb => harfbuzz_0.9.25.bb} (88%)

-- 
1.8.3.2


