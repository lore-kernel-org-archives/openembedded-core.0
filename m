Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4E46C61663
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 14:19:06 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Jul 2013 06:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,668,1367996400"; d="scan'208";a="268467661"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Jul 2013 06:48:46 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 16:50:23 +0300
Message-Id: <cover.1373896070.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2] [V2] BlueZ 5 experimental packages
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
X-List-Received-Date: Mon, 15 Jul 2013 14:19:08 -0000

This sets of patches adds bluez5 recipes as experimental packages.
BlueZ 5.X is not an upgrade for Bluez 4.x, as such, no upgrade is
provided/possible.
The two versions of the BT stack also conflicts each other.

The following changes since commit 74e403705e25afec656b5e40921771a9c29bdc40:

  yocto-kernel: make BBLAYERS parsing more robust (2013-07-13 18:23:39 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/bluez57v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/bluez57v2

Cristian Iorga (2):
  bluez5: new package for v5.7
  bluez4: conflicts with/replaces bluez5

 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    3 ++
 .../bluez5/bluez5-5.7/bluetooth.conf               |   16 +++++++
 meta/recipes-connectivity/bluez5/bluez5.inc        |   45 ++++++++++++++++++++
 meta/recipes-connectivity/bluez5/bluez5_5.7.bb     |   37 ++++++++++++++++
 4 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5-5.7/bluetooth.conf
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5.inc
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.7.bb

-- 
1.7.10.4


