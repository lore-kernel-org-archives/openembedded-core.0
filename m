Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 64AB465E14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 14:49:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2014 07:49:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="374283369"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.12.111])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2014 07:45:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Aug 2014 07:49:06 -0700
Message-Id: <cover.1408459360.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/7] August Package Updates
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
X-List-Received-Date: Tue, 19 Aug 2014 14:49:51 -0000

Richard,

Here is a batch of recipe updates.

Sau!


The following changes since commit 47d1fc9f5c38f3d092937c47bd4c2f45adaa7fe6:

  qemu: fix Darwin cross-compilation (2014-08-18 20:43:24 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (7):
  cups: Upgrade to 1.7.5
  libbsd: Upgrade to 0.7.0
  boost: Upgrade to 1.56.0
  glew: Upgrade to 1.11.0
  libidn: Upgrade to 1.29
  gnupg: Upgrade to 2.0.26
  sqlite3: Upgrade to 2.8.6.0

 .../cups/{cups_1.7.4.bb => cups_1.7.5.bb}          |  4 ++--
 .../libidn/{libidn_1.28.bb => libidn_1.29.bb}      | 10 +++++-----
 .../glew/{files => glew}/autotools.patch           |  0
 .../glew/{files => glew}/fix-glew.pc-install.patch | 22 +++++++++++-----------
 .../glew_fix_for_automake-1.12.patch               |  0
 .../glew/{glew_1.10.0.bb => glew_1.11.0.bb}        |  4 ++--
 ...bjam-native_1.55.0.bb => bjam-native_1.56.0.bb} |  0
 .../boost/{boost-1.55.0.inc => boost-1.56.0.inc}   |  4 ++--
 meta/recipes-support/boost/boost.inc               |  8 ++++----
 .../boost/{boost_1.55.0.bb => boost_1.56.0.bb}     |  0
 .../gnupg/{gnupg_2.0.25.bb => gnupg_2.0.26.bb}     |  4 ++--
 .../libbsd/{libbsd_0.6.0.bb => libbsd_0.7.0.bb}    |  7 ++++---
 .../{sqlite3_3.8.5.0.bb => sqlite3_3.8.6.0.bb}     |  6 +++---
 13 files changed, 35 insertions(+), 34 deletions(-)
 rename meta/recipes-extended/cups/{cups_1.7.4.bb => cups_1.7.5.bb} (40%)
 rename meta/recipes-extended/libidn/{libidn_1.28.bb => libidn_1.29.bb} (75%)
 rename meta/recipes-graphics/glew/{files => glew}/autotools.patch (100%)
 rename meta/recipes-graphics/glew/{files => glew}/fix-glew.pc-install.patch (74%)
 rename meta/recipes-graphics/glew/{files => glew}/glew_fix_for_automake-1.12.patch (100%)
 rename meta/recipes-graphics/glew/{glew_1.10.0.bb => glew_1.11.0.bb} (83%)
 rename meta/recipes-support/boost/{bjam-native_1.55.0.bb => bjam-native_1.56.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.55.0.inc => boost-1.56.0.inc} (83%)
 rename meta/recipes-support/boost/{boost_1.55.0.bb => boost_1.56.0.bb} (100%)
 rename meta/recipes-support/gnupg/{gnupg_2.0.25.bb => gnupg_2.0.26.bb} (88%)
 rename meta/recipes-support/libbsd/{libbsd_0.6.0.bb => libbsd_0.7.0.bb} (76%)
 rename meta/recipes-support/sqlite/{sqlite3_3.8.5.0.bb => sqlite3_3.8.6.0.bb} (80%)

-- 
1.8.3.1


