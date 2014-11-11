Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA606AC0D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 08:46:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Nov 2014 00:46:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,359,1413270000"; d="scan'208";a="630016393"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2014 00:46:32 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Nov 2014 10:46:21 +0200
Message-Id: <cover.1415695544.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/4] Various PUs
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
X-List-Received-Date: Tue, 11 Nov 2014 08:46:43 -0000

The following changes since commit 3c741a8d33acbf4b3d5eecc04533bc76e2f37253:

  oprofile: 0.9.9 -> 1.0.0 (2014-11-09 10:21:24 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (4):
  wpa-supplicant: upgrade to 2.3
  sbc: upgrade to 1.3
  bluez5: upgrade to 5.25
  linux-firmware: upgrade to git rev 0e5f637

 meta/recipes-connectivity/bluez5/bluez5_5.22.bb    |  3 --
 meta/recipes-connectivity/bluez5/bluez5_5.25.bb    |  4 ++
 .../wpa-supplicant/wpa-supplicant.inc              |  4 +-
 .../fix-libnl3-host-contamination.patch            | 14 +++----
 ...wpa-supplicant_2.2.bb => wpa-supplicant_2.3.bb} |  0
 .../linux-firmware/linux-firmware_git.bb           | 48 +++++++++++++++++-----
 .../sbc/{sbc_1.2.bb => sbc_1.3.bb}                 |  4 +-
 7 files changed, 52 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.22.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5_5.25.bb
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.2.bb => wpa-supplicant_2.3.bb} (100%)
 rename meta/recipes-multimedia/sbc/{sbc_1.2.bb => sbc_1.3.bb} (76%)

-- 
2.1.0


