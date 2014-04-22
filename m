Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AF0A0601A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 23:49:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2014 16:49:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,907,1389772800"; d="scan'208";a="497712213"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2014 16:49:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Apr 2014 16:49:22 -0700
Message-Id: <cover.1398210385.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 00/10] Package Updates post 1.6
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
X-List-Received-Date: Tue, 22 Apr 2014 23:49:36 -0000

Richard,

Here is a batch of patches to start off the post 1.6 package
update season!

Sau!

The following changes since commit 90a955761db4724f0222527a129a3904d6d8aa6e:

  scripts/send-error-report: use a real server as the default (2014-04-19 11:04:05 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (10):
  help2man update to 1.44.1
  cups: update to 1.7.2
  lsbinitscripts: update to 9.53
  man-pages: update to 3.64
  mc: update to 4.8.12
  msmtp: update to 1.4.32
  libxkbcommon: update to 0.4.1
  util-macros: update to 1.19.0
  sqlite3: Update to 3080403
  libnl: update to 3.2.24

 ...-native_1.44.1.bb => help2man-native_1.45.1.bb} |  4 +--
 .../cups/{cups_1.7.1.bb => cups_1.7.2.bb}          |  4 +--
 ...binitscripts_9.52.bb => lsbinitscripts_9.53.bb} |  6 ++--
 .../{man-pages_3.60.bb => man-pages_3.64.bb}       |  4 +--
 .../mc/{mc_4.8.10.bb => mc_4.8.12.bb}              |  6 ++--
 .../msmtp/{msmtp_1.4.31.bb => msmtp_1.4.32.bb}     |  4 +--
 ...libxkbcommon_0.4.0.bb => libxkbcommon_0.4.1.bb} |  4 +--
 ...util-macros_1.18.0.bb => util-macros_1.19.0.bb} |  6 ++--
 ...free-caused-by-freeing-link-af_data-in-rt.patch | 41 ----------------------
 .../libnl/{libnl_3.2.22.bb => libnl_3.2.24.bb}     |  9 +++--
 .../{sqlite3_3.8.3.1.bb => sqlite3_3080403.bb}     | 10 +++---
 11 files changed, 28 insertions(+), 70 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.44.1.bb => help2man-native_1.45.1.bb} (79%)
 rename meta/recipes-extended/cups/{cups_1.7.1.bb => cups_1.7.2.bb} (40%)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.52.bb => lsbinitscripts_9.53.bb} (78%)
 rename meta/recipes-extended/man-pages/{man-pages_3.60.bb => man-pages_3.64.bb} (82%)
 rename meta/recipes-extended/mc/{mc_4.8.10.bb => mc_4.8.12.bb} (92%)
 rename meta/recipes-extended/msmtp/{msmtp_1.4.31.bb => msmtp_1.4.32.bb} (82%)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.4.0.bb => libxkbcommon_0.4.1.bb} (81%)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.18.0.bb => util-macros_1.19.0.bb} (75%)
 delete mode 100644 meta/recipes-support/libnl/libnl/0001-fix-double-free-caused-by-freeing-link-af_data-in-rt.patch
 rename meta/recipes-support/libnl/{libnl_3.2.22.bb => libnl_3.2.24.bb} (83%)
 rename meta/recipes-support/sqlite/{sqlite3_3.8.3.1.bb => sqlite3_3080403.bb} (68%)

-- 
1.8.3.1


