Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A9B596E44F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 15:58:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Feb 2014 07:54:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,780,1384329600"; d="scan'208";a="449602524"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 04 Feb 2014 07:58:42 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2014 18:01:29 +0200
Message-Id: <cover.1391529644.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/2] BlueZ5 5.14 upgrades
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
X-List-Received-Date: Tue, 04 Feb 2014 15:58:42 -0000

The following changes since commit 82f9c2bcff3e977beefde6048d2ba32d17acbbd0:

  wic: Hook up --debug option (2014-02-04 12:57:36 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (2):
  sbc: upgrade to 1.2
  bluez5: upgrade to 5.14

 meta/recipes-connectivity/bluez5/bluez5_5.13.bb        |  5 -----
 meta/recipes-connectivity/bluez5/bluez5_5.14.bb        |  5 +++++
 meta/recipes-multimedia/sbc/{sbc_1.1.bb => sbc_1.2.bb} | 10 +++++-----
 3 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.13.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.14.bb
 rename meta/recipes-multimedia/sbc/{sbc_1.1.bb => sbc_1.2.bb} (45%)

-- 
1.8.3.2


