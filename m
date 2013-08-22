Return-Path: <mihai.prica@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B5B6360842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 10:53:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 22 Aug 2013 03:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,933,1367996400"; d="scan'208";a="384861898"
Received: from unknown (HELO mihai-Vostro-460.rb.intel.com) ([10.237.105.31])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2013 03:53:47 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 13:53:04 +0300
Message-Id: <cover.1377164191.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Upgrade harfbuzz
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
X-List-Received-Date: Thu, 22 Aug 2013 10:53:59 -0000

The following changes since commit b2ff1add530b1fec2fb7f385227a03db47015c37:

  poky.conf: Don't force the addition of extra DISTRO_FEATURES (2013-08-20 22:58:04 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mihaip/harfbuzz
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mihaip/harfbuzz

Mihai Prica (1):
  harfbuzz: upgrade to v0.9.19

 .../harfbuzz-0.9.17/disable_graphite.patch         |   15 ---------------
 .../{harfbuzz_0.9.17.bb => harfbuzz_0.9.19.bb}     |   18 +++++++++++++-----
 2 files changed, 13 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz-0.9.17/disable_graphite.patch
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.17.bb => harfbuzz_0.9.19.bb} (61%)

-- 
1.7.9.5


