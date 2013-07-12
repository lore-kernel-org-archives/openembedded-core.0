Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE896AE86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 14:04:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Jul 2013 07:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,653,1367996400"; d="scan'208";a="344562748"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2013 07:04:51 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2013 17:06:24 +0300
Message-Id: <1373637989-24991-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/5] BlueZ 5 experimental recipes
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
X-List-Received-Date: Fri, 12 Jul 2013 14:04:52 -0000

This sets of patches adds bluez5 recipes as experimental packages.
BlueZ 5.X is not an upgrade for Bluez 4.x, as such, no upgrade is
provided/possible.
The two versions of the BT stack also conflicts each other.

Alexandru DAMIAN (1):
  bluez5: add readline dependency

Cristian Iorga (3):
  bluez5: new package for v5.3
  bluez4: conflicts with/replaces bluez5
  bluez5: upgrade to v5.7

Richard Purdie (1):
  bluez5: Set udev variables using pkg-config

 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    5 ++-
 .../bluez5/bluez5-5.7/bluetooth.conf               |   16 +++++++
 .../bluez5/bluez5-5.7/fix-udev-paths.patch         |   35 +++++++++++++++
 meta/recipes-connectivity/bluez5/bluez5.inc        |   45 ++++++++++++++++++++
 meta/recipes-connectivity/bluez5/bluez5_5.7.bb     |   38 +++++++++++++++++
 5 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.7/bluetooth.conf
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.7/fix-udev-paths.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5.inc
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.7.bb

-- 
1.7.10.4


