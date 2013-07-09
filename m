Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 105AE6AEA2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 00:32:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jul 2013 17:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1023,1363158000"; d="scan'208";a="367139943"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.85])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jul 2013 17:32:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2013 17:32:03 -0700
Message-Id: <cover.1373329833.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/4] Several Updates
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
X-List-Received-Date: Tue, 09 Jul 2013 00:32:09 -0000


The following changes since commit b97570c66737a6c404b49459cd95184abb855399:

  qt4: Take PV increase opportunity to drop PR (2013-07-05 15:49:51 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (4):
  man-pages: Update to 3.52
  cmake: Update to 2.8.11.2
  tzcode-native: Update to 2013d
  kconfig-frontends: Update to 3.10

 meta/recipes-devtools/cmake/cmake-native_2.8.11.1.bb          |  5 -----
 meta/recipes-devtools/cmake/cmake-native_2.8.11.2.bb          |  5 +++++
 .../cmake/{cmake_2.8.11.1.bb => cmake_2.8.11.2.bb}            |  3 +++
 ...onfig-frontends_3.9.0.bb => kconfig-frontends_3.10.0.0.bb} | 11 +++++------
 .../man-pages/{man-pages_3.50.bb => man-pages_3.52.bb}        |  5 ++---
 .../tzcode/{tzcode-native_2013c.bb => tzcode-native_2013d.bb} |  5 +++--
 6 files changed, 18 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.11.1.bb
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.11.2.bb
 rename meta/recipes-devtools/cmake/{cmake_2.8.11.1.bb => cmake_2.8.11.2.bb} (89%)
 rename meta/recipes-devtools/kconfig-frontends/{kconfig-frontends_3.9.0.bb => kconfig-frontends_3.10.0.0.bb} (78%)
 rename meta/recipes-extended/man-pages/{man-pages_3.50.bb => man-pages_3.52.bb} (81%)
 rename meta/recipes-extended/tzcode/{tzcode-native_2013c.bb => tzcode-native_2013d.bb} (83%)

-- 
1.8.1.4


