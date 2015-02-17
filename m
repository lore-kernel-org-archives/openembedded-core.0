Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A41DB606E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 19:26:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 17 Feb 2015 11:21:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,595,1418112000"; d="scan'208";a="455858176"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Feb 2015 11:11:31 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Feb 2015 21:26:26 +0200
Message-Id: <cover.1424201137.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] qt-mobility: fix compilation if no Bluetooth stack is present
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
X-List-Received-Date: Tue, 17 Feb 2015 19:26:37 -0000

The following changes since commit 51bdf3ba5f229f2a6ff60661b82912bb95591381:

  ref-manual: Review edits to the AUTOREV variable. (2015-02-17 15:17:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/qt4-mobility-nobluez-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/qt4-mobility-nobluez-fix

Richard Purdie (1):
  qt-mobility: Add patch to fix no bluez compile issues

 .../fix-compile-error-no-bluez.patch               | 338 +++++++++++++++++++++
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |   1 +
 2 files changed, 339 insertions(+)
 create mode 100644 meta/recipes-qt/qt4/qt-mobility-1.2.0/fix-compile-error-no-bluez.patch

-- 
2.1.0


