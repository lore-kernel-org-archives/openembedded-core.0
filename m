Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 95CD67182C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 13:08:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 17 Feb 2015 05:00:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,594,1418112000"; d="scan'208";a="686780868"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 17 Feb 2015 05:08:07 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Feb 2015 15:07:53 +0200
Message-Id: <cover.1424178303.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH v2 00/11] BlueZ 5 as bluetooth alternative stack
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
X-List-Received-Date: Tue, 17 Feb 2015 13:08:39 -0000

Based on Peter A. Bigot Bluez5 switch patchset.
Full credit given to original authors.
Some changes/adaptations needed, all done and implemented by Cristian Iorga.
Tested with each Bluetooth stack provider.
Version 2 brings in an improvement to qt-mobility.

The following changes since commit 6ae933b75c1c34a9d39e1aff0a0cb26a7ce4677f:

  bitbake: tests/fetch.py: latest_versionstring add set of PN (2015-02-16 09:13:06 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/bluez5_switch_t2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/bluez5_switch_t2

Cristian Iorga (1):
  conf/distro/include/default-providers: updated bluez-hcidump providers

Peter A. Bigot (9):
  bluetooth.bbclass: simplify recipe inference of bluetooth provider
  packagegroup-base: select distro preference for bluez provider
  pulseaudio: select distro preference for bluez provider
  neard: select distro preference for bluez provider
  libpcap: select distro preference for bluez provider
  ofono: select distro preference for bluez provider
  gstreamer1.0-plugins-bad: select distro preference for bluez provider
  connman: depend on distro provider of bluez
  qt-mobility: select distro preference for bluez provider

Richard Purdie (1):
  default-providers: Set the preferred provider for bluez based on
    version

 meta/classes/bluetooth.bbclass                             | 14 ++++++++++++++
 meta/conf/distro/include/default-providers.inc             |  4 ++--
 meta/recipes-connectivity/connman/connman.inc              |  8 +++++---
 meta/recipes-connectivity/libpcap/libpcap.inc              |  6 ++++--
 meta/recipes-connectivity/neard/neard.inc                  |  4 ++--
 meta/recipes-connectivity/ofono/ofono.inc                  |  6 +++---
 meta/recipes-core/packagegroups/packagegroup-base.bb       |  3 ++-
 .../gstreamer/gstreamer1.0-plugins-bad.inc                 |  4 ++--
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb              |  1 -
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc          |  4 ++--
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc                  |  8 +++++---
 11 files changed, 41 insertions(+), 21 deletions(-)
 create mode 100644 meta/classes/bluetooth.bbclass

-- 
2.1.0


