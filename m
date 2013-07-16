Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9F36B220
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 15:24:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2013 08:21:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,677,1367996400"; d="scan'208";a="366112128"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jul 2013 08:25:32 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2013 18:26:00 +0300
Message-Id: <1373988362-10097-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH V4 0/2] BlueZ 5 experimental recipes
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
X-List-Received-Date: Tue, 16 Jul 2013 15:24:23 -0000

This sets of patches adds bluez5 recipes as experimental packages.
BlueZ 5.X is not an upgrade for Bluez 4.x, as such, no upgrade is
provided/possible.
The two versions of the BT stack also conflicts each other.

In V4 RREPLACES is removed from the recipes.

Cristian Iorga (2):
  bluez5: new package for v5.7
  bluez4: conflicts with bluez5

 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    2 +
 .../bluez5/bluez5-5.7/bluetooth.conf               |   16 +++++
 meta/recipes-connectivity/bluez5/bluez5.inc        |   68 ++++++++++++++++++++
 meta/recipes-connectivity/bluez5/bluez5_5.7.bb     |    5 ++
 4 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.7/bluetooth.conf
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5.inc
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.7.bb

-- 
1.7.10.4


