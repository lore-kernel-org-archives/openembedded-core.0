Return-Path: <wei.tee.ng@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A708C75618
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 07:46:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Jun 2015 00:46:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,643,1427785200"; d="scan'208";a="730491483"
Received: from weiteeng-ilbpg1.png.intel.com ([10.88.227.45])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2015 00:46:24 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jun 2015 15:46:18 +0800
Message-Id: <1434699981-8983-1-git-send-email-wei.tee.ng@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: wei.tee.ng@intel.com
Subject: [PATCH 0/3] [dizzy] Enable Marvell 8897 Wifi feature
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
X-List-Received-Date: Fri, 19 Jun 2015 07:46:26 -0000

From: Ng Wei Tee <wei.tee.ng@intel.com>

Hi all,

I would like to add hostapd and iw configuration for enabling
Marvell 8897 Wifi feature. Hostapd and iw configuration were
created in the recipes-connectivity layer to enable Marvell 8897
module function in AP Mode and STA mode.

This also package the Marvell pci8897 and usb8897 in the
recipes-kernel/linux-firmware and intel iwlwifi firmware copyright
years changed. Please review and provide feedback if any.

This patch is target to merge in openembedded-core dizzy branch.

Regards,
Wei Tee

Ng Shui Lei (2):
  recipes-connectivity: Add hostapd configuration for enabling Marvell
    8897 WiFi feature
  recipes-connectivity: Add iw configuration for enabling Marvell 8897
    WiFi feature

Ng Wei Tee (1):
  linux-firmware: Package Marvell pci8897 and usb8897 firmware

 .../hostapd/hostapd-2.2/defconfig                  |  145 ++++++++++++++++++++
 .../hostapd/hostapd-2.2/hostapd.service            |   11 ++
 meta/recipes-connectivity/hostapd/hostapd-2.2/init |   58 ++++++++
 meta/recipes-connectivity/hostapd/hostapd_2.2.bb   |   48 +++++++
 ....sh-don-t-use-git-describe-for-versioning.patch |   40 ++++++
 meta/recipes-connectivity/iw/iw_3.8.bb             |   27 ++++
 .../linux-firmware/linux-firmware_git.bb           |   19 ++-
 7 files changed, 345 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/defconfig
 create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/hostapd.service
 create mode 100644 meta/recipes-connectivity/hostapd/hostapd-2.2/init
 create mode 100644 meta/recipes-connectivity/hostapd/hostapd_2.2.bb
 create mode 100644 meta/recipes-connectivity/iw/iw-3.8/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
 create mode 100644 meta/recipes-connectivity/iw/iw_3.8.bb

-- 
1.7.9.5


