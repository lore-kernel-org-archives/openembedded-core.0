Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E6E6E605A0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 14:58:53 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2013 07:58:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,819,1367996400"; d="scan'208";a="277922082"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Aug 2013 07:58:52 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2013 17:59:50 +0300
Message-Id: <cover.1375714695.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/4] various upgrades
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
X-List-Received-Date: Mon, 05 Aug 2013 14:58:54 -0000

Various PUs

The following changes since commit 4cff3defb545643132b7233fcffb3fedc1bf182b:

  grep: Add patch for texinfo 5.1 (2013-08-03 10:33:14 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/updates_prime
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/updates_prime

Cristian Iorga (4):
  neon: upgrade to v0.30.0
  gstreamer1.0-plugins-ugly: upgrade to v1.0.9
  telepathy-glib: upgrade to v0.20.4
  harfbuzz: upgrade to v0.9.19

 .../telepathy/telepathy-glib/pkgconfig.patch       | 41 ----------------------
 ...thy-glib_0.20.1.bb => telepathy-glib_0.20.4.bb} |  8 ++---
 .../harfbuzz-0.9.17/disable_graphite.patch         | 15 --------
 .../harfbuzz/harfbuzz/disable_graphite.patch       | 15 ++++++++
 .../{harfbuzz_0.9.17.bb => harfbuzz_0.9.19.bb}     |  7 ++--
 .../gstreamer/gstreamer1.0-plugins-ugly.inc        |  2 --
 ...1.0.7.bb => gstreamer1.0-plugins-ugly_1.0.9.bb} |  4 +--
 .../{neon-0.29.6 => neon-0.30.0}/pkgconfig.patch   |  0
 .../neon/{neon_0.29.6.bb => neon_0.30.0.bb}        |  7 ++--
 9 files changed, 24 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-connectivity/telepathy/telepathy-glib/pkgconfig.patch
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.20.1.bb => telepathy-glib_0.20.4.bb} (73%)
 delete mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz-0.9.17/disable_graphite.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/disable_graphite.patch
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.17.bb => harfbuzz_0.9.19.bb} (85%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.0.7.bb => gstreamer1.0-plugins-ugly_1.0.9.bb} (66%)
 rename meta/recipes-support/neon/{neon-0.29.6 => neon-0.30.0}/pkgconfig.patch (100%)
 rename meta/recipes-support/neon/{neon_0.29.6.bb => neon_0.30.0.bb} (83%)

-- 
1.8.1.2


