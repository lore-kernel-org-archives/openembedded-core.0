Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B15B26E7D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 14:22:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 06:22:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,860,1384329600"; d="scan'208";a="484721892"
Received: from nithyasr-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.246])
	by orsmga002.jf.intel.com with ESMTP; 17 Feb 2014 06:22:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 14:22:26 +0000
Message-Id: <cover.1392646768.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH 0/4] Misc core fixes
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
X-List-Received-Date: Mon, 17 Feb 2014 14:22:42 -0000

Some miscellaneous fixes for issues found when using Hob, trying to
restore from shared state and building an image at the same time as an
SDK.


The following changes since commit 11e2aaf2d751277e3e99ac2acbbeff2b7227be94:

  lib/oe/package_manager: Make empty package directories non-fatal (2014-02-16 16:30:58 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/fixes3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes3

Paul Eggleton (4):
  bitbake.conf: add BBINCLUDED and BB_INVALIDCONF to config hash
    whitelist
  eglibc-locale: add eglibc-gconv to PACKAGES_DYNAMIC
  classes/populate_sdk_base: fix race condition with do_rootfs
  classes/populate_sdk_base: optimise task dependencies

 meta/classes/populate_sdk_base.bbclass     | 4 +++-
 meta/conf/bitbake.conf                     | 2 +-
 meta/recipes-core/eglibc/eglibc-locale.inc | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

-- 
1.8.5.3


