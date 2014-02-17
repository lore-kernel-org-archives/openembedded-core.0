Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9B1906E92E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 08:23:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 17 Feb 2014 00:23:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,859,1384329600"; d="scan'208";a="476400697"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.197])
	by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2014 00:23:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 00:22:55 -0800
Message-Id: <cover.1392625337.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/7] Package Updates
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
X-List-Received-Date: Mon, 17 Feb 2014 08:23:03 -0000

The following changes since commit 11e2aaf2d751277e3e99ac2acbbeff2b7227be94:

  lib/oe/package_manager: Make empty package directories non-fatal (2014-02-16 16:30:58 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (7):
  libnl: Update to 3.2.24
  help2man: Update to 1.44.1
  lsbinitscripts: Update to 9.52
  man-pages: Update to 3.56
  libxkbcommon: Update to 0.3.2
  libcheck: Update to 0.9.12
  nspr: Update to 4.10.3

 ...-native_1.43.3.bb => help2man-native_1.44.1.bb} |  6 ++--
 meta/recipes-extended/lsb/lsbinitscripts_9.52.bb   |  2 +-
 .../{man-pages_3.56.bb => man-pages_3.57.bb}       |  4 +--
 ...libxkbcommon_0.3.2.bb => libxkbcommon_0.4.0.bb} |  4 +--
 .../{libcheck_0.9.11.bb => libcheck_0.9.12.bb}     |  4 +--
 ...free-caused-by-freeing-link-af_data-in-rt.patch | 41 ----------------------
 .../libnl/{libnl_3.2.22.bb => libnl_3.2.24.bb}     |  8 ++---
 .../nspr/{nspr_4.10.2.bb => nspr_4.10.3.bb}        |  4 +--
 8 files changed, 16 insertions(+), 57 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.43.3.bb => help2man-native_1.44.1.bb} (72%)
 rename meta/recipes-extended/man-pages/{man-pages_3.56.bb => man-pages_3.57.bb} (82%)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.3.2.bb => libxkbcommon_0.4.0.bb} (78%)
 rename meta/recipes-support/libcheck/{libcheck_0.9.11.bb => libcheck_0.9.12.bb} (79%)
 delete mode 100644 meta/recipes-support/libnl/libnl/0001-fix-double-free-caused-by-freeing-link-af_data-in-rt.patch
 rename meta/recipes-support/libnl/{libnl_3.2.22.bb => libnl_3.2.24.bb} (83%)
 rename meta/recipes-support/nspr/{nspr_4.10.2.bb => nspr_4.10.3.bb} (96%)

-- 
1.8.3.1


